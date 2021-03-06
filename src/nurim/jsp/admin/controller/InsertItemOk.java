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

@WebServlet("/admin/insert_item_ok.do")
public class InsertItemOk extends BaseController {
	private static final long serialVersionUID = -4124214171500366910L;

	/** (1) 사용하고자 하는 Helper + Service 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	UploadHelper upload;
	ProductAdmin productAdmin;
	RegexHelper regex;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		/** (2) 사용하고자 하는 Helper + Service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		upload = UploadHelper.getInstance();
		regex = RegexHelper.getInstance();
		productAdmin = new ProductAdminImpl(sqlSession, logger);
		/** (3) 로그인 여부 검사 */
		// 로그인 중이 아니라면 이 페이지를 동작시켜서는 안된다.
		if (web.getSession("loginInfo") == null) {
			// 이미 SqlSession 객체를 생성했으므로, 데이터베이스 접속을 해제해야 한다.
			sqlSession.close();
			web.redirect(web.getRootPath() + "/admin/index.do", "로그인 중이 아닙니다.");
			return null;
		}
		/** (4) 파일이 포함된 POST 파라미터 받기 */
		// <form>태그 안에 <input type="file">요소가 포함되어 있고
		// enctype="multipart/form-data"가 정의되어 있는 경우
		// WebHelper의 getString()|getInt() 메서드는 더 이상 사용할 수 없게 된다.
		try {
			upload.multipartRequest(request);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, "multipart 데이터가 아닙니다.");
			return null;
		}
		// UploadHelper에서 텍스트 형식의 파라미터를 분류한 Map을 리턴받아서 값을 추출한다.
		Map<String, String> paramMap = upload.getParamMap();
		String proName = paramMap.get("title");
		String proPrice = paramMap.get("price");
		String provider = paramMap.get("provider");
		String content = paramMap.get("content");
		String category = paramMap.get("category");
		String soldout = paramMap.get("sal_no");
		String amount= paramMap.get("no");
		
		
		logger.debug("proName=" + proName);
		logger.debug("proPrice=" + proPrice);
		logger.debug("amount=" + amount);
		logger.debug("provider=" + provider);
		logger.debug("content=" + content);
		logger.debug("category=" + category);
		logger.debug("soldout=" + soldout);


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
		if (!regex.isValue(amount) && soldout.equals("1")) {
			sqlSession.close();
			web.redirect(null, "수량을 입력하세요.");
			return null;
		}
		
		
		
		/** (6) 업로드 된 파일 정보 추출 */
		List<FileInfo> fileList = upload.getFileList();
		// 업로드 된 프로필 사진 경로가 저장될 변수
		String profileImg = null;
		
		// 업로드 된 파일이 존재할 경우만 변수값을 할당한다.
		if (fileList.size() > 0) {
			// 단일 업로드이므로 0번째 항목만 가져온다.
			FileInfo info = fileList.get(0);
			profileImg = info.getFileDir() + "/" + info.getFileName();
		}

		// 파일경로를 로그로 기록
		logger.debug("profileImg=" + profileImg);

		
		/** (5) 전달받은 파라미터를 Beans 객체에 담는다. */
		Product product= new Product();
		product.setProName(proName);
		product.setProPrice(proPrice);
		
		if(soldout.equals("2")){
			product.setAmount("0");
		}else{
			product.setAmount(amount);
		}
		
		product.setProvider(provider);
		product.setContent(content);
		product.setProImg(profileImg);
		
		/** (8) Service를 통한 데이터베이스 저장 처리 */
		try {
			productAdmin.insertProduct(product);
			ProCategory proCategory = new ProCategory();
			int categoryid = Integer.parseInt(category);
			proCategory.setCategoryId(categoryid);
			proCategory.setProductId(product.getId());
			productAdmin.insertProCategory(proCategory);
		}catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			// 예외가 발생한 경우이므로, 더이상 진행하지 않는다.
			return null;
		}
		

		/** (9)상품등록이 완료되었으므로 상품 페이지로 이동 */
		web.redirect(web.getRootPath() + "/admin/item_list.do", "상품이 등록되었습니다. 상품을 확인해 주세요.");

		return null;
	}

}
