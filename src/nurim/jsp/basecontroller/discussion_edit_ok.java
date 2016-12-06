package nurim.jsp.basecontroller;

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
import nurim.jsp.model.Document;
import nurim.jsp.model.Member;
import nurim.jsp.service.DiscussionService;
import nurim.jsp.service.impl.DiscussionServiceImpl;

@WebServlet("/discussion_edit_ok.do")
public class discussion_edit_ok extends BaseController {
	private static final long serialVersionUID = -1826627085822816513L;

	/** (1) 사용하고자 하는 Helper 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	BBSCommon bbs;
	RegexHelper regex;
	DiscussionService discussionService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/** (2) 사용하고자 하는 Helper + Service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		bbs = BBSCommon.getInstance();
		regex = RegexHelper.getInstance();
		discussionService = new DiscussionServiceImpl(sqlSession, logger);
		
		/** 파라미터 받기 */
		String subject = web.getString("subject");
		String content = web.getString("content");
		//작성자 아이피 주소 가져오기
		String ipAddress = web.getClientIP();
		int memberId = 1;
		
		//글 번호 가져오기
		int documentId = 0;
		try {
			documentId = web.getInt("document_id");
		} catch (NullPointerException e) {
			sqlSession.close();
			web.redirect(null, "글 번호가 올바르지 않습니다.");
			return null;
		}
		
		/** (5) 게시판 카테고리 값을 받아서 view에 전달 */
		String category = web.getString("category");
		request.setAttribute("category", category);
		logger.debug("caregory = " + category);
		
		/** (6) 존재하는 게시판인지 판별하기 */
		try {
			String bbsName = bbs.getBbsName(category);
			request.setAttribute("bbsName", bbsName);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}
		
		/** (7) 로그인 한 경우 자신의 글이라면 입력하지 않은 정보를 세션 데이터로 대체한다. 
		//소유권 검사 정보
		boolean myDocument = false;
		
		Member loginInfo = (Member) web.getSession("loginInfo");
		if (loginInfo != null) {
			try {
				//소유권 판정을 위하여 사용하는 임시 객체
				Document temp = new Document();
				temp.setCategory(category);
				temp.setId(documentId);
				temp.setMemberId(loginInfo.getId());
				
				if (discussionService.selectDiscussionCountByMemberId(temp) > 0) {
					//소유권을 의미하는 변수 변경
					myDocument = true;
					//입력되지 않은 정보들 갱신
					memberId = loginInfo.getId();
				}
			} catch (Exception e) {
				sqlSession.close();
				web.redirect(null, e.getLocalizedMessage());
				return null;
			}
		}
		
		//전달된 파라미터는 로그로 확인한다.
		logger.debug("documentId = " + documentId);
		logger.debug("category = " + category);
		logger.debug("subject = " + subject);
		logger.debug("content = " + content);
		logger.debug("ipAddress = " + ipAddress);
		logger.debug("memberId = " + memberId);
		*/
		
		/** (8) 입력 받은 파라미터에 대한 유효성 검사 */
		//제목 및 내용 검사
		if (!regex.isValue(subject)) {
			sqlSession.close();
			web.redirect(null, "글 제목을 입력하세요.");
			return null;
		}
				
		if (!regex.isValue(content)) {
			sqlSession.close();
			web.redirect(null, "내용을 입력하세요.");
			return null;
		}
		
		/** (9) 입력 받은 파파미터를 Beans로 묶기 */
		Document document = new Document();
		//UPDATE 문의 WHERE 절에서 사용해야 하므로 글 번호 추가
		// -> 글 번호는 숫자로 변환해서 처리해야 한다.
		document.setId(documentId);
		document.setCategory(category);
		document.setSubject(subject);
		document.setContent(content);
		document.setIpAddress(ipAddress);
		document.setMemberId(memberId);
		logger.debug(document.toString());
		
		/** (10) 게시물 변경을 위한 Service 기능을 호출 */
		try {
			//자신의 글이 아니라면 비밀번호 검사를 먼저 수행한다.
			/**if (!myDocument) {
				discussionService.selectDiscussionCountByPw(document);
			} */
			
			discussionService.updateDiscussion(document);
		}  catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}
		
		/** (11) 모든 절차가 종료되었으므로 DB 접속 해제 후 페이지 이동 */
		sqlSession.close();
		
		String url = "%s/discussion_write_result.do?category=%s&document_id=%d";
		url = String.format(url, web.getRootPath(), category, documentId);
		web.redirect(url, null);
		
		return null;
	}

}
