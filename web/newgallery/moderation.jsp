<%-- 
    Document   : moderate
    Created on : Feb 6, 2015, 5:48:36 PM
    Author     : anurag
--%>
<%@page import="java.net.URLDecoder"%>
<%@page import="moderation.PostModel"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="moderation.Moderate"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html>
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="css/moderation.css">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
  
  <script>
  $(function(){
$('a[title]').tooltip();
});

  </script>
  <style>
            a.list-group-item {
    height:auto;
    min-height:120px;
    overflow-y: auto;
}
a.list-group-item.active small {
    color:#fff;
}
 
        </style>
  
</head>

   
        <script>
            function submitForm(param,id) {
               
//           alert(id);
    var http;
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
   
 http=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
     
 http=new ActiveXObject("Microsoft.XMLHTTP");
  }
    http.open("POST", "../test1.jsp", false);
    http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    http.setRequestHeader("Content-length", param.length);
    http.setRequestHeader("Connection", "close");
       http.send(param);
       var result=http.responseText;
       if ( result.indexOf("saved") > -1 ) {
   document.getElementById(id).className = 'btn btn-lg btn-block btn-prima btn-success';
}
else{
    if ( result.indexOf("update") > -1 ) {
    document.getElementById(id).className = 'btn btn-lg btn-block btn-prima btn-info';
}
else{
     document.getElementById(id).className = 'btn btn-lg btn-block btn-prima btn-warning';
}
    
}
//    alert(http.responseText);
           false;
    }
 

        </script> 
<body>
    
    
      <%
     List instaposts=null;
      Iterator itr=null;
      
        String tagname=request.getParameter("hash_tag");
        String album_id=request.getParameter("album_id");
        String username=(String)session.getAttribute("username");
        String sql="select count(*) from album where creator_id='"+username+"' and album_id='"+album_id+"' and hash_tag='"+tagname+"'";
        Connection con=new setting.Conn().getConnection();
        ResultSet rs=testing.Database.getResultset(sql, con);
        rs.next();
        if(rs.getInt(1)==0){
        
        }
        else{
            
        session.setAttribute("album_id", album_id);
       if(request.getParameterMap().containsKey("hash_tag"))
           tagname=request.getParameter("hash_tag");
       try{
       if(tagname!=null && tagname!=""){
           instaposts= new Moderate(tagname, album_id).getInstapost();
           if(instaposts!=null){
                itr=instaposts.iterator();
           }
       }
       }
       catch(Exception e){
           
       }
       
       
       
        %>

<div>
    
        <div class="container">
            <div class="row">
                <div class="board">
                    <!-- <h2>Welcome to IGHALO!<sup>™</sup></h2>-->
                    <div class="board-inner">
                    <ul class="nav nav-tabs" id="myTab">
                        
                    <div class="liner"></div>
                    <li class="active">
                     <a href="#instagram" data-toggle="tab" title="instagram">
                      <span class="round-tabs one">
                              <i class="fa fa-instagram"></i>
                      </span> 
                  </a></li>

                  <li><a href="#twitter" data-toggle="tab" title="twitter">
                     <span class="round-tabs two">
                         <i class="fa fa-twitter"></i>
                     </span> 
           </a>
                 </li>
                 
                   <li><a href="#facebook" data-toggle="tab" title="facbook">
                     <span class="round-tabs three">
                         <i class="fa fa-facebook"></i>
                     </span> 
           </a>
                 </li>
 
                     
                     </ul>
                    </div>

                     <div class="tab-content">
                      <div class="tab-pane fade in active" id="instagram">
                               
     <div class="list-group">
         
         <%
          
                       PostModel post;
                    while(itr.hasNext()){
                        post=(PostModel)itr.next();
                    %>
          
          <a class="list-group-item">
                <div class="media col-md-2">
                    <figure class="">
                     <img class="media-object img-rounded img-responsive" style="max-height:100px;" src="<%=post.getImage_standard()%> "  >
                    </figure>
                </div>
                    <div class="col-md-8" style="">
                        <h4 class="list-group-item-heading"><img  src="<%=post.getSender_pic() %>" style="max-height:40px; border-radius: 20px;" /> <%=post.getSender_name() %></h4>
                    <p class="list-group-item-text" style="font-size:12px;">
                          <%=URLDecoder.decode(post.getCaption_text(), "UTF-8") %>
                    </p>
                </div>
              <div class="col-md-2"><br><br> 
                  <%if(post.getStatus().equalsIgnoreCase("new")){ %>
             <button type="button" class="btn btn-primary btn-lg btn-block btn-prima" id='<%=post.getPost_id()%>' onclick="return submitForm('<%=post.getParam()%>','<%=post.getPost_id()%>')"   > SAVE </button>
 <%}else{%>
  <button type="button" class="btn btn-success btn-lg btn-block btn-prima" id='<%=post.getPost_id()%>' onclick="return submitForm('<%=post.getParam()%>','<%=post.getPost_id()%>')" > Update </button>
  
  <%}%>
                </div>
          </a>
         
         <% }%>
         
         
         
         
        </div>
                      </div>
                      <div class="tab-pane fade" id="twitter">
                          <div class="list-group">
                          <%
           
                       out.flush();
                           List twitterposts= new Moderate(tagname, album_id).getTwitterpost();
                            Iterator itr1=twitterposts.iterator();
                        PostModel post1;
                    while(itr1.hasNext()){
                        post1=(PostModel)itr1.next();
                    %>
<a class="list-group-item">
          <%if(null!=post1.getImage_standard()){%> 
                <div class="media col-md-3">
                    <figure class="pull-left">
                    <img class="media-object img-rounded img-responsive"  src="<%=post1.getImage_standard()%> "  />
                    </figure>
                </div>
                    <%}%>
                <div class="col-md-6">
                    <h4 class="list-group-item-heading"> <img  src="<%=post1.getSender_pic() %>" style="max-height:40px; border-radius: 20px;" /> <%=post1.getSender_name() %></h4>
                    <p class="list-group-item-text" style="font-size:12px">
                        <%=URLDecoder.decode(post1.getCaption_text(), "UTF-8") %>
                        
                    </p>
                </div>
              <div class="col-md-3"><br><br> 
                <%if(post1.getStatus().equalsIgnoreCase("new")){ %>
             <button type="button" class="btn btn-primary btn-lg btn-block btn-prima" id='<%=post1.getPost_id()%>' onclick="return submitForm('<%=post1.getParam()%>','<%=post1.getPost_id()%>')"   > SAVE </button>
 <%}else{%>
  <button type="button" class="btn btn-success btn-lg btn-block btn-prima" id='<%=post1.getPost_id()%>' onclick="return submitForm('<%=post1.getParam()%>','<%=post1.getPost_id()%>')" > Update </button>
  
  <%}%>
                </div>
          </a>          
         
         <% }%>
         
                          </div>
             
                      </div>
         
         
         <div class="tab-pane fade" id="facebook">
                          <h3 class="head text-center">Facebook Moderataion </h3>
                          <p class="narrow text-center">
                          
                              Currently Facebook Moderation panel is not available.Actually it is stopped by facebook
                          
                          </p>
                          
                          <p class="text-center">
                    <!--<a href="" class="btn btn-success btn-outline-rounded green"> create your profile <span style="margin-left:10px;" class="glyphicon glyphicon-send"></span></a>-->
                </p>
                          
                      </div>

<div class="clearfix"></div>
</div>

</div>
</div>
</div> 
     
</div> 
        
        <% }%>
</body>
</html>
