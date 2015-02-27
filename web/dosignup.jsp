<%-- 
    Document   : dosignup
    Created on : Feb 6, 2014, 11:25:56 PM
    Author     : anurag
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign up processing</title>
    </head>
    <body>
        <%

       
       String name=request.getParameter("name");
       String tel=request.getParameter("tel");
      String email=request.getParameter("email");
       String password=request.getParameter("password");
       String acceptTerms=request.getParameter("acceptTerms");
       String type="";
       out.print(name+"--"+tel+"--"+email+"---"+password+"---"+acceptTerms);
       try{
           Connection c=new setting.Conn().getConnection();
           Statement s=c.createStatement();
            String checkemail="select count(email) as email from login where email='"+email+"';";
          ResultSet rs=s.executeQuery(checkemail);
          rs.next();
          if(Integer.parseInt(rs.getString("email"))>0){
          session.setAttribute("notification", email+" is already register ");
           response.sendRedirect("signup.jsp");
          }
                   else{
           String sql="insert into login (name,email,phone,password,type,join_date,status) values('"+name+"','"+email+"',"+tel+",'"+password+"','"+type+"',now(),0);";
          s.execute(sql);
        
              session.setAttribute("loginerror", "Account activation details are sent to your mail ( "+email+" ). Please activate your account ");
               response.sendRedirect("login.jsp");
               
  String messageText=" <html><head><meta http-equiv='Content-Type' content='text/html; charset=utf-8' /></head><body><div style='border-width:2px; border-style:groove; border-radius:4px; max-width:619px ;margin:auto;'><table width='600' border='0' align='center' cellpadding='0' cellspacing='0' bgcolor='#FFFFFF'> <tbody><tr> <td> <table style='width:100%'> <tbody><tr> <td style='width:100%' align='center'> <img alt='' border='0' src='http://app.yralup.com/banner/logoheader.jpg' ></td> </tr> <tr> <td bgcolor='#3333FF' style='height:1px'> </td> </tr> <tr> <td style='height:15px;text-align:center'> <b style='color:#bc343e'>Welcome to Yralup </b></td> </tr> <tr> <td style='font-family:Verdana,Arial,Helvetica,sans-serif;font-size:11px;line-height:14px;font-style:normal;color:#3a4650;text-decoration:none'> <table width='100%'> <tbody><tr> <td></td> </tr> <tr> <td> <strong> Welcome "
 + name
 + ",</strong> <br> <br> Thank You for your registration on Yralup.<br><br> Your registration has been confirmed .<br> To activate your account click on the link below.<br><br>"
 + " <a href='http://app.yralup.com/activate.jsp?username="+email+"' style='font-weight:bold' target='_blank'>Click here to <span class='il'>activate</span> your account</a><br><br> <strong>LoginId: &nbsp;&nbsp;</strong>"
 + email
 + "<br> <strong>Phone: &nbsp;</strong>"
 +tel
 + "<br> <strong>Password: &nbsp;</strong>"
  + password
 + "<br> <br> <br>Thank You. <br> <br> *If you are facing any issue with this website,please email us on <b style='font-weight:bold'><a href='mailto:contact@yralup.com' target='_blank'>contact@yralup.com</a></b> (preferably with screenshots). </td> </tr> <tr> <td>&nbsp;</td> </tr> </tbody></table> </td> </tr> <tr> <td style='font-family:Verdana,Arial,Helvetica,sans-serif;font-size:11px;line-height:14px;font-style:normal;color:#3a4650;text-decoration:none'> </td> </tr> <tr> <td style='font-family:Verdana,Arial,Helvetica,sans-serif;font-size:11px;line-height:14px;font-style:normal;color:#3a4650;text-decoration:none'>&nbsp; </td> </tr> <tr> <td valign='top' bgcolor='#034a2c'> <table align='center' cellpadding='0' cellspacing='0' border='0' style='height:15px;width:99%'> <tbody><tr> <td height='15' style='font-size:11px;color:#ffffff;font-family:Arial,Verdana,Sans-Serif;text-align:center' bgcolor='#3366FF'> Copyright <strong>Ad Technosys Pvt Ltd</strong>. All Rights Reserved. </td> </tr> </tbody></table> </td> </tr> </tbody></table> </td> </tr> </tbody></table></div></body></html>";
                 
  testing.MailSender.email1(email, "Account Activation for Social Media Event ", messageText);
   String admintext=" <html><head><meta http-equiv='Content-Type' content='text/html; charset=utf-8' /></head><body><div style='border-width:2px; border-style:groove; border-radius:4px; max-width:619px ;margin:auto;'><table width='600' border='0' align='center' cellpadding='0' cellspacing='0' bgcolor='#FFFFFF'> <tbody><tr> <td> <table style='width:100%'> <tbody><tr> <td style='width:100%' align='center'> <img alt='' border='0' src='http://app.yralup.com/banner/logoheader.jpg' ></td> </tr> <tr> <td bgcolor='#3333FF' style='height:1px'> </td> </tr> <tr> <td style='height:15px;text-align:center'> <b style='color:#bc343e'>Welcome to Yralup </b></td> </tr> <tr> <td style='font-family:Verdana,Arial,Helvetica,sans-serif;font-size:11px;line-height:14px;font-style:normal;color:#3a4650;text-decoration:none'> <table width='100%'> <tbody><tr> <td></td> </tr> <tr> <td> <strong> Welcome "
 + name
 + ",</strong> <br> <br> Thank You for your registration on Social Media Event.<br><br> Your registration has been confirmed .<br> To Validate your account click on the link below.<br><br>"
 + " <br><br> <strong>LoginId: &nbsp;&nbsp;</strong>"
 + email
 + "<br> <strong>Phone: &nbsp;</strong>"
 +tel
 + "<br> <br> <br>Thank You. <br> <br> *If you are facing any issue with this website,please email us on <b style='font-weight:bold'><a href='mailto:contact@yralup.com' target='_blank'>contact@yralup.com</a></b> (preferably with screenshots). </td> </tr> <tr> <td>&nbsp;</td> </tr> </tbody></table> </td> </tr> <tr> <td style='font-family:Verdana,Arial,Helvetica,sans-serif;font-size:11px;line-height:14px;font-style:normal;color:#3a4650;text-decoration:none'> </td> </tr> <tr> <td style='font-family:Verdana,Arial,Helvetica,sans-serif;font-size:11px;line-height:14px;font-style:normal;color:#3a4650;text-decoration:none'>&nbsp; </td> </tr> <tr> <td valign='top' bgcolor='#034a2c'> <table align='center' cellpadding='0' cellspacing='0' border='0' style='height:15px;width:99%'> <tbody><tr> <td height='15' style='font-size:11px;color:#ffffff;font-family:Arial,Verdana,Sans-Serif;text-align:center' bgcolor='#3366FF'> Copyright <strong>Ad Technosys Pvt Ltd</strong>. All Rights Reserved. </td> </tr> </tbody></table> </td> </tr> </tbody></table> </td> </tr> </tbody></table></div></body></html>";
  testing.MailSender.email1("anukumarrag@gmail.com", "Account Activation for Social Media Event ", admintext);
          
          } 
          c.close();
       }
       catch(Exception e){
           out.print(e.getMessage());
            session.setAttribute("status", "An Error occure please contact to provider <br/>"+e);
               response.sendRedirect("success.jsp");
          
       }
       %>        


    </body>
</html>
