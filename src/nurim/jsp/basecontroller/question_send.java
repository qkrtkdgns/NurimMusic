package nurim.jsp.basecontroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import nurim.jsp.helper.BaseController;

@WebServlet("/question_send.do")
public class question_send extends BaseController {
	private static final long serialVersionUID = -747722669601984536L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		return "question_send";
	} 
	
       
    
}
