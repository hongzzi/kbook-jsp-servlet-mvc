<%@page import="model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link href="/WebProject/css/left.css" rel="stylesheet" type="text/css">
<style>
.profile{
	position:relative;
	font-family : '배달의민족 주아';
    float: left;
    width: 220px;
    height:100%;
    margin-bottom: 20px;
    border:1px solid LightGray;
    border-radius:3px;
	box-shadow: 0px 2px 7px lightgrey;
    display:inline;
    color:rgb(26,26,26);
    background-color:white;
}

hr{
	border: solid 1px LightGray;
}
</style>
</head>
<body>
<%Member member=(Member)session.getAttribute("member");%>
	<div id="wrap">
		<div class="profile">
			<ul>
			  	<li class="myProfile">My Profile</a></li>
			  	<li class="profileIMG"><img alt="Profile Image" src="/WebProject/img/user.PNG"style="width:100px; height:100px; border-radius:50px 50px 50px 50px;"></li>
			  	<li class="line"><hr></li>
			  	<li class="email"><img alt="email" src="/WebProject/img/mail.png"style="width:20px;height:15px;"><%=member.getEmail() %></li>
			  	<li class="pencil"><img alt="major" src="/WebProject/img/pencil.png" style="width:20px;height:15px;"><%=member.getDepartment() %></li>
			</ul>
		</div>
		<div class="category">
			<ul>
				<li class="grey" id="major"><a href="/WebProject/jsp/department.jsp">학과 그룹</a></li>
		  		<li class="grey" id="event"><a href="/WebProject/jsp/event.jsp">이벤트</a></li>
		  		<li class="grey" id="foods"><a href="/WebProject/jsp/foods.jsp">근처 맛집</a></li>
			</ul>
		</div>
	</div>

</body>
</html>