package nurim.jsp.service;

import nurim.jsp.model.Document;

public interface DocumentService {
	/** 
	 * 게시물을 저장한다.
	 * @param document	- 게시물 데이터
	 * @throws Exception
	 */
	public void insertDocument(Document document) throws Exception;
}
