package nurim.jsp.helper;

public class Util {
	
private static Util current = null;
	
	public static Util getInstance(){
		if(current==null){
			current=new Util();
		}
		return current;
	}
	
	public static void freeInstance(){
		current = null;
	}
	
	private Util(){
		super();
	}
	
	/**
	 * 범위를 갖는 랜덤값을 생성하여 리턴하는 메서드
	 * @param min - 범위 안에서의 최소값
	 * @param max - 범위 안에서의 최대값
	 * @return min~max 안에서의 랜덤값
	 * */
	public int random(int min, int max){
		int num = (int)((Math.random()*(max-min+1))+min);
		return num;
	}
	
	/**
	 * 랜덤한 비밀번호를 생성하여 리턴한다.
	 * @return String
	 * */
	
	public String getRandomPassword(){
		String password ="";
		
		String words = "ABCDEFGHIJKMNOPQRSTUVWXYZabcdefghijklmnopqrtuvwxyz1234567890";
		
		int words_len = words.length();
		
		for(int i=0; i < 8; i++){
			int random = random(0, words_len -1);
			String c =words.substring(random, random+1);
			
			password += c;
		}
		return password;
	}
}
