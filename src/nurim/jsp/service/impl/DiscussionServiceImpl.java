package nurim.jsp.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import nurim.jsp.model.Document;
import nurim.jsp.service.DiscussionService;

public class DiscussionServiceImpl implements DiscussionService {

	/** 처리 결과를 기록할 Log4J 객체 생성 */
	Logger logger;
	
	/** MyBatis */
	SqlSession sqlSession;
	
	/** 생성자를 통한 객체 생성 */
	public DiscussionServiceImpl (SqlSession sqlSession, Logger logger) {
		this.sqlSession = sqlSession;
		this.logger = logger;
	}
	
	@Override
	public void insertDiscussion(Document document) throws Exception {
		try {
			int result = sqlSession.insert("DiscussionMapper.insertDiscussion", document);
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
	public Document selectDiscussion(Document document) throws Exception {
		Document result = null;
		
		try {
			result = sqlSession.selectOne("DiscussionMapper.selectDiscussion", document);
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
	public Document selectPrevDiscussion(Document document) throws Exception {
		Document result = null;
		
		try {
			//이전글이 없는 경우도 있으므로, 리턴값이 null인 경우 예외를 발생시키지 않는다.
			result = sqlSession.selectOne("DiscussionMapper.selectPrevDiscussion", document);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("이전글 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public Document selectNextDiscussion(Document document) throws Exception {
		Document result = null;
		
		try {
			//다음글이 없는 경우도 있으므로, 리턴값이 null인 경우 예외를 발생시키지 않는다.
			result = sqlSession.selectOne("DiscussionMapper.selectNextDiscussion", document);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("다음글 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public void updateDiscussionHit(Document document) throws Exception {
		try {
			int result = sqlSession.update("DiscussionMapper.updateDiscussionHit", document);
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
	public List<Document> selectDiscussionList(Document document) throws Exception {
		List<Document> result = null;

		try {
			result = sqlSession.selectList("DiscussionMapper.selectDiscussionList", document);
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
	public int selectDiscussionCount(Document document) throws Exception {
		int result = 0;
		
		try {
			//게시물 수가 0건인 경우도 있으므로
			//결과값이 0인 경우에 대한 예외를 발생시키지 않는다.
			result = sqlSession.selectOne("DiscussionMapper.selectDiscussionCount", document);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("게시물 수 조회에 실패했습니다.");
		}
		
		return result;
	}

	@Override
	public int selectDiscussionCountByMemberId(Document document) throws Exception {
		int result = 0;
		try {
			//자신의 게시물이 아닌 경우도 있으므로
			//결과값이 0인 경우에 대한 예외를 발생시키지 않는다.
			result = sqlSession.selectOne("DiscussionMapper.selectDiscussionCountByMemberId", document);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("게시물 수 조회에 실패했습니다.");
		}
		
		return result;
	}

	@Override
	public void updateDiscussion(Document document) throws Exception {
		try {
			int result = sqlSession.update("DiscussionMapper.updateDiscussion", document);
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
	public void updateDiscussionMemberOut(Document document) throws Exception {
		try {
			//게시글을 작성한 적이 없는 회원도 있을 수 있기 때문에
			//NullPointerException을 발생시키지 않는다.
			sqlSession.update("DiscussionMapper.updateDiscussionMemberOut", document);
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("참조관계 해제에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}
		
	}

	@Override
	public void deleteDiscussion(Document document) throws Exception {
		try {
			int result = sqlSession.delete("DiscussionMapper.deleteDiscussion", document);
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
	public Document selectDiscussionEndDate(Document document) throws Exception {
		Document result = null;
		
		try {
			//토론종료일이 없는 게시물은 없으므로 NullPointerException을 생략한다.
			result = sqlSession.selectOne("DiscussionMapper.selectDiscussionEndDate", document);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("토론종료일 조회에 실패했습니다.");
		}
		return result;
	}
	
	

	@Override
	public void updateDiscussionVote(Document document) throws Exception {
		try {
			int result = sqlSession.update("DiscussionMapper.updateDiscussionVote", document);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("존재하지 않는 게시물에 대한 요청입니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("투표수 갱신에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}
	}

	@Override
	public Document selectBestDiscussion(Document document) throws Exception {
		Document result = null;
		
		try {
			result = sqlSession.selectOne("DiscussionMapper.selectBestDiscussion", document);
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
	public Document updateDiscussionEndDate(Document document) throws Exception {
		Document result = null;
		
		try {
			//토론종료일이 없는 게시물은 없으므로 NullPointerException을 생략한다.
			result = sqlSession.selectOne("DiscussionMapper.selectDiscussionEndDate", document);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("토론종료일 조회에 실패했습니다.");
		}
		return result;
	}

}
