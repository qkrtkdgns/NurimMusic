package nurim.jsp.model;

public class Comment {
   private int id = 0;
   private int member_id = 0;
   private int document_id = 0;
   private String user_id = null;
   private String reg_date = null;
   private String edit_date = null;
   private String ip_address = null;
   
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
   public int getDocument_id() {
      return document_id;
   }
   public void setDocument_id(int document_id) {
      this.document_id = document_id;
   }
   public String getUser_id() {
      return user_id;
   }
   public void setUser_id(String user_id) {
      this.user_id = user_id;
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
   public String getIp_address() {
      return ip_address;
   }
   public void setIp_address(String ip_address) {
      this.ip_address = ip_address;
   }
   
   @Override
   public String toString() {
      return "Comment [id=" + id + ", member_id=" + member_id + ", document_id=" + document_id + ", user_id="
            + user_id + ", reg_date=" + reg_date + ", edit_date=" + edit_date + ", ip_address=" + ip_address + "]";
   }
}