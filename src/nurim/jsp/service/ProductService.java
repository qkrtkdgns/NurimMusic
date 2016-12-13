package nurim.jsp.service;

import java.util.List;

import nurim.jsp.model.Basket;
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

	/**
	 * index 페이지 BestItem 보여주기
	 * @return
	 * @throws Exception
	 */
	public List<Product> selectProductBestItemList() throws Exception;

	/**
	 * index 페이지 NewItem 보여주기
	 * @return
	 * @throws Exception
	 */
	public List<Product> selectProductNewItemList() throws Exception;

	/**
	 * index 페이지 MD 추천 아이템 보여주기
	 * @return
	 * @throws Exception
	 */
	public List<Product> selectProductMDItemList() throws Exception;

	/**
	 * 국내 음반 index 리스트 보여주기
	 * @return
	 * @throws Exception
	 */
	public List<Product> selectProductKorNewItemList() throws Exception;

	/**
	 * 해외 음반 index 리스트 보여주기
	 * @return
	 * @throws Exception
	 */
	public List<Product> selectProductForeignNewItemList() throws Exception;

	/**
	 * 상품 음반 index HOTItem 리스트 보여주기
	 * @return
	 * @throws Exception
	 */
	public List<Product> selectProductHOTItemList() throws Exception;
	
	/**
	 * 단일 상품을 조회한다.
	 * @param product - 상품 데이터
	 * @throws Exception
	 */
	public Product selectProduct(Product product) throws Exception;
	
	/**
	 * 이전 상품을 조회한다.
	 * @param product - 상품 데이터
	 * @throws Exception
	 */
	public Product selectPrevProduct(Product product) throws Exception;
	
	/**
	 * 다음 상품을 조회한다.
	 * @param product - 상품 데이터
	 * @throws Exception
	 */
	public Product selectNextProduct(Product product) throws Exception;
	
	
	/**
	 * 조회수 증가
	 * @param product - 상품 데이터
	 * @throws Exception
	 */
	public void updateProduct(Product product) throws Exception;
	
}
