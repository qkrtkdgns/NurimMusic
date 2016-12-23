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

}
