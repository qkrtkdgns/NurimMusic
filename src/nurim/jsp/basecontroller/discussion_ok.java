package nurim.jsp.basecontroller;

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
import nurim.jsp.model.Document;
import nurim.jsp.service.DiscussionService;
import nurim.jsp.service.impl.DiscussionServiceImpl;

@WebServlet("/discussion_ok.do")
public class discussion_ok extends BaseController {
	private static final long serialVersionUID = 7852207704195079802L;

		 /** (1) 사용하고자 하는 Helper 객체 선언 */
		   Logger logger;
		   SqlSession sqlSession;
		   WebHelper web;
		   BBSCommon bbs;
		   DiscussionService discussionService;
		   
		   @Override
		   public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		      
		      /** (2) 사용하고자 하는 Helper + Service 객체 생성 */
		      logger = LogManager.getFormatterLogger(request.getRequestURI());
		      sqlSession = MyBatisConnectionFactory.getSqlSession();
		      web = WebHelper.getInstance(request, response);
		      bbs = BBSCommon.getInstance();
		      discussionService = new DiscussionServiceImpl(sqlSession, logger);
		      
		      /** (3) 게시판 카테고리 값을 받아서 View에 전달 */
		      String category = web.getString("category");
		      request.setAttribute("category", category);
		      logger.debug("category = " + category);
		      
		      //게시물 번호와 결과값 가져오기
		      int documentId = web.getInt("document_id");
		      logger.debug("document_id = " + documentId);
		      String result = web.getString("result");
		      logger.debug("result = " + result);
		      
		      //업데이트 할 값 입력해주기
		      Document document = new Document();
		      document.setId(documentId);
		      
		      if(result.equals("Y")){
		         document.setAgree(1);
		      }else if(result.equals("N")){
		         document.setDisagree(1);
		      }else{
		         web.redirect(null, "올바르지 않은 선택값입니다.");
		         return null;
		      }
		      
		      /** (4) 존재하는 게시판인지 판별하기 */
		      try {
		         String bbsName = bbs.getBbsName(category);
		         request.setAttribute("bbsName", bbsName);
		      } catch (Exception e) {
		         web.redirect(null, e.getLocalizedMessage());
		         return null;
		      }
		      
		      /** 찬성, 반대수 조회하기 */
		      String cookieKey = "document" + "_" + category + "_" + documentId + "_" + 1;		// + memberId
		      logger.debug("cookieKey >> " + cookieKey);
		      //준비한 문자열에 대응되는 쿠키값 조회
		      String cookieVar = web.getCookie(cookieKey);
		      logger.debug("cookieVar >> " + cookieVar);
		      
		      try {
		         //쿠키값이 없다면 투표수 갱신
		         if (cookieVar == null) {
		            logger.debug("document >> " + document);
		            sqlSession.update("DiscussionMapper.updateDiscussionVote", document);
		            sqlSession.commit(); 
		            web.setCookie(cookieKey, "Y", 60*2);            
		            web.redirect(null, "투표가 완료되었습니다.");
		            return null;
		         } else {
		            web.redirect(null, "이미 투표 하셨습니다.");
		            return null;
		         }
		      } catch (Exception e) {
		         
		      }finally{
		         sqlSession.close();
		      }
		      return null;
		      
		   }
		}