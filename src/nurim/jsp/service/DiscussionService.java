package nurim.jsp.service;

import java.util.List;

import nurim.jsp.model.Document;

public interface DiscussionService {

	/**
	 * 게시물을 저장한다.
	 * @param document	- 게시물 데이터
	 * @throws Exception
	 */
	public void insertDiscussion(Document document) throws Exception;
	
	/**
	 * 하나의 게시물을 읽어들인다.
	 * @param document	- 읽어들일 게시물 일련번호가 저장된 Beans
	 * @return					- 읽어들인 게시물
	 * @throws Exception
	 */
	public Document selectDiscussion(Document document) throws Exception;
	
	/**
	 * 현재 글을 기준으로 이전글을 읽어들인다.
	 * @param document	- 현재글에 대한 게시물 번호가 저장된 Beans
	 * @return	 BbsDocument - 읽어들인 게시물 내용 (없을 경우 null)
	 * @throws Exception
	 */
	public Document selectPrevDiscussion(Document document) throws Exception;
	
	/**
	 * 현재글을 기준으로 다음글을 읽어들인다.
	 * @param document	- 현재글에 대한 게시물 번호가 저장된 Beans
	 * @return	BbsDocument - 읽어들인 게시물 내용 (없을 경우 null)
	 * @throws Exception
	 */
	public Document selectNextDiscussion(Document document) throws Exception;
	
	/**
	 * 조회수를 1 증가시킨다.
	 * @param document	- 현재글에 대한 게시물 번호가 저장된 Beans
	 * @throws Exception
	 */
	public void updateDiscussionHit(Document document) throws Exception;
	
	/**
	 * 게시글 목록 조회
	 * @param document	- 카테고리 정보가 저장된 Beans
	 * @return					- 게시물 목록
	 * @throws Exception
	 */
	public List<Document> selectDiscussionList(Document document) throws Exception;
	
	/**
	 * 전체 게시물 수 조회
	 * @param document
	 * @return int
	 * @throws Exception
	 */
	public int selectDiscussionCount(Document document) throws Exception;
	
	/**
	 * 자신의 게시물인지 검사한다.
	 * @param document
	 * @return int
	 * @throws Exception
	 */
	public int selectDiscussionCountByMemberId(Document document) throws Exception;
	
	/**
	 * 게시물을 수정한다.
	 * @param document		- 게시물 데이터
	 * @throws Exception
	 */
	public void updateDiscussion(Document document) throws Exception;
	
	/**
	 * 회원과 게시물의 참조관게를 해제한다.
	 * @param document		- 게시물 데이터
	 * @throws Exception
	 */
	public void updateDiscussionMemberOut(Document document) throws Exception;
	
	/**
	 * 게시물을 삭제한다.
	 * @param document
	 * @throws Exception
	 */
	public void deleteDiscussion(Document document) throws Exception;
	
	/**
	 * 토론 종료일을 계산한다.
	 * @param document
	 * @throws Exception
	 */
	public Document updateDiscussionEndDate(Document document) throws Exception;
	
	public Document selectBestDiscussion(Document document) throws Exception;
	
	public void updateDiscussionVote(Document document) throws Exception;
	
	public Document selectDiscussionEndDate(Document document) throws Exception;
}
