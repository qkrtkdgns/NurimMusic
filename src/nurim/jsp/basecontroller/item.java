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
import nurim.jsp.model.Product;
import nurim.jsp.service.ProductService;
import nurim.jsp.service.impl.ProductServiceImpl;

@WebServlet("/item.do")
public class item extends BaseController {
	private static final long serialVersionUID = -2069680356228214922L;
	
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	ProductService productService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		productService = new ProductServiceImpl(sqlSession, logger);
		
		/** (3)상품 번호 파라미터 받기*/
		String CategoryName = web.getString("category");
		int productId = web.getInt("id");
		logger.debug("productId> " + productId);
		logger.debug("CategoryName> " + CategoryName);
		if(productId==0){
			web.redirect(null, "상품 번호가 지정되지 않았습니다.");
			sqlSession.close();
			return null;
		}
		
		Product product = new Product();
		product.setId(productId);
		product.setProCategoryName(CategoryName);
		logger.debug("productId> " + productId);
		
		/**조회수 중복 갱신 방지 처리*/
		//카테고리와 게시물 일련번호를 조합한 문자열 생성
		String cookieKey = "product"+CategoryName+"_"+productId;
		//준비한 문자열에 대응되는 쿠키값 조회
		String cookieVar = web.getCookie(cookieKey);
		
		/**(4) 게시물 일련번호를 사용한 데이터 조회*/
		//상품 상세 페이지 내용이 저장될 객체
		Product readproduct = null;
		Product prevproduct = null;
		Product nextproduct = null;
		
		try{
			if(cookieVar==null){
				productService.updateProductHit(product);
				//준비한 문자열에 대한 쿠키를 24시간동안 저장
				web.setCookie(cookieKey, "Y", 60*60*24);
			}
			
			readproduct = productService.selectProduct(product);
			prevproduct = productService.selectPrevProduct(product);
			nextproduct =productService.selectNextProduct(product);
			logger.debug("readproduct> " + readproduct);
			logger.debug("prevproduct> " + prevproduct);
			logger.debug("nextproduct> " + nextproduct);
		}catch(Exception e){
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}finally{
			sqlSession.close();
		}
		
		request.setAttribute("readproduct", readproduct);
		request.setAttribute("prevproduct", prevproduct);
		request.setAttribute("nextproduct", nextproduct);
		
		return "item";
	}

}
