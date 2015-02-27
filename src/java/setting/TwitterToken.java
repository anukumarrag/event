/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package setting;

import twitter4j.Twitter;
import twitter4j.TwitterFactory;
import twitter4j.conf.ConfigurationBuilder;

/**
 *
 * @author anurag
 */
public class TwitterToken {
    
    public static Twitter twitterObject(){
        Twitter twitter=null;
        try{
           
            ConfigurationBuilder cb = new ConfigurationBuilder();
cb.setDebugEnabled(true)
  .setOAuthConsumerKey("Kb8ND2PPNcQoJSEdh2pA")
  .setOAuthConsumerSecret("vb1tSs2CRUZQUkfKDRCDAEqO1JUpSvBU7vtW3Al52IY")
  .setOAuthAccessToken("88373110-NaKga9zqHgI3t9gxWxlUQ8od8VakHtHqupLX8BKmS")
  .setOAuthAccessTokenSecret("vKp9xuT3XQWeCZ3VfgnoAeKmtqaBVB7yjpLxZJmAEgdgX");
TwitterFactory tf = new TwitterFactory(cb.build());
twitter = tf.getInstance();
     System.out.println(twitter);  
      
        }
        catch(Exception e){
            System.out.println(e);
        }
       return twitter;
    }
    
    public static TwitterFactory getTwitterFactory(){
        TwitterFactory tf=null;
        try{
           ConfigurationBuilder cb = new ConfigurationBuilder();
cb.setDebugEnabled(true)
  .setOAuthConsumerKey("Kb8ND2PPNcQoJSEdh2pA")
  .setOAuthConsumerSecret("vb1tSs2CRUZQUkfKDRCDAEqO1JUpSvBU7vtW3Al52IY")
  .setOAuthAccessToken("88373110-NaKga9zqHgI3t9gxWxlUQ8od8VakHtHqupLX8BKmS")
  .setOAuthAccessTokenSecret("vKp9xuT3XQWeCZ3VfgnoAeKmtqaBVB7yjpLxZJmAEgdgX");
  tf = new TwitterFactory(cb.build());
        }catch(Exception e){
            System.err.println(" Exception occure in Twitter getTwitterFactory "+e);
        }
return tf;
        
    }
    
    
    
    public static void main(String...a){
        twitterObject();
    }
}
