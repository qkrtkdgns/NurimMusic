package nurim.jsp.model;

public class Product {
	private int id = 0;
	private int documentId = 0;
	private int pro_categoryId = 0;
	private String pro_img = null;
	private String pro_name = null;
	private int pro_price = 0;
	private int amount = 0;
	private int pro_hit = 0;
	private String reg_date = null;
	private String edit_date = null;
	private String provider = null;
	private String content = null;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getDocumentId() {
		return documentId;
	}
	public void setDocumentId(int documentId) {
		this.documentId = documentId;
	}
	public int getPro_categoryId() {
		return pro_categoryId;
	}
	public void setPro_categoryId(int pro_categoryId) {
		this.pro_categoryId = pro_categoryId;
	}
	public String getPro_img() {
		return pro_img;
	}
	public void setPro_img(String pro_img) {
		this.pro_img = pro_img;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public int getPro_price() {
		return pro_price;
	}
	public void setPro_price(int pro_price) {
		this.pro_price = pro_price;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getPro_hit() {
		return pro_hit;
	}
	public void setPro_hit(int pro_hit) {
		this.pro_hit = pro_hit;
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
	public String getProvider() {
		return provider;
	}
	public void setProvider(String provider) {
		this.provider = provider;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	@Override
	public String toString() {
		return "Product [id=" + id + ", documentId=" + documentId + ", pro_categoryId=" + pro_categoryId + ", pro_img="
				+ pro_img + ", pro_name=" + pro_name + ", pro_price=" + pro_price + ", amount=" + amount + ", pro_hit="
				+ pro_hit + ", reg_date=" + reg_date + ", edit_date=" + edit_date + ", provider=" + provider
				+ ", content=" + content + "]";
	}
	
}
