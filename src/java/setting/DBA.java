/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package setting;

import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.Properties;

/**
 *
 * @author anurag
 */
public class DBA {
    private String db;
    private String un;
    private String up;
    private String url;

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
    
     public DBA() {
         try{
         Properties prop = new Properties();
        String propFileName = "setting/keysetting.properties";
 
        InputStream inputStream =getClass().getClassLoader().getResourceAsStream(propFileName);
        prop.load(inputStream);
        if (inputStream == null) {
            System.err.println(" inputstream is null");
            throw new FileNotFoundException("property file '" + propFileName + "' not found in the classpath");
        }
       this.db=prop.getProperty("db");
       this.un=prop.getProperty("un");
       this.up=prop.getProperty("up");
       this.url=prop.getProperty("url");
     
        }
        catch(Exception e){
            e.printStackTrace();
            System.out.println("exception ="+e);            
        }
     }

    public String getDb() {
        return db;
    }

    public String getUn() {
        return un;
    }

    public String getUp() {
        return up;
    }
     
    
}
