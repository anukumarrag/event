<%-- 
    Document   : instapanel_more
    Created on : Apr 8, 2014, 11:30:30 AM
    Author     : anurag
--%>

<%@page import="java.net.URL"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONValue"%>
<%@page import="org.apache.commons.io.IOUtils"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>more instapanel</title>
    </head>
    <body>
       <%
    
         String url=(String)session.getAttribute("more_instapanel");
          String album_id=(String)session.getAttribute("album_id");
           try {
            String genreJson = IOUtils.toString(new URL(url));
            JSONObject genreJsonObject = (JSONObject) JSONValue.parseWithException(genreJson);
            String data="";
            JSONArray genreArray = (JSONArray) genreJsonObject.get("data");
            JSONObject pagination = (JSONObject) genreJsonObject.get("pagination");
           String next=(String)pagination.get("next_url");
         session.setAttribute("more_instapanel", next);
            // get the first genre
            if(genreArray.size()==0)
             data="<div style='padding:50px; background-color=grey;color:white'> Tagname Not Found</div>";
                      else
                      { 
          for(int i=0;i<genreArray.size();i++){
            JSONObject firstGenre = (JSONObject) genreArray.get(i);
        
            //parameter
            String param="";
                     
             // post_id   
           String post_id="";
           if(firstGenre.get("id")!=null)
           post_id=firstGenre.get("id").toString();
      
         //post_creation time      
           String create_time="";
           if(firstGenre.get("created_time")!=null)
           create_time=firstGenre.get("created_time").toString();
          
         // post type  
           String type="";
           if(firstGenre.get("type")!=null)
           type=firstGenre.get("type").toString();
         
           // post link
           String link="";
            if(firstGenre.get("link")!=null)
           link=firstGenre.get("link").toString();
           
         // sender details name, id, pic 
           String sender_name="";
           String sender_id="";
           String sender_pic="";
            if(firstGenre.get("user")!=null){
           JSONObject user=(JSONObject) firstGenre.get("user");
           sender_name=(String)user.get("full_name");
           sender_id=(String)user.get("id");
           sender_pic=(String)user.get("profile_picture");
                    
           }
           
           
           //post message
           String post_message="";
           
           JSONObject caption=(JSONObject) firstGenre.get("caption");
                if(caption!=null)
              post_message=(String) caption.get("text");
              


           String pic_low="";
           String pic_standard="";
            boolean ispic=false;
             String pic="";
            if(firstGenre.get("type").toString().equalsIgnoreCase("image")){
                ispic=true;
                 JSONObject images=(JSONObject) firstGenre.get("images");
                 if(images!=null){
              JSONObject low_resolution=(JSONObject) images.get("low_resolution");
              JSONObject standard_resolution=(JSONObject) images.get("standard_resolution");
            
           pic_low=(String)low_resolution.get("url");
           pic_standard=(String)standard_resolution.get("url");
         
        String control_date=new java.util.Date().toString();
    
       String post_messageencode = URLEncoder.encode(post_message, "UTF-8");
     //  out.println("<br/>original="+post_message+"<br/>encoded="+post_messageencode);
      param="post_id="+post_id+
              "&album_id="+album_id+
              "&type="+type+
              "&post_time="+create_time+
              "&link="+link+
              "&pic_low="+pic_low+
              "&pic_standard="+pic_standard+
              "&post_message="+post_messageencode+
              "&sender_name="+sender_name+
              "&sender_id="+sender_id+
              "&sender_pic="+sender_pic+
              "&control_date="+control_date;  
              
      
           
            pic="<span class='pic'><a target='_blank' href='"+link+"'><img class='pic' src='"+pic_low+"' /></a>"
 + "<div class='actionbutton'>"
 + "<input type='button' id='"+post_id+"' onclick=\"return submitForm('"+param+"')\" value='ok'/> "
 + "</div></span>";
                       }
                                 }
            
      
            if(ispic==true)
          data+="<div class='plan'>"+pic+"<div class='msgdiv'><span class='message'>"+post_message+"</span>"
 + "</div></div>";   
           }
            
            out.print(data);
                      }
        
            
           }catch(Exception ee){
                
           }
      
   
    %>
    
    </body>
</html>
