package nurim.jsp.service;

import java.util.List;

import nurim.jsp.model.Document;

public interface ReviewService {
	
	/**
	 * 회원리뷰 게시물을 등록한다.
	 * @param document
	 * @throws Exception
	 */
	public void insertReview(Document document) throws Exception;
	
	/** 
	 * 회원리뷰 게시물을 읽어들인다.
	 * @param document
	 * @return
	 * @throws Exception
	 */
	public Document selectReview(Document document) throws Exception;
	
	/**
	 * 조회수를 1 증가시킨다.
	 * @param document
	 * @throws Exception
	 */
	public void updateReviewHit(Document document) throws Exception;
	
	/**
	 * 회원리뷰 목록 조회
	 * @param document
	 * @return
	 * @throws Exception
	 */
	public List<Document> selectReviewList(Document document) throws Exception;

	/**
	 * 전체 게시물 수 조회
	 * @param document
	 * @return int
	 * @throws Exception
	 */
	public int selectReviewCount(Document document) throws Exception;
	
	/**
	 * 게시물을 수정한다.
	 * @param document		- 게시물 데이터
	 * @throws Exception
	 */
	public void updateReview(Document document) throws Exception;
	
	/**
	 * 자신의 게시물인지 검사한다.
	 * @param document
	 * @return int
	 * @throws Exception
	 */
	public int selectReviewCountByMemberId(Document document) throws Exception;
	
	/**
	 * 게시물을 삭제한다.
	 * @param document
	 * @throws Exception
	 */
	public void deleteReview(Document document) throws Exception;

	/**
	 * 현재 글을 기준으로 이전글을 읽어들인다.
	 * @param document	- 현재글에 대한 게시물 번호가 저장된 Beans
	 * @return	 BbsDocument - 읽어들인 게시물 내용 (없을 경우 null)
	 * @throws Exception
	 */
	public Document selectPrevReview(Document document) throws Exception;
	
	
	/**
	 * 현재글을 기준으로 다음글을 읽어들인다.
	 * @param document	- 현재글에 대한 게시물 번호가 저장된 Beans
	 * @return	BbsDocument - 읽어들인 게시물 내용 (없을 경우 null)
	 * @throws Exception
	 */
	public Document selectNextReview(Document document) throws Exception;
}
