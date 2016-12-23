package nurim.jsp.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import nurim.jsp.admin.service.DocumentService;
import nurim.jsp.admin.service.impl.DocumentServiceImpl;
import nurim.jsp.controller.bbs.BBSCommon;
import nurim.jsp.dao.MyBatisConnectionFactory;
import nurim.jsp.helper.BaseController;
import nurim.jsp.helper.PageHelper;
import nurim.jsp.helper.WebHelper;
import nurim.jsp.model.Document;

@WebServlet("/admin/one_one.do")
public class OneOne extends BaseController {
	private static final long serialVersionUID = -8326215208191552762L;

	/** (1) 사용하고자 하는 Helper 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	BBSCommon bbs;
	DocumentService documentService;
	PageHelper pageHelper;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		/** (2) 사용하고자 하는 Helper + Service 객체 선언 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		bbs = BBSCommon.getInstance();
		pageHelper = PageHelper.getInstance();
		documentService = new DocumentServiceImpl(sqlSession, logger);

		/** (5) 조회할 정보에 대한 Beans 생성 */
		// 검색어
		String keyword = web.getString("keyword");
		// 필터
		String dropdown = web.getString("dropdown");

		logger.debug("keyword >> " + keyword);
		logger.debug("dropdown >> " + dropdown);

		request.setAttribute("keyword", keyword);
		request.setAttribute("dropdown", dropdown);

		Document document = new Document();
		// 현재 페이지 수 -> 기본값은 1페이지로 설정함
		int page = web.getInt("page", 1);

		// 제목과 내용에 대한 검색으로 활용하기 위해서 입력값을 설정한다.
		if(dropdown != null){
		if (dropdown.equals("제목")) {
			document.setSubject(keyword);
		} else if (dropdown.equals("내용")) {
			document.setContent(keyword);
		} }else {
			document.setSubject(keyword);
			document.setContent(keyword);
		}
		logger.debug("document >> " + document);

		/** (6) 게시글 목록 조회 */
		int totalCount = 0;
		List<Document> documentList = null;
 
		try {
			// 전체 게시물 수
			totalCount = documentService.selectDocumentOneCount(document);
			logger.debug("total Count >> " + totalCount);
			// 나머지 페이지 번호 계산하기
			// -> 현제 페이지, 전체 게시물 수, 한 페이지의 목록 수, 그룹갯수
			pageHelper.pageProcess(page, totalCount, 10, 5);

			// 페이지 번호 계산 결과에서 limit절에 필요한 값을 Beans에 추가
			document.setLimitStart(pageHelper.getLimitStart());
			document.setListCount(pageHelper.getListCount());
			logger.debug("document >> " + document);

			documentList = documentService.selectDocumentOneList(document);
			logger.debug("documentList >> " + documentList);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}

		/** (7) 조회 결과를 view에 전달 */
		request.setAttribute("documentList", documentList);
		// 페이지 번호 계산 결과를 view에 전달
		request.setAttribute("pageHelper", pageHelper);

		return "admin/one_one";

	}

}
