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
import nurim.jsp.model.Basket;
import nurim.jsp.model.Member;
import nurim.jsp.service.BasketService;
import nurim.jsp.service.impl.BasketServiceImpl;

@WebServlet("/basket.do")
public class basket extends BaseController {
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
		
		//장바구니에 멤버아이디 셋팅해주기
		Basket bas = new Basket();
		bas.setMemberId(loginInfo.getId());
		
		/**(4) 장바구니에 리스트 담기 */
		//장바구니에 담을 리스트 객체 생성
		List<Basket> basket = null;
		
		try{
			basket = basketService.selectList(bas);
		}catch(Exception e){
			logger.debug(e.getLocalizedMessage());
			return null;
		}finally{
			sqlSession.close();
		}
		logger.debug("basket >> " + basket);
		request.setAttribute("basket", basket);
		
		return "basket";
	}
       
    

}
