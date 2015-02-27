<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%

int newcount=0;
try{
    String album_id=request.getParameter("album_id");
    String count1=(String)session.getAttribute(album_id);
    int count=Integer.parseInt(count1);

    Connection con=new setting.Conn().getConnection();
    Statement s=con.createStatement();
    String sql="select * from albumdata where album_id='"+album_id+"'";
    ResultSet rs=s.executeQuery(sql);
    ResultSetMetaData metaData = rs.getMetaData();
    rs.last();
  newcount=rs.getRow();
  session.setAttribute(album_id,""+newcount);
  rs.beforeFirst();
    if(newcount>count){
        
          String sql1="select * from albumdata where post_id in (select post_id from albumpost where album_id='"+album_id+"')";
           rs=testing.Database.getResultset(sql1, con);
          for(int i=0;i<count;i++){
              rs.next();
                           }
        //  count = metaData.getColumnCount(); //number of column
        // application.setAttribute(album_id,""+count);
            String data="";
           String post_message="";
           String link="";
           String picture="";
           String sender_pic="";
           String sender_name="";
             String pic="";
          while(rs.next()){  
              link=rs.getString("link");
              picture=rs.getString("image_low");
              post_message=rs.getString("caption_text");
              sender_pic=rs.getString("sender_pic");
              sender_name=rs.getString("sender_name");
              String post_messagedecode=URLDecoder.decode(post_message, "UTF-8");
               String img="";
              String typeclass="instagram";
              if(rs.getString("type").equalsIgnoreCase("twitter_post"))
                  typeclass="twitter";
              if(null!=picture && !picture.equals("null"))
                  img="<img src=\""+picture+"\" alt=\""+rs.getString("post_id")+"\"/>";
               pic="<span class='pic1'><a target='_blank' href='"+link+"'><img class='pic' src='"+picture+"' /></a></span>";
             data+="<li><figure>"+
                        img+
			"<figcaption class=\""+typeclass+"\">"+
                       "<!--<h3>Letterpress asymmetrical</h3>-->"
                       + "<p>"+post_messagedecode+"</p>"
                       + " <p class=\"sender\"><span style=\"float: left;  display: inline; vertical-align: middle;\">"
                       + "<img src=\""+sender_pic+"\" style=\"width: 40px; height: 40px; border-radius: 20px;\"/>"+
                     "</span>"+
                       "<span style=\"display: inline-block; padding: 8px;\">  "+sender_name+"</span> </p>"+
                        "</figcaption>"
                       + "</figure></li>";
//          data+="<div class='plan'>"+pic+"<div class='msgdiv'><span class='message'>"+post_messagedecode+"</span>"
// + "</div><div id='usermain'><div id='userpic'>"+
//    "<img src='"+sender_pic+"' class='sender_pic' style='border-radius:4px;' />"+
//    "</div><div id='username'>"
//     +sender_name+"</div></div></div>";   
           
      out.print(data);                
            
               }
        
        
      
//out.print(session.getAttribute("count")); 
        
    }
   else{
    // out.println("no change"+album_id);
   //   out.print(session.getAttribute("count")); 
   }
    con.close();
}
catch(Exception e){
    out.print(e);
}

%>
