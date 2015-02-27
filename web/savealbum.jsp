<%-- 
    Document   : eventsSave
    Created on : Mar 27, 2014, 1:36:47 PM
    Author     : anurag
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       
        <title>Events Creation</title>
        <style>
            td{
                text-align: right;
                padding-left: 10px;
                    
            } 
            th{
                text-align: left;
            }
            .mytable{
                margin: auto;
                background-color:  #ebeccf;
                padding: 10px 40px;
               border: #ae7c4a;
               border-width: 3px;
               border-collapse:  collapse;
               line-height: 30px;
            }
        </style>
    </head>
    <body>
       <%
       try{
if(session.getAttribute("username")!=null){
   String creater_id=(String)session.getAttribute("username");
   String event_name=request.getParameter("event_name");
   String phone_no=request.getParameter("phone_no");
   String marriage_date=request.getParameter("marriage_date");
   
   String hash_tag=request.getParameter("hashtag");
 
   
   Connection c=new setting.Conn().getConnection();
   ResultSet r=c.createStatement().executeQuery("select count(album_id)+1 as id from album");
   r.next();
   int event_id=r.getInt(1);
   String sql="insert into album (album_id,album_name,phone_no,hash_tag,creator_id,event_creation_date,marriage_date,status) values('"+event_id+"','"+event_name+"','"+phone_no+"','"+hash_tag+"','"+creater_id+"',now(),'"+marriage_date+"','"+null+"');";
   PreparedStatement ps=c.prepareStatement(sql);
   ps.execute();
   response.sendRedirect("moderate.jsp");
   
   try{}catch(Exception e){}
   %>
   
       <%
     }
//   else{
//     session.setAttribute("events_error", "Please provide hash tag for each team");   
//     response.sendRedirect("create.jsp");
//        }     
    
      
else{
   response.sendRedirect("login.jsp");
}
       }
       catch(Exception e){
           e.printStackTrace(response.getWriter());
           out.print(e);
       }
       finally{
          
       }

%>
    </body>
</html>
