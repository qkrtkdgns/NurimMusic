package nurim.jsp.helper;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * Servlet implementation class BaseController
 */
@WebServlet("/BaseController")
public abstract class BaseController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       public Logger logger = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BaseController() {
    	String className = this.getClass().getName();
    	System.out.println(className+"실행");
        
    	logger = LogManager.getLogger(className);
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.pageInit(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.pageInit(request, response);
	}

	/**
	 * Get , Post 방식에 상관없이 공통 처리되는 메서드
	 */
	private void pageInit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		//페이지 형식 지정
		response.setContentType("text/html; charset=utf-8");
		//파라미터 처리 형식을 지정
		request.setCharacterEncoding("utf-8");
		
		//현재 URL을 획득해서 로그에 출력
		String url = request.getRequestURI().toString();
		if(request.getQueryString() != null){
			url = url +"?"+request.getQueryString();
		}
		//get인지 ,post 방식인지 조사
		String methodName =request.getMethod();
		
		logger.info("["+methodName+"]"+url);
		
		//view의 이름을 얻기위해 메서드 호출
		String view= doRun(request, response);
		
		//획득한 view가 있을경우 화면 표시
		if(view != null ){
			//view 생성
			view = "/WEB-INF/views/"+view+".jsp";
			logger.info("[View]"+view);
			
			//RequestDispatcher는 현재의 요청을 다른 서블릿으로 보내는 인터페이스

			RequestDispatcher dispatcher = request.getRequestDispatcher(view);
			dispatcher.forward(request, response);
		}
	}
	public abstract String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
}
