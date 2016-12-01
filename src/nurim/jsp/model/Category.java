package nurim.jsp.model;

public class Category {
	private int id;
	private String proCategoryName;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getProCategoryName() {
		return proCategoryName;
	}
	public void setProCategoryName(String proCategoryName) {
		this.proCategoryName = proCategoryName;
	}
	@Override
	public String toString() {
		return "Category [id=" + id + ", proCategoryName=" + proCategoryName + "]";
	}
	

}
