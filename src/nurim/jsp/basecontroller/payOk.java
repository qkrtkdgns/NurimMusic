package nurim.jsp.basecontroller;

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
import nurim.jsp.helper.WebHelper;
import nurim.jsp.model.Basket;
import nurim.jsp.model.Member;
import nurim.jsp.model.Order;
import nurim.jsp.service.BasketService;
import nurim.jsp.service.OrderService;
import nurim.jsp.service.impl.BasketServiceImpl;
import nurim.jsp.service.impl.OrderServiceImpl;

@WebServlet("/pay_ok.do")
public class payOk extends BaseController {
	private static final long serialVersionUID = -6408632236277685919L;
	/** (1) 사용하고자 하는 Helper 객체 선언 */
	// --> import org.apache.logging.log4j.Logger;
	Logger logger;
	// --> import org.apache.ibatis.session.SqlSession;
	SqlSession sqlSession;
	// --> import study.jsp.helper.WebHelper;
	WebHelper web;
	BasketService basketService;
	OrderService orderService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		// -->import org.apache.logging.log4j.LogManager;
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		// -->import study.jsp.mysite.service.impl.MemberServiceImpl;
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		basketService = new BasketServiceImpl(sqlSession, logger);
		orderService = new OrderServiceImpl(sqlSession, logger);
		
		/** (3) 로그인 여부 검사 */
		Member loginInfo = (Member) web.getSession("loginInfo");				
		// 로그인 중이 아니라면 이 페이지를 동작시켜서는 안된다.
		if (loginInfo == null) {
			// 이미 SqlSession 객체를 생성했으므로, 데이터베이스 접속을 해제해야 한다.
			sqlSession.close();
			web.redirect(web.getRootPath() + "/index.do", "로그인 중이 아닙니다.");
			return null;
		}
		logger.debug("loginInfo >> " +loginInfo);
		
		/** (4) 검색할 값 받아오기 */
		String[] id = web.getStringArray("id");
		String[] pId = web.getStringArray("pId");
		String[] price = web.getStringArray("price");
		String[] amount = web.getStringArray("amount");
		String[] proName = web.getStringArray("proName");
		String[] proImg = web.getStringArray("proImg");
		
		for(int i =0; i<id.length; i++){
			logger.debug("id >> " + id[i]);
			logger.debug("pId >> " + pId[i]);
			logger.debug("price >> " + price[i]);
			logger.debug("amount >> " + amount[i]);
			logger.debug("proName >> " + proName[i]);
			logger.debug("proImg >> " + proImg[i]);
		}
		String recName = web.getString("name");
		String recPostcode = web.getString("postcode");
		String recAddr1 = web.getString("addr1");
		String recAddr2 = web.getString("addr2");
		String recTel = web.getString("tel");
		
		logger.debug("recName >> " + recName);
		logger.debug("recPostcode >> " + recPostcode);
		logger.debug("recAddr1 >> " + recAddr1);
		logger.debug("recAddr2 >> " + recAddr2);
		logger.debug("recTel >> " + recTel);
		
		if(recName == null){
			web.redirect(null, "수령자명을 입력해주세요.");
			return null;
		}
		if(recPostcode== null){
			web.redirect(null, "우편번호를 입력해주세요.");
			return null;
		}
		if(recAddr1 == null){
			web.redirect(null, "주소를 입력해주세요.");
			return null;
		}
		if(recAddr2 == null){
			web.redirect(null, "상세주소를 입력해주세요.");
			return null;
		}
		if(recTel == null){
			web.redirect(null, "수령자 전화번호를 입력해주세요.");
			return null;
		}
		
		//중복사용될 배송 정보 등록
		Basket basket = new Basket();
		Order order = new Order();
		order.setRecName(recName);
		order.setRecPostcode(recPostcode);
		order.setRecAddr1(recAddr1);
		order.setRecAddr2(recAddr2);
		order.setRecTel(recTel);
		order.setMemberId(loginInfo.getId());
		/** (5) 결제 처리 하기 */
		try{
			//상품 수량 확인 (basket Id를 통해서 구한 amount값을 가지고 product 재고 수량과 비교 한다.)
			for(int i = 0; i<id.length; i++){
				int temp = Integer.parseInt(id[i]);
				int temp2 = Integer.parseInt(pId[i]);
				basket.setId(temp);
				basket.setProductId(temp2);
				if(temp!=0){
				basketService.compareItem(basket);
				}else{
					basketService.compareItem2(basket);
				}
				logger.debug("["+i+"]번 실행했습니다.");
				logger.debug("basket >> "+ basket);
			}
			for(int i = 0; i<id.length; i++){
			//상품 등록 ( basket Id를 통해서 구한 product_id값을 가지고 product 내용물을 가져와 order에 셋팅한다.)
			order.setProductId(Integer.parseInt(pId[i]));
			order.setProName(proName[i]);
			order.setProImg(proImg[i]);
			order.setProPrice(Integer.parseInt(price[i]));
			order.setoAmount(Integer.parseInt(amount[i]));
			if(order.getoAmount()==0){
				order.setoAmount(1);
			}
			logger.debug("order >> " + order);
			
			orderService.insertOrder(order);
			
			//상품 수량 수정( basket Id를 통해서 구한 amount 값을 가지고 product 재고 수량을 변경한다.)
			orderService.updateProduct(order);
			
			//등록된 상품 제거 (사용이 완료된 basket Id를 삭제한다.)
			basket.setId(Integer.parseInt(id[i]));
			if(basket.getId()!=0){
			basketService.deleteitem(basket);}
			}
		}catch(Exception e){
			logger.debug(e.getLocalizedMessage());
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}finally{
			sqlSession.close();
		}
		
		web.redirect(web.getRootPath()+"/index.do", "주문이 완료되었습니다. 입금을 해주세요.");
		
		return null;
	}
	

}
