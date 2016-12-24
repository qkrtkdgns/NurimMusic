package nurim.jsp.admin.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import nurim.jsp.admin.service.DocumentService;
import nurim.jsp.model.Document;

public class DocumentServiceImpl implements DocumentService {

	Logger logger;
	SqlSession sqlSession;
	
	public DocumentServiceImpl(SqlSession sqlSession,Logger logger) {
		super();
		this.logger = logger;
		this.sqlSession = sqlSession;
	}

	@Override
	public int selectReviewCount(Document document) throws Exception {
		int result = 0;
		
		try{
		}catch(NullPointerException e){
			
		}
		catch(Exception e){
			
		}
		
		return result;
	}

	@Override
	public List<Document> selectReviewList(Document document) throws Exception {
		List<Document> result=null;
		
		try{
		}catch(NullPointerException e){
			
		}
		catch(Exception e){
			
		}
		return result;
	}

	@Override
	public int selectDocumentOneCount(Document document) throws Exception {
		int result = 0;
		try{
			result = sqlSession.selectOne("DocumentMapper.selectDocumentOneCount",document);
		}catch(Exception e){
			logger.debug(e.getLocalizedMessage());
			throw new Exception(e.getLocalizedMessage());
		}
		
		return result;
	}
	
	@Override
	public List<Document> selectDocumentOneList(Document document) throws Exception{
		List<Document> result = null;
		try{
			result = sqlSession.selectList("DocumentMapper.selectDocumentOneList",document);
		}catch(Exception e){
			logger.debug(e.getLocalizedMessage());
			throw new Exception(e.getLocalizedMessage());
		}
		return result;
	}

	@Override
	public int updateQnaAnswer(Document document) throws Exception{
		int result = 0;
		try{
			result = sqlSession.update("DocumentMapper.updateQnaAnswer",document);
			if(result == 0){
				throw new NullPointerException();
			}
		}catch(NullPointerException e){
			logger.debug(e.getLocalizedMessage());
			throw new Exception("답변이 등록되지 않았습니다.");
		}catch(Exception e){		
			logger.debug(e.getLocalizedMessage());
			throw new Exception(e.getLocalizedMessage());
		}finally{
			sqlSession.commit();
		}
		return result;
	}
	@Override
	public Document selectAnswer(Document document) throws Exception{
		Document result = null;
		
		try{
			result = sqlSession.selectOne("DocumentMapper.selectAnswer",document);
		}catch(Exception e){
			logger.debug(e.getLocalizedMessage());
			throw new Exception("조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public void insertNotice(Document document) throws Exception {
		try {
			int result = sqlSession.insert("DocumentNoticeMapper.insertNotice", document);
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
	public Document selectNotice(Document document) throws Exception {
		Document result = null;
		
		try {
			result = sqlSession.selectOne("DocumentNoticeMapper.selectNotice", document);
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
	public void updateNoticeHit(Document document) throws Exception {
		try {
			int result = sqlSession.update("DocumentNoticeMapper.updateNoticeHit", document);
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
	public List<Document> selectNoticeList(Document document) throws Exception {
		List<Document> result = null;

		try {
			result = sqlSession.selectList("DocumentNoticeMapper.selectNoticeList", document);
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
	public int selectNoticeCount(Document document) throws Exception {
		int result = 0;
		
		try {
			//게시물 수가 0건인 경우도 있으므로
			//결과값이 0인 경우에 대한 예외를 발생시키지 않는다.
			result = sqlSession.selectOne("DocumentNoticeMapper.selectNoticeCount", document);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("게시물 수 조회에 실패했습니다.");
		}
		
		return result;
	}


	@Override
	public void updateNotice(Document document) throws Exception {
		try {
			int result = sqlSession.delete("DocumentNoticeMapper.deleteNotice", document);
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
	public int selectNoticeCountByMemberId(Document document) throws Exception {
		int result = 0;
		try {
			//자신의 게시물이 아닌 경우도 있으므로
			//결과값이 0인 경우에 대한 예외를 발생시키지 않는다.
			result = sqlSession.selectOne("DocumentNoticeMapper.selectNoticeCountByMemberId", document);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("게시물 수 조회에 실패했습니다.");
		}
		
		return result;
	}

	@Override
	public void deleteNotice(Document document) throws Exception {
		try {
			int result = sqlSession.delete("DocumentNoticeMapper.deleteNotice", document);
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

}
