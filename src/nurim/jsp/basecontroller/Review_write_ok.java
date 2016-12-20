package nurim.jsp.basecontroller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

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
import nurim.jsp.helper.FileInfo;
import nurim.jsp.helper.RegexHelper;
import nurim.jsp.helper.UploadHelper;
import nurim.jsp.helper.WebHelper;
import nurim.jsp.model.Document;
import nurim.jsp.model.File;
import nurim.jsp.model.Member;
import nurim.jsp.service.ReviewService;
import nurim.jsp.service.impl.ReviewServiceImpl;

@WebServlet("/Review_write_ok.do")
public class Review_write_ok extends BaseController {
	private static final long serialVersionUID = 5051609896409537221L;

	/** (1) 사용하고자 하는 Helper 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	BBSCommon bbs;
	UploadHelper upload;
	RegexHelper regex;
	ReviewService reviewService;
	NoticeFileService noticeFileService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/** (2) 사용하고자 하는 Helper + Service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		bbs = BBSCommon.getInstance();
		upload = UploadHelper.getInstance();
		regex = RegexHelper.getInstance();
		reviewService = new ReviewServiceImpl(sqlSession, logger);
		noticeFileService = new NoticeFileServiceImpl(sqlSession, logger);
		
		/** (3) 파일이 포함된 POST 파라미터 받기 */
		try {
			upload.multipartRequest(request);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, "multipart 데이터가 없습니다.");
			return null;
		}
		
		/** (4) UploadHelper에서 텍스트 형식의 값을 추출 */
		Map<String, String> paramMap = upload.getParamMap();
		String category = paramMap.get("category");
		String subject = paramMap.get("subject");
		String content = paramMap.get("content");
		//작성자 아이피 주소 가져오기
		String ipAddress = web.getClientIP();
		//회원 일련번호 -> 비로그인인 경우 0
		int memberId = 1;
		//로그인 한 경우, 입력하지 않은 이름, 비밀번호, 이메일을 세션정보로 대체
		Member loginInfo = (Member) web.getSession("loginInfo");
		if (loginInfo != null) {
			memberId = loginInfo.getId();
		}
		
		//전달된 파라미터는 로그로 확인한다.
		logger.debug("category = " + category);;
		logger.debug("subject = " + subject);
		logger.debug("content = " + content);
		logger.debug("ipAddress = " + ipAddress);
		logger.debug("memberId = " + memberId);
		
		/** (5) 게시판 카테고리 값을 받아서 view에 전달 */
		//파일이 첨부된 경우 WebHelper를 사용할 수 없다.
		//String category = web.getString("category");
		request.setAttribute("category", category);
		
		/** (6) 존재하는 게시판인지 판별하기 */
		try {
			String bbsName = bbs.getBbsName(category);
			request.setAttribute("bbsName", bbsName);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}
		
		/** (7) 입력 받은 파라미터에 대한 유효성 검사 */
		//제목 및 내용 검사
		if (!regex.isValue(subject)) {
			sqlSession.close();
			web.redirect(null, "글 제목을 입력하세요.");
			return null;
		}
				
		if (!regex.isValue(content)) {
			sqlSession.close();
			web.redirect(null, "내용을 입력하세요.");
			return null;
		}
		
		/** (8) 입력 받은 파라미터를 Beans로 묶기 */
		Document document = new Document();
		document.setCategory(category);
		document.setSubject(subject);
		document.setContent(content);
		document.setIpAddress(ipAddress);
		document.setMemberId(memberId);
		logger.debug("document >> " + document.toString());
		
		/** (9) Service를 통한 게시물 저장 */
		try {
			reviewService.insertReview(document);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}
		
		/** (10) 첨부파일 목록 처리 */
		//업로드 된 파일 목록
		List<FileInfo> fileList = upload.getFileList();
		logger.debug("fileList=" + fileList);
		
		try {
			//업로드 된 파일의 수만큼 반복 처리 한다.
			for (int i = 0; i < fileList.size(); i++) {
				//업로드 된 정보 하나 추출하여 데이터베이스에 저장하기 위한 형태로 가공해야 한다.
				FileInfo info = fileList.get(i);
				//DB에 저장하기 위한 항목 생성
				File file = new File();
				//몇 번 게시물에 속한 파일인지 지정한다.
				file.setDocumentId(document.getId());
				
				//데이터 복사
				file.setOriginName(info.getOriginName());
				file.setFileDir(info.getFileDir());
				file.setFileName(info.getFileName());
				file.setContentType(info.getContentType());
				file.setFileSize(info.getFileSize());
				
				//저장 처리
				noticeFileService.insertFile(file);
				
			}
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		/** (11) 저장 완료 후 읽기 페이지로 이동하기 */
		//읽어들일 게시물을 식별하기 위한 게시물 일련번호 값을 전달해야 한다.
		String url = "%s/Review_write_result.do?category=%s&document_id=%d";
		url = String.format(url, web.getRootPath(), document.getCategory(), document.getId());
		web.redirect(url, null);
		return null;
	}
}
