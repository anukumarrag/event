<%-- 
    Document   : index
    Created on : Apr 9, 2014, 12:07:56 PM
    Author     : anurag
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<head>
<title>Home Page</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
<link href="css/slider.css" rel="stylesheet" type="text/css" media="all"/>
<script type="text/javascript" src="js/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="js/jquery.nivo.slider.js"></script>
<link rel="icon" href="images/favicon.jpg" sizes="16x16" type="image/png">
<script type="text/javascript">
    $(window).load(function() {
        $('#slider').nivoSlider();
    });
    
    
    
    </script>
    
 

</head>
<body>
	 	<div class="wrap">
	 		<div class="header">
		     <div class="header_top">	    
				 <div class="logo">
                                     <a href="index.jsp"><img src="images/logo.png"  alt="" /></a>
					 </div>	
					 <div class="dail">
                        <p><img src="images/mobile.png">+91 9871177477</p>
            <%if(session.getAttribute("username")!=null){ %>
            <p ><img src="images/user.png"><%=session.getAttribute("username") %></p>
            <%}else{%>
                        <p><a href="login.jsp" class="login">Login / Signup</a><%}%>
					</div>		  
			     <div class="clear"></div>
		    </div>		   
		<!------ Slider ------------>
		  <div class="slider">
	      	<div class="slider-wrapper theme-default">
	            <div id="slider" class="nivoSlider">
	                <img src="images/1.jpg" data-thumb="images/1.jpg" alt="" />
                        <img src="images/2.jpg" data-thumb="images/2.jpg" alt="" />
                        <img src="images/3.jpg" data-thumb="images/3.jpg" alt="" />
                        <img src="images/4.jpg" data-thumb="images/4.jpg" alt="" />
                        <img src="images/5.jpg" data-thumb="images/5.jpg" alt="" />
                        <img src="images/1.jpg" data-thumb="images/1.jpg" alt="" />
                        <img src="images/2.jpg" data-thumb="images/2.jpg" alt="" />
                        <img src="images/3.jpg" data-thumb="images/3.jpg" alt="" />
                        <img src="images/4.jpg" data-thumb="images/4.jpg" alt="" />

	                
	            </div>
	        </div>
   		</div>
		<!------End Slider ------------>
		<div class="header-bottom">
		       <div class="menu">
					    <ul>
							<li class="active"><a href="index.jsp">Home</a></li>
							<li><a href="createalbum.jsp">Create</a></li>
							<li><a href="moderate.jsp">Moderate</a></li>
							<li><a href="display.jsp">Display</a></li>
							<li><a href="contact.jsp">Contact</a></li>
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
		                    <li><a class="facebook" href="https://www.facebook.com/socialweddingalbum" target="_blank"> </a></li>
		                    <li><a class="twitter" href="https://twitter.com/socialweddingal" target="_blank"></a></li>
		                    <li><a class="googleplus" href="https://plus.google.com/u/0/103437660612386680154/about" target="_blank"></a></li>
		                    
		                    
		                </ul>
		 		    </div>	
		 		   <div class="clear"></div>
		 		</div>
            </div>
          </div>
   <div class="main">
   	<div class="desc-info">
       <div class="wrap">
     	<div class="section group">
				<div class="lsidebar span_1_of_3">
				      <h3><span>Welcome</span></h3>
				      <h3>Social Wedding Album, where you can make your wedding album from social media channel</h3>
					  
				</div>
					<div class="cont span_2_of_3">
				       <div class="section group example">
							<div class="col_1_of_2 span_1_of_2">
							<div class="icon">
								<img src="images/list-img.png">
							</div>
							  <div class="heading">
							   <h3><a href="createalbum.jsp">Create Album</a></h3>
							   <p>Create your wedding Album using a Hash Tag.Using that hash tag it will collect your wedding Photo from different Social Media Channel</p>
			 				   </div>
			 				   <div class="clear"></div>
			 				</div>
							<div class="col_1_of_2 span_1_of_2">
							<div class="icon">
								<img src="images/list-img.png">
							</div>
							  <div class="heading">
							   <h3><a href="moderate.jsp">Moderate Album</a></h3>
							   <p>In Moderation you can select photos which you want to display inn your wedding Album.</p>
			 				   </div>
			 				   <div class="clear"></div>
			 				</div>
		    			</div>	
		    			 <div class="section group example">
							<div class="col_1_of_2 span_1_of_2">
							<div class="icon">
								<img src="images/list-img.png">
							</div>
							  <div class="heading">
							   <h3><a href="display.jsp">Display Album</a></h3>
							   <p>After Moderation all moderated Photos will be displayed in your album</p>
			 				   </div>
			 				   <div class="clear"></div>
			 				</div>
<!--							<div class="col_1_of_2 span_1_of_2">
							<div class="icon">
								<img src="images/list-img.png">
							</div>
							  <div class="heading">
							   <h3><a href="#">Lorem ipsum dolor</a></h3>
							   <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
			 				   </div>
			 				   <div class="clear"></div>
			 				</div>-->
		    			</div>			    
				    </div>				
		   		</div>
		  </div>
    </div>
       <p style="background: url(images/red_line.png); height: 104px; background-position: center; background-repeat: no-repeat; "></p>
<!--    <div class="content-grids">
    	<div class="top_strip"> </div>
   	 <div class="wrap">
   	 	<div class="section group">
				<div class="grid_1_of_3 images_1_of_3">
					<div class="grid_icon"><img src="images/g1.png"></div>
					  <h3>our profile</h3>
					  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
				     <div class="button"><span><a href="#">Read More</a></span></div>
				</div>
				<div class="grid_1_of_3 images_1_of_3">
					  <div class="grid_icon"><img src="images/g2.png"></div>
					  <h3>Care advices</h3>
					  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
				     <div class="button"><span><a href="#">Read More</a></span></div>
				</div>
				<div class="grid_1_of_3 images_1_of_3">
					  <div class="grid_icon"><img src="images/g3.png"></div>
					  <h3>Tips & Advices</h3>
					  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
				     <div class="button"><span><a href="#">Read More</a></span></div>
				</div>
			</div>
  		 </div>
  		 <div class="botton_strip"> </div>
  	  </div>-->
   </div>
                                                       
<div class="footer" style="background-color: white">
	<div class="wrap"> <div class="top_strip"> </div>
            <div class="section group" >
				<div class="col_1_of_4 span_1_of_4">
				    <div class="location">
				    	<h3>Location</h3>
				    	<ul>
                                            <li>Social wedding Album</li>
				    		 <li>23/21 D, East Patel Nagar,</li>
						  	  <li>New Delhi -110008,</li>
						  	   <li>India.</li>
						 </ul>
				    </div>			
				</div>
				 <div class="col_1_of_4 span_1_of_4">
    <h3>Information</h3>
    <p>Social Media Album is way which collect all wishes of your friend from different social media channels and , you can display it as a live wishing wall in your marriage ceremony .<br /><span><a href="http://www.socialweddingalbum.com">Read More[....]</a></span></p>
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
			 <p class="copy"><span>Social Wedding Album</span> © All Rights Reseverd</p> <p class="design"> Design by  <a href="http://www.yralup.com">Yralup</a></p>
		      <div class="clear"></div>
		</div>	
	</div>
 </div>
</body>
</html>

