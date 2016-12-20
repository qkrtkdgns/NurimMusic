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

import nurim.jsp.dao.MyBatisConnectionFactory;
import nurim.jsp.helper.BaseController;
import nurim.jsp.helper.WebHelper;
import nurim.jsp.model.Document;
import nurim.jsp.service.DiscussionService;
import nurim.jsp.service.ReviewService;
import nurim.jsp.service.impl.DiscussionServiceImpl;
import nurim.jsp.service.impl.ReviewServiceImpl;

@WebServlet("/community.do")
public class community extends BaseController {
	private static final long serialVersionUID = -3053363972801724952L;

	/** (1) 사용하고자 하는 Helper 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	ReviewService reviewService;
	DiscussionService discussionService;
	
	/**
	 * 특정 카테고리에 대한 상위 n개의 게시물 가져오기
	 * @param category	- 가져올 카테고리
	 * @param listCount 	- 가져올 게시물 수
	 * @return	
	 * @throws Exception
	 */
	private List<Document> getDiscussionList(String category, int listCount) throws Exception {
		List<Document> list = null;
		
		//조회할 조건 생성하기
		//-> 지정된 카테고리의 0번째부터 listCount개 만큼 조회
		Document document = new Document();
		document.setCategory(category);
		document.setLimitStart(0);
		document.setListCount(listCount);
		
		list = discussionService.selectDiscussionList(document);
		
		return list;
	}
	
	private List<Document> getReviewList(String category, int listCount) throws Exception {
		List<Document> list = null;
		
		//조회할 조건 생성하기
		//-> 지정된 카테고리의 0번째부터 listCount개 만큼 조회
		Document document = new Document();
		document.setCategory(category);
		document.setLimitStart(0);
		document.setListCount(listCount);
		document.setGallery(category.equals("gallery"));
		
		list = reviewService.selectReviewList(document);
		
		return list;
	}
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/** (2) 사용하고자 하는 Helper + Service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		discussionService = new DiscussionServiceImpl(sqlSession, logger);		
		reviewService = new ReviewServiceImpl(sqlSession, logger);
		
		/** (3) 각 게시판 종류별로 최근 게시물을 조회한다. */
		List<Document> discussionList = null;		//토론광장 최신 게시물
		List<Document> reviewList = null;			//회원리뷰 최신 게시물
		
		try {
			discussionList = this.getDiscussionList("discussion", 7);
			logger.debug("discussionList = " + discussionList);
			reviewList = this.getReviewList("review", 2);
			logger.debug("reviewList = " + reviewList);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
		} finally {
			sqlSession.close();
		}
		
		/** (4) 최신 글 목록을 View 에 전달 */
		request.setAttribute("discussionList", discussionList);
		request.setAttribute("reviewList", reviewList);
		
		return "Community";
	}

}
