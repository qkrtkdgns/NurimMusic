package nurim.jsp.model;

public class File {
	private int id = 0;
	private int productId = 0;
	private int documentId = 0;
	private String originName = null;
	private String fileDir = null;
	private String fileName = null;
	private String contentType = null;
	private long fileSize = 0;
	private String regDate = null;
	private String editDate = null;
	
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
	public int getDocumentId() {
		return documentId;
	}
	public void setDocumentId(int documentId) {
		this.documentId = documentId;
	}
	public String getOriginName() {
		return originName;
	}
	public void setOriginName(String originName) {
		this.originName = originName;
	}
	public String getFileDir() {
		return fileDir;
	}
	public void setFileDir(String fileDir) {
		this.fileDir = fileDir;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getContentType() {
		return contentType;
	}
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
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
		return "File [id=" + id + ", productId=" + productId + ", documentId=" + documentId + ", originName="
				+ originName + ", fileDir=" + fileDir + ", fileName=" + fileName + ", contentType=" + contentType
				+ ", fileSize=" + fileSize + ", regDate=" + regDate + ", editDate=" + editDate + "]";
	}
	
}
