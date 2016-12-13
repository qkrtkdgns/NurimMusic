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

@WebServlet("/foreign.do")
public class foreign extends BaseController {
	private static final long serialVersionUID = -5312487709834003162L;
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
		
List<Product> newItem = new ArrayList<Product>();
		
		try{
			newItem = productService.selectProductForeignNewItemList();
		}catch(Exception e){
			logger.debug(e.getLocalizedMessage());
			web.redirect(null, e.getLocalizedMessage());
			return null;
			
		}finally{
			sqlSession.close();
		}
		logger.debug("newItem >> " + newItem);
		
		request.setAttribute("newItem", newItem);
		
		return "foreign";
	}

}
