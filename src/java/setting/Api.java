
package setting;

import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.Properties;


public class Api {
    private String access_token;
    private String token_date;
    private String insta_token;

    public String getInsta_token() {
        return insta_token;
    }

    public Api() {
         try{
         Properties prop = new Properties();
        String propFileName = "setting/keysetting.properties";
 
        InputStream inputStream =getClass().getClassLoader().getResourceAsStream(propFileName);
        prop.load(inputStream);
        if (inputStream == null) {
            System.err.println(" inputstream is null");
            throw new FileNotFoundException("property file '" + propFileName + "' not found in the classpath");
        }
       access_token=prop.getProperty("access_token");
       token_date=prop.getProperty("token_date");
       insta_token=prop.getProperty("insta_access_token");
     
        }
        catch(Exception e){
            e.printStackTrace();
            System.out.println("exception ="+e);            
        }
        
    }
   
    public String getAccess_token() {
     
        return access_token;
       
    }

    

    public String getToken_date() {
        return token_date;
    }

   
    public static void main(String[] args) {
        Api a=new Api();
        System.out.println(a.getAccess_token());
        System.out.println(a.getToken_date());
    }
}
