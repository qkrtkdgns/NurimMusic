package nurim.jsp.model;

public class Product extends Category {
	private int id;
	private int documentId;
	private String proImg;
	private String proName;
	private String proPrice;
	private String amount ;
	private int proHit ;
	private String regDate;
	private String editDate;
	private String provider;
	private String content;
	
	private int LimitStart;
	private int ListCount;
	
	private String CList;
	
	public String getCList() {
		return CList;
	}
	public void setCList(String sList) {
		CList = sList;
	}
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
	public String getProPrice() {
		return proPrice;
	}
	public void setProPrice(String proPrice) {
		this.proPrice = proPrice;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
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
	public int getLimitStart() {
		return LimitStart;
	}
	public void setLimitStart(int limitStart) {
		LimitStart = limitStart;
	}
	public int getListCount() {
		return ListCount;
	}
	public void setListCount(int listCount) {
		ListCount = listCount;
	}
	@Override
	public String toString() {
		return "Product [id=" + id + ", documentId=" + documentId + ", proImg=" + proImg + ", proName=" + proName
				+ ", proPrice=" + proPrice + ", amount=" + amount + ", proHit=" + proHit + ", regDate=" + regDate
				+ ", editDate=" + editDate + ", provider=" + provider + ", content=" + content + ", LimitStart="
				+ LimitStart + ", ListCount=" + ListCount + ", CList=" + CList + ", getProCategoryName()="
				+ getProCategoryName() + "]";
	}
	

	
}
