package nurim.jsp.model;

public class Order {
   private int id = 0;
   private int product_id = 0;
   private int member_id = 0;
   private int basket_id = 0;
   private String rec_name = null;
   private String rec_tel = null;
   private String rec_postcode = null;
   private String rec_addr1 = null;
   private String rec_addr2 = null;
   private String rec_state = null;
   private int o_amount = 0;
   private String reg_date = null;
   private String edit_date = null;
   
   public int getId() {
      return id;
   }
   public void setId(int id) {
      this.id = id;
   }
   public int getProduct_id() {
      return product_id;
   }
   public void setProduct_id(int product_id) {
      this.product_id = product_id;
   }
   public int getMember_id() {
      return member_id;
   }
   public void setMember_id(int member_id) {
      this.member_id = member_id;
   }
   public int getBasket_id() {
      return basket_id;
   }
   public void setBasket_id(int basket_id) {
      this.basket_id = basket_id;
   }
   public String getRec_name() {
      return rec_name;
   }
   public void setRec_name(String rec_name) {
      this.rec_name = rec_name;
   }
   public String getRec_tel() {
      return rec_tel;
   }
   public void setRec_tel(String rec_tel) {
      this.rec_tel = rec_tel;
   }
   public String getRec_postcode() {
      return rec_postcode;
   }
   public void setRec_postcode(String rec_postcode) {
      this.rec_postcode = rec_postcode;
   }
   public String getRec_addr1() {
      return rec_addr1;
   }
   public void setRec_addr1(String rec_addr1) {
      this.rec_addr1 = rec_addr1;
   }
   public String getRec_addr2() {
      return rec_addr2;
   }
   public void setRec_addr2(String rec_addr2) {
      this.rec_addr2 = rec_addr2;
   }
   public String getRec_state() {
      return rec_state;
   }
   public void setRec_state(String rec_state) {
      this.rec_state = rec_state;
   }
   public int getO_amount() {
      return o_amount;
   }
   public void setO_amount(int o_amount) {
      this.o_amount = o_amount;
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
      return "Order [id=" + id + ", product_id=" + product_id + ", member_id=" + member_id + ", basket_id="
            + basket_id + ", rec_name=" + rec_name + ", rec_tel=" + rec_tel + ", rec_postcode=" + rec_postcode
            + ", rec_addr1=" + rec_addr1 + ", rec_addr2=" + rec_addr2 + ", rec_state=" + rec_state + ", o_amount="
            + o_amount + ", reg_date=" + reg_date + ", edit_date=" + edit_date + "]";
   }
}