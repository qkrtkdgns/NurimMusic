package nurim.jsp.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import nurim.jsp.admin.service.DocumentService;
import nurim.jsp.admin.service.impl.DocumentServiceImpl;
import nurim.jsp.dao.MyBatisConnectionFactory;
import nurim.jsp.helper.BaseController;
import nurim.jsp.helper.WebHelper;
import nurim.jsp.model.Document;

@WebServlet("/admin/one_one_answer.do")
public class OneOneAnswer extends BaseController {
	private static final long serialVersionUID = -8326215208191552762L;

	/** (1) 사용하고자 하는 Helper 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	DocumentService documentService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		/** (2) 사용하고자 하는 Helper + Service 객체 선언 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		documentService = new DocumentServiceImpl(sqlSession, logger);

		// 로그인 중이 아니라면 이 페이지를 동작시켜서는 안된다.
		if (web.getSession("loginInfo") == null) {
			// 이미 SqlSession 객체를 생성했으므로, 데이터베이스 접속을 해제해야 한다.
			sqlSession.close();
			web.redirect(web.getRootPath() + "/admin/index.do", "로그인 중이 아닙니다.");
			return null;
		}

		int id = web.getInt("id");
		logger.debug("id >> " + id);

		Document document = new Document();
		document.setId(id);

		try {
			document = documentService.selectAnswer(document);
		} catch (Exception e) {
			logger.debug(e.getLocalizedMessage());
		} finally {
			sqlSession.close();
		}
		document.setId(id);
		logger.debug("document >> " + document);
		request.setAttribute("document", document);
		return "admin/one_one_answer";

	}

}
