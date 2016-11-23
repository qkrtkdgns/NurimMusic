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

}
