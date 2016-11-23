package nurim.jsp.helper;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class WebHelper {

	
	private static WebHelper current;
	
	public static WebHelper getInstance(HttpServletRequest request, HttpServletResponse  response ){
		if(current==null){
			current=new WebHelper();
		}
		current.init(request, response);
		return current;
	}
	
	public static void freeInstance(){
		current = null;
	}
	private WebHelper(){
		super();
	}
	
	private static final String DOMAIN = "localhost";
	
	private HttpServletRequest request;
	
	private HttpServletResponse  response;
	
	private PrintWriter out;
	
	private HttpSession session;
	
	public void init(HttpServletRequest request, HttpServletResponse response){
		this.request = request;
		this.response=response;
	
		this.session = request.getSession();
		
		this.session.setMaxInactiveInterval(60*60*24);
	
	try{
		this.request.setCharacterEncoding("utf-8");
		this.response.setCharacterEncoding("utf-8");
		
		this.out= response.getWriter();
	}catch(Exception e){
		e.printStackTrace();
	}
}
	
	
	public String getString(String fieldName, String defaultValue){
		String result = defaultValue;
		
		String param = this.request.getParameter(fieldName);
		
		if(param !=null){
			param=param.trim();
			if(!param.equals("")){
				result=param;
			}
		}
		return result;
	}
	
	public int getInt(String fieldName, int defaultValue){
		int result= defaultValue;
		String param =this.getString(fieldName, null);
	
	
	try{
		result = Integer.parseInt(param);
	}catch(NumberFormatException e){
		e.printStackTrace();
	}
	return result;
	}
	
	public String[] getStringArray(String fieldName, String[] defaultValue){
		
		String[] result = defaultValue;
		
		String[] param = this.request.getParameterValues(fieldName);
		
		if(param !=null){
			if(param.length>0){
				result=param;
			}
		}
		return result;
	}
	
	
	

	public String getString(String fieldName){
		return this.getString(fieldName,null);
	}
	
	public int getInt(String fieldName){
	return this.getInt(fieldName,0);
	}
	
	public String[] getStringArray(String fieldName){
		return this.getStringArray(fieldName,null);
	}
	
	
	
	public void redirect(String url, String msg){
		String html ="<!doctype html>";
		html += "<html>";
		html +="<head>";
		html +="<meta charset='utf-8'>";
		
		if(msg !=null){
			html+="<script type='text/javascript'>alert('" +msg+ "');</script>";
		}
		
		if(url !=null){
			html += "<meta http-equiv='refresh' content='0; url=" +url+ "'/>";
		}else{
			html +="<script type='text/javascript'>history.back();</script>";
		}
		
		
		
		html += "</head>";
	    html += "<body></body>";
	    html += "</html>";
		
	    out.print(html);
	}
	
	public void setCookie(String key, String value, int timeout){
		try{
			value = URLEncoder.encode(value,"utf-8");
			
		}catch(UnsupportedEncodingException e){
			e.printStackTrace();
		}
		
		Cookie cookie =new Cookie(key,value);
		cookie.setPath("/");
		cookie.setDomain(DOMAIN);
		
		if(timeout>-1){
			cookie.setMaxAge(timeout);
		}
		this.response.addCookie(cookie);
	}
	public String getCookie(String key, String defaultValue){
		String result  = defaultValue;
		
		Cookie[] cookies = this.request.getCookies();
		
		if(cookies !=null){
			for(int i =0; i<cookies.length; i++){
				String cookieName = cookies[i].getName();
				if(cookieName.equals(key)){
					result = cookies[i].getValue();
				try{
					result = URLDecoder.decode(result,"utf-8");
						}catch(UnsupportedEncodingException e){
							e.printStackTrace();
				}
				break;
				}//end if
			}//end for
		}//end if
		
		return result;
	}
	
	public String getCookie(String key){
		return this.getCookie(key,null);
	}
	
	public void removeCookie(String key){
		this.setCookie(key, null, 0);
	}
	
	
	public void setSession(String key, Object value){
		this.session.setAttribute(key, value);
	}
	
	public Object getSession(String key, Object defaultValue){
		Object value = this.session.getAttribute(key);
		
		if(value==null){
			value =defaultValue;
		}
		return value;
	}
	
	public Object getSession(String key){
		return this.getSession(key,null);
	}
	
	
	public void removeSession(String key){
		this.session.removeAttribute(key);
	}
	
	public void removeAllSession(){
		this.session.invalidate();
	}
	
	
	//현재 프로젝트의 최상위 경로값을 "/프로젝트명" 형식으로 리턴한다.
	public String getRootPath(){
		return this.request.getContextPath();
	}
	
	public String getClientIP(){
		String ip = request.getHeader("X-FORWARDED-FOR");
		if(ip == null || ip.length() ==0){
			ip = request.getHeader("Proxy-Client-IP");
		}
		if(ip == null || ip.length() ==0){
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if(ip == null || ip.length() ==0){
			ip = request.getRemoteAddr();
		}
		return ip;
	}
}
