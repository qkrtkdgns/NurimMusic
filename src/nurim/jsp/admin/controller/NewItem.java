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
import nurim.jsp.admin.service.ProductService;
import nurim.jsp.admin.service.impl.ProductAdminImpl;
import nurim.jsp.admin.service.impl.ProductServiceImpl;
import nurim.jsp.dao.MyBatisConnectionFactory;
import nurim.jsp.helper.BaseController;
import nurim.jsp.helper.PageHelper;
import nurim.jsp.helper.UploadHelper;
import nurim.jsp.helper.WebHelper;
import nurim.jsp.model.Product;

@WebServlet("/admin/new_item.do")
public class NewItem extends BaseController{
	private static final long serialVersionUID = -6769667557571667255L;
	/**(1) 사용하고자 하는 Helper 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	ProductAdmin productAdmin;
	PageHelper pageHelper;
	UploadHelper upload;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		productAdmin = new ProductAdminImpl(sqlSession, logger);
		pageHelper = PageHelper.getInstance();
		upload = UploadHelper.getInstance();
		/** (3) 로그인 여부 검사 */
		
		/**로그인 중이 아니라면 이 페이지를 동작시켜서는 안된다.
		if (web.getSession("loginInfo") == null) {
			// 이미 SqlSession 객체를 생성했으므로, 데이터베이스 접속을 해제해야 한다.
			sqlSession.close();
			web.redirect(web.getRootPath() + "/admin/index.do", "로그인 중이 아닙니다.");
			return null;
		}
		*/ 
		
		/** (3) 조회할 정보에 대한 Beans 생성 */
		Product product = new Product();
		
		//현재 페이지 수 --> 기본 값은 1페이지로 설정함
		//int page = web.getInt("page",1);
		//검색어
	//			String keyword = web.getString("search_item");
		//		logger.debug("keyword >> " + keyword);
				
				//제목과 내용에 대한 검색으로 활용하기 위해서 입력값을 설정한다.
				//prod.setProName(keyword);

				/** (6) 게시글 목록 조회 */
				int totalCount = 0;
				List<Product> productList = null;
				
				try {
					//전체 게시물 수
					totalCount = productAdmin.selectProductCount(product);
					//나머지 페이지 번호 계산하기
					//--> 현재 페이지, 전체 게시물 수, 한 페이지의 목록 수, 그룹갯수
					
					//pageHelper.pageProcess(page, totalCount, 3, 7);
					
					//페이지 번호 계산 결과에서 Limit절에 필요한 값을 Beans에 추가
					
					//prod.setLimitStart(pageHelper.getLimitStart());
					//prod.setListCount(pageHelper.getListCount());
					productList = productAdmin.selectProductList(product);
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
				// 사용자가 입력한 검색어를 View에 되돌려준다. --> 자동완성 구현을 위함
				//request.setAttribute("keyword", keyword);
				//페이지 번호 계산 결과를 View에 전달
				//request.setAttribute("pageHelper", pageHelper);
		
		
		// "/WEB-INF/views/view/index.jsp"파일을 View로 사용한다.
		return "admin/new_item";
	}

}
