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
import nurim.jsp.helper.PageHelper;
import nurim.jsp.helper.WebHelper;
import nurim.jsp.model.Member;
import nurim.jsp.model.Order;
import nurim.jsp.service.OrderService;
import nurim.jsp.service.impl.OrderServiceImpl;

@WebServlet("/delivery.do")
public class delivery extends BaseController {
	private static final long serialVersionUID = 6911107150965693973L;

	/** (1) 사용하고자 하는 Helper + Service 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	PageHelper pageHelper;
	OrderService orderService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/**(2) 사용하고자 하는 Helper + SErvice 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		pageHelper = PageHelper.getInstance();
		orderService = new OrderServiceImpl(sqlSession, logger);
		
		/** (3) 세션에서 로그인 정보 가져오기 */
		Member loginInfo = (Member) web.getSession("loginInfo");
		logger.debug("loginInfo >> " + loginInfo);
		
		//로그인 중인지 확인
		if(loginInfo == null){
			sqlSession.close();
			web.redirect(web.getRootPath() + "/index.do", "로그인 중이 아닙니다.");
			return null;
		}
		//현재 페이지 수 --> 기본 값은 1페이지로 설정함
		int page = web.getInt("page",1);
		/** (4) 검색할 값 받아오기 */
		String PrevDate = web.getString("date_prev");
		String NextDate = web.getString("date_next");
		String RecState = web.getString("category");
		String ProName = web.getString("search_item");
		if(ProName == null){
		ProName = web.getString("keyword");}
		
		Order member = new Order();
		member.setMemberId(loginInfo.getId());
		member.setPrevDate(PrevDate);
		member.setNextDate(NextDate);
		member.setRecState(RecState);
		member.setProName(ProName);
		logger.debug("order >> " + member);
		/**(5) 로그인정보로 주문정보 확인하기 */
		//배송상황별 카운트 갯수 가져올 변수 선언
		int prevPay = 0;
		int nextPay = 0;
		int prevDelivery = 0;
		int nextDelivery = 0;
		
		//리스트를 받을 객체 선언
		int totalCount = 0;
		List<Order> orderList = null;
		try{
			totalCount = orderService.selectOrderCount(member);
			logger.debug("totalCount >> " + totalCount);
			//나머지 페이지 번호 계산하기
			//--> 현재 페이지, 전체 게시물 수, 한 페이지의 목록 수, 그룹갯수
			pageHelper.pageProcess(page, totalCount, 2, 5);
			logger.debug("pageHelper >> " + pageHelper);
			//페이지 번호 계산 결과에서 Limit절에 필요한 값을 Beans에 추가
			member.setLimitStart(pageHelper.getLimitStart());
			member.setListCount(pageHelper.getListCount());
			//로그인 정보로 주문리스트 받기
			orderList = orderService.selectOrderList(member);
			logger.debug("orderList >> " + orderList);
			//배송상활별 카운트 갯수 등록
			prevPay = orderService.selectOrderPrevPay(member);
			nextPay = orderService.selectOrderNextPay(member);
			prevDelivery = orderService.selectOrderPrevDelivery(member);
			nextDelivery = orderService.selectOrderNextDelivery(member);
			
			logger.debug("prevPay >> " + prevPay);
			logger.debug("nextPay >> " + nextPay);
			logger.debug("prevDelivery >> " + prevDelivery);
			logger.debug("nextDelivery >> " + nextDelivery);
		}catch(Exception e){
			logger.debug(e.getLocalizedMessage());
		}finally{
			sqlSession.close();
		}
		request.setAttribute("order", member);
		request.setAttribute("orderList", orderList);
		request.setAttribute("prevPay", prevPay);
		request.setAttribute("nextPay", nextPay);
		request.setAttribute("prevDelivery", prevDelivery);
		request.setAttribute("nextDelivery", nextDelivery);
		//페이지 번호 계산 결과를 View에 전달
		request.setAttribute("pageHelper", pageHelper);
		
		return "delivery";
	}
   

}
