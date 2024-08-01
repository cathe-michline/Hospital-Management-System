<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	String reason = request.getParameter("value").toString();
%>
<!DOCTYPE html>


<html>
<head>
<title>Page not Found</title>
</head>
  <body>
<div id="main">
    	<div class="fof">
    	<% 
    	if(reason == "found") {
    	out.print("<h1>Sorry! Account Not Found... :(</h1>");
    	}
    	else{
    		out.print("<h1>Sorry! Couldn't find the you're looking for... :(</h1>");
    	}%>
        		<h4><a href="home"> Back to home </a></h4>
    	</div>
</div>
    
  </body>
  <style>
  *{
    transition: all 0.6s;
}

html {
    height: 100%;
}

body{
    font-family: 'Lato', sans-serif;
    color: #888;
    margin: 0;
}

#main{
    display: table;
    width: 100%;
    height: 100vh;
    text-align: center;
}

.fof{
	  display: table-cell;
	  vertical-align: middle;
}

.fof h1{
	  font-size: 50px;
	  display: inline-block;
	  padding-right: 12px;
	  animation: type .5s alternate infinite;
}

.fof h4 a{
	  font-size: 25px;
	  display: inline-block;
	  padding-right: 12px;
	  animation: type .5s alternate infinite;
	  color : grey;
}

@keyframes type{
	  from{box-shadow: inset -3px 0px 0px #888;}
	  to{box-shadow: inset -3px 0px 0px transparent;}
}
  </style>
  </html>