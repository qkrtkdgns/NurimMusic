package nurim.jsp.basecontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import nurim.jsp.dao.MyBatisConnectionFactory;
import nurim.jsp.helper.BaseController;
import nurim.jsp.helper.WebHelper;
import nurim.jsp.model.Member;
import nurim.jsp.service.MemberService;
import nurim.jsp.service.impl.MemberServiceImpl;

@WebServlet("/find_id_ok.do")
public class find_idOk extends BaseController {
	private static final long serialVersionUID = -5286865949205310802L;

	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	MemberService memberService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		memberService = new MemberServiceImpl(sqlSession, logger);
		
		//파라미터 받기
		String userName = web.getString("user_name");
		String email = web.getString("email");
		
		logger.debug("name >> " + userName);
		logger.debug("email >> " + email);
		
		//값 셋팅하기
		Member member = new Member();
		logger.debug("member >> " + member);
		member.setUserName(userName);
		member.setEmail(email);
		
		try{
			member = memberService.selectUserId(member);
			logger.debug("member >> " + member);
		}catch(Exception e){
			logger.debug(e.getLocalizedMessage());
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}finally{
			sqlSession.close();
		}
		web.redirect(null, "회원 아이디는 " + member.getUserId()+" 입니다.");
		return null;
	}

}
