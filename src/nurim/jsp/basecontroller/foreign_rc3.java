package nurim.jsp.basecontroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import nurim.jsp.helper.BaseController;

/**
 * Servlet implementation class foreign_rc3
 */
@WebServlet("/foreign_rc3.do")
public class foreign_rc3 extends BaseController {
	private static final long serialVersionUID = -4716694491293986884L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		return "foreign_rc3";
	}

}
