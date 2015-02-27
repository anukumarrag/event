<%-- 
    Document   : createalbum
    Created on : Apr 10, 2014, 10:40:54 PM
    Author     : anurag
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 
<head>
<title>Create Event</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="css/styleevent.css" rel="stylesheet" type="text/css" media="all"/>
<link rel="stylesheet" type="text/css" href="css/jquery.datetimepicker.css"/>
<link rel="icon" href="images/favicon.jpg" sizes="16x16" type="image/png">
    <style>body{
             
                 
}
            .label{
                line-height: 30px;
                font-weight: 600;
                font-size: large;
                font-family: sans-serif;
                padding-right: 7px;
                color: #081C6B;
               
            }
            #closing_date, #media_type,#team_size {
                padding: 2px;
                font-weight: 500;
                left: 200px;
                width: 100px;
                
            }
            #event_name{
               font-size:14px;
                  color: #081C6B;
                  font-weight: 900;
                  font-family: serif;
                 padding:4px 0px 4px 15px;
                 border:1px solid #d8d8d8;
              
               
                 -webkit-border-radius:3px;-moz-border-radius:3px;border-radius:3px;
                 box-shadow:inset 2px 2px 4px #f1f1f1;
                 width: 10em;
            }
            #myform{
                padding: 10px 50px;
                background-color:#f8f8f8;
                width: 450px;
               
                border-radius:4px;
                position: relative;
                             //  border:   solid thick;
              //  border-image: url('images/shadow.png') repeat;
                /*background: url('images/shadow.png') no-repeat bottom;*/
            }
            
            form{
                margin: auto;
                z-index: 2;
                
            }
            .hashtag{
                font-size:14px;
                  color: #081C6B;
                  font-weight: 900;
                  font-family: serif;
                 padding:3px 0px 3px 25px;
                 border:1px solid #d8d8d8;
              
               background-color: #f1f1f1;
                 -webkit-border-radius:3px;
                 -moz-border-radius:3px;
                 border-radius:3px;
                 box-shadow:inset 2px 2px 4px #f1f1f1;
                background:url(images/hash.png) no-repeat;
            }
            #phone_no{
               font-size:14px;
                  color: #081C6B;
                  font-weight: 900;
                  font-family: serif;
                 padding:3px 0px 3px 29px;
                 border:1px solid #d8d8d8;
               width: 9em;
               background-color: #f1f1f1;
                 -webkit-border-radius:3px;
                 -moz-border-radius:3px;
                 border-radius:3px;
                 box-shadow:inset 2px 2px 4px #f1f1f1;
                background:url(images/mobile.jpg) no-repeat; 
            }
            #datetimepicker2{
             font-size:14px;
                  color: #081C6B;
                  font-weight: 900;
                  font-family: serif;
                 padding:4px 0px 4px 15px;
                 border:1px solid #d8d8d8;
              
               background-color: #f1f1f1;
                 -webkit-border-radius:3px;-moz-border-radius:3px;border-radius:3px;
                 box-shadow:inset 2px 2px 4px #f1f1f1;
                background:url(images/cal.png) no-repeat;
                background-position: right;
                width: 10em;
            }
            #media_type,#team_size{
                 background:url(images/down1.png) no-repeat;
                background-position: right;
                width: 12em;
                padding: 2px;
                border:1px solid #d8d8d8;
            }
            #save{
                
       border:none;
	outline:none;
    -moz-border-radius: 5px;
    -webkit-border-radius: 5px;
    border-radius: 5px;
    color:  #ffffff;
    display: inline-block;
    cursor:pointer;
   width:220px;
    clear:both;
    padding: 5px 20px;
    text-shadow: 0 1px 1px #777;
    font-weight:bold;
    font-family:"Century Gothic", Helvetica, sans-serif;
    font-size:16px;
    -moz-box-shadow:0px 0px 3px #aaa;
    -webkit-box-shadow:0px 0px 3px #aaa;
    box-shadow:0px 0px 3px #aaa;
    background: #8fde62;
    margin-left:auto;
margin-right:auto;
            }  
            
             #save:hover{
              background: #C0C0C0;
    color:#666;
    text-shadow:1px 1px 1px #fff;
   }
   .notes{
       background:  url(img/social.png) no-repeat  ;
       background-size: 80px;
       color:  #f8f8f8;
       font-family: sans-serif;
       font-size:  38px;
       font-weight: 800;
       text-align: center;
       padding-left: 100px;
       z-index: 3;
   }
        </style>
        
        <script type="text/javascript">

 
 function form_test(){
      var event_name=document.getElementById("event_name").value.trim();
      if(event_name==""){
          alert("please provide Event name")
          document.getElementById("event_name").focus();
           return false;
      }
     var event_name=document.getElementById("phone_no").value.trim();
      if(event_name==""){
          alert("please provide Phone No")
          document.getElementById("phone_no").focus();
           return false;
      }
      
    var event_name=document.getElementById("hashtag").value.trim();
      if(event_name==""){
          alert("please provide Hash Tag")
          document.getElementById("hashtag").focus();
           return false;
      }
      
      var event_closing_date=document.getElementById("datetimepicker2").value.trim();
      if(event_closing_date==""){
          alert("please provide Event Date")
          document.getElementById("datetimepicker2").focus();
           return false;
      }
     
 }
 
 
</script>

</head>
<body>
    <%if(session.getAttribute("username")==null)response.sendRedirect("login.jsp"); %>
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
							<li class="active"><a href="createalbum.jsp">Create</a></li>
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
       
       <div class="wrap">

<div class="about_desc" style="position: relative;top: 20px;">
			       
                                       <div class="create" style="width: 100%; margin: auto;">
                                                   <center>
                                                     <div class="clear"></div> 
                     <p style=""> Create your event</p>	  
                                                       
                                                       <span style="margin: auto; alignment-adjust: central">
                   <form name="myform" id="myform" action="savealbum.jsp" method="post">
         
          <table width="400px">
              <tr><td align="right">     <label class="label"> Event Name :</label></td>
                  <td> <input type="text" name="event_name" id="event_name" placeholder="name of Event"/>
                  </td></tr>
              <tr><td align="right">     <label class="label"> Phone No :</label></td>
                  <td> 
               <input type="text" name="phone_no" id="phone_no" placeholder="phone no"/>
                  </td></tr>
            <tr>
                <th align="right"><label class="label"> Hash Tag :</label></th> <td  id="hash_content">
                    <input type='text' name='hashtag' id='hashtag' class='hashtag' required placeholder='eg( srk,PMOindia  ) ' style="width:9em" ><font style="font-size: x-small; color: green; " >only 1 hashtag</font>  
            </td>
              </tr>
              <tr>
              <td align="right">  <label class="label">Event Date :</label></td>
                  
              <td><input name="marriage_date" type="text" placeholder="Date" id="datetimepicker2"/> </td>
              </tr>
              <tr>
                  <th colspan="2"><br/>
                      <input id="save" type="submit" name="save" onclick ="return form_test();" value="Submit Event"/>
                  </th>         
              </tr>
          </table>
          <img src="images/shadow.png" width="100%"/>
            </form>                            
                                                           
                                                           
                                                           
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
    
     
<script src="js/jquery.js"></script>
<script src="js/jquery.datetimepicker.js"></script>

<script>

$('#datetimepicker2').datetimepicker({
	yearOffset:0,
	timepicker:false,
	format:'Y-m-d',
	formatDate:'Y-m-d'
	//minDate:'-1970-01-01', // today is minimum date
	//maxDate:'+1970-01-06' // and day after 6 is maximum date calendar
});

</script>
    
</body>
</html>

