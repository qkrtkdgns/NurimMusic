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

}
