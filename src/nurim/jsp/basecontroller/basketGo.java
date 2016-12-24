package nurim.jsp.basecontroller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import nurim.jsp.dao.MyBatisConnectionFactory;
import nurim.jsp.helper.BaseController;
import nurim.jsp.helper.UploadHelper;
import nurim.jsp.helper.WebHelper;
import nurim.jsp.model.Basket;
import nurim.jsp.model.Member;
import nurim.jsp.service.BasketService;
import nurim.jsp.service.ProductService;
import nurim.jsp.service.impl.BasketServiceImpl;
import nurim.jsp.service.impl.ProductServiceImpl;

@WebServlet("/basketgo.do")
public class basketGo extends BaseController {


	private static final long serialVersionUID = 4194066265630205701L;
	
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	BasketService basketService;
	UploadHelper upload;
	ProductService productService;
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		basketService = new BasketServiceImpl(sqlSession, logger);
		upload = UploadHelper.getInstance();
		productService = new ProductServiceImpl(sqlSession, logger);
		
		/** (3) 로그인 여부 검사 */
		// 로그인 중이 아니라면 이 페이지를 동작시켜서는 안된다.
		if (web.getSession("loginInfo") == null) {
			// 이미 SqlSession 객체를 생성했으므로, 데이터베이스 접속을 해제해야 한다.
			sqlSession.close();
			web.redirect(web.getRootPath() + "/admin/index.do", "로그인 중이 아닙니다.");
			return null;
		}
		
		/** (4) POST 파라미터 받기 */
		String proImg =web.getString("b_file");
		String pro_price = web.getString("b_price");
		String proName = web.getString("b_pro_name");
		String product_id= web.getString("b_basket");
		String[] pro_idList = web.getStringArray("blist");
		
		
		logger.debug("proImg > " +proImg);
		logger.debug("pro_price > " +pro_price);
		logger.debug("proName > " +proName);
		logger.debug("product_id > " +product_id);
				
		
		Member loginInfo = (Member) web.getSession("loginInfo");

		/** (5) 조회할 정보에 대한 Beans 생성 */
		// 파라미터를 Beans로 묶기
		Basket basket = new Basket();
		
		if (product_id == null) {
			if(pro_idList == null){
			sqlSession.close();
			web.redirect(null, "상품 번호가 지정되지 않았습니다.");
			return null;
			}else{
				for(int i = 0 ; i < pro_idList.length; i++){
					logger.debug("pro_idList > " +pro_idList[i]);
				}
			}
		}else{
			int productId =Integer.parseInt(product_id);
			int proPrice = Integer.parseInt(pro_price);
			basket.setProductId(productId);
			basket.setProImg(proImg);
			basket.setProName(proName);
			basket.setProPrice(proPrice);
		}
		
		basket.setMemberId(loginInfo.getId());
		
		/** (4) 일련번호를 사용한 데이터 조회 */
		// 지금 보고 있는 상품이 저장될 객체
		Basket basketItem= null;
		Basket basketItemList= null;
		int countItem= 0;
		try {
			if(product_id != null){
				countItem = basketService.CountItem(basket);
				basketItem=basketService.insertItem(basket);
				logger.debug("basketItem > " +basketItem);
				
			}else if(pro_idList !=null){
				for(int i = 0 ; i < pro_idList.length; i++){
					logger.debug("pro_idList > " +pro_idList[i]);
					basket.setProductId(Integer.parseInt(pro_idList[i]));
					countItem = basketService.CountItem(basket);
					basketItemList=basketService.insertItemList(basket);
				}
			}

		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		web.redirect(web.getRootPath()+"/basket.do", "상품이 장바구니에 담겼습니다. 장바구니를 확인해 보세요");
		
		return null;
	}
       
    

}
