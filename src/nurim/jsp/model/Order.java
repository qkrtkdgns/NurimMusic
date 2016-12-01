package nurim.jsp.model;

public class Order {
	private int id;
	private int productId;
	private int memberId;
	private String recName;
	private String recTel;
	private String recPostcode;
	private String recAddr1;
	private String recAddr2;
	private String recState;
	private int oAmount;
	private String regDate;
	private String editDate;
	private String proImg;
	private String proName;
	private int proPrice;
	private int amount;
	//조건검색을 위한 멤버변수 추가
	private String prevDate;
	private String nextDate;
	
	//페이지 넘김 번호 할당
	private int LimitStart;
	private int ListCount;
	
	public String getPrevDate() {
		return prevDate;
	}
	public void setPrevDate(String prevDate) {
		this.prevDate = prevDate;
	}
	public String getNextDate() {
		return nextDate;
	}
	public void setNextDate(String nextDate) {
		this.nextDate = nextDate;
	}
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
				+ amount + ", prevDate=" + prevDate + ", nextDate=" + nextDate + ", LimitStart=" + LimitStart
				+ ", ListCount=" + ListCount + "]";
	}
	
}
