package nurim.jsp.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import nurim.jsp.model.Document;
import nurim.jsp.model.Order;
import nurim.jsp.service.DocumentService;

public class DocumentServiceImpl implements DocumentService {

	/** 처리 결과를 기록할 Log4J 객체 생성 */
	Logger logger;
	
	/** MyBatis */
	SqlSession sqlSession;
	
	/** 생성자를 통한 객체 생성 */
	public DocumentServiceImpl(SqlSession sqlSession, Logger logger) {
		this.sqlSession = sqlSession;
		this.logger = logger;
	}
	
	@Override
	public void insertDocument(Document document) throws Exception {
		try {
			int result = sqlSession.insert("DocumentMapper.insertDocument", document);
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
	public int selectQnaCount(Document document) throws Exception {
		int result = 0;
		
		try{
			result = sqlSession.selectOne("DocumentMapper.selectQnaCount",document);
		}catch(Exception e){
			logger.debug(e.getLocalizedMessage());
			throw new Exception("페이지 계산에 실패했습니다.");
		}
		return result;
	}

	@Override
	public List<Document> selectQnaList(Document document) throws Exception {
		List<Document> result = null;
		
		try{
			result = sqlSession.selectList("DocumentMapper.selectQnaList",document);
		}catch(Exception e){
			logger.debug(e.getLocalizedMessage());
			throw new Exception("페이지를 불러오는 데 실패했습니다.");
		}
		
		return result;
	}

	@Override
	public Document selectQnaQuestion(Document document) throws Exception {
		Document result = null;
		
		try{
			result = sqlSession.selectOne("DocumentMapper.selectQnaQuestion",document);
			if(result == null){
				throw new NullPointerException();
			}
		}catch(NullPointerException e){
			logger.debug(e.getLocalizedMessage());
			throw new Exception("잘못된 요청입니다.");
		}catch(Exception e){
			logger.debug(e.getLocalizedMessage());
			throw new Exception("질문확인에 실패하였습니다.");
		}
		
		return result;
	}

	@Override
	public void updateDocumentByMember(Document document) throws Exception {
		try{
			sqlSession.update("DocumentMapper.updateDocumentByMember",document);
		}catch(Exception e){
			sqlSession.rollback();
			logger.debug(e.getLocalizedMessage());
			throw new Exception("게시글 수정에 실패했습니다.");
		}finally{
			sqlSession.commit();
		}
	}
		
	}
