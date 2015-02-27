<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<head>
<title>Contact to Social Wedding Album</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="icon" href="images/favicon.jpg" sizes="16x16" type="image/png">
<link href="css/styleevent.css" rel="stylesheet" type="text/css" media="all"/>

    <script>
        
         function form_test(){
      var name=document.getElementById("userName").value.trim();
      if(name==""){
          alert("please provide your Name")
          document.getElementById("userName").focus();
           return false;
      }
     var email=document.getElementById("userEmail").value.trim();
      if(email==""){
          alert("please provide userEmail")
          document.getElementById("userEmail").focus();
           return false;
      }else{
            var reg = /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/
 if (!reg.test(email)){alert("please provide Correct Email")
          document.getElementById("userEmail").focus();
           return false;
       }
 
      }
      
    var msg=document.getElementById("userMsg").value.trim();
      if(msg==""){
          alert("Plese Write your message")
          document.getElementById("userMsg").focus();
           return false;
      }
      
     
     
 }
    </script>

</head>
<body>
	 	<div class="wrap">
	 		<div class="header">
		     <div class="header_top">	    
				 <div class="logo">
                                     <a href="index.jsp" style="text-decoration: none; color: white;">Social Media Events </a>
					 </div>	
					 <div class="dail">
                        <p><img src="images/mobile.png">+91 9871177477
            <%if(session.getAttribute("username")!=null){ %>
             <img src="images/user.png"><%=session.getAttribute("username") %> 
            <%}else{%>
                         <a href="login.jsp" class="login">Login / Signup</a><%}%>
            </p></div>		  
			     <div class="clear"></div>
		    </div>		   
		<!------ Slider ------------>
		 
		<!------End Slider ------------>
		<div class="header-bottom">
		       <div class="menu">
					    <ul>
							<li><a href="index.jsp">Home</a></li>
							<li><a href="createalbum.jsp">Create</a></li>
							<li><a href="moderate.jsp">Moderate</a></li>
							<li><a href="display.jsp">Display</a></li>
							<li class="active"><a href="contact.jsp">Contact</a></li>
                                                        <li>
                   <%if(session.getAttribute("username")!=null){ %>
                   <a href="logout.jsp">
                       <!--<img src="images/logout11.png" height="30px"/>-->
                       <button class="logout">Logout</button>
                   </a>
            <%}%>                                         
                                                        </li>
							<div class="clear"></div>
						</ul>
					</div>
					<div class="social-icons">						
		                <ul>
		                    <li><a class="facebook" href="https://www.facebook.com/Yralup" target="_blank"> </a></li>
		                    <li><a class="twitter" href="https://twitter.com/yralup" target="_blank"></a></li>
		                    <li><a class="googleplus" href="https://plus.google.com/+Yralupyralup/" target="_blank"></a></li>
		                    
		                    <div class="clear"></div>
		                </ul>
		 		    </div>	
		 		   <div class="clear"></div>
		 		</div>
            </div>
          </div>
   			<div class="main">
                 <div class="wrap">	
                 	 <div class="section group contact">
				      <div class="lsidebar span_2_of_3">
				      	<h2>Find Us Here</h2>
				      	  <div class="contact_info">
					    	  <div class="map">
                                                      <object type="text/html" width="100%" height="350" class="borderless" standby="Google map is being loaded" data="https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=106 Tower A Logix Technova Nodia Sec - 132 Nodia - 201301 &amp;aq=&amp;ie=UTF8&amp;hq=&amp;hnear=106 Tower A Logix Technova Nodia Sec - 132 Nodia - 201301 &amp;t=m&amp;z=14&amp;output=embed" title="Yralup"></object>							  </div>
						</div>
					 </div>
					<div class="cont span_1_of_3">
                                            <h3 class="myh2">Contact / Feedback</h3>
				       <div class="contact-form" id="contactform">
                                           <form action="" method="post" name="myform">
					    	<div>
						    	<span><label>NAME</label></span>
                                                        <span><input id="userName" name="userName" type="text" class="textbox"></span>
						    </div>
						    <div>
						    	<span><label>E-MAIL</label></span>
						    	<span><input name="userEmail" id="userEmail" type="text" class="textbox"></span>
						    </div>
						    <div>
						    	<span><label>SUBJECT / Message</label></span>
						    	<span><textarea name="userMsg" id="userMsg"> </textarea></span>
						    </div>
						   <div>
                                                       <span><input type="submit" name="send_query" onclick="return form_test()" class="mybutton" value="Submit"></span>
						  </div>
					    </form>
				  </div>	
		    			 	    
				    </div>				
		   		</div>
   			 </div>
   
   <div class="footer" style="background-color: white">
	<div class="wrap"> <div class="top_strip"> </div>
            <div class="section group" >
				<div class="col_1_of_4 span_1_of_4">
				    <div class="location">
				    	<h3>Location</h3>
				    	<ul>
                                            <li>Social Media Event</li>
				    		 <li>23/21 D, East Patel Nagar,</li>
						  	  <li>New Delhi -110008,</li>
						  	   <li>India.</li>
						 </ul>
				    </div>			
				</div>
				 <div class="col_1_of_4 span_1_of_4">
    <h3>Information</h3>
    <p>Social Media event is way which collect all posts from different social media channels and , you can display it on screen/website  .<br /><span><a href="http://www.yralup.com">Read More[....]</a></span></p>
</div>
				     
						<div class="col_1_of_4 span_1_of_4">
							   <h3>Contact Us</h3>
							       <ul class="address">
								  	 <li><span>Email :</span>info@yralup.com</li>
								  	 <li><span>Mobile 1:</span> +91 9871177477</li>
								  	 <li><span>Mobile 2 :</span>+91 8802339625</li>
								  	
								  </ul>
						  </div>
					  </div>
				</div>
		  <div class="copy-right">
			<div class="wrap">
			 <p class="copy"><span>yralup</span> © All Rights Reseverd</p> <p class="design"> Design by  <a href="http://www.yralup.com">Yralup</a></p>
		      <div class="clear"></div>
		</div>	
	</div>
 </div>
     
     <%
     if(request.getParameterMap().containsKey("send_query")){
         String username=request.getParameter("userName");
         String useremail=request.getParameter("userEmail");
         String usermessage=request.getParameter("userMsg");
         
    
     %>
     <script>
         document.getElementById("contactform").innerHTML="<center><img src='images/thanksc.png'/></center>";
     </script>
     
     <%
         out.flush();
         testing.MailSender.email1("admin@yralup.com", username+"\t Contact from Social Wedding Album", "Name:- "+username+"<br/>Emailid:-"+useremail+"<br/>Message:-"+usermessage);
     }
     %>
     
     
</body>
</html>

