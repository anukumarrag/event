/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package email;
 /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
 
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 *
 * @author anurag
 */
public class GetProperty {
    private String apiurl;
    private String apikey;
     private String from;
     private String smtp,user,password,port;

    public String getPort() {
        return port;
    }
     private String bcc,replyto;
     

    public String getReplyto() {
        return replyto;
    }
     

    public String getSmtp() {
        return smtp;
    }

    public String getUser() {
        return user;
    }

    public String getPassword() {
        return password;
    }

    public String getBcc() {
        return bcc;
    }
     
     
    
    
     public GetProperty() {
         try{
         Properties prop = new Properties();
        String propFileName = "email/mailsetting.properties";
 
        InputStream inputStream =getClass().getClassLoader().getResourceAsStream(propFileName);
        prop.load(inputStream);
        if (inputStream == null) {
            System.err.println(" inputstream is null");
            throw new FileNotFoundException("property file '" + propFileName + "' not found in the classpath");
        }
        this.apiurl=prop.getProperty("apiurl");
        this.apikey=prop.getProperty("apikey");
        this.from=prop.getProperty("from", "Victoria club Hotel  <info@victoriaclubhotel.info>");
        this.smtp=prop.getProperty("smtp");
        this.user=prop.getProperty("user");
        this.password=prop.getProperty("password");
        this.bcc=prop.getProperty("bcc");
         this.replyto=prop.getProperty("replyto");
         this.port=prop.getProperty("port");
        }
        catch(IOException e){
            System.out.println("exception ="+e);    
//             e.printStackTrace();
        }
     }

    public String getFrom() {
        return from;
    }

  

    public String getApiurl() {
        return apiurl;
    }

    public String getApikey() {
        return apikey;
    }
    
       public static void main(String[] args) {
        
         GetProperty dba=new GetProperty();
         System.out.println(dba.getApiurl());
          System.out.println(dba.getApikey());
    }
}
