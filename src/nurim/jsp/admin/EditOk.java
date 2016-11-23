package nurim.jsp.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import nurim.jsp.admin.service.ProductService;
import nurim.jsp.admin.service.impl.ProductServiceImpl;
import nurim.jsp.dao.MyBatisConnectionFactory;
import nurim.jsp.helper.BaseController;
import nurim.jsp.helper.UploadHelper;
import nurim.jsp.helper.WebHelper;
import nurim.jsp.model.Product;

@WebServlet("/admin/edit_ok.do")
public class EditOk extends BaseController {
	private static final long serialVersionUID = -4124214171500366910L;

	/** (1) 사용하고자 하는 Helper + Service 객체 선언 */
	// --> import org.apache.logging.log4j.Logger;
	Logger logger;
	// --> import org.apache.ibatis.session.SqlSession;
	SqlSession sqlSession;
	// --> import study.jsp.helper.WebHelper;
	WebHelper web;
	// --> import study.jsp.helper.UploadHelper;
	UploadHelper upload;
	ProductService productService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		/** (2) 사용하고자 하는 Helper + Service 객체 생성 */
		// --> import org.apache.logging.log4j.LogManager;
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		// --> import study.jsp.mysite.dao.MyBatisConnectionFactory;
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		upload = UploadHelper.getInstance();
		// 회원가입 처리를 위한 Service객체
		productService = new ProductServiceImpl(sqlSession, logger);

		/** (4) 파라미터 처리 */
		// --> topbar.jsp에 배치된 폼으로부터 전송되는 입력값.
		String title = web.getString("title");
		int price = web.getInt("price");
		int no = web.getInt("no");
		String date = web.getString("date");
		String file = web.getString("file");
		String category = web.getString("category");
		String provide = web.getString("provide");
		String cont = web.getString("cont");

		logger.debug("title=" + title);
		logger.debug("price=" + price);
		logger.debug("no=" + no);
		logger.debug("date=" + date);
		logger.debug("file=" + file);
		logger.debug("category=" + category);
		logger.debug("provide=" + provide);
		logger.debug("cont=" + cont);

		/** (5) 전달받은 파라미터를 세션에 저장 */
		// --> import study.jsp.mysite.model.Member
		Product prod= new Product();
		prod.setPro_name(title);
		prod.setPro_price(price);
		prod.setAmount(no);
		prod.setReg_date(date);
		prod.setPro_img(file);
		prod.setCategory(category);
		prod.setProvider(provide);
		prod.setContent(cont);
		/** (8) Service를 통한 데이터베이스 저장 처리 */
		try {
			productService.insertProductItem(prod);
		}catch(NullPointerException e){
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			// 예외가 발생한 경우이므로, 더이상 진행하지 않는다.
			return null;
		}

		/** (9) 가입이 완료되었으므로 메인페이지로 이동 */
		web.redirect(web.getRootPath() + "/admin/new_item.do", "상품이 등록되었습니다. 상품을 해 주세요.");

		return null;
	}

}
