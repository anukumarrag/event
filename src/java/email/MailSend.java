/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package email;

import com.sun.mail.smtp.SMTPTransport;
import java.util.Date;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author anurag
 * 
 * 
 */
public class MailSend {
    public static String email2_previous(String to,String subject,String messageText ){
    try
        {
             GetProperty api=new GetProperty();
final String username=api.getUser();
             final String password=api.getPassword();
String host = api.getSmtp();  
String from=api.getFrom();   
    
Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", api.getPort());
 
		Session session = Session.getInstance(props,
		  new javax.mail.Authenticator() {
                        @Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		  });
 
Message msg = new MimeMessage(session);
try{
msg.setFrom(new InternetAddress(from,"Victoria Club Hotel"));
InternetAddress[] address = {new InternetAddress(to)};

msg.setRecipients(Message.RecipientType.TO, address);
msg.setSubject(subject);
msg.setSentDate(new Date()); 
  msg.setContent(messageText,"text/html" );  
Transport.send(msg);
return "message send Successfully "+ to+ messageText+subject;
    }
catch(Exception exc){
return "Message sending failed  1"+exc + to+ messageText+subject;
}
}

        catch(Exception e)
        {
return "Message sending failed  2"+e+ to+ messageText+subject;
    }
        }
    
    
     public static String email2(String email,String subject, String mymsg){
        String status="";
        try{
        GetProperty api=new GetProperty();
        Properties props = System.getProperties();
        props.put("mail.smtps.host",api.getSmtp());
        props.put("mail.smtps.auth","true"); 
        props.put("mail.smtp.port",api.getPort());
        Session session = Session.getInstance(props, null);
        Message msg = new MimeMessage(session);
        msg.setFrom(new InternetAddress(api.getFrom()));
        msg.setRecipients(Message.RecipientType.TO,InternetAddress.parse(email, false));
      
        msg.setSubject(subject);
        msg.setContent(mymsg, "text/html; charset=utf-8");
        
        msg.setSentDate(new Date());
        SMTPTransport t =(SMTPTransport)session.getTransport("smtps");
        t.connect(api.getSmtp(), api.getUser(), api.getPassword());
        t.sendMessage(msg, msg.getAllRecipients());
        System.out.println("Response: " + t.getLastServerResponse());
        status=t.getLastServerResponse();
        t.close();
        
        
        }
        catch(MessagingException e){
            
        }
    
        return status;
}
    
    
    
     
}
