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

import nurim.jsp.admin.service.DocumentNoticeService;
import nurim.jsp.admin.service.NoticeFileService;
import nurim.jsp.admin.service.impl.DocumentNoticeServiceImpl;
import nurim.jsp.admin.service.impl.NoticeFileServiceImpl;
import nurim.jsp.controller.bbs.BBSCommon;
import nurim.jsp.dao.MyBatisConnectionFactory;
import nurim.jsp.helper.BaseController;
import nurim.jsp.helper.PageHelper;
import nurim.jsp.helper.UploadHelper;
import nurim.jsp.helper.WebHelper;
import nurim.jsp.model.Document;
import nurim.jsp.model.File;

@WebServlet("/info_contents.do")
public class info_contents extends BaseController {
	private static final long serialVersionUID = 664101863044703201L;
	
	/** (1) 사용하고자 하는 Helper 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	BBSCommon bbs;
	DocumentNoticeService documentNoticeService;
	PageHelper pageHelper;
	UploadHelper upload;
	NoticeFileService fileService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/** (2) 사용하고자 하는 Helper + Service 객체 선언 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		bbs = BBSCommon.getInstance();
		documentNoticeService = new DocumentNoticeServiceImpl(sqlSession, logger);
		pageHelper = PageHelper.getInstance();
		upload = UploadHelper.getInstance();
		fileService = new NoticeFileServiceImpl(sqlSession, logger);
		
		/** (3) 게시판 카테고리 값을 받아서 View에 전달 */
		String category = web.getString("category");
		request.setAttribute("category", category);
		
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
		//첨부파일 정보가 저장될 객체
		List<File> fileList = null;
		//이전글이 저장될 객체
		Document prevDocument = null;
		//다음글이 저장될 객체
		Document nextDocument = null;
				
		/** 조회수 중복 갱신 방지 처리 */
		try {
			readDocument = documentNoticeService.selectNotice(document);
			prevDocument = documentNoticeService.selectPrevNotice(document);
			nextDocument = documentNoticeService.selectNextNotice(document);
			fileList = fileService.selectNoticeFileList(file);
		} catch (Exception e) {
			web.redirect(null,  e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
				
		/** (5) 읽은 데이터를 view에 전달한다. */
		request.setAttribute("readDocument", readDocument);
		request.setAttribute("fileList", fileList);
		request.setAttribute("prevDocument", prevDocument);
		request.setAttribute("nextDocument", nextDocument);
				
		return "info_contents";
	}

}
