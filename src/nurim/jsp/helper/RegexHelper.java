package nurim.jsp.helper;

import java.util.regex.Pattern;

public class RegexHelper {

private static RegexHelper current = null;
	
	public static RegexHelper getInstance(){
		if(current==null){
			current=new RegexHelper();
		}
		return current;
	}
	
	public static void freeInstance(){
		current = null;
	}
	
	private RegexHelper(){
		super();
	}
	
	public boolean isValue(String str){
		boolean result = false;
		if(str != null){
			result =!str.trim().equals("");
					
		}
		return result;
	}
	
	
	
	public boolean isNum(String str){
		boolean result = false;
		if(isValue(str)){
			result= Pattern.matches("^[0-9]*S", str);
		}
		
		return result;
	}
	
	public boolean isEng(String str){
		boolean result = false;
		if(isValue(str)){
			result= Pattern.matches("^[a-zA-Z]*$", str);
		}
		
		return result;
	}
	
	
	public boolean isKor(String str){
		boolean result = false;
		if(isValue(str)){
			result= Pattern.matches("^[ㄱ-ㅎ가-힣]*$", str);
		}
		
		return result;
	}
	
	public boolean isEngNum(String str){
		boolean result = false;
		if(isValue(str)){
			result= Pattern.matches("^[a-zA-Z0-9]*$", str);
		}
		
		return result;
	}
	
	public boolean isKorNum(String str){
		boolean result = false;
		if(isValue(str)){
			result= Pattern.matches("^[ㄱ-ㅎ가-힣0-9]*$", str);
		}
		
		return result;
	}
	
	public boolean isEmail(String str){
		boolean result = false;
		if(isValue(str)){
			result= Pattern.matches("^[_a-zA-Z0-9-\\.]+@[\\.a-zA-Z0-9-]+\\.[a-zA-Z]+$", str);
		}
		
		return result;
	}
	
	public boolean isCellPhone(String str){
		boolean result = false;
		if(isValue(str)){
			result= Pattern.matches("^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$", str);
		}
		
		return result;
	}
	
	public boolean isTel(String str){
		boolean result = false;
		if(isValue(str)){
			result= Pattern.matches
					("^\\d{2,3}\\d{3,4}\\d{4}$", str);
		}
		
		return result;
	}
	
	public boolean isJumin(String str){
		boolean result = false;
		if(isValue(str)){
			result= Pattern.matches
					("^\\d{6}[1-4]\\d{6}", str);
		}
		
		return result;
	}
	
}
