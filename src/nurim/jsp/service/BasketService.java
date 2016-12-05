package nurim.jsp.service;

import java.util.List;

import nurim.jsp.model.Basket;

public interface BasketService {

	public List<Basket> selectList(Basket bas) throws Exception;

	public void deleteitem(Basket bas) throws Exception;

	public void updateItem(Basket basket) throws Exception;

	public Basket selectItem(Basket basket) throws Exception;

}
