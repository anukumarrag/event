
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="X-UA-Compatible" content="IE=9" />
<meta name="viewport" content="initial-scale=1.0"> 
<title>Login to Yralup</title>
<link href="cssg/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="cssg/colorbox.css" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
		<script src="js/jquery.colorbox.js"></script>
                
                <script>
			$(document).ready(function(){
				$(".iframe").colorbox({iframe:true, width:"700px", height:"300px"});
				
				//Example of preserving a JavaScript event for inline calls.
				$("#click").click(function(){ 
					$('#click').css({"background-color":"#f00", "color":"#fff", "cursor":"inherit"}).text("Open this window again and this message will still be here.");
					return false;
				});
			});
		</script>
                
<script>
    
  function formSubmit()
{
    
    if(document.login.name.value!="" && document.login.password.value!="" && document.login.name.value!="Username" && document.login.password.value!="Password")
// alert("hii" + document.login.name.value  + document.login.password.value);  
  document.getElementById("myform").submit();
}   
    
    
</script>

</head>

<body>
    <%if(session.getAttribute("username")!=null)response.sendRedirect("index.jsp"); %>
    
  <br/>
 
 
<!-- Box Start-->
<div id="box_bg">

<div id="content">
	<h1>Sign In</h1>
	
	<!-- Social Buttons -->
<!--	<div class="social">
	Sign in using social network:<br/>
	<div class="twitter"><a href="#" class="btn_1">Login with Twitter</a></div>
	<div class="fb"><a href="#" class="btn_2">Login with Facebook</a></div>
	</div>-->
	
	<!-- Login Fields -->
	<div id="login">
            
            <!--Sign in using your registered account:<br/>-->
            <form  id="myform" name="login" action="loginauthevent" method="post">
            
   <input type="text" name="name" onblur="if(this.value=='')this.value='Username';" onfocus="if(this.value=='Username')this.value='';" value="Username" class="login user"/>
	<input type='text' name="password" value='Password'  onfocus="if(this.value=='' || this.value == 'Password') {this.value='';this.type='password'}"  onblur="if(this.value == '') {this.type='text';this.value=this.defaultValue}" class="login password"/>
	
            </form>
        </div>
	
	<!-- Green Button -->
        <div id="submit" class="button green"><a href="javascript:formSubmit();">Sign In</a></div>

	<!-- Checkbox -->
	<div class="checkbox">
	<li>
	<fieldset>
	<![if !IE | (gte IE 8)]><legend id="title2" class="desc"></legend><![endif]>
	<!--[if lt IE 8]><label id="title2" class="desc"></label><![endif]-->
	<div>
		<span>
		<input id="Field" name="Field" type="checkbox" class="field checkbox" value="First Choice" tabindex="4" onchange="handleInput(this);" />
		<label class="choice" for="Field">Keep me signed in</label>
		</span>
	</div>
	</fieldset>
	</li>
	</div>

</div>
</div>

<!-- Text Under Box -->
<div id="bottom_text">
	Don't have an account? <a href="signup.jsp">Sign Up</a><br/>
	Remind <a class='iframe' href="PasswordForm.jsp">Password</a></p>
</div>

<%
if(session.getAttribute("loginerror")!=null){
 
%>
<div style="margin: auto; width: 600px; height: 50px; background-color:  tomato; font-family:  serif; font-size:  large; color:white; font-weight: bold; text-align: center;"> <%=session.getAttribute("loginerror")%></div>

<%      
 session.setAttribute("loginerror", null);   
}
%>


</body>
</html>
