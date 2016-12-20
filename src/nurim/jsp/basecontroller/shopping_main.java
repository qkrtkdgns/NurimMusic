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
import nurim.jsp.helper.WebHelper;
import nurim.jsp.model.Product;
import nurim.jsp.service.ProductService;
import nurim.jsp.service.impl.ProductServiceImpl;

@WebServlet("/shopping_main.do")
public class shopping_main extends BaseController {
	private static final long serialVersionUID = 956198854180820389L;
	
	Logger logger;
	SqlSession sqlSession;
	ProductService productService;
	WebHelper web;
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		productService = new ProductServiceImpl(sqlSession, logger);
		
		Product product =null;
		List<Product> HotItemList = null;
		List<Product> shppingItemList = null;
		
		try {

			HotItemList= productService.selectProductHOTItemList(product);
			shppingItemList= productService.selectProductShoppingNewItemList(product);
				
			logger.debug("HotItemList >> " + HotItemList);
			logger.debug("shppingItemList >> " + shppingItemList);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		request.setAttribute("HotItemList", HotItemList);
		request.setAttribute("shppingItemList", shppingItemList);
		return "shopping_main";
	}
	

}
