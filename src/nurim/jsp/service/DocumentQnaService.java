package nurim.jsp.service;

import java.util.List;

import nurim.jsp.model.Document;

public interface DocumentQnaService {
	
	/**
	 * 일대일 문의사항을 저장한다.
	 * @param document
	 * @throws Exception
	 */
	public void insertQna(Document document) throws Exception;

	/**
	 * 하나의 게시물을 읽어들인다.
	 * @param documentQna		- 읽어들일 게시물 일련번호가 저장된 Beans
	 * @return					
	 * @throws Exception
	 */
	public Document selectQna(Document document) throws Exception;

	/**
	 * 자신의 게시물인지 검사한다.
	 * @param document
	 * @return int
	 * @throws Exception
	 */
	public int selectQnaCountByMemberId(Document document) throws Exception;
	
	/**
	 * 게시글 목록 조회
	 * @param document	- 카테고리 정보가 저장된 Beans
	 * @return					- 게시물 목록
	 * @throws Exception
	 */
	public List<Document> selectQnaList(Document document) throws Exception;
	
	/**
	 * 비밀번호를 검사한다.
	 * @param document
	 * @return
	 * @throws Exception
	 */
	public int selectQnaCountByPw(Document document) throws Exception;
	
	/**
	 * 전체 게시물 수 조회
	 * @param document
	 * @return int
	 * @throws Exception
	 */
	public int selectQnaCount(Document document) throws Exception;
	
	public void updateQna(Document document) throws Exception;
	
	/**
	 * 일대일 문의답변 내용을 생성한다.
	 * @param document
	 * @throws Exception
	 */
	public void insertQnaA (Document document) throws Exception;
}
