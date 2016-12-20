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
import nurim.jsp.helper.WebHelper;
import nurim.jsp.model.Comment;
import nurim.jsp.service.CommentService;
import nurim.jsp.service.impl.CommentServiceImpl;

@WebServlet("/bbs/comment_edit.do")
public class CommentEdit extends BaseController {
	private static final long serialVersionUID = -4968218558723467192L;

	/** (1) 사용하고자 하는 Helper 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	CommentService commentService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/** (2) 사용하고자 하는 Helper + Service 객체 선언 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		commentService = new CommentServiceImpl(sqlSession, logger);
		
		/** (3) 글 번호 파라미터 받기 */
		int commentId = web.getInt("comment_id");
		if (commentId == 0) {
			sqlSession.close();
			web.redirect(null, "댓글 번호가 없습니다.");
			return null;
		}
		
		//파라미터를 Beans로 묶기
		Comment comment = new Comment();
		comment.setId(commentId);
		
		/** (4) 댓글 일련번호를 사용한 데이터 조회 */
		//지금 읽고 있는 댓글이 저장될 객체
		Comment readComment = null;
		
		try {
			readComment = commentService.selectComment(comment);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		/** (5) 읽은 데이터를 view에게 전달한다. */
		request.setAttribute("comment", readComment);
		
		return "comment_edit";
	}

}
