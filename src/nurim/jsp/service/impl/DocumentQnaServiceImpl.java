package nurim.jsp.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import nurim.jsp.model.Document;
import nurim.jsp.service.DocumentQnaService;

public class DocumentQnaServiceImpl implements DocumentQnaService {

	/** 처리 결과를 기록할 Log4J 객체 생성 */
	Logger logger;
	
	/** MyBatis */
	SqlSession sqlSession;
	
	/** 생성자를 통한 객체 생성 */
	public DocumentQnaServiceImpl (SqlSession sqlSession, Logger logger) {
		this.sqlSession = sqlSession;
		this.logger = logger;
	}
	
	@Override
	public void insertQna(Document document) throws Exception {
		try {
			int result = sqlSession.insert("DocumentQnaMapper.insertQna", document);
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
	public Document selectQna(Document document) throws Exception {
		Document result = null;
		
		try {
			result = sqlSession.selectOne("DocumentQnaMapper.selectQna", document);
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
	public int selectQnaCountByMemberId(Document document) throws Exception {
		int result = 0;
		try {
			//자신의 게시물이 아닌 경우도 있으므로
			//결과값이 0인 경우에 대한 예외를 발생시키지 않는다.
			result = sqlSession.selectOne("DocumentQnaMapper.selectDocumentQnaCountByMemberId", document);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("게시물 수 조회에 실패했습니다.");
		}
		
		return result;
	}

	@Override
	public int selectQnaCountByPw(Document document) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("DocumentQnaMapper.selectDocumentQnaCountByPw", document);
			//비밀번호가 일치하는 데이터의 수가 0이라면 비밀번호가 잘못된 것으로 간주한다.
			if (result < 1) {
				throw new NullPointerException();
		}
	} catch (NullPointerException e) {
		logger.error(e.getLocalizedMessage());
		throw new Exception("비밀번호를 확인하세요.");
	} catch (Exception e) {
		logger.error(e.getLocalizedMessage());
		throw new Exception("게시물 수 조회에 실패했습니다.");
	}
		return result;
	}

	@Override
	public void updateQna(Document document) throws Exception {
		try {
			int result = sqlSession.update("DocumentQnaMapper.updateQna", document);
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
	public List<Document> selectQnaList(Document document) throws Exception {
		List<Document> result = null;

		try {
			result = sqlSession.selectList("DocumentQnaMapper.selectQnaList", document);
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
	public int selectQnaCount(Document document) throws Exception {
		int result = 0;
		
		try {
			//게시물 수가 0건인 경우도 있으므로
			//결과값이 0인 경우에 대한 예외를 발생시키지 않는다.
			result = sqlSession.selectOne("DocumentQnaMapper.selectQnaCount", document);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("게시물 수 조회에 실패했습니다.");
		}
		
		return result;
	}
	@Override
	public void insertQnaA(Document document) throws Exception {
		try {
			int result = sqlSession.insert("DocumentQnaMapper.insertQnaA", document);
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
}
