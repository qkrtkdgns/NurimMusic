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
import nurim.jsp.model.Document;
import nurim.jsp.model.Member;
import nurim.jsp.service.DocumentService;
import nurim.jsp.service.impl.DocumentServiceImpl;

@WebServlet("/mypage_qna_question.do")
public class mypage_qna_question extends BaseController {
	private static final long serialVersionUID = 8829658516614447080L;

	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	DocumentService documentService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		documentService = new DocumentServiceImpl(sqlSession, logger);
		
		Member loginInfo = (Member) web.getSession("loginInfo");

		// 로그인 중인지 확인
		if (loginInfo == null) {
			sqlSession.close();
			web.redirect(web.getRootPath() + "/index.do", "로그인 중이 아닙니다.");
			return null;
		}
		
		int id = web.getInt("id");
		logger.debug("id >> " + id );
		
		Document document = new Document();
		document.setId(id);
		logger.debug("document >> " + document);
				
		try{
			document = documentService.selectQnaQuestion(document);
		}catch(Exception e){
			logger.debug(e.getLocalizedMessage());
			return null;
		}finally{
			sqlSession.close();
		}
		
		request.setAttribute("document", document);
		return "mypage_qna_question";
	} 

}
