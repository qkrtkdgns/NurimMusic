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

import nurim.jsp.admin.service.NoticeFileService;
import nurim.jsp.admin.service.impl.NoticeFileServiceImpl;
import nurim.jsp.controller.bbs.BBSCommon;
import nurim.jsp.dao.MyBatisConnectionFactory;
import nurim.jsp.helper.BaseController;
import nurim.jsp.helper.PageHelper;
import nurim.jsp.helper.UploadHelper;
import nurim.jsp.helper.WebHelper;
import nurim.jsp.model.Comment;
import nurim.jsp.model.Document;
import nurim.jsp.model.File;
import nurim.jsp.service.CommentService;
import nurim.jsp.service.ReviewService;
import nurim.jsp.service.impl.CommentServiceImpl;
import nurim.jsp.service.impl.ReviewServiceImpl;

@WebServlet("/admin/user_review.do")
public class UserReview extends BaseController{
	private static final long serialVersionUID = 3124457816427104705L;
	/**(1) 사용하고자 하는 Helper 객체 선언 */
	// --> import org.apache.logging.log4j.Logger;
	Logger logger;
	// --> import org.apache.ibatis.session.SqlSession;
	SqlSession sqlSession;
	// --> import study.jsp.helper.WebHelper;
	WebHelper web;
	BBSCommon bbs;
	ReviewService reviewService;
	PageHelper pageHelper;
	UploadHelper upload;
	NoticeFileService noticeFileService;
	CommentService commentService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//"WEB-INF/views/index.jsp"파일을 View로 사용한다.
		
		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		// -->import org.apache.logging.log4j.LogManager;
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		// -->import study.jsp.mysite.service.impl.MemberServiceImpl;
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		bbs = BBSCommon.getInstance();
		reviewService = new ReviewServiceImpl(sqlSession, logger);
		pageHelper = PageHelper.getInstance();
		upload = UploadHelper.getInstance();
		noticeFileService = new NoticeFileServiceImpl(sqlSession, logger);
		commentService = new CommentServiceImpl(sqlSession, logger);
		
		/** (3) 로그인 여부 검사 */
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
		
		/** (4) 존재하는 게시판인지 판별하기 */
		try {
			String bbsName = bbs.getBbsName(category);
			request.setAttribute("bbsName", bbsName);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}
		
		/** (5) 조회할 정보에 대한 Beans 생성 */
		Document document = new Document();
		File file = new File();
		Comment comment = new Comment();
		
		//검색어
		String keyword = web.getString("keyword");
		//Document document = new Document();
		document.setCategory(category);
		
		//현재 페이지 수 -> 기본값은 1페이지로 정함
		int page = web.getInt("page", 1);
		
		//제목과 내용에 대한 검색으로 활용하기 위해서 입력값을 설정한다.
		document.setSubject(keyword);
		document.setContent(keyword);
		
		/** (6) 게시글 목록 조회 */
		int totalCount = 0;
		List<Document> documentList = null;
		//첨부파일 정보가 저장될 객체
		List<File> fileList = null;
		String[] checkbox = web.getStringArray("check");
		logger.debug("checkbox >> " + checkbox);
		
		//게시판 종류가 갤러리인 경우 사진목록을 함께 조회함을 요청
		document.setGallery(category.equals("gallery"));
		logger.debug("document = " + document.getCategory());
		
		try {
			//전체 게시물 수
			totalCount = reviewService.selectReviewCount(document);
			
			//나머지 페이지 번호 계산하기
			// -> 현제 페이지, 전체 게시물 수, 한 페이지의 목록 수, 그룹갯수
			pageHelper.pageProcess(page, totalCount, 10, 5);
			
			//페이지 번호 계산 결과에서 limit절에 필요한 값을 Beans에 추가
			document.setLimitStart(pageHelper.getLimitStart());
			document.setListCount(pageHelper.getListCount());
			documentList = reviewService.selectReviewList(document);	
			
			if(checkbox != null){
				for(int i = 0 ; i < checkbox.length; i++){
					//logger.debug("checkbox1 >>"+checkbox1);
					document.setId(Integer.parseInt(checkbox[i]));
					file.setDocumentId(Integer.parseInt(checkbox[i]));
					logger.debug("checkbox >>"+checkbox);
					fileList = noticeFileService.selectNoticeFileList(file);
					logger.debug("fileList = " + fileList);
					noticeFileService.deleteFileAll(file);
					commentService.deleteCommentAll(comment);
					reviewService.deleteReview(document);
				}
			}
			
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		//조회결과가 존재할 경우 -> 갤러리라면 이미지 경로를 썸네일로 교체
		if (document.isGallery() && documentList != null) {
			for (int i=0; i<documentList.size(); i++) {
				Document item = documentList.get(i);
				String imagePath = item.getImagePath();
				if (imagePath != null) {
					String thumbPath = upload.createThumbnail(imagePath, 400, 320, true);
					//글 목록 컬렉션 내의 Beans 객체가 갖는 이미지 경로를 썸네일로 변경한다.
					item.setImagePath(thumbPath);
					logger.debug("thumbnail create > " + item.getImagePath());
				}
			}
		}
		
		/** (8) 실제 파일을 삭제한다. */
		//DB에서 파일 정보가 삭제되더라도 실제 저장되어 있는 파일 자체가 삭제 되는 것은 아니다.
		//실제 파일도 함께 삭제하기 위해서 (7)번 절차에서 파일정보를 삭제하기 전에 미리 조회해둔 것이다.
		//조회한 파일 목록만큼 반복하면서 저장되어 있는 파일을 삭제한다.
		if (fileList != null) {
			for (int i = 0; i < fileList.size(); i++) {
				File f = fileList.get(i);
				String filePath = f.getFileDir() + "/" + f.getFileName();
				logger.debug("fileRemove: " + filePath);
				upload.removeFile(filePath);
			}
		}
		
		/** (7) 조회 결과를 view에 전달 */
		request.setAttribute("documentList", documentList);
		//사용자가 입력한 검색어를 view에 되돌려준다. -> 자동완성 구현을 위함
		request.setAttribute("keyword", keyword);
		//페이지 번호 계산 결과를 view에 전달
		request.setAttribute("pageHelper", pageHelper);
		request.setAttribute("fileList", fileList);
		
		// "/WEB-INF/views/view/index.jsp"파일을 View로 사용한다.
		return "admin/user_review";
	}

}
