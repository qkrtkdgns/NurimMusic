package nurim.jsp.basecontroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import nurim.jsp.helper.BaseController;

@WebServlet("/LoginPage.do")
public class LoginPage extends BaseController {
	private static final long serialVersionUID = -5584735248867070809L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		return "LoginPage";
	}

}
