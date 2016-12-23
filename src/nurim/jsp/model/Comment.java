package nurim.jsp.model;

public class Comment extends Document {
	private int id;
	private int memberId;
	private int documentId;

	private String userId;
	private String regDate;
	private String editDate;
	private String ipAddress;
	private String content;
	private String payCheck;
	
	private int LimitStart;
	private int ListCount;
	
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPayCheck() {
		return payCheck;
	}
	public void setPayCheck(String payCheck) {
		this.payCheck = payCheck;
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
	public int getDocumentId() {
		return documentId;
	}
	public void setDocumentId(int documentId) {
		this.documentId = documentId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
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
	public String getIpAddress() {
		return ipAddress;
	}
	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
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
		return "Comment [id=" + id + ", memberId=" + memberId + ", documentId=" + documentId + ", userId=" + userId
				+ ", regDate=" + regDate + ", editDate=" + editDate + ", ipAddress=" + ipAddress + ", content="
				+ content + ", payCheck=" + payCheck + ", LimitStart=" + LimitStart + ", ListCount=" + ListCount
				+ ", getCategory()=" + getCategory() + "]";
	}


	
}
