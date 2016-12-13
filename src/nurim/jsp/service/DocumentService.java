package nurim.jsp.service;

import java.util.List;

import nurim.jsp.model.Document;
import nurim.jsp.model.Order;

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

	/**
	 * 회원 탈퇴시 회원이 작성한 게시글의 member id을 변경한다.
	 * @param document
	 * @throws Exception
	 */
	public void updateDocumentByMember(Document document) throws Exception;
}
