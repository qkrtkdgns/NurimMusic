package nurim.jsp.admin.service;

import java.util.List;

import nurim.jsp.model.Product;

public interface ProductService {
	
	public int selectProductCount(Product product) throws Exception;
	
	public List<Product> selectProductList(Product product) throws Exception;

	public void insertProductItem(Product product) throws Exception;
}
