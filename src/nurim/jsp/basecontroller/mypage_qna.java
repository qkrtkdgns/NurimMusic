package nurim.jsp.basecontroller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import nurim.jsp.dao.MyBatisConnectionFactory;
import nurim.jsp.helper.BaseController;
import nurim.jsp.helper.PageHelper;
import nurim.jsp.helper.WebHelper;
import nurim.jsp.model.Document;
import nurim.jsp.model.Member;
import nurim.jsp.service.DocumentService;
import nurim.jsp.service.impl.DocumentServiceImpl;

@WebServlet("/mypage_qna.do")
public class mypage_qna extends BaseController {
	private static final long serialVersionUID = -6281900591655467642L;

	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	PageHelper pageHelper;
	DocumentService documentService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		pageHelper = PageHelper.getInstance();
		documentService = new DocumentServiceImpl(sqlSession, logger);

		Member loginInfo = (Member) web.getSession("loginInfo");

		// 로그인 중인지 확인
		if (loginInfo == null) {
			sqlSession.close();
			web.redirect(web.getRootPath() + "/index.do", "로그인 중이 아닙니다.");
			return null;
		}
		// 현재 페이지 수 --> 기본 값은 1페이지로 설정함
		int page = web.getInt("page", 1);

		Document document = new Document();
		document.setMemberId(loginInfo.getId());
		logger.debug("document >> " + document);

		// 상담글을 담을 리스트 선언
		int totalCount = 0;
		List<Document> documentlist = null;
		try {
			// 회원 번호로 게시글 리스트 검색
			// totalCount = documentService.selectQnaCount(document);
			// logger.debug("totalCount >> " + totalCount);
			// 나머지 페이지 번호 계산하기
			// --> 현재 페이지, 전체 게시물 수, 한 페이지의 목록 수, 그룹갯수
			pageHelper.pageProcess(page, totalCount, 5, 5);
			logger.debug("pageHelper >> " + pageHelper);
			// 페이지 번호 계산 결과에서 Limit절에 필요한 값을 Beans에 추가
			//document.setLimitStart(pageHelper.getLimitStart());
			//document.setListCount(pageHelper.getListCount());

			// documentlist = documentService.selectQnaList(document);
		} catch (Exception e) {
			logger.debug(e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}

		request.setAttribute("document", document);
		request.setAttribute("documentList", documentlist);
		// 페이지 번호 계산 결과를 View에 전달
		request.setAttribute("pageHelper", pageHelper);

		return "mypage_qna";
	}

}
