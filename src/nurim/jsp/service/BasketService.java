package nurim.jsp.service;

import java.util.List;

import nurim.jsp.model.Basket;

public interface BasketService {

	/**
	 * 장바구니의 아이템 목록을 확인한다.
	 * @param bas
	 * @return
	 * @throws Exception
	 */
	public List<Basket> selectList(Basket bas) throws Exception;

	/**
	 * 장바구니 상품을 삭제한다.
	 * @param bas
	 * @throws Exception
	 */
	public void deleteitem(Basket bas) throws Exception;

	/**
	 * 장바구니 상품의 수량을 수정한다.
	 * @param basket
	 * @throws Exception
	 */
	public void updateItem(Basket basket) throws Exception;

	/**
	 * 장바구니의 상품을 선택한다.
	 * @param basket
	 * @return
	 * @throws Exception
	 */
	public Basket selectItem(Basket basket) throws Exception;

	/**
	 * 상품 재고를 확인한다.
	 * @param basket
	 * @throws Exception
	 */
	public void compareItem(Basket basket) throws Exception;

	public Basket selectProductBasketItem(Basket basket) throws Exception;

	/**
	 * 삭제된 회원의 장바구니를 삭제한다.
	 * @param basket
	 * @throws Exception
	 */
	public void deleteBasket(Basket basket) throws Exception;

	/**
	 * 바로 주문시 상품 재고 확인
	 * @param basket
	 * @throws Exception
	 */
	public void compareItem2(Basket basket) throws Exception;
	
	
	/**
	 * 장바구니에 상품을 추가한다.
	 * @param basket
	 * @return
	 * @throws Exception
	 */
	public Basket insertItem(Basket basket) throws Exception;
	
	
	/**
	 * (상품 상세페이지)장바구니에 상품을 추가한다.
	 * @param basket
	 * @return
	 * @throws Exception
	 */
	public Basket insertItem2(Basket basket) throws Exception;
	
	/**
	 * 체크된 상품들을 장바구니에 상품을 추가한다.
	 * @param basket
	 * @return
	 * @throws Exception
	 */
	public Basket insertItemList(Basket basket) throws Exception;

	/**
	 * 상품이 장바구니에 담겨있는지 확인(중복 검사)
	 * @param basket
	 * @return int
	 * @throws Exception
	 */
	public int CountItem(Basket basket) throws Exception;
	
	
	public void deleteitemProduct(Basket basket) throws Exception;
	
	
	public Basket selectProductBasketItemAA(Basket basket) throws Exception;
}
