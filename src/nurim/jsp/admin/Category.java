package nurim.jsp.admin;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;



@WebServlet("/category.do")
public class Category extends HttpServlet {
	

	private static final long serialVersionUID = 4502839871848935046L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		
		
		String type = request.getParameter("type");
		List<CategoryItem> list = new ArrayList<CategoryItem>();
		
		
				
		switch(type){
		case "kor":
			list.add(new CategoryItem("0", "-------"));
			list.add(new CategoryItem("1", "k-pop"));
			list.add(new CategoryItem("2", "dance"));
			list.add(new CategoryItem("3", "ost"));
			break;
		case "for":
			list.add(new CategoryItem("0", "-------"));
			list.add(new CategoryItem("4", "pop"));
			list.add(new CategoryItem("5", "Rock"));
			list.add(new CategoryItem("6", "jazz"));
			break;
		case "shapping":
			list.add(new CategoryItem("0", "--------"));
			list.add(new CategoryItem("7", "이어폰"));
			list.add(new CategoryItem("8", "헤드폰"));
			break;
		}
		JSONObject json = new JSONObject();
		json.put("item", list);
		response.getWriter().print(json);
	}

	

}
