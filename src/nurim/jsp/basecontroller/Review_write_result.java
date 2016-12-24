package nurim.jsp.basecontroller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import nurim.jsp.admin.service.NoticeFileService;
import nurim.jsp.admin.service.impl.NoticeFileServiceImpl;
import nurim.jsp.controller.bbs.BBSCommon;
import nurim.jsp.dao.MyBatisConnectionFactory;
import nurim.jsp.helper.BaseController;
import nurim.jsp.helper.WebHelper;
import nurim.jsp.model.Document;
import nurim.jsp.model.File;
import nurim.jsp.service.ReviewService;
import nurim.jsp.service.impl.ReviewServiceImpl;

@WebServlet("/Review_write_result.do")
public class Review_write_result extends BaseController {
	private static final long serialVersionUID = 617968352772902237L;

	/** (1) 사용하고자 하는 Helper 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	BBSCommon bbs;
	ReviewService reviewService;
	NoticeFileService noticeFileService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/** (2) 사용하고자 하는 Helper + Service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		bbs = BBSCommon.getInstance();
		reviewService = new ReviewServiceImpl(sqlSession, logger);
		noticeFileService = new NoticeFileServiceImpl(sqlSession, logger);
		
		/** (3) 게시판 카테고리 값을 받아서 View에 전달 */
		String category = web.getString("category");
		request.setAttribute("category", category);
		logger.debug("category = " + category);
		
		/** (4) 존재하는 게시판인지 판별하기 */
		try {
			String bbsName = bbs.getBbsName(category);
			request.setAttribute("bbsName", bbsName);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}
		
		/** (5) 글 번호 파라미터 받기 */
		int documentId = web.getInt("document_id");
		logger.debug("documentId = " + documentId);
		
		if (documentId == 0) {
			web.redirect(null, "글 번호가 지정되지 않았습니다.");
			sqlSession.close();
			return null;
		}
		//파라미터를 Beans로 묶기
		Document document = new Document();
		document.setId(documentId);
		document.setCategory(category);
		
		File file = new File();
		file.setDocumentId(documentId);
		
		/** (6) 게시물 일련번호를 사용한 데이터 조회 */
		//지금 읽고 있는 게시물이 저장될 객체
		Document readDocument = null;
		//이전글이 저장될 객체
		Document prevDocument = null;
		//다음글이 저장될 객체
		Document nextDocument = null;
		//첨부파일 정보가 저장될 객체
		List<File> fileList = null;
		
		/** 조회수 중복 갱신 방지 처리 */
		//카테고리와 게시물 일련번호를 조합한 문자열을 생성
		//ex) document_notice_15
		String cookieKey = "document_" + category + "_" + documentId;
		//준비한 문자열에 대응되는 쿠키값 조회
		String cookieVar = web.getCookie(cookieKey);
		try {
			//쿠키값이 없다면 조회수 갱신
			if (cookieVar == null) {
				reviewService.updateReviewHit(document);
				//준비한 문자열에 대한 쿠키를 24시간동안 저장
				web.setCookie(cookieKey, "Y", 1);
			}
			readDocument = reviewService.selectReview(document);
			prevDocument = reviewService.selectPrevReview(document);
			nextDocument = reviewService.selectNextReview(document);
			fileList = noticeFileService.selectNoticeFileList(file);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		logger.debug("document >> " + readDocument);
		
		/** (7) 읽은 데이터를 View에게 전달한다. */
		request.setAttribute("readDocument", readDocument);
		request.setAttribute("prevDocument", prevDocument);
		request.setAttribute("nextDocument", nextDocument);
		request.setAttribute("fileList", fileList);
		
		return "Review_write_result";
	}

}
