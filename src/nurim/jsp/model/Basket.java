package nurim.jsp.model;

public class Basket {
	private int id;
	private int product_id;
	private int member_id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	@Override
	public String toString() {
		return "Basket [id=" + id + ", product_id=" + product_id + ", member_id=" + member_id + "]";
	}
	
	

}
