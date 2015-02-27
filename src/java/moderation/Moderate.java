/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package moderation;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.io.IOUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.json.simple.parser.ParseException;
import setting.Api;
import twitter4j.MediaEntity;
import twitter4j.Query;
import twitter4j.QueryResult;
import twitter4j.Status;
import twitter4j.Twitter;



/**
 *
 * @author anurag
 */
public class Moderate {
 
    String hash;
    String instanext;
    Query twitternext;
    String album_id;

        public Moderate( String hash,String album_id) {
        this.hash=hash;
        this.album_id=album_id;
        
    }
    
    public List getInstapost() throws SQLException{
        List savedpost=getSavedList(album_id);
        List posts=new ArrayList();
        try{
            String access_token=new Api().getInsta_token();
            String tagname=this.hash;
            String url = "https://api.instagram.com/v1/tags/"+tagname+"/media/recent?access_token="+access_token+"&count=50";
            System.out.println(url);
            try {
            String genreJson = IOUtils.toString(new URL(url));
            JSONObject genreJsonObject = (JSONObject) JSONValue.parseWithException(genreJson);
            String data="";
            JSONArray genreArray = (JSONArray) genreJsonObject.get("data");
            JSONObject pagination = (JSONObject) genreJsonObject.get("pagination");
           this.instanext=(String)pagination.get("next_url");
       
           if(genreArray.size()>0)
           {
          for(int i=0;i<genreArray.size();i++){
            JSONObject firstGenre = (JSONObject) genreArray.get(i);
        PostModel post=new PostModel();
        post.setAlbum_id(this.album_id);
            //parameter
                     
             // post_id   
           if(firstGenre.get("id")!=null){
                post.setPost_id(firstGenre.get("id").toString());
           if(savedpost.contains(firstGenre.get("id")))
               post.setStatus("old");
           else  post.setStatus("new");
           }
         //post_creation time    
           if(firstGenre.get("created_time")!=null)
            post.setPost_time(firstGenre.get("created_time").toString());
         // post type  
           if(firstGenre.get("type")!=null)
               post.setType(firstGenre.get("type").toString());
         
           // post link
           
            if(firstGenre.get("link")!=null)
             post.setLink(firstGenre.get("link").toString());
         // sender details name, id, pic 
           
            if(firstGenre.get("user")!=null){
           JSONObject user=(JSONObject) firstGenre.get("user");
           post.setSender_id((String)user.get("id"));
           post.setSender_name((String)user.get("full_name"));
           post.setSender_pic((String)user.get("profile_picture"));
                   
           }
           
           
           //post message
           
           JSONObject caption=(JSONObject) firstGenre.get("caption");
                if(caption!=null)
              post.setCaption_text(URLEncoder.encode((String) caption.get("text"), "UTF-8"));

 
            boolean ispic=false;
             String pic="";
            if(firstGenre.get("type").toString().equalsIgnoreCase("image")){
                ispic=true;
                 JSONObject images=(JSONObject) firstGenre.get("images");
                 if(images!=null){
              JSONObject low_resolution=(JSONObject) images.get("low_resolution");
              JSONObject standard_resolution=(JSONObject) images.get("standard_resolution");
            post.setImage_low((String)low_resolution.get("url"));
            post.setImage_standard((String)standard_resolution.get("url"));
     //  out.println("<br/>original="+post_message+"<br/>encoded="+post_messageencode);
      post.setParam("post_id="+post.getPost_id()+
              "&album_id="+post.getAlbum_id()+
              "&type="+post.getType()+
              "&post_time="+post.getPost_time()+
              "&link="+post.getLink()+
              "&pic_low="+post.getImage_low()+
              "&pic_standard="+post.getImage_standard()+
              "&post_message="+post.getCaption_text()+
              "&sender_name="+post.getSender_name()+
              "&sender_id="+post.getSender_id()+
              "&sender_pic="+post.getSender_pic());
            
          
                       }
                                 }
            
      
            if(ispic==true)
                    posts.add(post);
           }
          
                                   }
           
            }
            catch(IOException | ParseException e){
                System.err.println("Exception occure in getInstapost inner try catch"+e);
            }
            
        }
        catch(Exception e){
            System.err.println("Exception in getinstapost method main try-catch"+e);
        }
        
        
        return posts;
    }
    
    public List getTwitterpost(){
        
        List posts=new ArrayList();
        try{
                List savedpost=getSavedList(album_id);
            String tagname=this.hash;
            Twitter twitter=setting.TwitterToken.twitterObject();
             Query query = new Query(tagname);
             query.setCount(50);
             QueryResult result;
              result = twitter.search(query);
              List<Status> tweets = result.getTweets();
                 for (Status tweet : tweets) {
                     System.out.println("\n\n\n"+tweet);
                    PostModel post=new PostModel();
                    post.setAlbum_id(this.album_id);
                    if(savedpost.contains(tweet.getId()))
                        post.setStatus("old");
                    else
                        post.setStatus("new");
                    post.setPost_id(""+tweet.getId());
                    post.setSender_name(URLEncoder.encode(tweet.getUser().getScreenName(), "UTF-8"));
                    post.setCaption_text(URLEncoder.encode(tweet.getText(), "UTF-8"));
                    post.setSender_pic(tweet.getUser().getProfileImageURL());
                    post.setSender_id(""+tweet.getUser().getId());
                     
                    for (MediaEntity mediaEntity : tweet.getMediaEntities())
                    {
                           post.setImage_standard(mediaEntity.getMediaURL());
                           post.setImage_low(mediaEntity.getMediaURL());
                    }
                    post.setPost_time(tweet.getCreatedAt().toString());
                    post.setType("twitter_post");
                    post.setLink(null);
                    post.setParam("post_id="+post.getPost_id()+
              "&album_id="+post.getAlbum_id()+
              "&type="+post.getType()+
              "&post_time="+post.getPost_time()+
              "&link="+post.getLink()+
              "&pic_low="+post.getImage_low()+
              "&pic_standard="+post.getImage_standard()+
              "&post_message="+post.getCaption_text()+
              "&sender_name="+post.getSender_name()+
              "&sender_id="+post.getSender_id()+
              "&sender_pic="+post.getSender_pic());
                 
                   
                    posts.add(post);
                    
                 }
              this.twitternext=result.nextQuery();
            
        }
        catch(Exception e){
            System.err.println("Exception occure in getTwitter "+e);
        }
        
        return posts;
    }
    
    
    
    public static String getMessage(String s) {
       // String s = "Please go to http://stackoverflow.com and then mailto:oscarreyes@wordpress.com to download a file from    ftp://user:pass@someserver/someFile.txt";
        // separete input by spaces ( URLs don't have spaces )
        String [] parts = s.split("\\s");
        String mys="";
        // Attempt to convert each item into an URL.   
        for( String item : parts ) try {
            URL url = new URL(item);
            // If possible then replace with anchor...
            mys+="<a style=\"\" href=\"" + url + "\" target=\"_blank\">"+ url + "</a> ";    
        
        } catch (MalformedURLException e) {
            // If there was an URL that was not it!...
           mys+=item+" ";
        }

        return mys;
    }
    
    
    
 

    public static List getSavedList(String album_id) throws SQLException {
    
        List saved=new ArrayList();
        String sql="select post_id from albumpost where album_id="+album_id+";";
        ResultSet rs=testing.Database.getResultset(sql, new setting.Conn().getConnection());
        while (rs.next()) 
        {
            saved.add(rs.getString("post_id"));
            
        }
    
        
        
        return saved;
    
    
    
    }
    
       public static void main(String[] args) throws SQLException {
           
           System.out.println(new Moderate("modi", "1").getInstapost());
//       List pm=getSavedList("1");
//           System.out.println(" test for 6922154403942777sds4s33955 = "+pm.contains("6922154403942ds77714_14533955"));
//       Iterator i=pm.iterator();
//        while (i.hasNext()) {
//            System.out.println("post id= "+((PostModel)i.next()).getPost_id());
//            
//        }
    }
    
    
}
