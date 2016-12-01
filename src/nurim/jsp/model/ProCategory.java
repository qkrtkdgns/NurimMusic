package nurim.jsp.model;

public class ProCategory extends Category{
	private int id = 0;
	private int productId = 0;
	private int categoryId = 0;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	@Override
	public String toString() {
		return "Pro_category [id=" + id + ", productId=" + productId + ", categoryId=" + categoryId
				+ ", getProCategoryName()=" + getProCategoryName() + "]";
	}
	
	
	
}
