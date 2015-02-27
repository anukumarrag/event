   var rf="ipl/";
var banner=rf+"default.jpg";
var hash1="";
var hash2="";
function updatevar(){


var now=new Date();
var day=now.getDate();
var month=now.getMonth()+1;

var year = now.getFullYear();
var hour=now.getHours();
var minute=now.getMinutes(); 
   
if(day===21 && month===4 && year===2014 && (hour>=20 && hour<=23))
{
banner=rf+"21apr_8.jpg";
hash1="gameoflegendsdd";
hash2="gameoflegendscsk";


}

if(day===22 && month===4 && year===2014 && (hour>=20  && hour<=23))
{
banner=rf+"22apr_8.jpg";
hash1="gameoflegendssrh";
hash2="gameoflegendskx1p";


}


if(day===23 && month===4 && year===2014 && (hour>=20 && hour<=23))
{
banner=rf+"23apr_8.jpg";
hash1="gameoflegendssrr";
hash2="gameoflegendscsk";


}
if(day===24 && month===4 && year===2014 && (hour>=20 && hour<=23))
{
banner=rf+"24apr_8.jpg";
hash1="gameoflegendskkr";
hash2="gameoflegendsrcb";


}
}

