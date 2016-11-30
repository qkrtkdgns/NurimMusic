package nurim.jsp.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import nurim.jsp.model.Document;
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
		
	}
