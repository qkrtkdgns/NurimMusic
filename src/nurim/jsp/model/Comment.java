package nurim.jsp.model;

public class Comment {
	private int id = 0;
	private int memberId = 0;
	private int documentId = 0;
	private String userId = null;
	private String regDate = null;
	private String editDate = null;
	private String ipAddress = null;
	
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
	
	@Override
	public String toString() {
		return "Comment [id=" + id + ", memberId=" + memberId + ", documentId=" + documentId + ", userId=" + userId
				+ ", regDate=" + regDate + ", editDate=" + editDate + ", ipAddress=" + ipAddress + "]";
	}
	
}
