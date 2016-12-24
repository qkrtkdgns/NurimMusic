package nurim.jsp.controller.bbs;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
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
import nurim.jsp.helper.WebHelper;
import nurim.jsp.model.Comment;
import nurim.jsp.service.CommentService;
import nurim.jsp.service.impl.CommentServiceImpl;

@WebServlet("/bbs/comment_list.do")
public class CommentList extends BaseController {
	private static final long serialVersionUID = 1176545732579453727L;

	/** (1) 사용하고자 하는 Helper + Service 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	CommentService commentService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/** (2) 페이지 형식 지정 + 사용하고자 하는 Helper + Service 객체 생성 */
		//페이지 형식을 JSON으로 설정한다.
		response.setContentType("application/json");
		
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		commentService = new CommentServiceImpl(sqlSession, logger);
		
		/** (3) 파라미터 받기 */
		//어떤 게시물에 속한 댓글들을 조회할지 판별하기 위하여
		//게시물 일련번호를 파라미터로 받는다.
		int documentId = web.getInt("document_id");
		logger.debug("document_id = " + documentId);
		
		/** (4) 입력 받은 파라미터에 대한 유효성 검사 */
		//덧글이 소속될 게시물의 일련번호
		if (documentId == 0) {
			sqlSession.close();
			web.printJsonRt("게시물 일련번호가 없습니다.");
			return null;
		}
		
		/** (5) 입력 받은 파라미터를 Beans로 묶기 */
		Comment comment = new Comment();
		comment.setDocumentId(documentId);
		
		/** (6) Service를 통한 댓글 목록 조회 */
		//작성 결과를 저장할 객체
		List<Comment> item = null;
		try {
			item = commentService.selectcommentList(comment);
			logger.debug("item = " + item);
		} catch (Exception e) {
			web.printJsonRt(e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		/** (7) 처리 결과를 JSON으로 출력하기 */
		//줄바꿈이나 HTML 특수문자에 대한 처리
		for (int i = 0; i < item.size(); i++) {
			Comment temp = item.get(i);
			temp.setUserId(web.convertHtmlTag(temp.getUserId()));
			temp.setContent(web.convertHtmlTag(temp.getContent()));
		}
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("rt", "OK");
		data.put("item", item);
		
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), data);
		
		return null;
	}
       

}
