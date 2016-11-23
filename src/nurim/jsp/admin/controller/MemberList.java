package nurim.jsp.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import nurim.jsp.admin.service.MemberService;
import nurim.jsp.admin.service.impl.MemberServiceImpl;
import nurim.jsp.dao.MyBatisConnectionFactory;
import nurim.jsp.helper.BaseController;
import nurim.jsp.helper.PageHelper;
import nurim.jsp.helper.WebHelper;
import nurim.jsp.model.Member;

@WebServlet("/admin/member.do")
public class MemberList extends BaseController{
	private static final long serialVersionUID = -6388037325744925479L;
	/**(1) 사용하고자 하는 Helper 객체 선언 */
	// --> import org.apache.logging.log4j.Logger;
	Logger logger;
	// --> import org.apache.ibatis.session.SqlSession;
	SqlSession sqlSession;
	// --> import study.jsp.helper.WebHelper;
	PageHelper pageHelper;
	WebHelper web;
	MemberService memberService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//"WEB-INF/views/index.jsp"파일을 View로 사용한다.
		
		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		// -->import org.apache.logging.log4j.LogManager;
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		// -->import study.jsp.mysite.service.impl.MemberServiceImpl;
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		pageHelper = PageHelper.getInstance();
		memberService = new MemberServiceImpl(sqlSession,logger);
		/** (3) 로그인 여부 검사 */
		// 로그인 중이 아니라면 이 페이지를 동작시켜서는 안된다.
		if (web.getSession("loginInfo") == null) {
			// 이미 SqlSession 객체를 생성했으므로, 데이터베이스 접속을 해제해야 한다.
			sqlSession.close();
			web.redirect(web.getRootPath() + "/admin/index.do", "로그인 중이 아닙니다.");
			return null;
		}
		
		/** (3) 조회할 정보에 대한 Beans 생성 */
		Member member = new Member();
		
		//현재 페이지 수 --> 기본 값은 1페이지로 설정함
		int page = web.getInt("page",1);
		//검색어
				String keyword = web.getString("search_item");
				String search_item = web.getString("dropdown");
				logger.debug("keyword >> " + keyword);
				logger.debug("search_item >> " + search_item);
				
				//제목과 내용에 대한 검색으로 활용하기 위해서 입력값을 설정한다.
				member.setUser_id(keyword);

				/** (6) 게시글 목록 조회 */
				int totalCount = 0;
				List<Member> memberList = null;
				
				try {
					//전체 게시물 수
					totalCount = memberService.selectMemberCount(member);
					System.out.println(member.toString());
					//나머지 페이지 번호 계산하기
					//--> 현재 페이지, 전체 게시물 수, 한 페이지의 목록 수, 그룹갯수
					pageHelper.pageProcess(page, totalCount, 3, 7);
					
					//페이지 번호 계산 결과에서 Limit절에 필요한 값을 Beans에 추가
					member.setLimitStart(pageHelper.getLimitStart());
					member.setListCount(pageHelper.getListCount());
					memberList = memberService.selectMemberList(member);
					System.out.println(memberList.toString());
				} catch (Exception e) {
					web.redirect(null, e.getLocalizedMessage());
					return null;
				} finally {
					sqlSession.close();
				}

				/** (7) 조회 결과를 View에 전달 */
				request.setAttribute("memberList", memberList);
				// 사용자가 입력한 검색어를 View에 되돌려준다. --> 자동완성 구현을 위함
				request.setAttribute("keyword", keyword);
				//페이지 번호 계산 결과를 View에 전달
				request.setAttribute("pageHelper", pageHelper);
		
		// "/WEB-INF/views/view/index.jsp"파일을 View로 사용한다.
		return "admin/member";
	}

}
