package nurim.jsp.admin;

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
import nurim.jsp.helper.UploadHelper;
import nurim.jsp.helper.WebHelper;
import nurim.jsp.model.Member;

@WebServlet("/admin/login_ok.do")
public class LoginOk extends BaseController {
	private static final long serialVersionUID = -4124214171500366910L;

	/** (1) 사용하고자 하는 Helper + Service 객체 선언 */
	// --> import org.apache.logging.log4j.Logger;
	Logger logger;
	// --> import org.apache.ibatis.session.SqlSession;
	SqlSession sqlSession;
	// --> import study.jsp.helper.WebHelper;
	WebHelper web;
	// --> import study.jsp.helper.UploadHelper;
	UploadHelper upload;
	MemberService memberService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		/** (2) 사용하고자 하는 Helper + Service 객체 생성 */
		// --> import org.apache.logging.log4j.LogManager;
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		// --> import study.jsp.mysite.dao.MyBatisConnectionFactory;
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		upload = UploadHelper.getInstance();
		// 회원가입 처리를 위한 Service객체
		memberService = new MemberServiceImpl(sqlSession,logger);

		/** (3) 로그인 여부 검사 */
		// 로그인 중이라면 이 페이지를 동작시켜서는 안된다.
		if (web.getSession("loginInfo") != null) {
			// 이미 SqlSession 객체를 생성했으므로, 데이터베이스 접속을 해제해야 한다.
			sqlSession.close();
			web.redirect(web.getRootPath() + "/admin/main.do", "이미 로그인 하셨습니다.");
			return null;
		}

		/** (4) 파라미터 처리 */
		// --> topbar.jsp에 배치된 폼으로부터 전송되는 입력값.
		String userId = web.getString("admin_id");
		String userPw = web.getString("admin_pw");

		logger.debug("userId=" + userId);
		logger.debug("userPw=" + userPw);

		if (userId == null || userPw == null) {
			sqlSession.close();
			web.redirect(null, "아이디나 비밀번호가 없습니다.");
			return null;
		}

		/** (5) 전달받은 파라미터를 세션에 저장 */
		// --> import study.jsp.mysite.model.Member
		Member member = new Member();
		member.setUser_id(userId);
		member.setUser_pw(userPw);
		
		/** (6) Service를 통한 회원 인증 */
		Member loginInfo;

		try {
			// 아이디와 비밀번호가 일치하는 회원 정보를 조회하여 리턴한다
			loginInfo = memberService.selectLoginInfo(member);
			if(loginInfo==null){
				throw new NullPointerException();
			}
			logger.debug("loginInfo >> " + loginInfo);
		}catch(NullPointerException e){
			sqlSession.close();
			web.redirect(null, "회원정보가 없습니다");
			return null;
		}
		catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}
		/**(7) 관리자 계정 확인 */
		if(loginInfo !=null){
			int admin = loginInfo.getId();
			logger.debug("admin >> " + admin);
		if(admin != 1){
			web.redirect(null, "관리자 계정이 아닙니다.");
			return null;
		}
		}
		/** (8) 조회된 회원 정보를 세션에 저장 */
		// 로그인 처리는 아이디와 비밀번호를 기반으로 조회된 정보를
		// 세션에 보관하는 과정을 말한다.
		// 로그인에 대한 판별은 저장된 세션정보의 존재 여부로 판별한다.
		web.setSession("loginInfo", loginInfo);

		/** (9) 페이지 이동 */
		// 이전 페이지 구하기 (javascript로 이동된 경우 조회 안됨)
		String movePage = request.getHeader("refere");
		if (movePage == null) {
			movePage = web.getRootPath() + "/admin/main.do";
		}

		sqlSession.close();
		logger.debug(movePage);
		web.redirect(movePage, null);
		return null;
	}

}
