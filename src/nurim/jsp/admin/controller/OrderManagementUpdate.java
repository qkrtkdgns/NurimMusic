package nurim.jsp.admin.controller;

import java.io.IOException;

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

@WebServlet("/admin/order_management_update.do")
public class OrderManagementUpdate extends BaseController {
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
		
		int id = web.getInt("id");
		String change = web.getString("change");
		
		Order order = new Order();
		order.setId(id);
		order.setRecState("'"+change+"'");
		logger.debug("order >> " + order);
		
		try{
			orderService.updateOrder(order);
		}catch(Exception e){
			logger.debug(e.getLocalizedMessage());
			return null;
		}finally{
			sqlSession.close();
		}
		
		web.redirect(null, "상태가 수정되었습니다.");
		return null;
	}

}
