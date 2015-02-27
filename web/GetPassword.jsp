<%-- 
    Document   : GetPassword
    Created on : Nov 16, 2013, 1:50:34 AM
    Author     : Anurag
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recovery</title>
             <script src="alert/js/jquery.js"></script>
<script src="alert/js/jquery-ui.js"></script>

<!-- ALERT -->


    </head>
    <body>
        <%
        String email=request.getParameter("email");
        String name="";
       String username="";
        String pass="";
        String msg="";
        String emailstatus="";
       boolean err=false;
       String errmsg="Sorry";
       String sql="SELECT name,email,password FROM login where email='"+email+"' ;";
       Connection c=new setting.Conn().getConnection();
       Statement s=c.createStatement();
       ResultSet rs=s.executeQuery(sql);
       rs.last();
       int row=rs.getRow();
       rs.beforeFirst();
       if(row==0)
       {
           session.setAttribute("recoveryerror", "Not registered with this Email   ");
           response.sendRedirect("PasswordForm.jsp");
       }
       else{
       if(row>0){
           rs.next();
       
        username=rs.getString("email");
        pass=rs.getString("password");
        name=rs.getString("name");
      //  out.print(hotelid+"\n"+username+"\n"+pass+"\n"+email);
     
    msg="<table border=\"0px\" style=\"background: url(http://app.yralup.com/banner/logoheader.jpg) no-repeat; width: 583px; height: 269px; position: absolute; left: 317px; top: 15px;\"><tr><td height=\"40px\"></td></tr><tr><td>"
       +"<table width=\"90%\" align=\"center\" border=\"1\" style=\"border-collapse:collapse \">"
           + "    <tr>      <th scope=\"col\">Attrbute</th>      <th scope=\"col\">Value</th></tr>"
            + "    <tr>      <td>Name</td>      <td>"+name+"</td>  </tr>"
           + "    <tr>      <td>UserName</td>      <td>"+username+"</td>    </tr>"
           + "    <tr>      <td>Password</td>      <td>"+pass+"</td>    </tr>"
           + "      </table></td></tr></table>";
     
       }
      
       try{
        emailstatus= testing.MailSender.email(email, "login Detail", msg); 
    //    out.print(emailstatus);
        c.close();
        %>
        
<img src="images/check-email.jpg" height="280px"/>
<%
    // response.sendRedirect("Login.jsp"); 
       
       }
       catch(Exception e){
        out.print(e);
       }
       }
        %>
        
    </body>
</html>
