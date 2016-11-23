package nurim.jsp.model;

public class File {
	private int id;
	private int product_id;
	private int document_id;
	private String origin_name;
	private String file_dir;
	private String file_name;
	private String content_type;
	private long file_size;
	private String reg_date;
	private String edit_date;
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
	public int getDocument_id() {
		return document_id;
	}
	public void setDocument_id(int document_id) {
		this.document_id = document_id;
	}
	public String getOrigin_name() {
		return origin_name;
	}
	public void setOrigin_name(String origin_name) {
		this.origin_name = origin_name;
	}
	public String getFile_dir() {
		return file_dir;
	}
	public void setFile_dir(String file_dir) {
		this.file_dir = file_dir;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getContent_type() {
		return content_type;
	}
	public void setContent_type(String content_type) {
		this.content_type = content_type;
	}
	public long getFile_size() {
		return file_size;
	}
	public void setFile_size(long file_size) {
		this.file_size = file_size;
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
		return "File [id=" + id + ", product_id=" + product_id + ", document_id=" + document_id + ", origin_name="
				+ origin_name + ", file_dir=" + file_dir + ", file_name=" + file_name + ", content_type=" + content_type
				+ ", file_size=" + file_size + ", reg_date=" + reg_date + ", edit_date=" + edit_date + "]";
	}
	
	

}
