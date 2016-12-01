package nurim.jsp.admin.service;

import java.util.List;

import nurim.jsp.model.Document;

public interface DocumentService {

	public int selectReviewCount(Document document) throws Exception;
	
	public List<Document> selectReviewList(Document document) throws Exception;
	
}
