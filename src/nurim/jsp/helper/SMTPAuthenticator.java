package nurim.jsp.helper;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class SMTPAuthenticator extends Authenticator{
	
	public PasswordAuthentication getPasswordAuthentication(){
	return new PasswordAuthentication("qkrtkdgns29@gmail.com","db26452242");

	}
}
