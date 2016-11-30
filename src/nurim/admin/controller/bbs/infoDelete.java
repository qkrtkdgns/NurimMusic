package nurim.admin.controller.bbs;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import nurim.jsp.controller.bbs.BBSCommon;
import nurim.jsp.helper.BaseController;
import nurim.jsp.helper.WebHelper;

@WebServlet("/bbs/info_delete.do")
public class infoDelete extends BaseController {
	private static final long serialVersionUID = -8741953463757714757L;
	
	/** (1) 사용하고자 하는 Helper 객체 선언 */
	WebHelper web;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/** (2) 사용하고자 하는 Helper + Service 객체 생성 */
		web = WebHelper.getInstance(request, response);
		
		return "bbs/info_delete";
	}
}
