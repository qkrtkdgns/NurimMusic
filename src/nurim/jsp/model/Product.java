package nurim.jsp.model;

public class Product {
	private int id = 0;
	private int documentId = 0;
	private int proCategoryId = 0;
	private String proImg = null;
	private String proName = null;
	private int proPrice = 0;
	private int amount = 0;
	private int proHit = 0;
	private String regDate = null;
	private String editDate = null;
	private String provider = null;
	private String content = null;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getDocumentId() {
		return documentId;
	}
	public void setDocumentId(int documentId) {
		this.documentId = documentId;
	}
	public int getProCategoryId() {
		return proCategoryId;
	}
	public void setProCategoryId(int proCategoryId) {
		this.proCategoryId = proCategoryId;
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
	public int getProHit() {
		return proHit;
	}
	public void setProHit(int proHit) {
		this.proHit = proHit;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getEditDate() {
		return editDate;
	}
	public void setEditDate(String editDate) {
		this.editDate = editDate;
	}
	public String getProvider() {
		return provider;
	}
	public void setProvider(String provider) {
		this.provider = provider;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "Product [id=" + id + ", documentId=" + documentId + ", proCategoryId=" + proCategoryId + ", proImg="
				+ proImg + ", proName=" + proName + ", proPrice=" + proPrice + ", amount=" + amount + ", proHit="
				+ proHit + ", regDate=" + regDate + ", editDate=" + editDate + ", provider=" + provider + ", content="
				+ content + "]";
	}
	
}
