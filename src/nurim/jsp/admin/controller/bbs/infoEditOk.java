package nurim.jsp.admin.controller.bbs;

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

import nurim.jsp.admin.service.DocumentNoticeService;
import nurim.jsp.admin.service.NoticeFileService;
import nurim.jsp.admin.service.impl.DocumentNoticeServiceImpl;
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

@WebServlet("/admin/info_edit_ok.do")
public class infoEditOk extends BaseController {
	private static final long serialVersionUID = 4276030630590189920L;

	/** (1) 사용하고자 하는 Helper 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	BBSCommon bbs;
	UploadHelper upload;
	RegexHelper regex;
	DocumentNoticeService documentNoticeService;
	NoticeFileService fileService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		/** (2) 페이지 형식 지정 + 사용하고자 하는 Helper + Service 객체 선언 */
		//페이지 형식을 JSON으로 설정한다.'
		response.setContentType("application/json");
		
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		bbs = BBSCommon.getInstance();
		upload = UploadHelper.getInstance();
		regex = RegexHelper.getInstance();
		documentNoticeService = new DocumentNoticeServiceImpl(sqlSession, logger);
		fileService = new NoticeFileServiceImpl(sqlSession, logger);
		
		/** (3) 파일이 포함된 POST 파라미터 받기 */
		try {
			upload.multipartRequest(request);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, "multipart 데이터가 아닙니다.");
			return null;
		}
		
		/** (4) UploadHelper 에서 텍스트 형식의 값을 추출 */
		Map<String, String> paramMap = upload.getParamMap();
		
		//글 번호 가져오기 -> Map에서 가져오는 값은 모두 String이므로 형변환 필요
		int documentId = 0;
		try {
			documentId = Integer.parseInt(paramMap.get("document_id"));
		} catch (NumberFormatException e) {
			sqlSession.close();
			web.redirect(null, "글 번호가 올바르지 않습니다.");
			return null;
		}
		
		String category = paramMap.get("category");
		String subject = paramMap.get("subject");
		String content = paramMap.get("content");
		//작성자 아이피 주소 가져오기
		String ipAddress = web.getClientIP();
		int memberId = 1;
	
		/** (5) 게시판 카테고리 값을 받아서 View에 전달 */
		//파일이 첨부된 경우 WebHelper를 사용할 수 있다.
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
		
		/** (9) 입력 받은 파파미터를 Beans로 묶기 */
		Document document = new Document();
		//UPDATE 문의 WHERE 절에서 사용해야 하므로 글 번호 추가
		// -> 글 번호는 숫자로 변환해서 처리해야 한다.
		document.setId(documentId);
		document.setCategory(category);
		document.setSubject(subject);
		document.setContent(content);
		document.setIpAddress(ipAddress);
		document.setMemberId(memberId);
		logger.debug(document.toString());
		
		/** (10) 게시물 변경을 위한 Service 기능을 호출 */
		try {
			documentNoticeService.updateNotice(document);
			logger.debug("document = " + document);
		}  catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}
		
		/** (11) 삭제를 선택한 첨부파일에 대한 처리 */
		//삭제할 파일 목록에 대한 체크 결과 -> 체크박스의 선택값을 paramMap에서 추출
		String delFile = paramMap.get("del_file");
		
		if (delFile != null) {
			//콤마 단위로 잘라서 배열로 변환
			String[] delFileList = delFile.split(",");
			
			for (int i = 0; i < delFileList.length; i++) {
				try {
					//체크박스에 의해서 전달된 id값으로 개별 파일에 대한 Beans 생성
					File file = new File();
					file.setId(Integer.parseInt(delFileList[i]));
					
					//개별 파일에 대한 정보를 조회하여 실제 파일을 삭제한다.
					File item = fileService.selectFile(file);
					upload.removeFile(item.getFileDir() + "/" + item.getFileName());
					
					//DB에서 파일정보 삭제처리
					fileService.deleteFile(file);
				} catch (Exception e) {
					sqlSession.close();
					web.redirect(null, e.getLocalizedMessage());
					return null;
				}
			}
		}
		
		/** (12) 추가적으로 업로드 된 파일 정보 처리 */
		//업로드 된 파일 목록
		List<FileInfo> fileInfoList = upload.getFileList();
		
		//업로드 된 파일의 수만큼 반복처리 한다.
		for (int i = 0; i < fileInfoList.size(); i++) {
			//업로드 된 정보 하나 추출
			// -> 업로드 된 정보를 데이터베이스에 저장하기 위한 형태로 가공해야 한다.
			FileInfo info = fileInfoList.get(i);
			
			//DB에 저장하기 위한 항목 하나 생성
			File file = new File();
			
			//데이터 복사
			file.setOriginName(info.getOrginName());
			file.setFileDir(info.getFileDir());
			file.setFileName(info.getFileName());
			file.setContentType(info.getContentType());
			file.setFileSize(info.getFileSize());
			
			//어느 게시물에 속한 파일인지 인식해야 하므로 글 번호 추가
			file.setDocumentId(documentId);
			
			//복사된 데이터를 DB에 저장
			try {
				fileService.insertFile(file); 
			} catch (Exception e) {
				sqlSession.close();
				web.redirect(null, e.getLocalizedMessage());
				return null;
			}
			
		}
		
		/** (13) 모든 절차가 종료되었으므로 DB 접속 해제 후 페이지 이동 */
		sqlSession.close();
			
		String url = "%s/admin/info_read.do?category=%s&document_id=%d";
		url = String.format(url, web.getRootPath(), category, documentId);
		web.redirect(url, null);
		
		return null;
	}

}
