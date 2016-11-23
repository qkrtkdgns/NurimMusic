package nurim.jsp.model;

public class Product {
	private int id;
	private int document_id;
	private String pro_img;
	private String pro_name;
	private String category;
	private int pro_price;
	private int amount;
	private int pro_hit;
	private String reg_date;
	private String edit_date;
	private String provider;
	private String content;
	
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

	public int getDocument_id() {
		return document_id;
	}

	public void setDocument_id(int document_id) {
		this.document_id = document_id;
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


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
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
		return "Product [id=" + id + ", document_id=" + document_id + ", pro_img=" + pro_img + ", pro_name=" + pro_name
				+ ", category=" + category + ", pro_price=" + pro_price + ", amount=" + amount + ", pro_hit=" + pro_hit
				+ ", reg_date=" + reg_date + ", edit_date=" + edit_date + ", provider=" + provider + ", content="
				+ content + ", LimitStart=" + LimitStart + ", ListCount=" + ListCount + "]";
	}




	

}
