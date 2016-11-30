package nurim.jsp.service;

import nurim.jsp.model.DocumentQna;

public interface DocumentQnaService {
	
	/**
	 * 일대일 문의사항을 저장한다.
	 * @param document
	 * @throws Exception
	 */
	public void insertQna(DocumentQna documentQna) throws Exception;

	/**
	 * 하나의 게시물을 읽어들인다.
	 * @param documentQna		- 읽어들일 게시물 일련번호가 저장된 Beans
	 * @return					
	 * @throws Exception
	 */
	public DocumentQna selectQna(DocumentQna documentQna) throws Exception;

	/**
	 * 자신의 게시물인지 검사한다.
	 * @param document
	 * @return int
	 * @throws Exception
	 */
	public int selectDocumentQnaCountByMemberId(DocumentQna documentQna) throws Exception;

	/**
	 * 비밀번호를 검사한다.
	 * @param document
	 * @return
	 * @throws Exception
	 */
	public int selectDocumentQnaCountByPw(DocumentQna documentQna) throws Exception;
	
	public void updateDocumentQna(DocumentQna documentQna) throws Exception;
}
