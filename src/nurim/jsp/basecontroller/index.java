
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
import nurim.jsp.model.Product;
import nurim.jsp.service.ProductService;
import nurim.jsp.service.impl.ProductServiceImpl;

@WebServlet("/index.do")
public class index extends BaseController {
	private static final long serialVersionUID = 8940201158330638365L;

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
		
		List<Product> bestItem = new ArrayList<Product>();
		List<Product> newItem = new ArrayList<Product>();
		List<Product> MDItem = new ArrayList<Product>();
		
		try{
			bestItem = productService.selectProductBestItemList();
			newItem = productService.selectProductNewItemList();
			MDItem = productService.selectProductMDItemList();
		}catch(Exception e){
			logger.debug(e.getLocalizedMessage());
			web.redirect(null, e.getLocalizedMessage());
			return null;
			
		}finally{
			sqlSession.close();
		}
		logger.debug("bestItem >> " + bestItem);
		logger.debug("newItem >> " + newItem);
		logger.debug("MDItem >> " + MDItem);
		
		request.setAttribute("bestItem", bestItem);
		request.setAttribute("newItem", newItem);
		request.setAttribute("MDItem", MDItem);
		
		return "index";
	}

}
