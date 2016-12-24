package nurim.jsp.model;

public class Document {
	private int id = 0;
	private String category = null;
	private String subject = null;
	private String content = null;
	private String regDate = null;
	private String editDate = null;
	private int hit = 0;
	private String ipAddress = null;
	private int memberId = 0;
	private int agree = 0;
	private int disagree = 0;
	private String qnaType = null;
	private String endDate = null;
	private int productId = 0;
	
	private boolean gallery;
	private String imagePath;
	
	//페이지 구현을 위해서 추가된 값
	private int limitStart;
	private int listCount;
	
	private String hitHighList = null;
	
	public boolean isGallery() {
		return gallery;
	}
	public void setGallery(boolean gallery) {
		this.gallery = gallery;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getIpAddress() {
		return ipAddress;
	}
	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}
	public int getAgree() {
		return agree;
	}
	public void setAgree(int agree) {
		this.agree = agree;
	}
	public int getDisagree() {
		return disagree;
	}
	public void setDisagree(int disagree) {
		this.disagree = disagree;
	}
	public String getQnaType() {
		return qnaType;
	}
	public void setQnaType(String qnaType) {
		this.qnaType = qnaType;
	}
	
	public int getLimitStart() {
		return limitStart;
	}
	public void setLimitStart(int limitStart) {
		this.limitStart = limitStart;
	}
	public int getListCount() {
		return listCount;
	}
	public void setListCount(int listCount) {
		this.listCount = listCount;
	}
	
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	
	public String getHitHighList() {
		return hitHighList;
	}
	public void setHitHighList(String hitHighList) {
		this.hitHighList = hitHighList;
	}
	
	@Override
	public String toString() {
		return "Document [id=" + id + ", category=" + category + ", subject=" + subject + ", content=" + content
				+ ", regDate=" + regDate + ", editDate=" + editDate + ", hit=" + hit + ", ipAddress=" + ipAddress
				+ ", memberId=" + memberId + ", agree=" + agree + ", disagree=" + disagree + ", qnaType=" + qnaType
				+ ", endDate=" + endDate + ", productId=" + productId + ", gallery=" + gallery + ", imagePath="
				+ imagePath + ", limitStart=" + limitStart + ", listCount=" + listCount + ", hitHighList=" + hitHighList
				+ "]";
	}
}
