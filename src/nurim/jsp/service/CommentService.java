package nurim.jsp.service;

import nurim.jsp.model.Comment;

/**
 * 덧글 관련 기능을 제공하기 위한 Service 계층
 */

public interface CommentService {
	
	/**
	 * 입금확인 내용을 저장한다.
	 * @param comment
	 * @throws Exception
	 */
	public void insertPayCheck(Comment comment) throws Exception;

	/**
	 * 하나의 댓글을 읽어들인다.
	 * @param comment	- 읽어들일 게시물 일련번호가 저장된 Beans
	 * @throws Exception
	 */
	public Comment selectPayCheck(Comment comment) throws Exception;
}
