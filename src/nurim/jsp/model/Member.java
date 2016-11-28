package nurim.jsp.model;

public class Member {

	private int id = 0;
	private String userId = null;
	private String userPw = null;
	private String userName = null;
	private String gender = null;
	private String birthdate = null;
	private String email = null;
	private String tel = null;
	private String postcode = null;
	private String addr1 = null;
	private String addr2 = null;
	private String regDate = null;
	private String editDate = null;
	
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
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirthdate() {
		return birthdate;
	}
	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
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
	@Override
	public String toString() {
		return "Member [id=" + id + ", userId=" + userId + ", userPw=" + userPw + ", userName=" + userName + ", gender="
				+ gender + ", birthdate=" + birthdate + ", email=" + email + ", tel=" + tel + ", postcode=" + postcode
				+ ", addr1=" + addr1 + ", addr2=" + addr2 + ", regDate=" + regDate + ", editDate=" + editDate
				+ ", LimitStart=" + LimitStart + ", ListCount=" + ListCount + "]";
	}
	

}
