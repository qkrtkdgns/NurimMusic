package nurim.jsp.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import nurim.jsp.model.Document;
import nurim.jsp.service.ReviewService;

public class ReviewServiceImpl implements ReviewService {

	/** 처리 결과를 기록할 Log4J 객체 생성 */
	Logger logger;
	
	/** MyBatis */
	SqlSession sqlSession;
	
	/** 생성자를 통한 객체 생성 */
	public ReviewServiceImpl (SqlSession sqlSession, Logger logger) {
		this.sqlSession = sqlSession;
		this.logger = logger;
	}
	
	@Override
	public void insertReview(Document document) throws Exception {
		try {
			int result = sqlSession.insert("ReviewMapper.insertReview", document);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("저장된 게시물이 없습니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("게시물 정보 등록에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}
	}

	@Override
	public Document selectReview(Document document) throws Exception {
		Document result = null;
		
		try {
			result = sqlSession.selectOne("ReviewMapper.selectReview", document);
			if (result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("조회된 게시물이 없습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("게시물 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public void updateReviewHit(Document document) throws Exception {
		try {
			int result = sqlSession.update("ReviewMapper.updateReviewHit", document);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("존재하지 않는 게시물에 대한 요청입니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("조회수 갱신에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}
	}

	@Override
	public List<Document> selectReviewList(Document document) throws Exception {
		List<Document> result = null;

		try {
			result = sqlSession.selectList("ReviewMapper.selectReviewList", document);
			if (result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception ("조회된 글 목록이 없습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("글 목록 조회에 실패했습니다.");
		}
		
		return result;
	}

	@Override
	public int selectReviewCount(Document document) throws Exception {
		int result = 0;
		
		try {
			//게시물 수가 0건인 경우도 있으므로
			//결과값이 0인 경우에 대한 예외를 발생시키지 않는다.
			result = sqlSession.selectOne("ReviewMapper.selectReviewCount", document);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("게시물 수 조회에 실패했습니다.");
		}
		
		return result;
	}

	@Override
	public void updateReview(Document document) throws Exception {
		try {
			int result = sqlSession.delete("ReviewMapper.updateReview", document);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("존재하지 않는 게시물입니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("게시물 수정에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}
		
	}

	@Override
	public int selectReviewCountByMemberId(Document document) throws Exception {
		int result = 0;
		try {
			//자신의 게시물이 아닌 경우도 있으므로
			//결과값이 0인 경우에 대한 예외를 발생시키지 않는다.
			result = sqlSession.selectOne("ReviewMapper.selectReviewCountByMemberId", document);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("게시물 수 조회에 실패했습니다.");
		}
		
		return result;
	}

	@Override
	public void deleteReview(Document document) throws Exception {
		try {
			int result = sqlSession.delete("ReviewMapper.deleteReview", document);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("존재하지 않는 게시물에 대한 요청입니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("게시물 삭제에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}
		
	}

	@Override
	public Document selectPrevReview(Document document) throws Exception {
		Document result = null;
		
		try {
			//이전글이 없는 경우도 있으므로, 리턴값이 null인 경우 예외를 발생시키지 않는다.
			result = sqlSession.selectOne("ReviewMapper.selectPrevReview", document);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("이전글 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public Document selectNextReview(Document document) throws Exception {
		Document result = null;
		
		try {
			//다음글이 없는 경우도 있으므로, 리턴값이 null인 경우 예외를 발생시키지 않는다.
			result = sqlSession.selectOne("ReviewMapper.selectNextReview", document);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("다음글 조회에 실패했습니다.");
		}
		return result;
	}

}
