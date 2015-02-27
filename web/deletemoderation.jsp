<%-- 
    Document   : test1
    Created on : Feb 25, 2014, 1:55:10 PM
    Author     : anurag
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

       <%
       
 String album_id=(String)request.getParameter("album_id");
 
String post_id=request.getParameter("post_id");
 Connection c=null;
try{
    
     c=new setting.Conn().getConnection();
     c.setAutoCommit(false);
    Statement s=c.createStatement();
     
    String sql1="delete from albumdata where  post_id='"+post_id+"' and album_id='"+album_id+"' ;";
    String sql2="delete from albumpost where  post_id='"+post_id+"' and album_id='"+album_id+"' ;";
    s.executeUpdate(sql1);
     s.executeUpdate(sql2);
      c.commit();
   out.print("updated");
}catch(Exception e){
    
    out.println(e);
}
finally{
    if(null!=c)
        c.close();
}
       %>
    