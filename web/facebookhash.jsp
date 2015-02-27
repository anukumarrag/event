<%-- 
    Document   : jsonjava
    Created on : Feb 6, 2014, 1:51:06 AM
    Author     : anurag
--%>

<%@page import="java.net.MalformedURLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="org.json.simple.parser.ParseException"%>
<%@page import="java.io.IOException"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONValue"%>
<%@page import="org.apache.commons.io.IOUtils"%>
<%@page import="java.net.URL"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FB</title>
       <link href="js/perfect-scrollbar.css" rel="stylesheet">
      <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
      <script src="js/jquery.mousewheel.js"></script>
      <script src="js/perfect-scrollbar.js"></script>
<script src='js/masonry.js'></script><script src='js/classie.js'></script>

        <style> 
	
	body{
	font-family: 'Helvetica Neue','Helvetica','?????? Pro W3','Hiragino Kaku Gothic Pro','????','Meiryo','?? ?????',arial,sans-serif;
	
	}
	
	
		
	#main-table {
		width: 100%;
                max-height:450px;
                overflow-y:hidden;
                overflow-x: hidden;
                background-color:transparent;
                text-align: center;
             
                
               
	}
        #main-table:hover{
            /*overflow-y: scroll;*/
        }

	.plan {
            background: #599af5;      
		border: 1px solid #ddd;
		color: #333;
		width: 225px;/*180px;  plan width = 180 + 20 + 20 + 1 + 1 = 222px */      
		float: left;
		position: relative;
	}
	
	
	
	
	
	/* --------------- */

	
	.plan	{
		
border-radius:4px 4px 4px 4px;
margin:5px 5px;
-webkit-box-shadow: 0 5px 9px -6px black;
	   -moz-box-shadow: 0 5px 9px -6px black;
	        box-shadow: 0 5px 9px -6px black;
  
/*                -webkit-box-shadow: .5px .5px 2px .5px #050505;
box-shadow: .5px .5px 2px .5px #050505;*/

	}
	
	
	
	
	.pic	{
	 border-radius:4px 4px 0 0;
	 display: block;
    max-width:225px;
    min-width: 225px;
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
color: #fff;
text-align: center;

}	 
.msgdiv{
    padding: 7px;
    text-align: justify;
}	 
  

 .box{
/*    border-style:solid;
    border-width:2px;
    border-color:#2C4F85;*/
    font:14px Georgia, serif;
    padding:0;
    box-shadow:0px 0px #000000;
    border-radius:6px;
	color: #fff;
      display: none;  
    
       	
}


.fbresult{
    text-align: center;
    background-color: #8b9dc3;
    border-radius: 0 0 3px 3px;
    min-width: 220px;
}
#loader{
position:absolute;
left:50%;
top:50%;
margin-left:-38px;
margin-top:-38px;
z-index: 99978;
display: block;
}
    </style>
    
  <base target="_blank" />
</head>
<body  leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

 <div id="loader" ><img src="image/retrive.gif"/></div>
 
        <%!
      public String picurl(String pic_url){
          String url=pic_url;
          String b4ext=pic_url.substring(0, pic_url.lastIndexOf('.')-1);
          String ext=pic_url.substring(pic_url.lastIndexOf('.'), pic_url.length());
          String newurl=b4ext+"n"+ext;
         return newurl; 
      }
        
public static String getMessage(String s) {
       // String s = "Please go to http://stackoverflow.com and then mailto:oscarreyes@wordpress.com to download a file from    ftp://user:pass@someserver/someFile.txt";
        // separete input by spaces ( URLs don't have spaces )
        String [] parts = s.split("\\s");
        String mys="";
        // Attempt to convert each item into an URL.   
        for( String item : parts ) try {
            URL url = new URL(item);
            // If possible then replace with anchor...
            mys+="<a href=\"" + url + "\" target=\"_blank\">"+ url + "</a> ";    
        
        } catch (MalformedURLException e) {
            // If there was an URL that was not it!...
           mys+=item+" ";
           
        }

        return mys;
    }
%>
        
        
        <%
            out.flush();
//        String username="anukumarrag@gmail.com";
//        if(session.getAttribute("username")!=null)
//            username=(String)session.getAttribute("username");
//        if(request.getParameter("username")!=null)
//             username=(String)request.getParameter("username");
//        Connection con=(Connection)application.getAttribute("con");
//        String sql="select pagename from fbpage where userid='"+username+"'";
//        ResultSet rs=testing.Database.getResultset(sql, con);
//       String pagename="Yralup";
//         while(rs.next())
//       pagename=rs.getString("pagename");
//        int no_of_post=35;
 String access_token=new setting.Api().getAccess_token();
String url = "https://graph.facebook.com/search?q=gameoflegends"
        + "&limit=100&access_token="+access_token;  
          try {
            String genreJson = IOUtils.toString(new URL(url));
            JSONObject genreJsonObject = (JSONObject) JSONValue.parseWithException(genreJson);
           
            String data="";
            
            JSONArray genreArray = (JSONArray) genreJsonObject.get("data");
            // get the first genre
           for(int i=0;i<genreArray.size();i++){
            JSONObject firstGenre = (JSONObject) genreArray.get(i);
            String post_id=firstGenre.get("id").toString();
            String create_time=firstGenre.get("created_time").toString();
            String post_message="";
          
            String link="";
            if(firstGenre.get("link")!=null)
            link=firstGenre.get("link").toString();
             if(firstGenre.get("message")!=null){
               post_message= getMessage(firstGenre.get("message").toString());
            if(post_message.length()>140)
                post_message=post_message.substring(0, 140)+"  ....<a href='"+link+"' target='_blank'>more</a>";
               
            } 
            boolean ispic=false;
             String picture="";
             String pic="";
            if(firstGenre.get("picture")!=null){
                ispic=true;
                if(firstGenre.get("type").toString().equalsIgnoreCase("photo"))
            picture=picurl(firstGenre.get("picture").toString());
                else
                    picture=firstGenre.get("picture").toString();
            pic="<span class='pic'><a target='_blank' href='"+link+"'><img class='pic' src='"+picture+"' /></a></span>";
                       }
             JSONObject from=(JSONObject) firstGenre.get("from");
            
               String share_count="";
            if(firstGenre.get("shares")!=null){
            JSONObject shares=(JSONObject) firstGenre.get("shares");
          
            boolean isshare=false;
                        if(shares!=null){
                            isshare=true;
//             out.println(shares.get("count")+"<br>"); 
           share_count=shares.get("count").toString();
                      }
                       }
            if(ispic==true)
          data+="<div class='plan'>"+pic+"<div class='msgdiv'><span class='message'>"+post_message+"</span></div></div>";   
           }
            %>
            <div id="main-table" class="masonry"  onMouseOver="pauseDiv()" onMouseOut="resumeDiv()" >

<%=data%>

</div>





        <%
        }
        catch (IOException e) {
            out.print(e);
        }
        catch ( ParseException e) {
            out.print(e);
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
		this.parentNode.removeChild(this);
                counter++;
              //  alert("image not loaded" + counter);
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


}

function adjustdiv(){
    
document.getElementById("loader").style.display = "none";
  //alert("adjust div");
  docReady( function() {

  var container = document.querySelector(".masonry");
     
  var msnry = new Masonry( container, {
    columnWidth: 5
  });
 
 $('#main-table').perfectScrollbar({wheelSpeed:100});  // for scroll bar
});


	 
  }
  
  checkimage();

//window.onerror = function(msg, url, linenumber) {
//    alert('Error message: '+msg+'\nURL: '+url+'\nLine Number: '+linenumber);
//    return true;
//}



ScrollRate = 60;

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
     //   document.getElementById("main-table").style.overflowY="scroll";
}

function resumeDiv() {
   //  document.getElementById("main-table").style.overflowY="hidden";
	PreviousScrollTop = DivElmnt.scrollTop;
	ScrollInterval    = setInterval('scrollDiv()', ScrollRate);
}


scrollDiv_init();








</script>


    </body>
</html>
