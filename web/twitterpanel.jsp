<%-- 
    Document   : index
    Created on : Feb 15, 2014, 12:04:37 PM
    Author     : anurag
--%>

<%@page import="twitter4j.MediaEntity"%>
<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="twitter4j.conf.ConfigurationBuilder"%>
<%@page import="twitter4j.TwitterException"%>
<%@page import="java.util.List"%>
<%@page import="twitter4j.Status"%>
<%@page import="twitter4j.QueryResult"%>
<%@page import="twitter4j.Query"%>
<%@page import="twitter4j.TwitterFactory"%>
<%@page import="twitter4j.Twitter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Twitter</title>
        
        
        <style>
#main{
	position: relative; width: 225px;
        border: thin solid rgba(204,204,204,1); 
       /* IE9 SVG, needs conditional override of 'filter' to 'none' */
background: -moz-linear-gradient(top,  rgba(135,224,253,1) 0%, rgba(83,203,241,0.97) 40%, rgba(7,227,234,0.93) 100%); /* FF3.6+ */
background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(135,224,253,1)), color-stop(40%,rgba(83,203,241,0.97)), color-stop(100%,rgba(7,227,234,0.93))); /* Chrome,Safari4+ */
background: -webkit-linear-gradient(top,  rgba(135,224,253,1) 0%,rgba(83,203,241,0.97) 40%,rgba(7,227,234,0.93) 100%); /* Chrome10+,Safari5.1+ */
background: -o-linear-gradient(top,  rgba(135,224,253,1) 0%,rgba(83,203,241,0.97) 40%,rgba(7,227,234,0.93) 100%); /* Opera 11.10+ */
background: -ms-linear-gradient(top,  rgba(135,224,253,1) 0%,rgba(83,203,241,0.97) 40%,rgba(7,227,234,0.93) 100%); /* IE10+ */
background: linear-gradient(to bottom,  rgba(135,224,253,1) 0%,rgba(83,203,241,0.97) 40%,rgba(7,227,234,0.93) 100%); /* W3C */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#87e0fd', endColorstr='#ed07e3ea',GradientType=0 ); /* IE6-8 */
 border-radius: 4px;
 
 
 border-radius:4px 4px 4px 4px;
  margin:7px 0px 0px 7px;
-webkit-box-shadow: 0 5px 9px -6px black;
	   -moz-box-shadow: 0 5px 9px -6px black;
	        box-shadow: 0 5px 9px -6px black;
 
	
}

#message{
	position: relative; left: 7px; top: 5px; width: 210px;
        color: #fff;
        font-family: sans-serif ;
        text-align: center;
        text-wrap: normal;
	
}

#icon{
	position: relative; left: 86px; top: 1px; width: 26px; height: 27px;
	
}

#ptime{
	
	position:relative; width: 211px; height: 21px;  text-align:left; top:15px;   margin:7px;
        color: #e3eaee;
}


#usermain{
	position: relative; border-top: thin solid rgba(204,204,204,1); width: 225px; height: 44px; margin-top:15px;
	 border-radius: 0 0 4px 4px;
         background: rgb(238,238,238); /* Old browsers */
/* IE9 SVG, needs conditional override of 'filter' to 'none' */
background: -moz-linear-gradient(top,  rgba(238,238,238,1) 0%, rgba(238,238,238,1) 100%); /* FF3.6+ */
background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(238,238,238,1)), color-stop(100%,rgba(238,238,238,1))); /* Chrome,Safari4+ */
background: -webkit-linear-gradient(top,  rgba(238,238,238,1) 0%,rgba(238,238,238,1) 100%); /* Chrome10+,Safari5.1+ */
background: -o-linear-gradient(top,  rgba(238,238,238,1) 0%,rgba(238,238,238,1) 100%); /* Opera 11.10+ */
background: -ms-linear-gradient(top,  rgba(238,238,238,1) 0%,rgba(238,238,238,1) 100%); /* IE10+ */
background: linear-gradient(to bottom,  rgba(238,238,238,1) 0%,rgba(238,238,238,1) 100%); /* W3C */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#eeeeee', endColorstr='#eeeeee',GradientType=0 ); /* IE6-8 */
 
}

#userpic{
	
	position: absolute; width: 41px; height: 34px; left: 11px; top: 6px;
	
}
.pic	{
	 border-radius:4px 4px 0 0;
	 display: block;
    max-width:212px;
    min-width: 212px;
    text-decoration: none;
    border-style: none;
	
	   	}
#username{
	
position: relative;
 width: 140px;
 height: 27px; 
 left: 55px;
  top: 10px;
  color: #878787;
 	
	
}
#main-table {
		width: 100%;
                max-height:550px;
                overflow-y:scroll;
                overflow-x: hidden;
                background-color:transparent;
                text-align: center;
                left:60px;
                top: 20px;
               display: inline-block;
               
	}
        #main-table:hover{
            /*overflow-y: scroll;*/
        }
        a{
            target:tab; 
        }
        
        #loader{
position:absolute;
left:50%;
top:50%;
margin-left:-38px;
margin-top:-38px;
z-index: 99978;
}
</style>



<link href="js/perfect-scrollbar.css" rel="stylesheet">
      <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
      <script src="js/jquery.mousewheel.js"></script>
      <script src="js/perfect-scrollbar.js"></script>
<script src='js/masonry.js'></script><script src='js/classie.js'></script>


<script src="alert/js/jquery.js"></script>
<script src="alert/js/jquery-ui.js"></script>

<!-- ALERT -->

<link href="alert/css/alert.css" rel="stylesheet" />
<link href="alert/themes/default/theme.css" rel="stylesheet" />
<script src="alert/js/alert.js"></script>


<script>
            function submitForm(param) {
              
           alert(param);
    var http;
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
   
 http=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
     
 http=new ActiveXObject("Microsoft.XMLHTTP");
  }
    http.open("POST", "test2.jsp", false);
    http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    http.setRequestHeader("Content-length", param.length);
   http.setRequestHeader("Connection", "close");
http.send(param);
//alert(""+http.responseText);
  $.alert.open('success', 'Save Successful', http.responseText);
//       
          return false;
    }
 

        </script> 







       
    </head>
    <body style="background-color: #e5e5ef">
        <div id="loader"><img src="image/retrive.gif"/></div>
        
    <%
    out.flush();
      String hashtag="gameoflegends";  
      int limit=50;
       if(request.getParameter("tag")!=null)
        hashtag=request.getParameter("tag");
      try{
          limit=Integer.parseInt(request.getParameter("limit"));
      }catch(Exception e){
          limit=50;
      }
      
      
TwitterFactory tf = (TwitterFactory)application.getAttribute("tf");
Twitter twitter = tf.getInstance();
String data="",data1="";
        try { int i=0;
            Query query = new Query(hashtag);
            QueryResult result;
            String tweet_user_name="";
            String tweet_text="";
            String user_pic="";
            String post_id="";
            String type="";
            String create_time="";
            String link="";
            String sender_id="";
            String control_date="";
            
            do {
               
                result = twitter.search(query);
                List<Status> tweets = result.getTweets();
                for (Status tweet : tweets) {
                    post_id=""+tweet.getId();
                    tweet_text=tweet.getText();
                    tweet_user_name=tweet.getUser().getScreenName();
                    create_time=tweet.getCreatedAt().toString();
                    
                    
                    
                    out.print(tweet+"<br/><br/><br/><br/>");
                    i++;
                  tweet_user_name="@" + tweet.getUser().getScreenName();
                //  out.println("@" + tweet.getUser().getScreenName()+"<br/>");
                  tweet_text=tweet.getText();
                //   out.println(" Tweets :-  " + tweet.getText()+"<br/> source :- "+tweet.getSource()+"<br/>");
               
                    //   out.println("Tweets url :- "+tweet+"<br/>");
                   String time=tweet.getCreatedAt().toString();
                    String time1=tweet.getCreatedAt().toString();
                   Date d=tweet.getCreatedAt();
                   Date now=new Date();
    SimpleDateFormat ft = 
      new SimpleDateFormat ("E yyyy.MM.dd 'at' hh:mm:ss a zzz");
    long diffInMillies = now.getTime() - d.getTime();
     diffInMillies=TimeUnit.MILLISECONDS.convert(diffInMillies,TimeUnit.MILLISECONDS);
long diffmin = diffInMillies / (60 * 1000) % 60;
if(diffmin==0){
     time=diffInMillies / 1000 % 60 + "second ago ";
}else{
if(diffmin<=60 && diffmin >0 )
{
  time=diffmin + " minutes ago";  
}
else{
   double diffHours = diffInMillies / (60 * 60 * 1000);
   if(diffHours==0){
        time=diffmin + " minutes ago"; 
   }
   if(diffHours<=24 && diffHours>0){
      time=diffHours + " hour ago";   
   }
     else{
       time=time1.substring(0, 11);
     }
}
}

String param="";
String picsurl="";
String picsdiv="";
 for (MediaEntity mediaEntity : tweet.getMediaEntities()) {
       picsurl= mediaEntity.getMediaURL();
    }
 param="post_id="+post_id+
              "&type="+type+
             "&post_time="+create_time+
             "&link="+link+
            "&pic_low="+picsurl+
             "&pic_standard="+picsurl+
             "&post_message="+tweet_text+
             "&sender_name="+tweet_user_name+
             "&sender_id="+sender_id+ 
         "&sender_pic="+user_pic+
             "&control_date="+control_date;  
 
 
 
 if(picsurl!="" || picsurl!=null){
   picsdiv="<span class='pic'><img class='pic' src='"+picsurl+"' />"
           + "<div class='actionbutton'>"
 + "<input type='button' id='"+post_id+"' onclick=\"return submitForm('"+param+"')\" value='ok'/> "
 + "</div></span>";

 }
 else{
   picsdiv="<span class='pic'>"
           + "<div class='actionbutton'>"
 + "<input type='button' id='"+post_id+"' onclick=\"return submitForm('"+param+"')\" value='ok'/> "
 + "</div></span>";
 }
 
 
 
                    //out.println(ft.format(d) +" diff= "+diffmin);
                  //  out.println("Tweets Time :- "+tweet.getCreatedAt()+"<br/>");
                //   out.println("retweet count :- "+tweet.getRetweetCount() +"<br/>");
                //       out.println("tweet Favorite count :- "+tweet.getFavoriteCount() +"<br/>");
                
                   user_pic=tweet.getUser().getProfileImageURL() ;
                  //   out.println("tweet user url  :- "+tweet.getUser().getOriginalProfileImageURL() +"<br/>");
            data1="<div id='main'><div id='message'><div id='icon' style=''><img src='images/twitter.ico' /></div>"
              +picsdiv  +tweet_text+ "</div><div id='ptime' >"
                + time+
    "</div><div id='usermain'><div id='userpic'>"+
    "<img src='"+user_pic+"' width='43' height='36' style='border-radius:4px;' />"+
    "</div><div id='username'>"
     +tweet_user_name+"</div></div></div>";           
         // out.print(data1);   
        data+=data1;               
                  // out.flush();
                   
                }
            } while ((query = result.nextQuery()) != null && i<=limit);{
           %>
    <div id="main-table" class="masonry">
        <%=data%>
    </div> 
    
    <center><h2 style="font-family: sans-serif , serif; color: #8b8b8b ; padding-top: 10px;"> Tweets with #<%=hashtag%></h2>
    </center>
        <%
            
            
                       }       
        } catch (TwitterException te) {
            te.printStackTrace();
            out.println("Failed to search tweets: " + te.getMessage());
            System.exit(-1);
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
   
     if (counter === imageCount) {

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

document.getElementById("loader").style.display="none";
document.getElementById("loader").style.display="none";
adjustdiv();


}

function adjustdiv(){
  //alert("adjust div");
  docReady( function() {

  var container = document.querySelector(".masonry");
  var msnry = new Masonry( container, {
    columnWidth: 5
  });


$('#main-table').perfectScrollbar({wheelSpeed:130});  // for scroll bar
  
});
	 
  }
  
  checkimage();

//window.onerror = function(msg, url, linenumber) {
//    alert('Error message: '+msg+'\nURL: '+url+'\nLine Number: '+linenumber);
//    return true;
//}


</script>

    </body>
</html>
