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
import nurim.jsp.service.BasketService;
import nurim.jsp.service.impl.BasketServiceImpl;

@WebServlet("/basket_update.do")
public class basketUpdate extends BaseController {
	private static final long serialVersionUID = 7468989066003412212L;

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
		
		/** (3) 세션에서 로그인 정보 가져오기 */
		Member loginInfo = (Member) web.getSession("loginInfo");
		logger.debug("loginInfo >> " + loginInfo);
		
		//로그인 중인지 확인
		if(loginInfo == null){
			sqlSession.close();
			web.redirect(web.getRootPath() + "/index.do", "로그인 중이 아닙니다.");
			return null;
		}
		//파라미터 받기
		int id = web.getInt("id");
		int amount = web.getInt("amount");
		logger.debug("id >> " + id);
		logger.debug("amount >> " + amount);
		
		//파라미터 셋팅하기
		Basket basket = new Basket();
		basket.setId(id);
		basket.setAmount(amount);
		logger.debug("basket >> " + basket);
		
		//상품 아이템 수량 수정
		try{
			basketService.updateItem(basket);
		}catch(Exception e){
			logger.debug(e.getLocalizedMessage());
			
		}finally{
			sqlSession.close();
		}
		
		web.redirect(web.getRootPath()+"/basket.do", "수정이 완료되었습니다.");
		return null;
	}
       
    

}
