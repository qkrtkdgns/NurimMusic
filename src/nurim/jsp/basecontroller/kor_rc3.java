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

import nurim.jsp.admin.service.ProductService;
import nurim.jsp.admin.service.impl.ProductServiceImpl;
import nurim.jsp.dao.MyBatisConnectionFactory;
import nurim.jsp.helper.BaseController;
import nurim.jsp.helper.PageHelper;
import nurim.jsp.helper.UploadHelper;
import nurim.jsp.helper.WebHelper;
import nurim.jsp.model.Product;

@WebServlet("/kor_rc3.do")
public class kor_rc3 extends BaseController {
	private static final long serialVersionUID = -6065660656266908222L;
	
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	ProductService productService;
	PageHelper pageHelper;
	UploadHelper upload;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		productService = new ProductServiceImpl(sqlSession, logger);
		pageHelper = PageHelper.getInstance();
		upload = UploadHelper.getInstance();
		
	
		
		/** (3) 조회할 정보에 대한 Beans 생성 */
		String CategoryName = "ost";
		String keyword = web.getString("keyword");
		Product product = new Product();
		
	
			product.setProName(keyword);	
			product.setProvider(keyword);
			
		if(web.getString("keyword_type")==null){
			web.redirect(null, "검색 조건을 선택하세요.");
		}
		
		product.setProCategoryName(CategoryName);
		logger.debug("ProCategoryName> " + CategoryName);
		logger.debug("keyword> " + keyword);
		
		//현재 페이지 수 --> 기본 값은 1페이지로 설정함
		int page = web.getInt("page",1);

				/** (6) 게시글 목록 조회 */
				int totalCount = 0;
				List<Product> productList = null;
				
				try {
					//전체 게시물 수
					totalCount = productService.selectProductCategoryCount(product);
					//--> 현재 페이지, 전체 게시물 수, 한 페이지의 목록 수, 그룹갯수
					pageHelper.pageProcess(page, totalCount, 10, 5);
					
					//페이지 번호 계산 결과에서 Limit절에 필요한 값을 Beans에 추가
					product.setLimitStart(pageHelper.getLimitStart());
					product.setListCount(pageHelper.getListCount());
					productList = productService.selectProductCategoryList(product);
					//logger.debug("prodList >> " + prodList);
				} catch (Exception e) {
					web.redirect(null, e.getLocalizedMessage());
					return null;
				} finally {
					sqlSession.close();
				}
				
				// 조회결과가 존재할 경우 --> 갤러리라면 이미지 경로를 썸네일로 교체
				if (productList != null) {
					for (int i=0; i<productList.size(); i++) {
						Product item = productList.get(i);
						String ProImg = item.getProImg();
						if (ProImg != null) {
							String thumbPath = upload.createThumbnail(ProImg, 100, 100, true);
							// 글 목록 컬렉션 내의 Beans 객체가 갖는 이미지 경로를 썸네일로 변경한다.
							item.setProImg(thumbPath);
							logger.debug("thumbnail create > " + item.getProImg());
						}
					}
				}
				
				/** (7) 조회 결과를 View에 전달 */
				request.setAttribute("productList", productList);
				//페이지 번호 계산 결과를 View에 전달
				request.setAttribute("pageHelper", pageHelper);
				//사용자가 입력한 검색어를 View에 전달
				request.setAttribute("keyword", keyword);
				
		return "kor_rc3";
	}

}
