<%-- 
    Document   : jsonjava
    Created on : Feb 6, 2014, 1:51:06 AM
    Author     : anurag
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="org.json.simple.parser.ParseException"%>
<%@page import="java.io.IOException"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONValue"%>
<%@page import="org.apache.commons.io.IOUtils"%>
<%@page import="java.net.URL"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Instagram Moderation</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
<link rel="icon" href="images/favicon.jpg" sizes="16x16" type="image/png">
        <script src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script src='js/masonry.js'></script><script src='js/classie.js'></script>

        <style> 
	 a{
           text-decoration:  white wavy;
       }
	
	body{
	font-family: 'Helvetica Neue','Helvetica','?????? Pro W3','Hiragino Kaku Gothic Pro','????','Meiryo','?? ?????',arial,sans-serif;
	
	}
	
        
        #main-table {
           
            //width: 1200px;
            width:100%;
            max-height:550px;
            padding-left: 10px;
         }
        
	.plan ,.pic {
            min-width: 223px;/*180px;  plan width = 180 + 20 + 20 + 1 + 1 = 222px */      
	    max-width:223px;
        }
      
       .message{
           color: whitesmoke;
       }
       .plan{
           background: #005387; 
       }
		
	#main-table {
                overflow-y:hidden;
                overflow-x: hidden;
                /*background-color:grey;*/
                text-align: center;
                /*border-radius: 7px;*/
                /*border:  #000000 solid 15px ;*/
                display:inline-block;
	}

	.plan {  
		border: 1px solid #ddd;
		float: left;
		position: relative;
	}
	
        #main-table:hover{
           overflow-y: scroll; 
        }
	
	
	
	/* --------------- */

	
	.plan	{
		
             border-radius:4px 4px 4px 4px;
             margin:7px 0px 0px 7px;
            -webkit-box-shadow: 0 5px 9px -6px black;
	   -moz-box-shadow: 0 5px 9px -6px black;
	     box-shadow: 0 5px 9px -6px black;
  
/*                -webkit-box-shadow: .5px .5px 2px .5px #050505;
box-shadow: .5px .5px 2px .5px #050505;*/

	}
	
	
	
	
	.pic	{
	 border-radius:4px 4px 0 0;
	 display: block;
    text-decoration: none;
    border-style: none;
	
	   	}
               
	 .message{
             
     -webkit-margin-before: 1em;
-webkit-margin-after: 1em;
-webkit-margin-start: 0px;
-webkit-margin-end: 0px;
-webkit-font-smoothing: antialiased;
-moz-osx-font-smoothing: grayscale;
font-size: 13px;
line-height: 17px;
word-wrap: break-word;

text-align: center;

}	 
.msgdiv{
    padding: 7px;
    text-align: justify;
}	 
.actionbutton{
    position: absolute;
    top: 0px;
    right: 0px;
   
}  
.hash{           font-size:12px;
                  color: #f1f1f1;
                  font-weight: 900;
                  font-family: serif;
                 padding:3px 0px 3px 25px;
           
                 border:1px solid #d8d8d8;
               width: 130px;
               background-color: #f1f1f1;
                 -webkit-border-radius:3px;-moz-border-radius:3px;border-radius:3px;
                 box-shadow:inset 2px 2px 4px #f1f1f1;
                background:url(images/hash.png) no-repeat;
                padding-left: 30px;
            }
 


    </style>
    <script src="alert/js/jquery.js"></script>
<script src="alert/js/jquery-ui.js"></script>

<!-- ALERT -->

<link href="alert/css/alert.css" rel="stylesheet" />
<link href="alert/themes/default/theme.css" rel="stylesheet" />
<script src="alert/js/alert.js"></script>
       <script>
            function submitForm(param) {
               
           
    var http;
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
   
 http=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
     
 http=new ActiveXObject("Microsoft.XMLHTTP");
  }
    http.open("POST", "test1.jsp", false);
    http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    http.setRequestHeader("Content-length", param.length);
   http.setRequestHeader("Connection", "close");
http.send(param);
     $.alert.open('success', 'Save Successful', http.responseText);
       
           false;
    }
 

        </script> 
   
 
    </head>
    
 
    <body><%if(session.getAttribute("username")==null)response.sendRedirect("login.jsp"); %>
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
       <%    
         
out.print(
 "<div id='loading' style='z-index:98768;margin: auto; position: absolute; left: 50%; top: 50%; width: 107px; height: 79px; margin-left:-50px; margin-top:-40px'>"+
"<center>"+
        "  <img src=\"image/retrive.gif\" />"+
"</center></div>"
 );
  out.flush();
%> 
        
        <%
    
        String tagname=request.getParameter("hash_tag");
        String album_id=request.getParameter("album_id");
        String username=(String)session.getAttribute("username");
        String sql="select count(*) from album where creator_id='"+username+"' and album_id='"+album_id+"' and hash_tag='"+tagname+"'";
        Connection con=new setting.Conn().getConnection();
        ResultSet rs=testing.Database.getResultset(sql, con);
        rs.next();
        if(rs.getInt(1)==0){
        %>
        <script>
            
          $.alert.open('error', 'Album Not Exit', "Album Not exits");   
        </script>
        <%
        }else{
        session.setAttribute("album_id", album_id);
       if(request.getParameterMap().containsKey("hash_tag"))
           tagname=request.getParameter("hash_tag");
   
 String access_token=(String)application.getAttribute("instaaccess_token");      
 String url = "https://api.instagram.com/v1/tags/"+tagname+"/media/recent?access_token="+access_token;
           try {
            String genreJson = IOUtils.toString(new URL(url));
            JSONObject genreJsonObject = (JSONObject) JSONValue.parseWithException(genreJson);
            String data="";
            JSONArray genreArray = (JSONArray) genreJsonObject.get("data");
            JSONObject pagination = (JSONObject) genreJsonObject.get("pagination");
           String next=(String)pagination.get("next_url");
          session.setAttribute("more_instapanel",next);
            // get the first genre
            if(genreArray.size()==0)
             data="<div style='padding:50px; background-color=grey;color:white'> Tagname Not Found</div>";
                      else
                      { 
          for(int i=0;i<genreArray.size();i++){
            JSONObject firstGenre = (JSONObject) genreArray.get(i);
        
            //parameter
            String param="";
                     
             // post_id   
           String post_id="";
           if(firstGenre.get("id")!=null)
           post_id=firstGenre.get("id").toString();
      
         //post_creation time      
           String create_time="";
           if(firstGenre.get("created_time")!=null)
           create_time=firstGenre.get("created_time").toString();
          
         // post type  
           String type="";
           if(firstGenre.get("type")!=null)
           type=firstGenre.get("type").toString();
         
           // post link
           String link="";
            if(firstGenre.get("link")!=null)
           link=firstGenre.get("link").toString();
           
         // sender details name, id, pic 
           String sender_name="";
           String sender_id="";
           String sender_pic="";
            if(firstGenre.get("user")!=null){
           JSONObject user=(JSONObject) firstGenre.get("user");
           sender_name=(String)user.get("full_name");
           sender_id=(String)user.get("id");
           sender_pic=(String)user.get("profile_picture");
                    
           }
           
           
           //post message
           String post_message="";
           
           JSONObject caption=(JSONObject) firstGenre.get("caption");
                if(caption!=null)
              post_message=(String) caption.get("text");
              


           String pic_low="";
           String pic_standard="";
            boolean ispic=false;
             String pic="";
            if(firstGenre.get("type").toString().equalsIgnoreCase("image")){
                ispic=true;
                 JSONObject images=(JSONObject) firstGenre.get("images");
                 if(images!=null){
              JSONObject low_resolution=(JSONObject) images.get("low_resolution");
              JSONObject standard_resolution=(JSONObject) images.get("standard_resolution");
            
           pic_low=(String)low_resolution.get("url");
           pic_standard=(String)standard_resolution.get("url");
         
        String control_date=new java.util.Date().toString();
    
       String post_messageencode = URLEncoder.encode(post_message, "UTF-8");
     //  out.println("<br/>original="+post_message+"<br/>encoded="+post_messageencode);
      param="post_id="+post_id+
              "&album_id="+album_id+
              "&type="+type+
              "&post_time="+create_time+
              "&link="+link+
              "&pic_low="+pic_low+
              "&pic_standard="+pic_standard+
              "&post_message="+post_messageencode+
              "&sender_name="+sender_name+
              "&sender_id="+sender_id+
              "&sender_pic="+sender_pic+
              "&control_date="+control_date;  
              
      
           
            pic="<span class='pic'><a target='_blank' href='"+link+"'><img class='pic' src='"+pic_low+"' /></a>"
 + "<div class='actionbutton'>"
 + "<input type='button' id='"+post_id+"' onclick=\"return submitForm('"+param+"')\" value='ok'/> "
 + "</div></span>";
                       }
                                 }
            
      
            if(ispic==true)
          data+="<div class='item'><div class='plan'>"+pic+"<div class='msgdiv'><span class='message'>"+post_message+"</span>"
 + "</div></div></div>";   
           }
          
                                   }
            %>
         
   <div class="wrap"> <center> <div id="main-table" class="masonry"  onMouseOver="pauseDiv()" onMouseOut="resumeDiv()" >
<!--    <center><img src="Social/image/wait.gif"/></center>-->
<%=data%>
        </div>
      
    </center>
   </div>
   
        <%
        }
        
        catch (Exception e) {
          //  e.printStackTrace(response.getWriter());
            out.print("<div style='padding:50px; background-color=grey;color:white'> Tagname Not Found</div>");
        }
    
        }


%>


<script>
 
    
function checkimage(){  
    
var $images = $('img')
, imageCount = $images.length
, counter = 0;

// one instead of on, because it need only fire once per image
$images.one("load",function(){

     // increment counter everytime an image finishes loading
     counter++;
   
     if (counter == imageCount) {

         // do stuff when all have loaded  ,  here i am calling a function which will adjust div and auto scroll 
         imageloaded();   
     } 
}).each(function () {
    if (this.complete) {

        // manually trigger load event in
        // event of a cache pull
        $(this).trigger("load");
    }
});

}
// it is for image adjust image block and scroll div after all image load
function imageloaded(){

//alert("from imageloaded");

adjustdiv();
document.getElementById("loading").style.display = "none";
//document.getElementById("main-table").style.width = "1200px";


}

function adjustdiv(){
  //alert("adjust div");s
  docReady( function() {

  var container = document.querySelector(".masonry");
  var msnry = new Masonry( container, {
    columnWidth: 5
  });


});
	 
  }
  
  checkimage();

//window.onerror = function(msg, url, linenumber) {
//    alert('Error message: '+msg+'\nURL: '+url+'\nLine Number: '+linenumber);
//    return true;
//}

function moredata(){
        
    var http;
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
   
 http=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
     
 http=new ActiveXObject("Microsoft.XMLHTTP");
  }
    http.open("POST", "instapanel_more.jsp", false);
    http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
     http.setRequestHeader("Connection", "close");
http.send();
     
        //alert(http.responseText);
      
      $('#main-table').append(http.responseText).fadeIn(1000);;
      adjustdiv();
       checkimage();
      return false;
}

</script>
<center><form name="myform" action="instapanel.jsp" method="post" style=" border-radius: 5px; padding: 5px; background-color: #743115 ; width: 400px;">
<!--        HashTag:-<input type="text" name="tagname" class="hash" placeholder="tag name"  value="<%=tagname%>" />
                   <input type="submit" value="OK" name="ok" style="padding: 5px 15px; border:  springgreen; border-radius: 9px;  margin-left: 10px">
                   -->
       <button value="" name="more" id="more" onclick="return moredata();" style="padding: 5px ; width: 300px; ">More Data</button>
        
    </form>
                   
</center>
                                                         
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
