package nurim.jsp.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import nurim.jsp.admin.service.ProductAdmin;
import nurim.jsp.admin.service.impl.ProductAdminImpl;
import nurim.jsp.dao.MyBatisConnectionFactory;
import nurim.jsp.helper.BaseController;
import nurim.jsp.helper.WebHelper;
import nurim.jsp.model.Product;
import nurim.jsp.service.ProductService;

/**
 * Servlet implementation class DeleteItem
 */
@WebServlet("/admin/delete_item_ok.do")
public class DeleteItemOK extends BaseController {


	private static final long serialVersionUID = 4966247350940403440L;
	
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	ProductAdmin productAdmin;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		productAdmin = new ProductAdminImpl(sqlSession, logger);
		
		
		Product product = new Product();
		String[] checkbox = web.getStringArray("check");
	
		try{
			
			
			
		}catch(Exception e){
			web.redirect(null, e.getLocalizedMessage());
		}finally{
			sqlSession.close();
		}
		
	
		return null;
	}


}
