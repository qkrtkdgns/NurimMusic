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
import nurim.jsp.model.Member;

@WebServlet("/admin/info_check_delete.do")
public class infoCheckDelete extends BaseController {
	private static final long serialVersionUID = 7531465667196649726L;

	/** (1) 사용하고자 하는 Helper 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	BBSCommon bbs;
	UploadHelper upload;
	PageHelper pageHelper;
	DocumentNoticeService documentNoticeService;
	NoticeFileService fileService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/** (2) 사용하고자 하는 Helper + Service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		bbs = BBSCommon.getInstance();
		upload = UploadHelper.getInstance();
		pageHelper = PageHelper.getInstance();
		documentNoticeService = new DocumentNoticeServiceImpl(sqlSession, logger);
		fileService = new NoticeFileServiceImpl(sqlSession, logger);

		// 로그인 중이 아니라면 이 페이지를 동작시켜서는 안된다.
		if (web.getSession("loginInfo") == null) {
			// 이미 SqlSession 객체를 생성했으므로, 데이터베이스 접속을 해제해야 한다.
			sqlSession.close();
			web.redirect(web.getRootPath() + "/admin/index.do", "로그인 중이 아닙니다.");
			return null;
		}

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

		/** (6) 파라미터를 Beans로 묶기 */
		// 게시글 데이터 삭제용
		Document document = new Document();
		document.setCategory(category);

		// 게시글에 포함된 파일 데이터 삭제용
		File file = new File();
		String[] checkbox = web.getStringArray("check");
		logger.debug("checkbox >> " + checkbox);

		/** (7) 데이터 삭제 처리 */
		// 로그인 중이라면 회원일련번호를 Beans에 추가한다.
		Member loginInfo = (Member) web.getSession("loginInfo");
		if (loginInfo != null) {
			document.setMemberId(loginInfo.getId());
		}
		logger.debug("loginInfo = " + loginInfo);
		List<File> fileList = null; // 게시물에 속한 파일 목록에 대한 조회결과

		try {
			if (checkbox != null) {
				for (int i = 0; i < checkbox.length; i++) {
					// logger.debug("checkbox1 >>"+checkbox1);
					document.setId(Integer.parseInt(checkbox[i]));
					file.setDocumentId(Integer.parseInt(checkbox[i]));
					logger.debug("checkbox >>" + checkbox);
					fileList = fileService.selectNoticeFileList(file);
					logger.debug("fileList = " + fileList);
					fileService.deleteFileAll(file);
					documentNoticeService.deleteNotice(document);
				}
			}
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}

		/** (8) 실제 파일을 삭제한다. */
		// DB에서 파일 정보가 삭제되더라도 실제 저장되어 있는 파일 자체가 삭제 되는 것은 아니다.
		// 실제 파일도 함께 삭제하기 위해서 (7)번 절차에서 파일정보를 삭제하기 전에 미리 조회해둔 것이다.
		// 조회한 파일 목록만큼 반복하면서 저장되어 있는 파일을 삭제한다.
		if (fileList != null) {
			for (int i = 0; i < fileList.size(); i++) {
				File f = fileList.get(i);
				String filePath = f.getFileDir() + "/" + f.getFileName();
				logger.debug("fileRemove: " + filePath);
				upload.removeFile(filePath);
			}
		}

		/** 강제 이동 */
		String url = "%s/admin/info_list.do?category=%s";
		url = String.format(url, web.getRootPath(), category);
		web.redirect(url, null);
		return null;
	}
}
