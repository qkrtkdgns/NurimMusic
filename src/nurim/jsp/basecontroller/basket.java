package nurim.jsp.basecontroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import nurim.jsp.helper.BaseController;

@WebServlet("/basket.do")
public class basket extends BaseController {
	private static final long serialVersionUID = 7468989066003412212L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		return "basket";
	}
       
    

}