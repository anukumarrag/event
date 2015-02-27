<%-- 
    Document   : jsonjava
    Created on : Feb 6, 2014, 1:51:06 AM
    Author     : anurag
--%>

<%@page import="java.net.URLDecoder"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.json.simple.parser.ParseException"%>
<%@page import="java.io.IOException"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONValue"%>
<%@page import="org.apache.commons.io.IOUtils"%>
<%@page import="java.net.URL"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
<!DOCTYPE html>
<html>
       <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Wedding Album</title>
        <script src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script src='js/masonry.js'></script><script src='js/classie.js'></script>
<link rel="icon" href="images/favicon.jpg" sizes="16x16" type="image/png">
<link rel="stylesheet" href="css/colorbox.css" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
		<script src="js/jquery.colorbox.js"></script>

        <style> 
	 a{
           text-decoration:  white wavy;
       }
	
	body{
	font-family: 'Helvetica Neue','Helvetica','?????? Pro W3','Hiragino Kaku Gothic Pro','????','Meiryo','?? ?????',arial,sans-serif;
	
        background-image: url(images/background.jpg);
	}
	
        
        #main-table {
           
           width: 1060px;
            max-height:640px;
            margin-top: 0px;
          
         }
        
	.plan ,.pic {
            min-width: 251px;/*180px;  plan width = 180 + 20 + 20 + 1 + 1 = 222px */      
	    max-width:251px;
        }
      
       .message{
           color: whitesmoke;
       }
       .plan{
           background: #FC7868; 
       }
		
	#main-table {
                overflow-y:hidden;
                overflow-x: hidden;
              
                text-align: center;
                border-radius: 7px;
               
                display:inline-block;
	}

	.plan {  
		border: 1px solid #ddd;
		float: left;
		position: relative;
	}
	
        #main-table:hover{
           /*overflow-y: scroll;*/ 
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
  

 
#usermain{
	position: relative; 
        width: 251px;
        height: 44px;
        margin-top:15px;
        overflow-y: hidden;
	 border-radius: 0 0 4px 4px;
         background: #1f2024;
         background: rgba(0,0,0,.8); /* Old browsers */
 
}

#userpic{
	
	position: absolute; width: 41px; height: 34px; left: 11px; top: 6px;
	
}

#username{
 font-family:'Helvetica Neue','Helvetica','?????? Pro W3','Hiragino Kaku Gothic Pro','????','Meiryo','?? ?????',arial,sans-serif;
 font-size: 14px;
position: relative;
 width: 130px;
 height: 27px; 
 left: 55px;
  top: 10px;
  color: #878787;
  float: left;
  font-weight: bold;
 	text-decoration:  none;
        text-decoration-color:  #8b8b8b;
	cursor: pointer;
}
 

.sender_pic{
    width: 43px;
    height: 36px;
}
 


    </style>
    
    
    
    </head>
    <body>
       <% 
       request.setCharacterEncoding("utf-8");      
out.print(
 "<div id='loading' style='z-index:98768;margin: auto; position: absolute; left: 50%; top: 50%; width: 107px; height: 79px; margin-left:-50px; margin-top:-40px'>"+
"<center>"+
        "  <img src=\"image/retrive.gif\" />"+
"</center></div>"
 );
  out.flush();
%> 
        
        <%
    int count =0;
        String album_id=request.getParameter("album_id");
         
        
             try {
            Connection c=new setting.Conn().getConnection();
            String sql="select * from albumdata where post_id in (select post_id from albumpost where album_id='"+album_id+"') order by post_id desc";
            ResultSet rs=testing.Database.getResultset(sql, c);
            String data="";
           String post_message="";
           String link="";
           String picture="";
           String sender_pic="";
           String sender_name="";
           
           rs.last();
          count = rs.getRow(); //number of column
            rs.beforeFirst();
            
                application.setAttribute(album_id, ""+count);
            
             String pic="";
             int i=0;
          while(rs.next()){  
              i++;
              link=rs.getString("link");
              picture=rs.getString("image_low");
              post_message=rs.getString("caption_text");
              sender_pic=rs.getString("sender_pic");
              sender_name=rs.getString("sender_name");
              String post_messagedecode=URLDecoder.decode(post_message, "UTF-8");
               pic="<span class='pic'><a target='_blank' href='"+link+"'><img class='pic' src='"+picture+"' /></a></span>";
             
          data+="<div class='plan'>"+pic+"<div class='msgdiv'><span class='message'>"+post_messagedecode+"</span>"
 + "</div><div id='usermain'><div id='userpic'>"+
    "<img src='"+sender_pic+"'class='sender_pic' style='border-radius:4px;' />"+
    "</div><div id='username'>"
     +sender_name+"</div></div></div>";   
           
            
            
               }%>
    <center> 
        <center><img src="images/topbanner.jpg" style="margin-top: 0px; z-index: 34; width:100%; height: 100px;"/></center>
        <div id="main-table" class="masonry"  onMouseOver="pauseDiv()" onMouseOut="resumeDiv()" >
            
<%=data%>
        </div>
    
        
    
    
    </center>
   
        <%
        c.close();
        }
        
        catch (Exception e) {
            out.print("<div style='padding:50px; background-color=grey;color:white'> Error </div>");
        }
    



%>


<script>
 
    
function checkimage(){  
   

var $images = $('img')
, imageCount = $images.length
, counter = 0;

 var imgs = document.getElementsByTagName('img')
	for(var i=0,j=imgs.length;i<j;i++){
		imgs[i].onerror = function(e){
                    
                counter++;
		this.parentNode.removeChild(this);
	}
}


 //alert(imageCount);
// one instead of on, because it need only fire once per image
$images.one("load",function(){
  //alert(counter);
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
  if(this.onabort){
     alert("not loaded");
   } 
    
    
});

}
// it is for image adjust image block and scroll div after all image load
function imageloaded(){

//alert("from imageloaded");

adjustdiv();
document.getElementById("loading").style.display = "none";


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



ScrollRate = 30;

function scrollDiv_init() {
	DivElmnt = document.getElementById("main-table");
	ReachedMaxScroll = false;
	
	DivElmnt.scrollTop = 0;
	PreviousScrollTop  = 0;
	
	ScrollInterval = setInterval('scrollDiv()', ScrollRate);
}

function scrollDiv() {
	
	if (!ReachedMaxScroll) {
		DivElmnt.scrollTop = PreviousScrollTop;
		PreviousScrollTop++;
		
		ReachedMaxScroll = DivElmnt.scrollTop >= (DivElmnt.scrollHeight - DivElmnt.offsetHeight);
	}
	else {
		ReachedMaxScroll = (DivElmnt.scrollTop == 0)?false:true;
		
		DivElmnt.scrollTop = PreviousScrollTop;
		PreviousScrollTop--;
	}
}

function pauseDiv() {
	clearInterval(ScrollInterval);
        document.getElementById("main-table").style.overflowY="scroll";
}

function resumeDiv() {
     document.getElementById("main-table").style.overflowY="hidden";
	PreviousScrollTop = DivElmnt.scrollTop;
	ScrollInterval    = setInterval('scrollDiv()', ScrollRate);
}

scrollDiv_init();
</script>
<!--<center><form name="myform" action="instagram.jsp" method="post" style="text-align: center; border-radius: 5px; padding: 5px; background-color: #ab3884 ; width: 350px;">
       Tag Name:-  #<input type="text" name="tagname" placeholder="tag name" style="padding: 5px;margin-left: 5px" value="<%//=tagname%>" />
                   <input type="submit" value="OK" name="ok" style="padding: 5px 15px;margin-left: 10px">
        </form>

</center>-->


<script>
(function worker() {
    var count='<%=application.getAttribute("count") %>';
  $.ajax({
     
    url: 'displayupdate.jsp?count='+count+'&album_id=<%=album_id%>', 
    success: function(data) {
     var a=data.trim().length;
      if(a>0){
    document.getElementById("main-table").innerHTML=data+document.getElementById("main-table").innerHTML; 
   checkimage(); 
  document.getElementById('main-table').scrollTop =0;
 }
},
    complete: function() {
      // Schedule the next request when the current one's complete
     
      setTimeout(worker,10000);
    }
  });
})();




   function opencolor() { 
        //For url
     //  $(".iframe").colorbox({href:"http://app.yralup.com", open:true});
	
		//$(".iframe").colorbox({open:true,iframe:true, width:"90%", height:"90%"});
            var banner="images/abhiashi.jpg";  
		 $.colorbox({href:banner, open:true,transition:'elastic', });
		 window.setTimeout(function() {
    $.colorbox.close();
}, 12000);
	
	

	}	
	
	
	
	
	function surprise() {
    (function loop() {
        var now = new Date();
        if (now.getMinutes()%5 === 0) {
            opencolor();
        }
        now = new Date();                  // allow for time passing
        var delay =60000 - (now % 60000); // exact ms to next minute interval
        setTimeout(loop, delay);
    })();
}
	
	//surprise();
	
	
	
	
	

</script>


    </body>
</html>
