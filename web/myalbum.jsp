
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>My Album</title>
  <link rel="stylesheet" href="js/style.css"/>
  <!--[if IE]><script type="text/javascript" src="excanvasX.js"></script><![endif]-->
  <script type="text/javascript" src="js/jquery-1.2.6.min.js"></script>
  <script type="text/javascript" src="js/jquery.jflip-0.4.js"></script>
  <script type="text/javascript">
  (function($){    
      $(function(){    
        $("#g1").jFlip(750,580,{background:"green",cornersTop:true}).
        bind("flip.jflip",function(event,index,total){
          $("#l1").html("Image "+(index+1)+" of "+total);
        });
        
      });
  })(jQuery);
  
  </script>
  <style type="text/css">
  .flip_gallery,#l1 {margin:10px}
  .pic{
  width:750px;
  height:580px;
  }
  </style>
</head>
<body style="background-image:url(images/back_1.jpg);">
    <%
    String album_id=request.getParameter("album_id");
    Connection c=new setting.Conn().getConnection();
    String sql="select * from albumdata where album_id='"+album_id+"'";
    ResultSet rs=testing.Database.getResultset(sql, c);
    
    %>
<center>
<ul id="g1">
<li>
    <img class="pic" src="images/cover.jpg"/>
  </li>
  <%
  while(rs.next()){%>
  <li><img class="pic" src="<%=rs.getString("image_standard") %>"/></li>
  <%
  
  }
  %>
  <li>
    <img class="pic" src="images/end.png"/>
  </li> 
</ul>
 
</center>
  <%out.flush();%>
<div id="l1">Image 1 </div>


</body></html>
