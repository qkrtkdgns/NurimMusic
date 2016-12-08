package nurim.jsp.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import nurim.jsp.model.Comment;
import nurim.jsp.service.CommentService;

public class CommentServiceImpl implements CommentService {

	/** 처리 결과를 기록할 Log4J 객체 생성 */
	Logger logger;
	
	/** MyBatis */
	SqlSession sqlSession;
	
	/** 생성자를 통한 객체 생성 */
	public CommentServiceImpl(SqlSession sqlSession, Logger logger) {
		this.sqlSession = sqlSession;
		this.logger = logger;
	}
	
	@Override
	public void insertComment(Comment comment) throws Exception {
		try {
			int result = sqlSession.insert("CommentMapper.insertComment", comment);
			if (result == 0) {
				throw new NullPointerException();
			} 
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("저장된 댓글이 없습니다.");
		}  catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("댓글 등록에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}
		
	}

	@Override
	public Comment selectComment(Comment comment) throws Exception {
		Comment result = null;
		
		try {
			result = sqlSession.selectOne("CommentMapper.selectComment", comment);
			if (result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("조회된 댓글이 없습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("댓글 조회에 실패했습니다.");
		}
		
		return result;
	}
	
	@Override
	public void insertPayCheck(Comment comment) throws Exception {
		try {
			int result = sqlSession.insert("CommentMapper.insertPay", comment);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("저장된 입금확인이 없습니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("입금확인 등록에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}
	}

	@Override
	public Comment selectPayCheck(Comment comment) throws Exception {
		Comment result = null;
		try {
			result = sqlSession.selectOne("CommentMapper.selectPayCheck", comment);
			if (result == null) {
				throw new NullPointerException();
			} 
		} catch (NullPointerException e) {
			throw new Exception("조회된 댓글이 없습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("댓글 조회에 실패했습니다.");
		}
		
		return result;
	}

	@Override
	public List<Comment> selectPayCheckList() throws Exception {
		List<Comment> result = null;
		try {
			result = sqlSession.selectList("CommentMapper.selectPayCheckList", null);
			if (result == null) {
				throw new NullPointerException();
			} 
		} catch (NullPointerException e) {
			throw new Exception("조회된 댓글이 없습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("댓글 조회에 실패했습니다.");
		}
		
		return result;
	}

	@Override
	public int selectcommentCountAll(Comment comment) throws Exception {
		int result = 0;
		
		try{
			result = sqlSession.selectOne("CommentMapper.selectcommentCountAll", comment);
		}catch(Exception e){
			logger.error(e.getLocalizedMessage());
		}
		
		return result;
	}

	@Override
	public List<Comment> selectcommentListAll(Comment comment) throws Exception {
		List<Comment> result = null;
		try {
			result = sqlSession.selectList("CommentMapper.selectcommentListAll", comment);
			if (result == null) {
				throw new NullPointerException();
			} 
		} catch (NullPointerException e) {
			throw new Exception("조회된 댓글이 없습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("댓글 조회에 실패했습니다.");
		}
		
		return result;
	}

	@Override
	public void updatecomment(Comment comment) throws Exception {
		try {
			int result = sqlSession.insert("CommentMapper.updatecomment", comment);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("수정된 정보가 없습니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("수정에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}
	}

}
