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

import nurim.jsp.controller.bbs.BBSCommon;
import nurim.jsp.dao.MyBatisConnectionFactory;
import nurim.jsp.helper.BaseController;
import nurim.jsp.helper.PageHelper;
import nurim.jsp.helper.WebHelper;
import nurim.jsp.model.Document;
import nurim.jsp.service.DiscussionService;
import nurim.jsp.service.impl.DiscussionServiceImpl;

@WebServlet("/discussion.do")
public class discussion extends BaseController {
	private static final long serialVersionUID = -8856651675103733553L;

	/** (1) 사용하고자 하는 Helper 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	BBSCommon bbs;
	DiscussionService discussionService;
	PageHelper pageHelper;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/** (2) 사용하고자 하는 Helper + Service 객체 선언 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		bbs = BBSCommon.getInstance();
		discussionService = new DiscussionServiceImpl(sqlSession, logger);
		pageHelper = PageHelper.getInstance();
		
		/** (3) 게시판 카테고리 값을 받아서 View에 전달 */
		String category = web.getString("category");
		request.setAttribute("category", category);
		logger.debug("category = " + category);
		
		/** (4) 존재하는 게시판인지 판별하기 */
		try {
			String bbsName = bbs.getBbsName(category);
			request.setAttribute("bbsName", bbsName);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}
		logger.debug("category = " + category);
		
		/** 찬성 수, 반대 수 받기 */
		int agree = web.getInt("agree");
		int disagree = web.getInt("disagree");
		
		/** (5) 조회할 정보에 대한 Beans 생성 */
		//검색어
		String keyword = web.getString("keyword");
		
		Document document = new Document();
		document.setCategory(category);
		document.setAgree(agree);
		document.setDisagree(disagree);
		
		//현재 페이지 수 -> 기본값은 1페이지로 설정함
		int page = web.getInt("page", 1);
		
		//제목과 내용에 대한 검색으로 활용하기 위해서 입력값을 설정한다.
		document.setSubject(keyword);
		document.setContent(keyword);
		
		/** (6) 게시글 목록 조회 */
		int totalCount = 0;
		List<Document> documentList = null;
		
			//ex) discussion_1
			String cookieKey = "discussion" + "_" + agree;
			String agreeCount = web.getCookie(cookieKey);
			
			String cookieKey2 = "discussion" + "_" + disagree;
			String disagreeCount = web.getCookie(cookieKey2);
			
		try {
			web.setCookie(cookieKey, agreeCount, 60*60*60*24);
			web.setCookie(cookieKey2, disagreeCount, 60*60*60*24);
			
			//전체 게시물 수
			totalCount = discussionService.selectDiscussionCount(document);
			
			//나머지 페이지 번호 계산하기
			// -> 현제 페이지, 전체 게시물 수, 한 페이지의 목록 수, 그룹갯수
			pageHelper.pageProcess(page, totalCount, 10, 5);
			
			//페이지 번호 계산 결과에서 limit절에 필요한 값을 Beans에 추가
			document.setLimitStart(pageHelper.getLimitStart());
			document.setListCount(pageHelper.getListCount());
			documentList = discussionService.selectDiscussionList(document);
			logger.debug("documentList = " + documentList);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage()); 
			return null;
		} finally {
			sqlSession.close();
		}
		
		/** (7) 조회 결과를 view에 전달 */
		request.setAttribute("documentList", documentList);
		//페이지 번호 계산 결과를 view에 전달
		request.setAttribute("pageHelper", pageHelper);
		
		return "discussion";
	}
}
