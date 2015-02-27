<%-- 
    Document   : logout
    Created on : Mar 3, 2014, 12:23:32 AM
    Author     : anurag
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thanks</title>
    </head>
    <body>
        <%
   session.invalidate();
response.sendRedirect("index.jsp");          
%>
    </body>
</html>
