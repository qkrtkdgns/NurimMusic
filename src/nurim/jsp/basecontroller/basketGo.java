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
import nurim.jsp.service.BasketService;
import nurim.jsp.service.impl.BasketServiceImpl;

@WebServlet("/basket_go.do")
public class basketGo extends BaseController {


	private static final long serialVersionUID = 4194066265630205701L;

	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	BasketService basketService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		basketService = new BasketServiceImpl(sqlSession, logger);
		
		String[] id = web.getStringArray("basket");
		for(int i=0; i<id.length; i++){
			logger.debug("product id >> " + id[i]);
		}
		
		
		
		return null;
	}
       
    

}
