package nurim.jsp.controller.bbs;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import nurim.jsp.dao.MyBatisConnectionFactory;
import nurim.jsp.helper.BaseController;
import nurim.jsp.helper.RegexHelper;
import nurim.jsp.helper.WebHelper;
import nurim.jsp.model.Document;
import nurim.jsp.model.Member;
import nurim.jsp.service.DocumentQnaService;
import nurim.jsp.service.impl.DocumentQnaServiceImpl;

@WebServlet("/bbs/qna_write_ok.do")
public class QnaWriteOk extends BaseController {
	private static final long serialVersionUID = 4164503334215781016L;

	/** (1) 사용하고자 하는 Helper 객체 선언 */
	Logger logger;
	WebHelper web;
	SqlSession sqlSession;
	RegexHelper regex;
	DocumentQnaService documentQnaService;
	BBSCommon bbs;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/** (2) 사용하고자 하는 Helper + Service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		regex = RegexHelper.getInstance();
		documentQnaService = new DocumentQnaServiceImpl(sqlSession, logger);
		bbs = BBSCommon.getInstance();
		
		/** 파라미터 받기 */
		String qnaType = web.getString("qna_type");
		String subject = web.getString("subject");
		String content = web.getString("content");
		//작성자 아이피 주소 가져오기
		String ipAddress = web.getClientIP();
		int memberId = 1;
		
		//로그인 한 경우, 입력하지 않음 이름, 이메일, 비밀번호, 이메일을 세션으로 대체
		Member loginInfo = (Member) web.getSession("loginInfo");
		if (loginInfo != null) {
			memberId = loginInfo.getId();
		}
		
		//전달된 파라미터는 로그로 확인한다.
		logger.debug("qna_type = " + qnaType);
		logger.debug("subject = " + subject);
		logger.debug("content = " + content);
		logger.debug("ipAddress = " + ipAddress);
		logger.debug("member_id = " + memberId);
		
		/** (3) 게시판 카테고리 값을 받아서 view에 전달 */
		String category = web.getString("category");
		request.setAttribute("category", category);
		logger.debug("category = " + category);
		
		/** (4) 존재하는 게시판인지 판별하기 */
		try {
			String bbsName = bbs.getBbsName(category);
			request.setAttribute("bbsName", bbsName);
			logger.debug("bbsName = " + bbsName);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}
		logger.debug("category = " + category);
		
		
		/** (6) 입력받은 파라미터에 대한 유효성 검사 */
		if (!regex.isValue(content)) {
			sqlSession.close();
			web.redirect(null, "내용을 입력하세요.");
			return null;
		}
		
		/** (7) 입력 받은 파라미터를 Beans로 묶기 */
		Document document = new Document();
		document.setCategory(category);
		document.setSubject(subject);
		document.setContent(content);
		document.setMemberId(memberId);
		document.setIpAddress(ipAddress);
		document.setQnaType(qnaType);
		logger.debug("document >> " + document.toString());
		
		/** (8) Service를 통한 게시물 저장 */
		try {
			documentQnaService.insertQna(document);
			documentQnaService.insertQnaA(document);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}
		
		/** (9) 저장 완료 후 읽기 페이지로 이동하기 */
		//읽어들일 게시물을 식별하기 위한 게시물 일련번호 값을 전달해야 한다.
		String url = "%s/bbs/qna_read.do?category=%s&document_id=%d";
		url = String.format(url, web.getRootPath(), document.getCategory(), document.getId());
		web.redirect(url, null);
		return null;
	}
   
}
