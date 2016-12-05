package nurim.jsp.admin.service;

import java.util.List;

import nurim.jsp.model.Category;
import nurim.jsp.model.ProCategory;
import nurim.jsp.model.Product;

public interface ProductAdmin {

	/**
	 * 상품을 등록한다.
	 * @param product - 상품 데이터
	 * @throws Exception
	 */
	public void insertProduct(Product product) throws Exception;
	
	/**
	 * 상품을 카테고리를 등록한다.
	 * @param category - 카테고리 데이터
	 * @throws Exception
	 */
	public void insertProCategory(ProCategory proCategory) throws Exception;
	
	
	/**
	 * 상품 목록을 조회한다.
	 * @param product - 상품 데이터
	 * @return List - 게시물 목록
	 * @throws Exception
	 */
	public List<Product> selectProductList(Product product) throws Exception;
	
	/**
	 * 카테고리 목록을 조회한다.
	 * @param category - 카테고리 데이터
	 * @return List - 카테고리 목록
	 * @throws Exception
	 */
	public List<ProCategory> selectProCategoryList(ProCategory proCategory) throws Exception;
	public List<Category> selectCategoryList(Category category) throws Exception;
	
	
	/**
	 * 전체 상품 수 조회
	 * 
	 * @param  product - 상품 데이터
	 * @return int
	 * @throws Exception
	 */
	public int selectProductCount(Product product) throws Exception;
	
	/**
	 * 선택된 상품 삭제
	 * @param  product - 상품 데이터
	 * @param  proCategory - 상품 카테고리 데이터
	 * @throws Exception
	 */
	public void deleteProduct(Product product) throws Exception;
	public void deleteProCategory(ProCategory proCategory) throws Exception;
	
	
	/**
	 * 단일 상품을 조회한다.
	 * @param product - 상품 데이터
	 * @throws Exception
	 */
	public Product selectProduct(Product product) throws Exception;
	
}
