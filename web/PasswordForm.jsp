<%-- 
    Document   : PasswordForm
    Created on : Nov 16, 2013, 1:48:16 AM
    Author     : Anurag
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="shortcut icon" href="images/fevicon1.png"/>
<title>YralUP</title>
  <script src="alert/js/jquery.js"></script>
<script src="alert/js/jquery-ui.js"></script>

<!-- ALERT -->

<link href="alert/css/alert.css" rel="stylesheet" />
<link href="alert/themes/default/theme.css" rel="stylesheet" />
<script src="alert/js/alert.js"></script>



<style>

#header{
	
     background-color:  #181818;
	-webkit-border-top-left-radius:5px;
	-moz-border-radius-topleft:5px;
	border-top-left-radius:5px;
	-webkit-border-top-right-radius:5px;
	-moz-border-radius-topright:5px;
	border-top-right-radius:5px;
	-webkit-border-bottom-right-radius:5px;
	-moz-border-radius-bottomright:5px;
	border-bottom-right-radius:5px;
	-webkit-border-bottom-left-radius:5px;
	-moz-border-radius-bottomleft:5px;
	border-bottom-left-radius:5px;
	text-indent:17px;
	border:1px solid #3362db;
	display:inline-block;
	color:#f7fafa;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	font-style:normal;
	height:65px;
	line-height:33px;
	
	text-decoration:none;
	text-align:center;
}
.bottom{
	font-family:Arial, Helvetica, sans-serif ;
	font-style:normal;
	font-size:16px;
	background-color:#C0C0C0;
}
</style>

<script>
    function submitform(){
            var email=document.getElementById('email').value.trim();
        if(email=="") {
        $.alert.open('info', 'Provide Data', "please  provide email id");
       document.getElementById("email").focus();
     
        }
    else{
        document.getElementById('spinner').style.display='block';
    document.getElementById('myform').submit();
      
        }
    }
</script>
<style>
            
</style>
</head>

<body >
    
<style type="text/css">

body {
	
	background-color: #e9f3fa;
}
</style>
<table width="600" border="0" align="center" cellpadding="0" cellspacing="8" class="size12">
  <tr>
    <td bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="frn_header"><table width="100%" border="0" cellpadding="5" cellspacing="0" class="frn_header_tbl">
          <tr>
            <td width="27%"><table id="header" width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="38%" align="left" nowrap="nowrap">
                    <div style="float:left;"><img src="images/logo.png"  vspace="0"/></div> </td>
                </tr>
            </table></td>
            </tr>
        </table></td>
      </tr>
    </table>
   
   
   
    <form action = "GetPassword.jsp" method="post" name="myform" id="myform">
              	<table id="content" width="100%" border="0" cellpadding="5" cellspacing="0" >
                 
				 <tr>
					<td width="50%" height="15" align="center" class="error" colspan="2">
						
						                        
						
					</td>
				  </tr>
	  
                  <tr>
                    <td align="right"><strong>E-mail Address</strong></td>
                    <td align="left">
                    	<input name="email" required id="email" type="text" size="30" value="" maxlength="50" />
                    </td>
                  </tr>
			        
                  <tr>
                    <td align="right">&nbsp;</td>
                    <td align="left">
                        <input name="recover" type="button" value="Get Password" onclick="return submitform();"/>
                    </td>
                  </tr>
                  <tr>
                    <td colspan="2" align="right">&nbsp;</td>
                  </tr>
                  <tr>
                    <td colspan="2" align="center" class="bottom">
                    	Password Recovery Panel for your Social wedding Album !...
                    </td>
                  </tr>
              </table>

        </form>
   
   
    </td>
  </tr>
</table>
    
    <%
      if(session.getAttribute("recoveryerror")!=null){
          String msg=(String)session.getAttribute("recoveryerror");
          
          %>
      <script>
$.alert.open('error', 'Wrong Authentication', '<%=session.getAttribute("recoveryerror").toString() %>');

</script><%session.setAttribute("recoveryerror", null);} %>
<div id="spinner" style="display: none;"></div>
</body>

</html>
