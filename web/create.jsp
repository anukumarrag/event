<%-- 
    Document   : create
    Created on : Mar 26, 2014, 6:16:29 PM
    Author     : anurag
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Event</title>
         <link rel="stylesheet" type="text/css" href="css/jquery.datetimepicker.css"/>
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
                top:150px;
                margin-right: 150px;
              //  border:   solid thick;
              //  border-image: url('images/shadow.png') repeat;
                /*background: url('images/shadow.png') no-repeat bottom;*/
            }
            body{
                text-align: center;
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
 function hash_create(){
    
	 var room=document.getElementById("team_size").value.trim();
          
	 if(room!="" && (room - 0)== room && room.length > 0){
              
	var text="<div id=\"hashlabel\" style=\"text-align:center; color:#6666ff \" > Provide Hash Tag for Each Team</div>";
	var i=1;
	for(i=1;i<=room;i++){
		text+="<input type='text' class='hashtag' required placeholder='Hash Tag "+i+"' style=\"width:6em\" name='"+i+"' id='"+i+"'> &nbsp;";
	}
	document.getElementById("hash_content").innerHTML=text;
}
else{
    document.getElementById("hash_content").innerHTML="";
    document.getElementById("hashlabel").innerHTML="";
}
 }
 
 function form_test(){
      var event_name=document.getElementById("event_name").value.trim();
      if(event_name==""){
          alert("please provide Album name")
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
          alert("please provide Marriage Date")
          document.getElementById("datetimepicker2").focus();
           return false;
      }
     
 }
 
 
</script>
        
    </head>
    <body style="background-image: url(images/bluestrip.jpg)">
        <%
//        if(session.getAttribute("username")==null )
//            response.sendRedirect("login.jsp");
//                    
        %>
        
        <img src="images/social1.png" style="position: fixed; left: 0px; top: 50px; z-index: 1;"/>
        <span class="notes">
            Create a Social Media Event Tracker , Using Hash Tag ( # ).
            
        </span>  
      <form name="myform" id="myform" action="savealbum.jsp" method="get">
         
          <table width="400px">
              <tr><td align="right">     <label class="label"> Album Name :</label></td>
                  <td> <input type="text" name="event_name" id="event_name" placeholder="name of Album"/>
                  </td></tr>
              <tr><td align="right">     <label class="label"> Phone No :</label></td>
                  <td> 
               <input type="text" name="phone_no" id="phone_no" placeholder="phone no"/>
                  </td></tr>
            <tr>
                <th align="right"><label class="label"> Hash Tag :</label></th> <th  id="hash_content">
              <input type='text' name='hashtag' id='hashtag' class='hashtag' required placeholder='Hash Tag ' style="width:9em" >  
            </th>
              </tr>
              <tr>
              <td align="right">  <label class="label">Marriage Date :</label></td>
                  
              <td><input name="marriage_date" type="text" placeholder="Date" id="datetimepicker2"/> </td>
              </tr>
              <tr>
                  <td colspan="2"><br/>
                      <input id="save" type="submit" name="save" onclick ="return form_test();" value="Submit Event"/>
                  </td>         
              </tr>
          </table>
          <img src="images/shadow.png" width="100%"/>
            </form>

 
<script src="./js/jquery.js"></script>
<script src="./js/jquery.datetimepicker.js"></script>

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
