<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
.container{
	width:500px;
	height:100px;
	background-color:green;
}
.face{
	width:80px;
	height:90px;
	float:left;
	margin:5px;
	background-color:yellow;
}
.info{
	width:290px;
	height:90px;
	text-align:left;
	float:left;
	margin:5px;
	background-color:orange;

}
.check{
	width:100px;
	height:90px;
	float:left;
	margin:5px;
	text-align:center;
	background-color:blue;
}
.blank
{
	width:500px;
	height:2px;
	background-color:gray;
}
</style>
<body>

			<% for(int i=0; i<5; i++) { %>
				<div class="container">
					<div class="face"><a href=""><img src="../img/user.PNG"/></a></div>
					<div class="info"><br><a href=""><font size="4">이름</font></a><br>
    					<font size="3" color="black">학과</font></div>
    				<div class="check"><div style= "position: relative; top: 35%;">
    				<input type="submit" name="yes" value="친구 추가"></div></div>
    			</div>
    	   <div class="blank"></div>
    	   <hr>
    	   <div class="blank"></div>
			<% } %>
	


</body>
</html>