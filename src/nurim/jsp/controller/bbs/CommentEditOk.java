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
import nurim.jsp.service.CommentService;
import nurim.jsp.service.impl.CommentServiceImpl;

@WebServlet("/bbs/comment_edit_ok.do")
public class CommentEditOk extends BaseController {
	private static final long serialVersionUID = 8508619611636052754L;

	/** (1) 사용하고자 하는 Helper 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	RegexHelper regex;
	CommentService commentService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/** (2) 페이지 형식 지정 + 사용하고자 하는 Helper + Service 객체 선언 */
		//페이지 형식을 JSON으로 설정한다.'
		response.setContentType("application/json");
		
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		commentService = new CommentServiceImpl(sqlSession, logger);
		regex = RegexHelper.getInstance();
		
		/** (3) 파라미터 받기 */
		int commentId = web.getInt("comment_id");
		String userId = "ggzzzzzz";
		String content = web.getString("content");
		//작성자 아이피 주소 가져오기
		String ipAddress = web.getClientIP();
		//회원 일련번호
		int memberId = 1;
		
		//전달된 파라미터는 로그로 확인한다.
		logger.debug("comment_id = " + commentId);
		logger.debug("user_id = " + userId);
		logger.debug("content = " + content);
		logger.debug("ipAddress = " + ipAddress);
		logger.debug("memberId = " + memberId);
		
		/** (5) 입력 받은 파라미터에 대한 유효성 검사 */
		if (commentId == 0) {
			sqlSession.close();
			web.printJsonRt("댓글 번호가 없습니다.");
			return null;
		}
		
		if (!regex.isValue(content)) {
			sqlSession.close();
			web.printJsonRt("내용을 입력하세요.");
			return null;
		}
		
		/** (6) 입력 받은 파라미터를 Beans로 묶기 */
		Comment comment = new Comment();
		//update문의 where절에서 사용해야 하므로 댓글 번호 추가
		comment.setId(commentId);
		comment.setUserId(userId);
		comment.setContent(content);
		comment.setIpAddress(ipAddress);
		comment.setMemberId(memberId);
		logger.debug(comment.toString());
		
		/** (7) 댓글 변경을 위한 Service 기능을 호출 */
		Comment item = null;
		try {
			commentService.updatecomment(comment);
			//변경된 결과를 조회
			item = commentService.selectComment(comment);
		}  catch (Exception e) {
			web.printJsonRt(e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		/** (8) 처리 결과를 JSON으로 출력하기 */
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
