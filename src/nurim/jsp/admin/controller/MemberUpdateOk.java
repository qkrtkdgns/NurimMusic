package nurim.jsp.admin.controller;

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

import nurim.jsp.admin.service.MemberService;
import nurim.jsp.admin.service.impl.MemberServiceImpl;
import nurim.jsp.dao.MyBatisConnectionFactory;
import nurim.jsp.helper.BaseController;
import nurim.jsp.helper.RegexHelper;
import nurim.jsp.helper.UploadHelper;
import nurim.jsp.helper.WebHelper;
import nurim.jsp.model.Member;

@WebServlet("/admin/member_update_ok.do")
public class MemberUpdateOk extends BaseController {
	private static final long serialVersionUID = -119449740030506798L;

	/** (1) 사용하고자 하는 Helper + Service 객체 선언 */
	// -->import org.apache.logging.log4j.Logger;
	Logger logger;
	// -->import org.apache.ibatis.session.SqlSession;
	SqlSession sqlSession;
	// --> import study.jsp.helper.WebHelper;
	WebHelper web;
	// --> import study.jsp.helper.RegexHelper;
	RegexHelper regex;
	// --> import study.jsp.mysite.service.MemberService;
	MemberService memberService;
	UploadHelper upload;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		response.setContentType("application/json");
		// --> import org.apache.logging.log4j.LogManager;
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		regex = RegexHelper.getInstance();
		upload = UploadHelper.getInstance();
		// --> import study.jsp.mysite.service.impl.MemberServiceImpl;
		memberService = new MemberServiceImpl(sqlSession, logger);
		/** (3) 로그인 여부 검사 
		// 로그인 중이 아니라면 이 페이지를 동작시켜서는 안된다.
		if (web.getSession("loginInfo") == null) {
			// 이미 SqlSession 객체를 생성했으므로, 데이터베이스 접속을 해제해야 한다.
			sqlSession.close();
			web.redirect(web.getRootPath() + "/admin/index.do", "로그인 중이 아닙니다.");
			return null;
		}*/

		int Id = web.getInt("id");
		String userId = web.getString("user_id");
		String userPw = web.getString("user_pw");
		String name = web.getString("user_name");
		String email = web.getString("user_email");
		String tel = web.getString("user_tel");
		String gender = web.getString("user_gender");
		String postcode = web.getString("postcode");
		String addr1 = web.getString("address");
		String addr2 = web.getString("address_sub");
		String birthdate = web.getString("user_birthdate");

		// 전달받은 파라미터는 값의 정상여부 확인을 위해서 로그로 확인
		logger.debug("id >> " + Id);
		logger.debug("userId=" + userId);
		logger.debug("userPw=" + userPw);
		logger.debug("name=" + name);
		logger.debug("email=" + email);
		logger.debug("tel=" + tel);
		logger.debug("gender=" + gender);
		logger.debug("postcode=" + postcode);
		logger.debug("addr1=" + addr1);
		logger.debug("addr2=" + addr2);
		logger.debug("birthdate >> " + birthdate);
		
		/** (5) 입력값의 유효성 검사 */
		// 아이디 검사
		if (!regex.isValue(userId)) {
			sqlSession.close();
			web.printJsonRt("아이디를 입력하세요.");
			return null;
		}
		if (!regex.isEngNum(userId)) {
			sqlSession.close();
			web.printJsonRt("아이디는 숫자와 영문의 조합으로 20자까지만 가능합니다.");
			return null;
		}
		if (userId.length() > 20) {
			sqlSession.close();
			web.printJsonRt("아이디는 숫자와 영문의 조합으로 20자까지만 가능합니다.");
			return null;
		}
		
		// 비밀번호 검사
		if (!regex.isValue(userPw)) {
			sqlSession.close();
			web.printJsonRt("비밀번호를 입력하세요.");
			return null;
		}
		if (!regex.isEngNum(userPw)) {
			sqlSession.close();
			web.printJsonRt("비밀번호는 숫자와 영문의 조합으로 20자까지만 가능합니다.");
			return null;
		}
		if (userPw.length() > 20) {
			sqlSession.close();
			web.printJsonRt("비밀번호는 숫자와 영문의 조합으로 20자까지만 가능합니다.");
			return null;
		}
		
		// 이름 검사
		if (!regex.isValue(name)) {
			sqlSession.close();
			web.printJsonRt("이름을 입력하세요.");
			return null;
		}
		if (!regex.isKor(name)) {
			sqlSession.close();
			web.printJsonRt("이름은 한글만 입력 가능합니다.");
			return null;
		}
		if (name.length() < 2 || name.length() > 5) {
			sqlSession.close();
			web.printJsonRt("이름은 2~5글자 까지만 가능합니다.");
			return null;
		}
		// 이메일 검사
		if (!regex.isValue(email)) {
			sqlSession.close();
			web.printJsonRt("이메일을 입력하세요.");
			return null;
		}
		if (!regex.isEmail(email)) {
			sqlSession.close();
			web.printJsonRt("이메일의 형식이 잘못되었습니다.");
			return null;
		}
		// 연락처 검사
		if (!regex.isValue(tel)) {
			sqlSession.close();
			web.printJsonRt("연락처를 입력하세요.");
			return null;
		}
		if (!regex.isCellPhone(tel) && !regex.isTel(tel)) {
			sqlSession.close();
			web.printJsonRt("연락처의 형식이 잘못되었습니다.");
			return null;
		}
		// 성별 검사
		if (!regex.isValue(gender)) {
			sqlSession.close();
			web.printJsonRt("성별을 입력하세요.");
			return null;
		}
		if (!gender.equals("M") && !gender.equals("F")) {
			sqlSession.close();
			web.printJsonRt("성별이 잘못되었습니다.");
			return null;
		}
		
		/** (7) 전달받은 파라미터를 Beans 객체에 담는다. */
		Member member = new Member();
		member.setId(Id);
		member.setUserId(userId);
		member.setUserPw(userPw);
		member.setUserName(name);
		member.setEmail(email);
		member.setTel(tel);
		member.setGender(gender);
		member.setPostcode(postcode);
		member.setAddr1(addr1);
		member.setAddr2(addr2);
		member.setBirthdate(birthdate);
		
		logger.debug("member >> "  + member);
		/** (8) Service를 통한 데이터베이스 저장 처리 */
		try {
			memberService.updateMemberByAdmin(member);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			// 예외가 발생한 경우이므로, 더이상 진행하지 않는다.
			return null;
		}
		Map<String,Object> data = new HashMap<String, Object>();
		data.put("rt", "OK");
		
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), data);
		request.setAttribute("member", member);
		
		// INSERT,UPDATE, DELETE 처리를 수행하는 action 페이지들은
		// 자체적으로 View를 갖지 않고 결과를 확인할 수 있는
		// 다른페이지로 강제 이동시켜야 한다. (중복실행 방지)
		// 그러므로 View의 경로를 리턴하지 않는다.
		return null;
	}

}
