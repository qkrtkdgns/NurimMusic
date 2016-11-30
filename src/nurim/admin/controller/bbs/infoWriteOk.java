package nurim.admin.controller.bbs;

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

import nurim.jsp.admin.service.DocumentService;
import nurim.jsp.admin.service.FileService;
import nurim.jsp.admin.service.impl.DocumentServiceImpl;
import nurim.jsp.admin.service.impl.FileServiceImpl;
import nurim.jsp.dao.MyBatisConnectionFactory;
import nurim.jsp.helper.BaseController;
import nurim.jsp.helper.FileInfo;
import nurim.jsp.helper.RegexHelper;
import nurim.jsp.helper.UploadHelper;
import nurim.jsp.helper.WebHelper;
import nurim.jsp.model.Document;
import nurim.jsp.model.File;
import nurim.jsp.model.Member;

@WebServlet("/bbs/info_write_ok.do")
public class infoWriteOk extends BaseController {
	private static final long serialVersionUID = 5529530262539445400L;

	/** (1) 사용하고자 하는 Helper 객체 선언 */
	Logger logger;
	WebHelper web;
	SqlSession sqlSession;
	UploadHelper upload;
	RegexHelper regex;
	DocumentService documentService;
	FileService fileService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/** (2) 사용하고자 하는 Helper + Service 객체 선언 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		regex = RegexHelper.getInstance();
		documentService = new DocumentServiceImpl(sqlSession, logger);
		fileService = new FileServiceImpl(sqlSession, logger);
		
		/** (3) 파일이 포함된 POST 파라미터 받기 */
		try {
			upload.multipartRequest(request);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, "multipart 데이터가 아닙니다.");
			return null;
		}
		
		/** (4) UploadHelper 에서 텍스트 형식의 값 추출 */
		Map<String, String> paramMap = upload.getParamMap();
		String subject = paramMap.get("subject");
		String content = paramMap.get("content");
		//작성자 아이피 주소 가져오기
		String ipAddress = web.getClientIP();
		//회원 일련번호 -> 비로그인인 경우 0
		int memberId = 0;
		//로그인 한 경우, 입력하지 않은 이름, 비밀번호, 이메일을 세션정보로 대체
		Member loginInfo = (Member) web.getSession("loginInfo");
		if (loginInfo != null) {
			memberId = loginInfo.getId();
		}
		
		//전달된 파라미터는 로그로 확인한다.
		logger.debug("subject = " + subject);
		logger.debug("content = " + content);
		logger.debug("ipAddress = " + ipAddress);
		logger.debug("memberId = " + memberId);
		
		/** (5) 입력 받은 파라미터에 대한 유효성 검사 */
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
		
		/** (6) 입력 받은 파라미터를 Beans로 묶기 */
		Document document = new Document();
		document.setSubject(subject);
		document.setContent(content);
		document.setIpAddress(ipAddress);
		document.setMemberId(memberId);
		logger.debug("document >> " + document.toString());
		
		/** (7) Service를 통한 게시물 작성 */
		try {
			documentService.insertNotice(document);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}
		
		/** (8) 첨부파일 목록 처리 */
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
				file.setOriginName(info.getOrginName());
				file.setFileDir(info.getFileDir());
				file.setFileName(info.getFileName());
				file.setContentType(info.getContentType());
				file.setFileSize(info.getFileSize());
						
				//저장 처리
				fileService.insertFile(file);
						
			}
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		/** (9) 저장 완료 후 읽기 페이지로 이동하기 */
		//읽어들일 게시물을 식별하기 위한 게시물 일련번호 값을 전달해야 한다.
		String url = "%s/bbs/info_read.do?&document_id=%d";
		url = String.format(url, web.getRootPath(), document.getId());
		web.redirect(url, null);
		
		return null;
	}

}
