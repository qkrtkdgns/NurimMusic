package nurim.jsp.model;

public class Basket {
	private int id = 0;
	private int productId = 0;
	private int memberId = 0;
	private String proImg = null;
	private String proName = null;
	private int proPrice = 0;
	private int amount = 0;
	
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
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public String getProImg() {
		return proImg;
	}
	public void setProImg(String proImg) {
		this.proImg = proImg;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public int getProPrice() {
		return proPrice;
	}
	public void setProPrice(int proPrice) {
		this.proPrice = proPrice;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	@Override
	public String toString() {
		return "Basket [id=" + id + ", productId=" + productId + ", memberId=" + memberId + ", proImg=" + proImg
				+ ", proName=" + proName + ", proPrice=" + proPrice + ", amount=" + amount + "]";
	}
	
}
