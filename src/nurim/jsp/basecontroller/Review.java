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
import nurim.jsp.helper.PageHelper;
import nurim.jsp.helper.UploadHelper;
import nurim.jsp.helper.WebHelper;
import nurim.jsp.model.Document;
import nurim.jsp.model.File;
import nurim.jsp.service.ReviewService;
import nurim.jsp.service.impl.ReviewServiceImpl;

@WebServlet("/Review.do")
public class Review extends BaseController {
	private static final long serialVersionUID = 7494557897086047595L;

	/** (1) 사용하고자 하는 Helper 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	BBSCommon bbs;
	ReviewService reviewService;
	PageHelper pageHelper;
	UploadHelper upload;
	NoticeFileService noticeFileService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/** (2) 사용하고자 하는 Helper + Service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		bbs = BBSCommon.getInstance();
		reviewService = new ReviewServiceImpl(sqlSession, logger);
		pageHelper = PageHelper.getInstance();
		upload = UploadHelper.getInstance();
		noticeFileService = new NoticeFileServiceImpl(sqlSession, logger);
		
		/** (3) 게시판 카테고리 값을 받아서 View에 전달 */
		String category = web.getString("category");
		request.setAttribute("category", category);
		String aa = web.getString("hitHighList");
		
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
		//검색어
		String keyword = web.getString("keyword");
		
		Document document = new Document();
		document.setCategory(category);
		document.setHitHighList(aa);
		//현재 페이지 수 -> 기본값은 1페이지로 정함
		int page = web.getInt("page", 1);
		
		//제목과 내용에 대한 검색으로 활용하기 위해서 입력값을 설정한다.
		document.setSubject(keyword);
		document.setContent(keyword);
		
		/** (6) 게시글 목록 조회 */
		int totalCount = 0;
		List<Document> documentList = null;
		File file = new File();
		//첨부파일 정보가 저장될 객체
		List<File> fileList = null;
		
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
			fileList = noticeFileService.selectNoticeFileList(file);
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
		
		/** (7) 조회 결과를 view에 전달 */
		request.setAttribute("documentList", documentList);
		//사용자가 입력한 검색어를 view에 되돌려준다. -> 자동완성 구현을 위함
		request.setAttribute("keyword", keyword);
		//페이지 번호 계산 결과를 view에 전달
		request.setAttribute("pageHelper", pageHelper);
		request.setAttribute("fileList", fileList);
		
		return "Review";
	}

}
