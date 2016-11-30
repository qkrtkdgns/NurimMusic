package nurim.jsp.basecontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import nurim.jsp.dao.MyBatisConnectionFactory;
import nurim.jsp.helper.BaseController;
import nurim.jsp.helper.WebHelper;
import nurim.jsp.model.Member;
import nurim.jsp.service.MemberService;
import nurim.jsp.service.impl.MemberServiceImpl;

@WebServlet("/user_information.do")
public class user_information extends BaseController {
	private static final long serialVersionUID = 6645994334857231145L;
	Logger logger;
	SqlSession sqlSession;
	MemberService memberService;
	WebHelper web;
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		memberService = new MemberServiceImpl(sqlSession, logger);
		
		//로그인 상태가 아니면 메인페이지로 이동시킨다.
				Member member = (Member) web.getSession("loginInfo");
				if(member == null){
					web.redirect("index.do", "로그인 중이 아닙니다.");
					return null;
				}
				
				/** (3) 파라미터 전달받기 */
				String password = web.getString("user_pw");
				logger.debug("password >> " +password);
				member.setUserPw(password);
				logger.debug("member >> "+ member);
				
				/** (4) 기존 비밀번호와 입력된 비밀번호 비교 */
				try{
					memberService.selectMemberPasswordCheck(member);
				}catch(Exception e){
					web.redirect(null, e.getLocalizedMessage());
					logger.debug(e.getLocalizedMessage());
					return null;
				}finally{
					sqlSession.close();
				}
				
		return "user_information";
	}

}
