package nurim.jsp.model;

public class Category {
	private int id = 0;
	private String proCategory = null;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPro_category() {
		return proCategory;
	}
	public void setPro_category(String pro_category) {
		this.proCategory = pro_category;
	}
	
	@Override
	public String toString() {
		return "category [id=" + id + ", proCategory=" + proCategory + "]";
	}
	
}
