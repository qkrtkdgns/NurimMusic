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
import nurim.jsp.helper.Util;
import nurim.jsp.helper.WebHelper;
import nurim.jsp.model.Member;
import nurim.jsp.service.MemberService;
import nurim.jsp.service.impl.MemberServiceImpl;

@WebServlet("/find_pw_ok.do")
public class find_pwOk extends BaseController {
	private static final long serialVersionUID = -5286865949205310802L;
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	MemberService memberService;
	Util util;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		util = Util.getInstance();
		memberService = new MemberServiceImpl(sqlSession, logger);
		
		//파라미터 받기
		String userId = web.getString("user_id");
		String userName = web.getString("user_name");
		String email = web.getString("email");
		String password = util.getRandomPassword();
		
		logger.debug("userId >> " + userId);
		logger.debug("name >> " + userName);
		logger.debug("email >> " + email);
		logger.debug("password >> " + password);
		
		//값 셋팅하기
		Member member = new Member();
		logger.debug("member >> " + member);
		member.setUserId(userId);
		member.setUserName(userName);
		member.setEmail(email);
		
		try{
			member = memberService.selectUserPw(member);
			logger.debug("member >> " + member);
			member.setUserPw(password);
			memberService.updateUserPw(member);
			logger.debug("member >> " + member);
		}catch(Exception e){
			logger.debug(e.getLocalizedMessage());
			return null;
		}finally{
			sqlSession.close();
		}
		web.redirect(null, "회원 비밀번호는 " + password +" 입니다.");
		return null;
	}

}
