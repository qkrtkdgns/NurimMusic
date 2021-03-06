package nurim.jsp.basecontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import nurim.jsp.service.MemberService;
import nurim.jsp.service.impl.MemberServiceImpl;
import nurim.jsp.dao.MyBatisConnectionFactory;
import nurim.jsp.helper.BaseController;
import nurim.jsp.helper.RegexHelper;
import nurim.jsp.helper.WebHelper;
import nurim.jsp.model.Member;


/**
 * Servlet implementation class JoinOk
 */
@WebServlet("/join_ok.do")
public class Join2Ok extends BaseController {


   private static final long serialVersionUID = -4880421995684020164L;
   /**(1) 사용하고자 하는 Helper+Service 객체 선언*/
   Logger logger;
   SqlSession sqlSession;
   WebHelper web;
   RegexHelper regex;
   MemberService memberService;
   @Override
   public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   
      /**(2) 사용하고자 하는 Helper+Service 객체 생성*/
      logger = LogManager.getFormatterLogger(request.getRequestURL());
      sqlSession =MyBatisConnectionFactory.getSqlSession();
      web = WebHelper.getInstance(request, response);
      regex =RegexHelper.getInstance();
      memberService = new MemberServiceImpl(sqlSession, logger);
      
      /**(3) 로그인 여부 검사*/
      //로그인 중이라면 이 페이지를 동작시켜서는 안된다.
            if(web.getSession("loginInfo")!=null){
               web.redirect(web.getRootPath()+"/index.do", "이미 로그인 하셨습니다.");
               return null;
            }
      /**(4)POST 파라미터 받기*/
      String userId = web.getString("user_id");
      String userPw =web.getString("user_pw");
      String userPwRe =web.getString("user_pw_re");
      String userName=web.getString("user_name");
      String  email= web.getString("email");
      String  tel=web.getString("tel");
      String  birthdate=web.getString("birthdate");
      String  gender=web.getString("gender");
      String  postcode=web.getString("postcode");
      String  addr1=web.getString("address");
      String  addr2=web.getString("address_sub");
      
      logger.debug("userId="+userId);
      logger.debug("userPw="+userPw);
      logger.debug("userPwRe="+userPwRe);
      logger.debug("userName="+userName);
      logger.debug("email="+email);
      logger.debug("tel="+tel);
      logger.debug("birthdate="+birthdate);
      logger.debug("gender="+gender);
      logger.debug("postcode="+postcode);
      logger.debug("addr1="+addr1);
      logger.debug("addr2="+addr2);
      /**(5) 입력값의 유효성 검사*/
      
      if(!regex.isValue(userId)){
         sqlSession.close();
         web.redirect(null, "아이디를 입력하세요");
         return null;
      }
      if(!regex.isEngNum(userId)){
         sqlSession.close();
         web.redirect(null, "아이디는 숫자와 영문의 조합만 가능합니다.");
         return null;
      }
      
      if(userId.length()>20){
         sqlSession.close();
         web.redirect(null, "아이디는 숫자와 영문의 조합으로 16자까지만 가능합니다.");
         return null;
      }
      
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
      
      if(!userPw.equals(userPwRe)){
         sqlSession.close();
         web.redirect(null, "비밀번호 확인이 잘못되었습니다.");
         return null;
      }
      
      if(!regex.isValue(userName)){
         sqlSession.close();
         web.redirect(null, "이름를 입력하세요");
         return null;
      }
      if(!regex.isKor(userName)){
         sqlSession.close();
         web.redirect(null, "이름은 한글만 입력 가능합니다.");
         return null;
      }
      
      if(userName.length()<2 || userName.length()>5){
         sqlSession.close();
         web.redirect(null, "이름은 2~5글자 까지만 가능합니다.");
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
      
   

      /**(7) 전달받은 파라미터를 Beans 객체에 담는다.*/
      Member member = new Member();
      member.setUserId(userId);
      member.setUserPw(userPw);
      member.setUserName(userName);
      member.setEmail(email);
      member.setTel(tel);
      member.setBirthdate(birthdate);
      member.setGender(gender);
      member.setPostcode(postcode);
      member.setAddr1(addr1);
      member.setAddr2(addr2);
      
      
      /**(8) Service를 통한 데이터베이스 저장 처리*/
      try{
    	 memberService.selectMemberCheck(member);
     	 memberService.selectMemberEmailCheck(member);
         memberService.insertMember(member);
      }catch(Exception e){
         sqlSession.close();
         web.redirect(null, e.getLocalizedMessage());
         return null;
      }
      /**(9) 가입이 완료되었으므로 메인페이지 이동*/
      sqlSession.close();
      web.redirect(web.getRootPath()+"/index.do", "회원가입이 완료되었습니다.");
      //INSERT, UPDATE, DELETE 처리를 수행하는 action 페이지들은
      //자체적으로 view를 갖지 않고 결과를 확인할 수 있는
      //다른 페이지로 강제 이동시켜야한다. (중복 실행 방지)
      // 그러므로 view의 경로를 리턴하지 않는다.
      return null;
   }
   
}