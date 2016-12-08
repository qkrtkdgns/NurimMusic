package nurim.jsp.service;

import java.util.List;

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
	
	/**
	 * 입금목록을 전부 불러온다.
	 * @param comment
	 * @return
	 * @throws Exception
	 */
	public List<Comment> selectPayCheckList() throws Exception;

	/**
	 * 입금확인 목록갯수를 확인한다.
	 * @param comment
	 * @return
	 * @throws Exception
	 */
	public int selectcommentCountAll(Comment comment) throws Exception;

	/**
	 * 입금확인 목록을 불러온다.
	 * @param comment
	 * @return
	 * @throws Exception
	 */
	public List<Comment> selectcommentListAll(Comment comment) throws Exception;

	/**
	 * 입금확인 목록 상태를 변경한다.
	 * @param comment
	 * @throws Exception
	 */
	public void updatecomment(Comment comment) throws Exception;
}
