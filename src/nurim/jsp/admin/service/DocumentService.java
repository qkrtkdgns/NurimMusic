package nurim.jsp.admin.service;

import java.util.List;

import nurim.jsp.model.Document;

public interface DocumentService {

	public int selectReviewCount(Document document) throws Exception;
	
	public List<Document> selectReviewList(Document document) throws Exception;
	
	/**
	 * 게시물을 저장한다.
	 * @param document	- 게시물 데이터
	 * @throws Exception
	 */
	public void insertNotice(Document document) throws Exception;

	/** 
	 * 공지사항 게시물을 읽어들인다.
	 * @param document
	 * @return
	 * @throws Exception
	 */
	public Document selectNotice(Document document) throws Exception;
	
	/**
	 * 조회수를 1 증가시킨다.
	 * @param document
	 * @throws Exception
	 */
	public void updateNoticeHit(Document document) throws Exception;
	
	/**
	 * 공지사항 목록 조회
	 * @param document
	 * @return
	 * @throws Exception
	 */
	public List<Document> selectNoticeList(Document document) throws Exception;
	
	/**
	 * 전체 게시물 수 조회
	 * @param document
	 * @return int
	 * @throws Exception
	 */
	public int selectNoticeCount(Document document) throws Exception;
	
	/**
	 * 게시물을 수정한다.
	 * @param document		- 게시물 데이터
	 * @throws Exception
	 */
	public void updateNotice(Document document) throws Exception;

	/**
	 * 자신의 게시물인지 검사한다.
	 * @param document
	 * @return int
	 * @throws Exception
	 */
	public int selectNoticeCountByMemberId(Document document) throws Exception;

	/**
	 * 게시물을 삭제한다.
	 * @param document
	 * @throws Exception
	 */
	public void deleteNotice(Document document) throws Exception;


}
