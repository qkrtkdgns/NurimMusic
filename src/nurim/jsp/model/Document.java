package nurim.jsp.model;

public class Document {
	private int id = 0;
	private int memberId = 0;
	private String category = null;
	private String subject = null;
	private String content = null;
	private String regDate = null;
	private String editDate = null;
	private int hit = 0;
	private String ipAddress = null;
	private int agree = 0;
	private int disagree = 0;
	private String qnaType = null;
	
	private int LimitStart= 0;
	private int ListCount=0;
	
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
	@Override
	public String toString() {
		return "Document [id=" + id + ", memberId=" + memberId + ", category=" + category + ", subject=" + subject
				+ ", content=" + content + ", regDate=" + regDate + ", editDate=" + editDate + ", hit=" + hit
				+ ", ipAddress=" + ipAddress + ", agree=" + agree + ", disagree=" + disagree + ", qnaType=" + qnaType
				+ ", LimitStart=" + LimitStart + ", ListCount=" + ListCount + "]";
	}
	
}
