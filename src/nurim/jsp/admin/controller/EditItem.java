package nurim.jsp.admin.controller;

import java.io.IOException;
import java.util.Map;

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
import nurim.jsp.helper.UploadHelper;
import nurim.jsp.helper.WebHelper;
import nurim.jsp.model.Product;


@WebServlet("/admin/edit_item.do")
public class EditItem extends BaseController{
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	ProductAdmin productAdmin;
	UploadHelper upload;
	
	private static final long serialVersionUID = 34858369414025718L;

	/**(1) 사용하고자 하는 Helper 객체 선언 */
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		productAdmin = new ProductAdminImpl(sqlSession, logger);
		upload = UploadHelper.getInstance();
		
		
		/** (3) 로그인 여부 검사 
		// 로그인 중이 아니라면 이 페이지를 동작시켜서는 안된다.
		if (web.getSession("loginInfo") == null) {
			// 이미 SqlSession 객체를 생성했으므로, 데이터베이스 접속을 해제해야 한다.
			sqlSession.close();
			web.redirect(web.getRootPath() + "/admin/index.do", "로그인 중이 아닙니다.");
			return null;
		}
		*/
		
				
				/**
				 * Map<String, String> paramMap =upload.getParamMap();
				int productId=0;
				try{
					productId = Integer.parseInt(paramMap.get("product_id"));
				}catch(NumberFormatException e){
					sqlSession.close();
					web.redirect(null, "글 번호가 올바르지 않습니다");
					return null;
				}
				
				
				String proName = paramMap.get("title");
				String proPrice = paramMap.get("price");
				String amount= paramMap.get("no");
				String provider = paramMap.get("provider");
				String content = paramMap.get("content");
				String proCategoryName = paramMap.get("category");
				
				//로그 확인
				logger.debug("proName=" + proName);
				logger.debug("proPrice=" + proPrice);
				logger.debug("amount=" + amount);
				logger.debug("provider=" + provider);
				logger.debug("content=" + content);
				logger.debug("proCategoryName=" + proCategoryName);
				*/
			
			
				
				/** (3) 글 번호 파라미터 받기 */
				int productId = web.getInt("id");
				if (productId == 0) {
					sqlSession.close();
					web.redirect(null, "상품 번호가 지정되지 않았습니다.");
					return null;
				}

				// 파라미터를 Beans로 묶기
				Product product = new Product();
				product.setId(productId);
				
				/** (4) 상품 일련번호를 사용한 데이터 조회 */
				// 지금 보고 있는 상품이 저장될 객체
				Product readproduct= null;
				
				
				try {
					
					readproduct=productAdmin.selectProduct(product);
					logger.debug("readproduct > " +readproduct);
				} catch (Exception e) {
					web.redirect(null, e.getLocalizedMessage());
					return null;
				} finally {
					sqlSession.close();
				}
				
				/** (7) 조회 결과를 View에 전달 */
				request.setAttribute("readproduct", readproduct);
		return "admin/edit_item";
	}

}
