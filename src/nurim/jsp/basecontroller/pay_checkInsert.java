package nurim.jsp.basecontroller;

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

import nurim.jsp.dao.MyBatisConnectionFactory;
import nurim.jsp.helper.BaseController;
import nurim.jsp.helper.WebHelper;
import nurim.jsp.model.Comment;
import nurim.jsp.model.Member;
import nurim.jsp.service.CommentService;
import nurim.jsp.service.impl.CommentServiceImpl;

@WebServlet("/pay_check_insert.do")
public class pay_checkInsert extends BaseController {
	private static final long serialVersionUID = -9204125148773753885L;

	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	CommentService commentService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		commentService = new CommentServiceImpl(sqlSession, logger);

		/** (3) 파라미터 받기 */
		Member member = (Member) web.getSession("loginInfo");
		String id = member.getUserId();
		String content = web.getString("pay_check");
		String ipAddress = web.getClientIP();

		logger.debug("id >> " + id);
		logger.debug("content >> " + content);
		logger.debug("ipAddress >> " + ipAddress);
		Comment comment = new Comment();
		
		comment.setMemberId(member.getId());
		comment.setUserId(id);
		comment.setContent(content);
		comment.setIpAddress(ipAddress);
		
		Comment item = null;

		try{
			commentService.insertPayCheck(comment);
			item = commentService.selectPayCheck(comment);
			logger.debug("item >> " + item);
		}catch(Exception e){
			logger.debug(e.getLocalizedMessage());
			return null;
		}finally{
			sqlSession.close();
		}
		logger.debug("item >> " + item);
		
		/** (7) 처리 결과를 JSON으로 출력하기 */
		//줄바꿈이나 HTML특수문자에 대한 처리
		// --> import java.util.HashMap;
		// --> import java.util.Map;
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("rt", "OK");
		data.put("item", item);

		// --> import com.fasterxml.jackson.databind.ObjectMapper
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), data);

		web.printJsonRt("OK");

		return null;
	}

}
