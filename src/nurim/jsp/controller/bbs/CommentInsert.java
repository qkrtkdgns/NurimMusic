package nurim.jsp.controller.bbs;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.fasterxml.jackson.databind.ObjectMapper;

import nurim.jsp.dao.MyBatisConnectionFactory;
import nurim.jsp.helper.BaseController;
import nurim.jsp.helper.RegexHelper;
import nurim.jsp.helper.WebHelper;
import nurim.jsp.model.Comment;
import nurim.jsp.model.Member;
import nurim.jsp.service.CommentService;
import nurim.jsp.service.impl.CommentServiceImpl;

@WebServlet("/bbs/comment_insert.do")
public class CommentInsert extends BaseController {
	private static final long serialVersionUID = -8700758894483101194L;
	
	/** (1) 사용하고자 하는 Helper 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	RegexHelper regex;
	CommentService commentService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/** (2) 페이지 형식 지정 + 사용하고자 하는 Helper + Service 객체 생성 */
		//페이지 형식을 JSON으로 설정한다.'
		response.setContentType("application/json");
		
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		regex = RegexHelper.getInstance();
		commentService = new CommentServiceImpl(sqlSession, logger);
		
		/** (3) 파라미터 받기 */
		int documentId = web.getInt("document_id");
		String content = web.getString("content");
		//작성자 아이피 주소 가져오기
		String ipAddress = web.getClientIP();
		int memberId = 1;
		String userId = "ggzzzzzz";
		
		//로그인 한 경우, 입력하지 않은 이름, 비밀번호, 이메일을 세션정보로 대체
		Member loginInfo = (Member) web.getSession("loginInfo");
		if (loginInfo != null) {
			memberId = loginInfo.getId();
		}
		
		//전달된 파라미터는 로그로 확인한다.
		logger.debug("document_id = " + documentId);
		logger.debug("user_id = " + userId );
		logger.debug("content = " + content);
		logger.debug("ipAddress = " + ipAddress);
		logger.debug("memberId = " + memberId);
		logger.debug("user_id = " + userId);
		
		/** (4) 입력 받은 파라미터에 대한 유효성 검사 */
		//덧글이 소속될 게시물의 일련번호
		if (documentId == 0) {
			sqlSession.close();
			web.printJsonRt("게시물 일련번호가 없습니다.");
			return null;
		}
		
		//내용 검사
		if (!regex.isValue(content)) {
			sqlSession.close();
			web.printJsonRt("내용을 입력하세요.");
			return null;
		}
				
		/** (5) 입력 받은 파라미터를 Beans로 묶기 */
		Comment comment = new Comment();
		comment.setDocumentId(documentId);
		comment.setUserId(userId);
		comment.setContent(content);
		comment.setIpAddress(ipAddress);
		comment.setMemberId(memberId);
		logger.debug("comment >> " + comment.toString());		
				
		/** (6) Service를 통한 덧글 저장 */
		//작성 결과를 저장할 객체
		Comment item = null;
		try {
			commentService.insertComment(comment);
			item = commentService.selectComment(comment);
		} catch (Exception e) {
			web.printJsonRt(e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		/** (7) 처리 결과를 JSON으로 출력하기 */
		//줄바꿈이나 HTML 특수문자에 대한 처리
		item.setUserId(web.convertHtmlTag(item.getUserId()));
		item.setContent(web.convertHtmlTag(item.getContent()));
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("rt", "OK");
		data.put("item", item);
		
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), data);
		
		return null;
	}


}
