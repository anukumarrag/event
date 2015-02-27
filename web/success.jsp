<%-- 
    Document   : success
    Created on : Feb 8, 2014, 1:11:28 AM
    Author     : anurag
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Success</title>
    </head>
    <body>
    <center><strong>
        <%
out.print(session.getAttribute("status"));        
        %>
        </strong>
    </center>
    </body>
</html>
