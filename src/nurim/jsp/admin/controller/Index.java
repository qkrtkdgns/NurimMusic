package nurim.jsp.admin.controller;

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

@WebServlet("/admin/index.do")
public class Index extends BaseController {
	private static final long serialVersionUID = 4987486982590752313L;
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		
		Member loginInfo = (Member) web.getSession("loginInfo");
		// 로그인 중이 아니라면 이 페이지를 동작시켜서는 안된다.
		if (loginInfo != null) {
			// 이미 SqlSession 객체를 생성했으므로, 데이터베이스 접속을 해제해야 한다.
			if(loginInfo.getUserName()=="관리자"){
			sqlSession.close();
			web.redirect(web.getRootPath() + "/admin/main.do", "로그인 중인 중입니다.");
			return null;
			}else{
				sqlSession.close();
				web.removeAllSession();
				web.redirect(web.getRootPath()+"/admin/index.do", "관리자 계정이 아닙니다. 로그아웃이 진행됩니다.");
				return null;
			}
		}

		return "admin/index";
	}

}
