package nurim.jsp.helper;

import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailHelper {
	private static MailHelper current;
	public static MailHelper getInstance(){
		if(current==null){
			current=new MailHelper();
		}
		return current;
	}
	
	public static void freeInstance(){
		current = null;
	}
	private MailHelper(){
		super();
	}
	
	public void sendMail(String sender, String receiver, String subject, String content)
		throws MessagingException{
		
		Properties p =new Properties();
		
		p.put("mail.smtp.user", "qkrtkdgns29@gmail.com");
		
		p.put("mail.smtp.host", "smtp.gmail.com");
		p.put("mail.smtp.port", "465");
		
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class",  "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");
	
		Authenticator auth =new SMTPAuthenticator();
		
		Session ses = Session.getInstance(p,auth);
		
		ses.setDebug(true);
		
		
		MimeMessage msg =new MimeMessage(ses);
		
		msg.setSubject(subject);
		
		Address fromAddr =new InternetAddress(sender);
		msg.setFrom(fromAddr);
		
		Address toAddr =new InternetAddress(receiver);
		msg.addRecipient(Message.RecipientType.TO, toAddr);
	
		msg.setContent(content, "text/html;charset=UTF-8");
		
		Transport.send(msg);
	}
}
