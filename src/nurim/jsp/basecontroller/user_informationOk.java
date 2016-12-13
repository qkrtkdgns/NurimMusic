package nurim.jsp.basecontroller;

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
import nurim.jsp.helper.RegexHelper;
import nurim.jsp.helper.WebHelper;
import nurim.jsp.model.Member;
import nurim.jsp.service.MemberService;
import nurim.jsp.service.impl.MemberServiceImpl;

@WebServlet("/user_information_ok.do")
public class user_informationOk extends BaseController {
	private static final long serialVersionUID = 6645994334857231145L;
	/**(1) 사용하고자 하는 Helper + Service 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	RegexHelper regex;
	MemberService memberService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/** (2) 사용하고자 하는 Helper + Service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		regex = RegexHelper.getInstance();
		memberService = new MemberServiceImpl(sqlSession, logger);
		
		/**(3)POST 파라미터 받기*/
	      String userPw =web.getString("user_pw");
	      String userPwRe =web.getString("user_pw_re");
	      String userPwReCheck = web.getString("user_pw_re_check");
	      String  email= web.getString("email");
	      String  tel=web.getString("tel");
	      String  birthdate=web.getString("birthdate");
	      String  gender=web.getString("gender");
	      String  postcode=web.getString("postcode");
	      String  addr1=web.getString("address");
	      String  addr2=web.getString("address_sub");
	      
	      logger.debug("userPw="+userPw);
	      logger.debug("userPwRe="+userPwRe);
	      logger.debug("userPwReCheck = " + userPwReCheck);
	      logger.debug("email="+email);
	      logger.debug("tel="+tel);
	      logger.debug("birthdate="+birthdate);
	      logger.debug("gender="+gender);
	      logger.debug("postcode="+postcode);
	      logger.debug("addr1="+addr1);
	      logger.debug("addr2="+addr2);
	      /**(5) 입력값의 유효성 검사*/
	      
	      if(userPwRe!=null){
		      if(!userPwRe.equals(userPwReCheck)){
		    	  sqlSession.close();
		    	  web.redirect(null, "변경할 비밀번호가 다릅니다.");
		    	  return null;
		      }}
	      
	      if(!regex.isValue(userPw)){
	         sqlSession.close();
	         web.redirect(null, "비밀번호를 입력하세요");
	         return null;
	      }
	      if(!regex.isEngNum(userPw)){
	         sqlSession.close();
	         web.redirect(null, "비밀번호는 숫자와 영문의 조합으로 20자까지만 가능합니다.");
	         return null;
	      }
	      
	      if(userPw.length()>20){
	         sqlSession.close();
	         web.redirect(null, "비밀번호는 숫자와 영문의 조합으로 20자까지만 가능합니다.");
	         return null;
	      }
	      
	      if(!regex.isValue(email)){
	         sqlSession.close();
	         web.redirect(null, "이메일를 입력하세요");
	         return null;
	      }
	      
	      if(!regex.isEmail(email)){
	         sqlSession.close();
	         web.redirect(null, "이메일 형식이 잘못되었습니다.");
	         return null;
	      }
	      
	      if(!regex.isValue(tel)){
	         sqlSession.close();
	         web.redirect(null, "연락처를 입력하세요");
	         return null;
	      }
	      
	      if(!regex.isCellPhone(tel) && !regex.isTel(tel)){
	         sqlSession.close();
	         web.redirect(null, "연락처의 형식이 잘못되었습니다.");
	         return null;
	      }
	      
	      if(!regex.isValue(birthdate)){
	         sqlSession.close();
	         web.redirect(null, "생년월일을 입력하세요");
	         return null;
	      }
	      
	      if(!regex.isValue(gender)){
	         sqlSession.close();
	         web.redirect(null, "성별을 입력하세요.");
	         return null;
	      }
	      
	      if(!gender.equals("M") && !gender.equals("F")){
	         sqlSession.close();
	         web.redirect(null, "성별이 잘못되었습니다.");
	         return null;
	      }
	      Member loginInfo = (Member) web.getSession("loginInfo");
	      /**(7) 전달받은 파라미터를 Beans 객체에 담는다.*/
	      Member member = new Member();
	      member.setUserId(loginInfo.getUserId());
	      member.setUserPw(userPw);
	      member.setUserName(loginInfo.getUserName());
	      member.setEmail(email);
	      member.setTel(tel);
	      member.setBirthdate(birthdate);
	      member.setGender(gender);
	      member.setPostcode(postcode);
	      member.setAddr1(addr1);
	      member.setAddr2(addr2);
	      
	      try{
	    	  //현재 아이디와 비밀번호로 회원정보 검사
	    	  memberService.selectMemberInformation(member);
	    	  if(userPwRe != null){
		    	  member.setUserPw(userPwRe);
		      }else{
		    	  member.setUserPw(userPw);
		      }
	    	  logger.debug("member >> " + member);
	    	  //현재 아이디로 정보 수정
	    	  memberService.updateMemberInformation(member);
	    	  web.setSession("loginInfo", member);
	      }catch(Exception e){
	    	  logger.debug(e.getLocalizedMessage());
	    	  web.redirect(null, e.getLocalizedMessage());
	    	  return null;
	      }finally{
	    	  sqlSession.close();
	      }
	      web.redirect(web.getRootPath()+"/index.do", "정보가 정상적으로 수정되었습니다.");
		return null;
	}

}
