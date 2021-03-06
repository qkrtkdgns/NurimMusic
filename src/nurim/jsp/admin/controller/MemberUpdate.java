package nurim.jsp.admin.controller;

import java.io.IOException;

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
import nurim.jsp.helper.RegexHelper;
import nurim.jsp.helper.UploadHelper;
import nurim.jsp.helper.WebHelper;
import nurim.jsp.model.Member;

@WebServlet("/admin/member_update.do")
public class MemberUpdate extends BaseController {
	private static final long serialVersionUID = -119449740030506798L;

	/** (1) 사용하고자 하는 Helper + Service 객체 선언 */
	// -->import org.apache.logging.log4j.Logger;
	Logger logger;
	// -->import org.apache.ibatis.session.SqlSession;
	SqlSession sqlSession;
	// --> import study.jsp.helper.WebHelper;
	WebHelper web;
	// --> import study.jsp.mysite.service.MemberService;
	MemberService memberService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		// --> import org.apache.logging.log4j.LogManager;
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		
		/** (3) 로그인 여부 검사 */
		// 로그인 중이 아니라면 이 페이지를 동작시켜서는 안된다.
		if (web.getSession("loginInfo") == null) {
			// 이미 SqlSession 객체를 생성했으므로, 데이터베이스 접속을 해제해야 한다.
			sqlSession.close();
			web.redirect(web.getRootPath() + "/admin/index.do", "로그인 중이 아닙니다.");
			return null;
		}
		

		// --> import study.jsp.mysite.service.impl.MemberServiceImpl;
		memberService = new MemberServiceImpl(sqlSession, logger);

		int Id = web.getInt("id");
		
		// 전달받은 파라미터는 값의 정상여부 확인을 위해서 로그로 확인
		logger.debug("id >> " + Id);
		
		/** (7) 전달받은 파라미터를 Beans 객체에 담는다. */
		Member member = new Member();
		member.setId(Id);
		
		/** (8) Service를 통한 데이터베이스 저장 처리 */
		try {
			member = memberService.selectMemberByAdmin(member);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			// 예외가 발생한 경우이므로, 더이상 진행하지 않는다.
			return null;
		}
		logger.debug("member >> "+ member);
		request.setAttribute("member", member);
		// INSERT,UPDATE, DELETE 처리를 수행하는 action 페이지들은
		// 자체적으로 View를 갖지 않고 결과를 확인할 수 있는
		// 다른페이지로 강제 이동시켜야 한다. (중복실행 방지)
		// 그러므로 View의 경로를 리턴하지 않는다.
		return "admin/member_update";
	}

}
