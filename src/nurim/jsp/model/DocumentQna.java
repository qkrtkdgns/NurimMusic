package nurim.jsp.model;

public class DocumentQna extends Document {
	private String userName = null;
	private String tel = null;
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	@Override
	public String toString() {
		return "DocumentQna [userName=" + userName + ", tel=" + tel + "]";
	}
}
