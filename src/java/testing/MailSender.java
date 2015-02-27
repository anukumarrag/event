package testing;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Anurag
 */
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
public class MailSender {
    
    public static String email(String to,String subject,String messageText ){
    try
        {
            final String username="admin@yralup.com";
             final String password="Diatm08@11";
String host = "mail.yralup.com";  // For gmail hosting
String from="info@yralup.com";  // write your email address means from email address.
    
Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "false");
		props.put("mail.smtp.host", "mail.yralup.com");
		props.put("mail.smtp.port", "26");
 
		Session session = Session.getInstance(props,
		  new javax.mail.Authenticator() {
                        @Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		  });
 

 
Message msg = new MimeMessage(session);
try{
msg.setFrom(new InternetAddress(from," Yralup Social media Hub"));
InternetAddress[] address = {new InternetAddress(to)};

msg.setRecipients(Message.RecipientType.TO, address);
msg.setSubject(subject);
msg.setSentDate(new Date());
msg.setText(messageText);
  msg.setContent(messageText,"text/html" );  
 
 
Transport.send(msg);

return "message send Successfully";
    }
catch(Exception exc){
return "Message sending failed  1"+exc;
}
}

        catch(Exception e)
        {
return "Message sending failed  2"+e;
    }
        }
    
    
       public static String email1(String to,String subject,String messageText ){
    try
        {
final String username="admin@yralup.com";
             final String password="Diatm08@11";
String host = "mail.yralup.com";  // For gmail hosting
String from="info@yralup.com";  // write your email address means from email address.
    
Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "false");
		props.put("mail.smtp.host", "mail.yralup.com");
		props.put("mail.smtp.port", "26");
 
		Session session = Session.getInstance(props,
		  new javax.mail.Authenticator() {
                        @Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		  });
 
Message msg = new MimeMessage(session);
try{
msg.setFrom(new InternetAddress(from," Social Media Event"));
InternetAddress[] address = {new InternetAddress(to)};

msg.setRecipients(Message.RecipientType.TO, address);
msg.setSubject(subject);
msg.setSentDate(new Date());
msg.setText(messageText);
  msg.setContent(messageText,"text/html" );  
Transport.send(msg);
return "message send Successfully";
    }
catch(Exception exc){
return "Message sending failed  1"+exc;
}
}

        catch(Exception e)
        {
return "Message sending failed  2"+e;
    }
        }
       
 public static void main(String...a){
    System.out.println( email1("admin@yralup.com","test","hiii"));
 }  

   

}
