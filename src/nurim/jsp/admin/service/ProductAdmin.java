package nurim.jsp.admin.service;

import java.util.List;

import nurim.jsp.model.Product;

public interface ProductAdmin {

	/**
	 * 상품을 등록한다.
	 * @param product - 상품 데이터
	 * @throws Exception
	 */
	public void insertProduct(Product product) throws Exception;
	
	/**
	 * 상품 목록을 조회한다.
	 * @param product - 상품 데이터
	 * @return List - 게시물 목록
	 * @throws Exception
	 */
	public List<Product> selectProductList(Product product) throws Exception;
	
	
	/**
	 * 전체 상품 수 조회
	 * 
	 * @param  product - 상품 데이터
	 * @return int
	 * @throws Exception
	 */
	public int selectProductCount(Product product) throws Exception;
}
