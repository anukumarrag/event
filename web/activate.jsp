<%-- 
    Document   : activate
    Created on : Feb 10, 2014, 12:48:39 AM
    Author     : anurag
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account activation</title>
    </head>
    <body>
        <%

      String email=request.getParameter("username");
       try{
           Connection c=new setting.Conn().getConnection();
           Statement s=c.createStatement();
           
           String sql="update login set status=1 where email='"+email+"'";
          s.executeUpdate(sql);
        response.sendRedirect("login.jsp");
             // session.setAttribute("status", "Account activation details are sent to your mail ( "+email+" ). Please activate your account ");
               
               
  String messageText=" <html><head><meta http-equiv='Content-Type' content='text/html; charset=utf-8' /></head><body><div style='border-width:5px; padding:10px; border-style:groove; border-radius:4px; max-width:619px ;margin:auto;'>"
 + "Hello Admin a user has activate Social Stream from username="+email+"</div></body></html>";
                 
  testing.MailSender.email1("anukumarrag@gmail.com", "Account has for Social Media Event ", messageText);
          
       }
       catch(Exception e){
           out.print(e.getMessage());
            session.setAttribute("status", "An Error occure please contact to provider "+e);
//               response.sendRedirect("error.jsp");
          
       }
       %>   
    </body>
</html>
