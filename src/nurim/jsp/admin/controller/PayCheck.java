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

import nurim.jsp.dao.MyBatisConnectionFactory;
import nurim.jsp.helper.BaseController;
import nurim.jsp.helper.PageHelper;
import nurim.jsp.helper.WebHelper;
import nurim.jsp.model.Comment;
import nurim.jsp.service.CommentService;
import nurim.jsp.service.impl.CommentServiceImpl;

@WebServlet("/admin/pay_check.do")
public class PayCheck extends BaseController{
	private static final long serialVersionUID = -7415600846773313763L;
	/**(1) 사용하고자 하는 Helper 객체 선언 */
	// --> import org.apache.logging.log4j.Logger;
	Logger logger;
	// --> import org.apache.ibatis.session.SqlSession;
	SqlSession sqlSession;
	// --> import study.jsp.helper.WebHelper;
	WebHelper web;
	PageHelper pageHelper;
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
		pageHelper = PageHelper.getInstance();
		commentService = new CommentServiceImpl(sqlSession, logger);
		
		/** (3) 로그인 여부 검사 */
		// 로그인 중이 아니라면 이 페이지를 동작시켜서는 안된다.
		if (web.getSession("loginInfo") == null) {
			// 이미 SqlSession 객체를 생성했으므로, 데이터베이스 접속을 해제해야 한다.
			sqlSession.close();
			web.redirect(web.getRootPath() + "/admin/index.do", "로그인 중이 아닙니다.");
			return null;
		}
		/** (4) 검색할 값 받아오기 */

		Comment comment = new Comment();
		logger.debug("comment >> " + comment);

		// 현재 페이지 수 --> 기본 값은 1페이지로 설정함
		int page = web.getInt("page", 1);

		// 총 아이템 수
		int totalCount = 0;
		List<Comment> commentList = null;
		
		try {
			// 전체 게시물 수
			totalCount = commentService.selectcommentCountAll(comment);
			logger.debug("totalCount >> " + totalCount);
			// 나머지 페이지 번호 계산하기
			// --> 현재 페이지, 전체 게시물 수, 한 페이지의 목록 수, 그룹갯수
			pageHelper.pageProcess(page, totalCount, 3, 7);
			// 페이지 번호 계산 결과에서 Limit절에 필요한 값을 Beans에 추가
			comment.setLimitStart(pageHelper.getLimitStart());
			comment.setListCount(pageHelper.getListCount());
			logger.debug("comment >> " + comment);
			commentList = commentService.selectcommentListAll(comment);
		} catch (Exception e) {
			logger.debug(e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		String[] state = {"입금대기","결제완료"};
		for(int i=0; i<state.length; i++){
		logger.debug("state >> "+ state[i]);}
		logger.debug("commentList >> " + commentList);
		logger.debug("comment >> " + comment);
		request.setAttribute("comment", comment);
		request.setAttribute("commentList", commentList);
		// 페이지 번호 계산 결과를 View에 전달
		request.setAttribute("pageHelper", pageHelper);
		//셀렉트 리스트 전달
		request.setAttribute("state", state);
		// "/WEB-INF/views/view/index.jsp"파일을 View로 사용한다.
		
		// "/WEB-INF/views/view/index.jsp"파일을 View로 사용한다.
		return "admin/pay_check";
	}

}
