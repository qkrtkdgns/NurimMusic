package nurim.jsp.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import nurim.jsp.helper.BaseController;

@WebServlet("/admin/index.do")
public class Index extends BaseController{
	private static final long serialVersionUID = 4987486982590752313L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//"WEB-INF/views/index.jsp"파일을 View로 사용한다.
		// "/WEB-INF/views/view/index.jsp"파일을 View로 사용한다.
		return "admin/index";
	}

}
