<%-- 
    Document   : index
    Created on : Dec 27, 2014, 2:51:03 PM
    Author     : buzzkart
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<title>Gallery</title>
		<meta name="description" content="Blueprint: Blueprint: Google Grid Gallery" />
		<meta name="keywords" content="social wedding album, wedding photo gallery" />
		<meta name="author" content="Codrops" />
		<link rel="stylesheet" type="text/css" href="css/demo.css" />
		<link rel="stylesheet" type="text/css" href="css/component.css" />
		<script src="js/modernizr.custom.js"></script>
                
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
                
                <style>
                    #grid-gallery{
                        max-height: 600px;
                        overflow-y: scroll;
                        margin-top: 77px;
                    }
                    
                    .twitter{
    /*background: url(img/twitter.png) center no-repeat;*/
    border-bottom: #55acee solid medium;
    
}
.instagram{
/*     background: url(img/instagram.png) center no-repeat;
     backface-visibility: .4;*/
     border-bottom: #3f729b solid medium;
}

.sender{
    
  
    padding-top: 10px;
    
}
                </style>
                
                
	<style>
		* { margin: 0; padding: 0; }
	
		#bg { position: fixed; top: 0; left: 0; }
		#bg{ width: 100%; }
		#bg { height: 100%; }
		
		 
	</style>
              	<script>
		$(function() {   
		
			var theWindow        = $(window),
			    $bg              = $("#bg"),
			    aspectRatio      = $bg.width() / $bg.height();
			    			    		
			function resizeBg() {
				
				if ( (theWindow.width() / theWindow.height()) < aspectRatio ) {
				    $bg
				    	.removeClass()
				    	.addClass('bgheight');
				} else {
				    $bg
				    	.removeClass()
				    	.addClass('bgwidth');
				}
							
			}
			                   			
			theWindow.resize(function() {
				resizeBg();
			}).trigger("resize");
		
		});
	</script>  
                
	</head>
        
        
        
        
        <body style="overflow-y: hidden;" >
            
            
          
            
               <%  request.setCharacterEncoding("utf-8");      
    int count =0;
        String album_id=request.getParameter("album_id");
          String data="",slidedata="";
        
             try {
            Connection c=new setting.Conn().getConnection();
            
            String template=testing.Template.getTemplate(c, album_id);
            
            String sql="select * from albumdata where post_id in (select post_id from albumpost where album_id='"+album_id+"') order by post_id desc";
            ResultSet rs=testing.Database.getResultset(sql, c);
           
           String post_message="";
           String link="";
           String picture="";
           String sender_pic="";
           String sender_name="";
           rs.last();
             count = rs.getRow(); //number of column
            rs.beforeFirst();
            
                session.setAttribute(album_id, ""+count);
            
             String pic="";
             int i=0;
         %>
                  <%
                         while(rs.next()){  
              i++;
              link=rs.getString("link");
              picture=rs.getString("image_low");
              post_message=rs.getString("caption_text");
              sender_pic=rs.getString("sender_pic");
              sender_name=rs.getString("sender_name");
              String post_messagedecode=URLDecoder.decode(post_message, "UTF-8");
              String img="";
              String typeclass="instagram";
              if(rs.getString("type").equalsIgnoreCase("twitter_post"))
                  typeclass="twitter";
              if(null!=picture && !picture.equals("null"))
                  img="<img src=\""+picture+"\" alt=\""+rs.getString("post_id")+"\"/>";
               data+="<li><figure>"+
                        img+
			"<figcaption class=\""+typeclass+"\">"+
                       "<!--<h3>Letterpress asymmetrical</h3>-->"
                       + "<p>"+post_messagedecode+"</p>"
                       + " <p class=\"sender\"><span style=\"float: left;  display: inline; vertical-align: middle;\">"
                       + "<img src=\""+sender_pic+"\" style=\"width: 40px; height: 40px; border-radius: 20px;\"/>"+
                     "</span>"+
                       "<span style=\"display: inline-block; padding: 8px;\">  "+sender_name+"</span> </p>"+
                        "</figcaption>"
                       + "</figure></li>";
               slidedata+="<li><figure>"+
                        "<figcaption>"+
                       "<!--<h3>Letterpress asymmetrical</h3>-->"
                       + "<p>"+post_messagedecode+"</p>"
                       + "</figcaption>"+
                         img+
                       "</figure></li>";
          %>
          
         <% 
               }
            %> 
            <div class="container">
                <%
                if(null!=template){
                %>
                <img src="<%=template%>" id="bg" alt="">
                <%
                }else{%>
			<header class="clearfix">
                            <img src="img/header1.jpg" class="headerpic"  />
                            <style>
                                
                                 #grid-gallery{
                        margin-top: 0px;
                    }
                            </style>
<!--				<span>Blueprint <span class="bp-icon bp-icon-about" data-content="The Blueprints are a collection of basic and minimal website concepts, components, plugins and layouts with minimal style for easy adaption and usage, or simply for inspiration."></span></span>
				<h1>Google Grid Gallery</h1>
				<nav>
					<a href="http://tympanus.net/Blueprints/FullWidthTabs/" class="bp-icon bp-icon-prev" data-info="previous Blueprint"><span>Previous Blueprint</span></a>
					a href="" class="bp-icon bp-icon-next" data-info="next Blueprint"><span>Next Blueprint</span></a
					<a href="http://tympanus.net/codrops/?p=18699" class="bp-icon bp-icon-drop" data-info="back to the Codrops article"><span>back to the Codrops article</span></a>
					<a href="http://tympanus.net/codrops/category/blueprints/" class="bp-icon bp-icon-archive" data-info="Blueprints archive"><span>Go to the archive</span></a>
				</nav>-->
			</header>
<% }%>
			<div id="grid-gallery" class="grid-gallery"  onMouseOver="pauseDiv()" onMouseOut="resumeDiv()">
				<section class="grid-wrap">
                                    <ul class="grid" id="main_table">
						<li class="grid-sizer"></li><!-- for Masonry column width -->
                                                
                                       <%=data%>         
                                        </ul>
            
				</section> 
                                        <!--// grid-wrap--> 
				<section class="slideshow">
                                    <ul id="slide_table">
                                        <%=slidedata%>
                                        
                                    </ul>
                                    <nav>
						<span class="icon nav-prev"></span>
						<span class="icon nav-next"></span>
						<span class="icon nav-close"></span>
					</nav>
					<div class="info-keys icon">Navigate with arrow keys</div>
				</section> 
                                        <!--// slideshow--> 
			
                        </div><!-- // grid-gallery -->
		</div>
            
            
            
		<script src="js/imagesloaded.pkgd.min.js"></script>
		<script src="js/masonry.pkgd.min.js"></script>
		<script src="js/classie.js"></script>
		<script src="js/cbpGridGallery.js"></script>
		<script>
                    function myfun(){
                        
                       new CBPGridGallery( document.getElementById( 'grid-gallery' ) );
                      // alert("hii");
                    }
			new CBPGridGallery( document.getElementById( 'grid-gallery' ) );
		</script>
                
          <%c.close();
        }
        
        catch (Exception e) {
            out.print(" Error"+e);
        }
    



%>      



<script>
(function worker() {
    var count='<%=session.getAttribute("count") %>';
  $.ajax({
     
    url: 'displayupdate.jsp?album_id=<%=album_id%>', 
    success: function(data) {
     var a=data.trim().length;
     
     console.log("update");
      new CBPGridGallery( document.getElementById( 'grid-gallery' ) );
      if(a>0){
    document.getElementById("main_table").innerHTML= data+document.getElementById("main_table").innerHTML; 
     document.getElementById("slide_table").innerHTML= data+document.getElementById("slide_table").innerHTML; 
     new CBPGridGallery( document.getElementById( 'grid-gallery' ) );
     
     console.log("update");
  document.getElementById('main_table').scrollTop =0;
 }
},
    complete: function() {
      // Schedule the next request when the current one's complete
     
      setTimeout(worker,10000);
    }
  });
})();

</script>

<script>
    
    


ScrollRate = 30;

function scrollDiv_init() {
	DivElmnt = document.getElementById("grid-gallery");
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
        document.getElementById("grid-gallery").style.overflowY="scroll";
}

function resumeDiv() {
     document.getElementById("grid-gallery").style.overflowY="hidden";
	PreviousScrollTop = DivElmnt.scrollTop;
	ScrollInterval    = setInterval('scrollDiv()', ScrollRate);
}

scrollDiv_init();

</script>
                
	</body>
</html>
