<%-- 
    Document   : test1
    Created on : Feb 25, 2014, 1:55:10 PM
    Author     : anurag
--%>

<%@page import="java.net.URLEncoder"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="org.apache.commons.codec.binary.Base64"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

       <%
       
request.setCharacterEncoding("utf-8");   /*  this must be inserted here for encoding itf-8 (another language )*/
String post_message=request.getParameter("post_message");
String album_id=(String)request.getParameter("album_id");

String post_messagedecode=URLDecoder.decode(post_message, "UTF-8");
String post_messageencode = URLEncoder.encode(post_message, "UTF-8");
String user_id=(String)session.getAttribute("username");

String post_id=request.getParameter("post_id");
String type=request.getParameter("type");
String link=request.getParameter("link");
String image_low=request.getParameter("pic_low");
String image_standard=request.getParameter("pic_standard");
String caption_text=post_messageencode;
String post_time=request.getParameter("post_time");
String sender_name=request.getParameter("sender_name");
String sender_id=request.getParameter("sender_id");
String sender_pic=request.getParameter("sender_pic");
String control_date="";
try{
    boolean isnew=false;
    int insert_status=0;
    boolean update_status=false;
    Connection c=new setting.Conn().getConnection();
    Statement s=c.createStatement();
    String sql1test = "select count(*) as total from albumpost where user_id='"+user_id+"' and post_id='"+post_id+"'";
    String sql1="";
    String sql1insert="";
    ResultSet rs=s.executeQuery(sql1test);
    if(rs.next()){
        if(rs.getInt("total")==0){
            out.print("New Data");
            isnew=true;
           }
    
    if(isnew==true){
       sql1="insert into albumpost(album_id,user_id,post_id,control_time) values('"+album_id+"','"+user_id+"','"+post_id+"',now()); ";
       sql1insert="insert into albumdata(album_id,post_id,type,link,image_low,image_standard,caption_text,post_time,sender_name,sender_id,sender_pic,control_date) values"
 + "('"+album_id+"','"+post_id+"','"+type+"','"+link+"','"+image_low+"','"+image_standard+"','"+caption_text+"','"+post_time+"','"+sender_name+"','"+sender_id+"','"+sender_pic+"',now())";
      insert_status=testing.Database.doInsert(sql1, c);
      if(insert_status==1)
          insert_status=testing.Database.doInsert(sql1insert, c);
    out.print("\n Save Successfully");
    }
               else{
        sql1insert="update albumdata set sender_name='"+sender_name+"',sender_pic='"+sender_pic+"' where post_id='"+post_id+"'";
      insert_status=testing.Database.doUpdate(sql1insert, c);
            out.print("Data has updated");
               }
        
               }
c.close();
}catch(Exception e){
    
    out.println(e);
}
       %>
    