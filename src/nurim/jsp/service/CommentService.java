package nurim.jsp.service;

import java.util.List;

import nurim.jsp.model.Comment;
import nurim.jsp.model.Product;

/**
 * 덧글 관련 기능을 제공하기 위한 Service 계층
 */

public interface CommentService {
	
	
	public void insertComment(Comment comment) throws Exception;
	
	public Comment selectComment(Comment comment) throws Exception;
	
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
	 * 검색된 덧글 수 조회
	 * @param  comment - 덧글 데이터
	 * @return int - 덧글 수
	 * @throws Exception
	 */
	public int  selectcommentListCount(Comment comment) throws Exception;
	
	/**
	 * 전체 목록중 검색 조건에 따라 덧글을 조회한다.
	 * @param comment - 덧글 데이터
	 * @return List - 검색된 덧글 목록
	 * @throws Exception
	 */
	public List<Comment> selectcommentList(Comment comment) throws Exception;
	
	
	/**
	 * 선택된 덧글 삭제
	 * @param  comment - 덧글 데이터
	 * @throws Exception
	 */
	public void deleteComment(Comment comment) throws Exception;
	
	/**
	 * 회원 탈퇴시 댓글의 회원 아이디를 변경한다.
	 * @param comment
	 * @throws Exception
	 */
	public void updateCommentByMember(Comment comment) throws Exception;
	
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
