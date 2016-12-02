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
import nurim.jsp.model.Order;
import nurim.jsp.service.OrderService;
import nurim.jsp.service.impl.OrderServiceImpl;

@WebServlet("/admin/order_management_delete.do")
public class OrderManagementDelete extends BaseController {
	private static final long serialVersionUID = 6122655773879779129L;
	/** (1) 사용하고자 하는 Helper 객체 선언 */
	// --> import org.apache.logging.log4j.Logger;
	Logger logger;
	// --> import org.apache.ibatis.session.SqlSession;
	SqlSession sqlSession;
	// --> import study.jsp.helper.WebHelper;
	WebHelper web;
	PageHelper pageHelper;
	OrderService orderService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// "WEB-INF/views/index.jsp"파일을 View로 사용한다.

		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		// -->import org.apache.logging.log4j.LogManager;
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		// -->import study.jsp.mysite.service.impl.MemberServiceImpl;
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		pageHelper = PageHelper.getInstance();
		orderService = new OrderServiceImpl(sqlSession, logger);

		/** (3) 로그인 여부 검사 */
		// 로그인 중이 아니라면 이 페이지를 동작시켜서는 안된다.
		if (web.getSession("loginInfo") == null) {
			// 이미 SqlSession 객체를 생성했으므로, 데이터베이스 접속을 해제해야 한다.
			sqlSession.close();
			web.redirect(web.getRootPath() + "/admin/index.do", "로그인 중이 아닙니다.");
			return null;
		}
		/** (4) 검색할 값 받아오기 */
		int count = web.getInt("count");
		String[] checkbox = web.getStringArray("checkbox");
		for(int i =0; i<count; i++){
			logger.debug("checkbox >> " + checkbox[i]);
		}
		logger.debug("count >> " + count);

		Order order = new Order();
		logger.debug("order >> " + order);

		// 현재 페이지 수 --> 기본 값은 1페이지로 설정함
		int page = web.getInt("page", 1);

		// 총 아이템 수
		int totalCount = 0;
		List<Order> orderList = null;
		try {
			for(int i =0; i<count; i++){
				
				int temp= Integer.parseInt(checkbox[i]);
				order.setId(temp);
				logger.debug("temp+order >>" + order);
				orderService.deleteOrder(order);
			}
			// 전체 게시물 수
			totalCount = orderService.selectOrderCountAll(order);
			logger.debug("totalCount >> " + totalCount);
			// 나머지 페이지 번호 계산하기
			// --> 현재 페이지, 전체 게시물 수, 한 페이지의 목록 수, 그룹갯수
			pageHelper.pageProcess(page, totalCount, 3, 7);
			// 페이지 번호 계산 결과에서 Limit절에 필요한 값을 Beans에 추가
			order.setLimitStart(pageHelper.getLimitStart());
			order.setListCount(pageHelper.getListCount());
			logger.debug("order >> " + order);
			orderList = orderService.selectOrderListAll(order);
		} catch (Exception e) {
			logger.debug(e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		logger.debug("orderList >> " + orderList);
		logger.debug("order >> " + order);
		request.setAttribute("order", order);
		request.setAttribute("orderList", orderList);
		// 페이지 번호 계산 결과를 View에 전달
		request.setAttribute("pageHelper", pageHelper);
		// "/WEB-INF/views/view/index.jsp"파일을 View로 사용한다.
		return "admin/order_management";
	}

}
