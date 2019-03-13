<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link href="../css/top.css" rel="stylesheet" type="text/css">
<style>
@charset "EUC-KR";
import url('https://cdn.rawgit.com/singihae/Webfonts/master/style.css');
html, body {
	font-family : '배달의민족 주아';
	margin:0;
	padding:0;
	height:100%;
	overflow:hidden;
}

nav.menu {
	font-family : '배달의민족 주아';
	position:relative;
    width: 100%;
    min-width:600px;
    height:50px;
    margin: 0;
    color:rgb(26,26,26);
    background-color: rgb(77,99,111);
}

div.logo{
	font:15px;
	font-weight:bold;
	float:left;
    width: 190px;
    height:50px;
    line-height:50px;
    margin: 0;
}

div.logo p{
	margin-top:0px;
	margin-bottom:0px;
	text-align:center;
	background-color: rgb(58,75,83);
}

nav.menu ul.left{
	width:250px;
    list-style-type: none;
    padding:0;
    height:100%;
    margin:0;
	float:left;
	text-align:left;
}
nav.menu ul.right{
	line-height:50px;
	position:absolute;
	right:10px;
	width:250px;
    list-style-type: none;
    padding:0;
    height:100%;
    margin:0;
	float:right;
	text-align:right;
}

nav.menu ul.right a{
	text-decoration:none;
	color:rgb(26,26,26);
	padding-right:10px;
}

form.search{
	width:400px;
	height:50px;
	line-height:50px;
	margin-left:15px;
}

input.input {
	width:300px;
}
input.search {
	width: 50px;
	padding:5px 15px; 
    background:lightGrey; 
    border:0px;
    cursor:pointer;
   	-webkit-border-radius: 5px;
    border-radius: 5px; 
	margin-left:15px;
	font-family : '배달의민족 주아';
}
</style>
</head>
<body>
	<nav class="menu">
			<div class="logo">
				<a href="/WebProject/jsp/index.jsp" style="text-decoration:none;color:white;"><p>144210</p></a>
			</div>
			<ul class="left">
				<li>
					<form class = "search" action="/WebProject/EventControl?action=search" method="post">
						<input class="input" name="search" type="text">
						<input class="search" name="submit" type="submit" value="검색">
					</form>
				</li>
			</ul>
		  	<ul class="right">
		    	<li><a href="login.jsp">로그아웃</a></li>
		  	</ul>
		</nav>

</body>
</html>