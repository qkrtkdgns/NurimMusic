package nurim.jsp.basecontroller;

import java.io.IOException;
import java.util.ArrayList;
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
import nurim.jsp.model.Basket;
import nurim.jsp.model.Member;
import nurim.jsp.service.BasketService;
import nurim.jsp.service.impl.BasketServiceImpl;

@WebServlet("/pay.do")
public class pay extends BaseController {
	private static final long serialVersionUID = -6408632236277685919L;
	/** (1) 사용하고자 하는 Helper 객체 선언 */
	// --> import org.apache.logging.log4j.Logger;
	Logger logger;
	// --> import org.apache.ibatis.session.SqlSession;
	SqlSession sqlSession;
	// --> import study.jsp.helper.WebHelper;
	WebHelper web;
	BasketService basketService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		// -->import org.apache.logging.log4j.LogManager;
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		// -->import study.jsp.mysite.service.impl.MemberServiceImpl;
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		basketService = new BasketServiceImpl(sqlSession, logger);
		
		/** (3) 로그인 여부 검사 */
		//세션에서 회원정보 받아오기
				Member loginInfo = (Member) web.getSession("loginInfo");
		// 로그인 중이 아니라면 이 페이지를 동작시켜서는 안된다.
		if (loginInfo == null) {
			// 이미 SqlSession 객체를 생성했으므로, 데이터베이스 접속을 해제해야 한다.
			sqlSession.close();
			web.redirect(web.getRootPath() + "/index.do", "로그인 중이 아닙니다.");
			return null;
		}
		logger.debug("loginInfo >> " + loginInfo);
		
		/** (4) 검색할 값 받아오기 */
		int count = web.getInt("count");
		String[] checkbox = web.getStringArray("checkbox");
		
		for(int i =0; i<count; i++){
			logger.debug("checkbox >> " + checkbox[i]);
		}
		
		/**(5)회원정보 세팅 */
		
		//장바구니에 멤버아이디 셋팅
		Basket basket = new Basket();
		basket.setMemberId(loginInfo.getId());
		int id= web.getInt("id");
		basket.setId(id);
		logger.debug("basket >> " + basket);
		//값을 받을 장바구니 객체 선언 */
		List<Basket> BasketList = new ArrayList<Basket>();
		//총 주문금액 변수
		int price=0;
		
		/**(6) 선택 수문, 전체 주문 분기처리 */
		try{
		if(count > 0){
		for(int i=0; i<count; i++){
			id = Integer.parseInt(checkbox[i]);
			basket.setId(id);
			
			//옮겨담기위한 장바구니 객체 선언
			Basket temp = new Basket();
			temp = basketService.selectItem(basket);
			BasketList.add(temp);
			logger.debug(BasketList.toString());
			//총 주문 금액
			price+=temp.getProPrice()*temp.getAmount();
			logger.debug("price >> " + price);
		}
		}else if(basket.getId()!=0){
			BasketList.add(basketService.selectItem(basket));
			logger.debug(BasketList.toString());
			//총 주문 금액
			price=BasketList.get(0).getProPrice()*BasketList.get(0).getAmount();
			logger.debug("price >> " + price);
			
		}else{
			BasketList = basketService.selectList(basket);
			//총 주문 금액
			for(int i=0; i<BasketList.size(); i++){
				price+=BasketList.get(i).getProPrice()*BasketList.get(i).getAmount();
				logger.debug("price >> " + price);
			}
		}
		logger.debug("BasketList >> "+BasketList);
		}catch(Exception e){
			logger.debug(e.getLocalizedMessage());
			return null;
		}finally{
			sqlSession.close();
		}
		request.setAttribute("price", price);
		request.setAttribute("BasketList", BasketList);
		return "pay";
	}
	

}
