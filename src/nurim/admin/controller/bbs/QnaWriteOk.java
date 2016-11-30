package nurim.admin.controller.bbs;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import nurim.jsp.controller.bbs.BBSCommon;
import nurim.jsp.dao.MyBatisConnectionFactory;
import nurim.jsp.helper.BaseController;
import nurim.jsp.helper.RegexHelper;
import nurim.jsp.helper.WebHelper;
import nurim.jsp.model.DocumentQna;
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
		
		/** (3) 파라미터 받기 */
		String category = web.getString("category");
		String qnaType = web.getString("qna_type");
		String userName = web.getString("user_name");
		String tel = web.getString("tel");
		String email = web.getString("email");
		String subject = web.getString("subject");
		String content = web.getString("content");
		//작성자 아이피 주소 가져오기
		String ipAddress = web.getClientIP();
		//회원 일련번호 받기
		int memberId = web.getInt("memberId");
		
		//로그인 한 경우, 입력하지 않음 이름, 이메일, 비밀번호, 이메일을 세션으로 대체
		Member loginInfo = (Member) web.getSession("loginInfo");
		if (loginInfo != null) {
			userName = loginInfo.getUserName();
			email = loginInfo.getEmail();
			memberId = loginInfo.getId();
		}
		
		//전달된 파라미터는 로그로 확인한다.
		logger.debug("category = " + category);
		logger.debug("qna_type = " + qnaType);
		logger.debug("user_name = " + userName);
		logger.debug("tel = " + tel);
		logger.debug("email = " + email);
		logger.debug("content = " + content);
		logger.debug("ipAddress = " + ipAddress);
		logger.debug("memberId = " + memberId);
		
		/** (4) 게시판 카테고리 값을 받아서 view에 전달 */
		request.setAttribute("category", category);
		
		/** (5) 존재하는 게시판인지 판별하기 */
		try {
			String bbsName = bbs.getBbsName(category);
			request.setAttribute("bbsName", bbsName);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}
		
		/** (6) 입력받은 파라미터에 대한 유효성 검사 */
		//이름
		if (!regex.isValue(userName)) {
			sqlSession.close();
			web.printJsonRt("작성자 이름을 입력하세요.");
			return null;
		}
		
		//이메일
		if (!regex.isValue(email)) {
			sqlSession.close();
			web.printJsonRt("이메일을 입력하세요.");
			return null;
		}
		
		if (!regex.isEmail(email)) {
			sqlSession.close();
			web.printJsonRt("이메일의 형식이 잘못되었습니다.");
			return null;
		}
		
		//내용 검사
		if (!regex.isValue(content)) {
			sqlSession.close();
			web.printJsonRt("내용을 입력하세요.");
			return null;
		}
		
		/** (7) 입력 받은 파라미터를 Beans로 묶기 */
		DocumentQna documentQna = new DocumentQna();
		documentQna.setCategory(category);
		documentQna.setUserName(userName);
		//documentQna.setEmail(email);
		documentQna.setSubject(subject);
		documentQna.setContent(content);
		logger.debug("documentQna >> " + documentQna.toString());
		
		/** (8) Service를 통한 게시물 저장 */
		try {
			for (int i = 1; i <= 1; i++) {
				documentQna.setSubject(subject + "(" + i + ")");
				documentQnaService.insertQna(documentQna);
			}
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}
		
		/** (9) 저장 완료 후 읽기 페이지로 이동하기 */
		//읽어들일 게시물을 식별하기 위한 게시물 일련번호 값을 전달해야 한다.
		String url = "%s/bbs/documentQna_read.do?category=%s&document_id=%d";
		url = String.format(url, web.getRootPath(), documentQna.getCategory(), documentQna.getId());
		web.redirect(url, null);
		return null;
	}
   

}
