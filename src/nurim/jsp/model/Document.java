package nurim.jsp.model;

public class Document {
	private int id;
	private int member_id;
	private String category;
	private String subject;
	private String content;
	private String reg_date;
	private String edit_date;
	private int hit;
	private String ip_address;
	private String agree;
	private String disagree;
	private String qna_type;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
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
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getEdit_date() {
		return edit_date;
	}
	public void setEdit_date(String edit_date) {
		this.edit_date = edit_date;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getIp_address() {
		return ip_address;
	}
	public void setIp_address(String ip_address) {
		this.ip_address = ip_address;
	}
	public String getAgree() {
		return agree;
	}
	public void setAgree(String agree) {
		this.agree = agree;
	}
	public String getDisagree() {
		return disagree;
	}
	public void setDisagree(String disagree) {
		this.disagree = disagree;
	}
	public String getQna_type() {
		return qna_type;
	}
	public void setQna_type(String qna_type) {
		this.qna_type = qna_type;
	}
	@Override
	public String toString() {
		return "Document [id=" + id + ", member_id=" + member_id + ", category=" + category + ", subject=" + subject
				+ ", content=" + content + ", reg_date=" + reg_date + ", edit_date=" + edit_date + ", hit=" + hit
				+ ", ip_address=" + ip_address + ", agree=" + agree + ", disagree=" + disagree + ", qna_type="
				+ qna_type + "]";
	}
	
	
	

}
