package nurim.jsp.service;

import java.util.List;

import nurim.jsp.model.Document;

public interface DocumentService {
	/** 
	 * 게시물을 저장한다.
	 * @param document	- 게시물 데이터
	 * @throws Exception
	 */
	public void insertDocument(Document document) throws Exception;

	public int selectQnaCount(Document document) throws Exception;

	public List<Document> selectQnaList(Document document) throws Exception;

	public Document selectQnaQuestion(Document document) throws Exception;
}
