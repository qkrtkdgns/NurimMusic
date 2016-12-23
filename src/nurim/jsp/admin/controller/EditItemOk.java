package nurim.jsp.admin.controller;

import java.io.IOException;
import java.util.List;
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
import nurim.jsp.helper.FileInfo;
import nurim.jsp.helper.RegexHelper;
import nurim.jsp.helper.UploadHelper;
import nurim.jsp.helper.WebHelper;
import nurim.jsp.model.ProCategory;
import nurim.jsp.model.Product;


@WebServlet("/admin/edit_item_ok.do")
public class EditItemOk extends BaseController{

	private static final long serialVersionUID = 9104202446339145629L;
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	ProductAdmin productAdmin;
	UploadHelper upload;
	RegexHelper regex;
	
	/**(1) 사용하고자 하는 Helper 객체 선언 */
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		productAdmin = new ProductAdminImpl(sqlSession, logger);
		upload = UploadHelper.getInstance();
		regex = RegexHelper.getInstance();
		
		/** (3) 로그인 여부 검사 */
		// 로그인 중이 아니라면 이 페이지를 동작시켜서는 안된다.
		if (web.getSession("loginInfo") == null) {
			// 이미 SqlSession 객체를 생성했으므로, 데이터베이스 접속을 해제해야 한다.
			sqlSession.close();
			web.redirect(web.getRootPath() + "/admin/index.do", "로그인 중이 아닙니다.");
			return null;
		}
		
		try {
			upload.multipartRequest(request);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, "multipart 데이터가 아닙니다.");
			return null;
		}

				Map<String, String> paramMap =upload.getParamMap();
				String product_id = paramMap.get("id");
				String proName = paramMap.get("title");
				String proPrice = paramMap.get("price");
				String provider = paramMap.get("provider");
				String content = paramMap.get("content");
				String amount= paramMap.get("no");
				String proCategoryName = paramMap.get("category");
				String soldout = paramMap.get("sal_no");
				String regDate= paramMap.get("date");
				
				
				logger.debug("proName=" + proName);
				logger.debug("proPrice=" + proPrice);
				logger.debug("amount=" + amount);
				logger.debug("provider=" + provider);
				logger.debug("content=" + content);
				logger.debug("proCategoryName=" + proCategoryName);
				logger.debug("soldout=" + soldout);
				
				/** (3) 글 번호 파라미터 받기 */
				if(product_id == null){
					sqlSession.close();
					web.redirect(null, "글 번호가 올바르지 않습니다");
					return null;
				}
				
				
				
				/** (4) 입력 받은 파라미터에 대한 유효성 검사 */
				if (!regex.isValue(proName)) {
					sqlSession.close();
					web.redirect(null, "상품명을 입력하세요.");
					return null;
				}

				if (!regex.isValue(proPrice)) {
					sqlSession.close();
					web.redirect(null, "상품 가격을 입력하세요.");
					return null;
				}

				// 재고
				if (!regex.isValue(amount)) {
					sqlSession.close();
					web.redirect(null, "수량을 입력하세요.");
					return null;
				}
			
			
				/**(5) 입력 받은 파라미터를 Beans로 묶기*/
				Product product = new Product();
				int productId = Integer.parseInt(product_id);
				product.setId(productId);
				product.setProName(proName);
				product.setProPrice(proPrice);
				product.setProvider(provider);
				product.setContent(content);
				product.setRegDate(regDate);
				
				if(soldout.equals("2")){
					product.setAmount("0");
				}else{
					product.setAmount(amount);
				}
				
				List<FileInfo> fileList = upload.getFileList();
				// 업로드 된 프로필 사진 경로가 저장될 변수
				
				String profileImg = null;
				// 업로드 된 파일이 존재할 경우만 변수값을 할당한다.
				if (fileList.size() > 0) {
					// 단일 업로드이므로 0번째 항목만 가져온다.
					FileInfo info = fileList.get(0);
					upload.removeFile( paramMap.get("Oldfile"));
					profileImg = info.getFileDir() + "/" + info.getFileName();
					
				}else{
					profileImg = paramMap.get("Oldfile");
				}
			
				// 파일경로를 로그로 기록
				logger.debug("profileImg=" + profileImg);
				
				product.setProImg(profileImg);
	
				ProCategory proCategory =new ProCategory();
				proCategory.setProductId(productId);
				proCategory.setProCategoryName(proCategoryName);
				
			/**(6) 상품 변경을 위한 Service 기능을 호출*/	
			try {
					productAdmin.updateProduct(product);
					productAdmin.updateProCategory(proCategory);
				} catch (Exception e) {
					web.redirect(null, e.getLocalizedMessage());
					return null;
				} finally {
					sqlSession.close();
				}
				
		web.redirect(web.getRootPath() + "/admin/item_list.do", "상품이 수정되었습니다. 상품을 확인해 주세요.");
		return null;
	}

}
