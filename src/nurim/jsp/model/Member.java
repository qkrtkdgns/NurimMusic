package nurim.jsp.model;

public class Member {

   private int id = 0;
   private String user_id = null;
   private String user_pw = null;
   private String user_name = null;
   private String gender = null;
   private String birthdate = null;
   private String email = null;
   private String tel = null;
   private String postcode = null;
   private String addr1 = null;
   private String addr2 = null;
   private String reg_date = null;
   private String edit_date = null;
   
   private int LimitStart = 0;
   private int ListCount = 0;

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
   public String getUser_id() {
      return user_id;
   }
   public void setUser_id(String user_id) {
      this.user_id = user_id;
   }
   public String getUser_pw() {
      return user_pw;
   }
   public void setUser_pw(String user_pw) {
      this.user_pw = user_pw;
   }
   public String getUser_name() {
      return user_name;
   }
   public void setUser_name(String user_name) {
      this.user_name = user_name;
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
@Override
public String toString() {
	return "Member [id=" + id + ", user_id=" + user_id + ", user_pw=" + user_pw + ", user_name=" + user_name
			+ ", gender=" + gender + ", birthdate=" + birthdate + ", email=" + email + ", tel=" + tel + ", postcode="
			+ postcode + ", addr1=" + addr1 + ", addr2=" + addr2 + ", reg_date=" + reg_date + ", edit_date=" + edit_date
			+ ", LimitStart=" + LimitStart + ", ListCount=" + ListCount + "]";
}
}