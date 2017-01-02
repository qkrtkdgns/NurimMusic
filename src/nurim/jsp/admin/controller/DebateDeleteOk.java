package nurim.jsp.admin.controller;

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
import nurim.jsp.helper.WebHelper;
import nurim.jsp.model.Comment;
import nurim.jsp.model.Document;
import nurim.jsp.model.Member;
import nurim.jsp.service.CommentService;
import nurim.jsp.service.DiscussionService;
import nurim.jsp.service.impl.CommentServiceImpl;
import nurim.jsp.service.impl.DiscussionServiceImpl;

@WebServlet("/admin/debate_delete_ok.do")
public class DebateDeleteOk extends BaseController {
	private static final long serialVersionUID = -455418874861145840L;

	/** (1) 사용하고자 하는 Helper 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	BBSCommon bbs;
	DiscussionService discussionService;
	CommentService commentService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		/** (2) 사용하고자 하는 Helper + Service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		bbs = BBSCommon.getInstance();
		discussionService = new DiscussionServiceImpl(sqlSession, logger);
		commentService = new CommentServiceImpl(sqlSession, logger);

		// 로그인 중이 아니라면 이 페이지를 동작시켜서는 안된다.
		if (web.getSession("loginInfo") == null) {
			// 이미 SqlSession 객체를 생성했으므로, 데이터베이스 접속을 해제해야 한다.
			sqlSession.close();
			web.redirect(web.getRootPath() + "/admin/index.do", "로그인 중이 아닙니다.");
			return null;
		}

		/** (3) 게시판 카테고리 값을 받아서 View에 전달 */
		String category = web.getString("category");
		request.setAttribute("category", category);

		/** (4) 존재하는 게시판인지 판별하기 */
		try {
			String bbsName = bbs.getBbsName(category);
			request.setAttribute("bbsName", bbsName);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}

		/** (5) 게시글 번호와 비밀번호 받기 */
		int documentId = web.getInt("document_id");

		logger.debug("documentId = " + documentId);

		if (documentId == 0) {
			sqlSession.close();
			web.redirect(null, "글 번호가 없습니다.");
			return null;
		}

		/** (6) 파라미터를 Beans로 묶기 */
		// 게시글 데이터 삭제용
		Document document = new Document();
		document.setId(documentId);
		document.setCategory(category);

		// 게시물에 속한 댓글 삭제를 위해서 생성
		Comment comment = new Comment();
		comment.setDocumentId(documentId);

		/** (7) 데이터 삭제 처리 */
		// 로그인 중이라면 회원일련번호를 Beans에 추가한다.
		Member loginInfo = (Member) web.getSession("loginInfo");
		if (loginInfo != null) {
			document.setMemberId(loginInfo.getId());
		}
		logger.debug("loginInfo = " + loginInfo);

		try {
			// 댓글이 게시물을 참조하므로, 댓글이 먼저 삭제되어야 한다.
			commentService.deleteCommentAll(comment);
			discussionService.deleteDiscussion(document); // 게시글 삭제
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}

		return null;
	}

}
