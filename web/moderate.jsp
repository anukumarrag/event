

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
 
<head>
<title>Moderate Album</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="css/styleevent.css" rel="stylesheet" type="text/css" media="all"/>
<link rel="icon" href="images/favicon.jpg" sizes="16x16" type="image/png">

   

</head> 
<body><%if(session.getAttribute("username")==null) response.sendRedirect("login.jsp"); %>
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
		<div class="header-bottom">
		       <div class="menu">
					    <ul>
							<li><a href="index.jsp">Home</a></li>
							<li><a href="createalbum.jsp">Create</a></li>
							<li class="active"><a href="moderate.jsp">Moderate</a></li>
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
       <div class="wrap">
<!--     	    <div class="section group">
				<div class="lsidebar span_1_of_3 offers_list">
				      <h2>What We Offer</h2>
				     		<ul>
		  						<li>Lorem ipsum dolor sit amet Sunt in culpa Duis aute</li>
		  						<li>Lorem ipsum dolor sit amet Sunt in culpa Duis aute</li>
		  						<li>Lorem ipsum dolor sit amet Sunt in culpa Duis aute</li>
		  						<li>Lorem ipsum dolor sit amet Sunt in culpa Duis aute</li>
		  						<li>Lorem ipsum dolor sit amet Sunt in culpa Duis aute</li>
		  						<li>Lorem ipsum dolor sit amet Sunt in culpa Duis aute</li>
		  						<li>Lorem ipsum dolor sit amet Sunt in culpa Duis aute</li>
		  						<li>Lorem ipsum dolor sit amet Sunt in culpa Duis aute</li>
		  						<li>Lorem ipsum dolor sit amet Sunt in culpa Duis aute</li>
		  						<li>Lorem ipsum dolor sit amet Sunt in culpa Duis aute</li>
		  						<li>Lorem ipsum dolor sit amet Sunt in culpa Duis aute</li>
		  					</ul>
						</div>-->
<div class="about_desc" style="position: relative;top: 20px;">
				       <h2>Moderate</h2>
                                       <div class="create" style="width: 100%; margin: auto;">
                                                   <center> <span style="margin: auto; alignment-adjust: central;">
<table   style="width: 100% ; background-color:khaki;  border-radius: 6px; ">
    <tr style="line-height: 35px; background-color: #B5AFAF ">
        <th>Album Name</th><th>Hash Tag</th><th>Marriage Date</th><th> Date of Creation</th>
        <th>Social Media</th>
    </tr>                                             
             <%
             String username=(String)session.getAttribute("username");
             String sql="select * from album where creator_id='"+username+"'";
             Connection con=new setting.Conn().getConnection();
             ResultSet rs=testing.Database.getResultset(sql, con);
            while(rs.next()){
                %>
               
                <tr  style="line-height: 30px;border-bottom:#B5AFAF thin solid ;"><th>  <%=rs.getString("album_name") %></th>
                       <th> <%=rs.getString("hash_tag") %> </th>
                         <th><%=rs.getString("marriage_date") %></th>
                         <th>  <%=rs.getString("event_creation_date")%> </th>
 <th> <a href="./newgallery/moderation.jsp?album_id=<%=rs.getString("album_id") %>&hash_tag=<%=rs.getString("hash_tag") %>" target="_blank">  
         <button> Moderate </button> </a>
         
<!--         <a href="updatemoderate.jsp?album_id=<%=rs.getString("album_id") %>&hash_tag=<%=rs.getString("hash_tag") %>" target="_blank">  
         <button> Edit Moderate </button> </a>-->
<!--                          <img src="../images/facebook.png" height="25px" width="25px"  /> -->
              
               </tr>
                
                                                           <%
            }con.close();
                     %>                                                                  
                     </table>                                 
                                                           
                                               </span></center>
                                     <p style="background: url(images/red_line.png); height: 104px; background-position: center; background-repeat: no-repeat; "></p>

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
    
    
</body>
</html>

