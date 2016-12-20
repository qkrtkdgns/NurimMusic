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

import nurim.jsp.admin.service.ProductAdmin;
import nurim.jsp.admin.service.impl.ProductAdminImpl;
import nurim.jsp.dao.MyBatisConnectionFactory;
import nurim.jsp.helper.BaseController;
import nurim.jsp.helper.PageHelper;
import nurim.jsp.helper.WebHelper;
import nurim.jsp.model.Product;
import nurim.jsp.service.CommentService;
import nurim.jsp.service.impl.CommentServiceImpl;

@WebServlet("/admin/comment.do")
public class Comment extends BaseController{
	private static final long serialVersionUID = -7415600846773313763L;
	/**(1) 사용하고자 하는 Helper 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	CommentService commentService;
	PageHelper pageHelper;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//"WEB-INF/views/index.jsp"파일을 View로 사용한다.
		
		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		// -->import org.apache.logging.log4j.LogManager;
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		commentService = new CommentServiceImpl(sqlSession, logger);
		pageHelper = PageHelper.getInstance();
		/** (3) 로그인 여부 검사 */
		// 로그인 중이 아니라면 이 페이지를 동작시켜서는 안된다.
		if (web.getSession("loginInfo") == null) {
			// 이미 SqlSession 객체를 생성했으므로, 데이터베이스 접속을 해제해야 한다.
			sqlSession.close();
			web.redirect(web.getRootPath() + "/admin/index.do", "로그인 중이 아닙니다.");
			return null;
		}
		
		/** (3) 각 게시판 종류별로 최근 게시물을 조회한다. */
		int totalCount = 0;
		List<Comment> commentList = null;
		int page = web.getInt("page",1);
		/** (4) 최신 글 목록을 View에 전달 */
		try {
			//전체 게시물 수
			//totalCount = productAdmin.selectProductCount(product);
			//나머지 페이지 번호 계산하기
			//--> 현재 페이지, 전체 게시물 수, 한 페이지의 목록 수, 그룹갯수
			
			//pageHelper.pageProcess(page, totalCount, 10, 5);
			
			//페이지 번호 계산 결과에서 Limit절에 필요한 값을 Beans에 추가
			//product.setLimitStart(pageHelper.getLimitStart());
		//	product.setListCount(pageHelper.getListCount());
			//productList = productAdmin.selectProductList(product);
			//logger.debug("productList > " +productList);
		
			
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		// "/WEB-INF/views/view/index.jsp"파일을 View로 사용한다.
		
		
		request.setAttribute("commentList", commentList);
		// 사용자가 입력한 검색어를 View에 되돌려준다. --> 자동완성 구현을 위함
		//request.setAttribute("keyword", keyword);
		
		//페이지 번호 계산 결과를 View에 전달
		request.setAttribute("pageHelper", pageHelper);
		return "admin/comment";
	}

}
