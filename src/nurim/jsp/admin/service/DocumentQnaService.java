package nurim.jsp.admin.service;

import nurim.jsp.model.Document;

public interface DocumentQnaService {
	
	/** 
	 * 일대일 문의를 저장한다.
	 * @param document
	 * @throws Exception
	 */
	public void insertQna (Document document) throws Exception;

}
