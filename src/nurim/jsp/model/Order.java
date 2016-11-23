package nurim.jsp.model;

public class Order {
	private int id = 0;
	private int productId = 0;
	private int memberId = 0;
	private String recName = null;
	private String recTel = null;
	private String recPostcode = null;
	private String recAddr1 = null;
	private String recAddr2 = null;
	private String recState = null;
	private int oAmount = 0;
	private String regDate = null;
	private String editDate = null;
	private String proImg = null;
	private String proName = null;
	private int proPrice = 0;
	private int amount = 0;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public String getRecName() {
		return recName;
	}
	public void setRecName(String recName) {
		this.recName = recName;
	}
	public String getRecTel() {
		return recTel;
	}
	public void setRecTel(String recTel) {
		this.recTel = recTel;
	}
	public String getRecPostcode() {
		return recPostcode;
	}
	public void setRecPostcode(String recPostcode) {
		this.recPostcode = recPostcode;
	}
	public String getRecAddr1() {
		return recAddr1;
	}
	public void setRecAddr1(String recAddr1) {
		this.recAddr1 = recAddr1;
	}
	public String getRecAddr2() {
		return recAddr2;
	}
	public void setRecAddr2(String recAddr2) {
		this.recAddr2 = recAddr2;
	}
	public String getRecState() {
		return recState;
	}
	public void setRecState(String recState) {
		this.recState = recState;
	}
	public int getoAmount() {
		return oAmount;
	}
	public void setoAmount(int oAmount) {
		this.oAmount = oAmount;
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
	public String getProImg() {
		return proImg;
	}
	public void setProImg(String proImg) {
		this.proImg = proImg;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public int getProPrice() {
		return proPrice;
	}
	public void setProPrice(int proPrice) {
		this.proPrice = proPrice;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	@Override
	public String toString() {
		return "Order [id=" + id + ", productId=" + productId + ", memberId=" + memberId + ", recName=" + recName
				+ ", recTel=" + recTel + ", recPostcode=" + recPostcode + ", recAddr1=" + recAddr1 + ", recAddr2="
				+ recAddr2 + ", recState=" + recState + ", oAmount=" + oAmount + ", regDate=" + regDate + ", editDate="
				+ editDate + ", proImg=" + proImg + ", proName=" + proName + ", proPrice=" + proPrice + ", amount="
				+ amount + "]";
	}
	
}
