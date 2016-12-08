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
		/**(4) 게시물 일련번호를 사용한 데이터 조회*/
		//상품 상세 페이지 내용이 저장될 객체
		Product readproduct = null;
		Product prevproduct = null;
		Product nextproduct = null;
		
		try{
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
