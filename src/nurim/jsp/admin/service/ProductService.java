package nurim.jsp.admin.service;

import java.util.List;

import nurim.jsp.model.Product;

public interface ProductService {
	
	public int selectProductCategoryCount(Product product) throws Exception;
	
	public List<Product> selectProductList(Product product) throws Exception;
	
	/**
	 * 카테고리별 상품 목록을 조회한다.
	 * @param product - 상품 데이터
	 * @return List - 게시물 목록
	 * @throws Exception
	 */
	public List<Product> selectProductCategoryList(Product product) throws Exception;
	
	public void insertProductItem(Product product) throws Exception;
}
