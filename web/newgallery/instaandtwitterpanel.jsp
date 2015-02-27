<%-- 
    Document   : instaandtwitterpanel
    Created on : Jan 19, 2015, 9:00:52 AM
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Moderate for instagram and twitter</title>
         
        
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
    http.open("POST", "../test1.jsp", false);
    http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    http.setRequestHeader("Content-length", param.length);
    http.setRequestHeader("Connection", "close");
       http.send(param);
       
    alert(http.responseText);
           false;
    }
 

        </script> 
   
        <style>
            body{
                
                font-family: sans-serif;
               
            } 
            
table {
    position: relative;
     border-collapse: collapse; /* IE7 and lower */
    border-spacing: 0;
      width: 100%;
}

.bordered {
    border: solid #ccc 1px;
    -moz-border-radius: 6px;
    -webkit-border-radius: 6px;
    border-radius: 6px;
    -webkit-box-shadow: 0 1px 1px #ccc; 
    -moz-box-shadow: 0 1px 1px #ccc; 
    box-shadow: 0 1px 1px #ccc;  
    
}

.bordered tr:hover {
    background: #fbf8e9;
    -o-transition: all 0.1s ease-in-out;
    -webkit-transition: all 0.1s ease-in-out;
    -moz-transition: all 0.1s ease-in-out;
    -ms-transition: all 0.1s ease-in-out;
    transition: all 0.1s ease-in-out;     
}    
    
.bordered td, .bordered th {
    border-left: 1px solid #ccc;
    border-top: 1px solid #ccc;
    padding: 10px;
    text-align: left;    
}

.bordered th {
    background-color: #dce9f9;
    background-image: -webkit-gradient(linear, left top, left bottom, from(#ebf3fc), to(#dce9f9));
    background-image: -webkit-linear-gradient(top, #ebf3fc, #dce9f9);
    background-image:    -moz-linear-gradient(top, #ebf3fc, #dce9f9);
    background-image:     -ms-linear-gradient(top, #ebf3fc, #dce9f9);
    background-image:      -o-linear-gradient(top, #ebf3fc, #dce9f9);
    background-image:         linear-gradient(top, #ebf3fc, #dce9f9);
    -webkit-box-shadow: 0 1px 0 rgba(255,255,255,.8) inset; 
    -moz-box-shadow:0 1px 0 rgba(255,255,255,.8) inset;  
    box-shadow: 0 1px 0 rgba(255,255,255,.8) inset;        
    border-top: none;
    text-shadow: 0 1px 0 rgba(255,255,255,.5); 
}

.bordered td:first-child, .bordered th:first-child {
    border-left: none;
}

.bordered th:first-child {
    -moz-border-radius: 6px 0 0 0;
    -webkit-border-radius: 6px 0 0 0;
    border-radius: 6px 0 0 0;
}

.bordered th:last-child {
    -moz-border-radius: 0 6px 0 0;
    -webkit-border-radius: 0 6px 0 0;
    border-radius: 0 6px 0 0;
}

.bordered th:only-child{
    -moz-border-radius: 6px 6px 0 0;
    -webkit-border-radius: 6px 6px 0 0;
    border-radius: 6px 6px 0 0;
}

.bordered tr:last-child td:first-child {
    -moz-border-radius: 0 0 0 6px;
    -webkit-border-radius: 0 0 0 6px;
    border-radius: 0 0 0 6px;
}

.bordered tr:last-child td:last-child {
    -moz-border-radius: 0 0 6px 0;
    -webkit-border-radius: 0 0 6px 0;
    border-radius: 0 0 6px 0;
}

.bordered tbody tr:nth-child(even) {
    background: #f5f5f5;
    -webkit-box-shadow: 0 1px 0 rgba(255,255,255,.8) inset; 
    -moz-box-shadow:0 1px 0 rgba(255,255,255,.8) inset;  
    box-shadow: 0 1px 0 rgba(255,255,255,.8) inset;        
}

.instaposts{
   display:inline-block;
    width: 49%;
    vertical-align: top;
    background-color: #d7e8e8; 
}
.twitterposts{
     display:inline-block;
    width: 50%;
    vertical-align: top;
    background-color: #f0ffff;
}
td{
     font-size: 11px;
     text-wrap: normal;
     word-wrap: normal;
           
}
.message{
    max-width: 300px;
}
@media screen and (max-width: 65em) {
	.twitterposts{
display: block;
width: 100%;

    }
    .instaposts{
    display: block;
width: 100%;
    
 
    }
}
            
        </style>
        
    </head>
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
       
       if(tagname!=null && tagname!=""){
           instaposts= new Moderate(tagname, album_id).getInstapost();
           if(instaposts!=null){
                itr=instaposts.iterator();
           }
       
        %>
        
        
        <div style="width: 100%; background-color: #f5f5f5;">
            <div class="instaposts">
                <h2>InstaGram Posts <hr> </h2>
           <table class="bordered" ><thead>
                    <tr>
                        <td>
                            Image
                        </td>
                        <td>
                            Message
                        </td>
                        <td>
                            Sender 
                        </td>
                        <td> Action </td>
                    </tr>
               </thead>
                    <%
                       PostModel post;
                    while(itr.hasNext()){
                        post=(PostModel)itr.next();
                    %>
                    <tr>
                        <td >
                            <img src="<%=post.getImage_standard() %>" width="70px" height="auto"/>
                        </td>
                        <td class="message">
                             <%=URLDecoder.decode(post.getCaption_text(), "UTF-8") %>
                        </td>
                        <td>
                             <%=post.getSender_name() %>
                        </td>
                        <td>
                            <input type='button' id='<%=post.getPost_id()%>' onclick="return submitForm('<%=post.getParam()%>')" value='ok'/>
                            
                        </td>
                    </tr>
                    
                        
                        <% }
                        
                        }
        
        
                        %>
                        
                </table>
            </div>
                
                        <div class="twitterposts" >
                            <h2>Twitter Posts <hr></h2>
                            <%
        out.flush();
                            List twitterposts= new Moderate(tagname, album_id).getTwitterpost();
                            Iterator itr1=twitterposts.iterator();
                            %>
                <table class="bordered"  >
                    <thead>
                    <tr>
                        <td>
                            Image
                        </td>
                        <td>
                            Message
                        </td>
                        <td>
                            Sender 
                        </td>
                        <td> Action </td>
                    </tr>
                    </thead>
                    <%
                       PostModel post;
                    while(itr1.hasNext()){
                        post=(PostModel)itr1.next();
                    %>
                    <tr>
                        <td >
                            <%if(null != post.getImage_standard()){%>
                            <img src="<%=post.getImage_standard() %>" width="70px" height="auto"/>
                            <%}%>
                        </td>
                        <td class="message">
                             <%=URLDecoder.decode(post.getCaption_text(), "UTF-8") %>
                        </td>
                        <td>
                             <%=post.getSender_name() %>
                        </td>
                        <td>
                            <input type='button' id='<%=post.getPost_id()%>' onclick="return submitForm('<%=post.getParam()%>')" value='ok'/>
                            
                        </td>
                    </tr>
                    
                        
                        <% }
                        
                        }
        
        
                        %>
                        
                </table>
            </div>

                        
                        
                        
</div>

    </body>
</html>
