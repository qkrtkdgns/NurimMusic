package nurim.jsp.helper;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class SMTPAuthenticator extends Authenticator{
	
	@Override
    public PasswordAuthentication getPasswordAuthentication() {
		// 자신의 Gmail 메일 주소와 비밀번호 입력.
        return new PasswordAuthentication("alsEh05@gmail.com", "grpzltsycyzgidbl");
    }
}
