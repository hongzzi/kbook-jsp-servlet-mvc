<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@page import="model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>FeedWrite</title>

<link href="/WebProject/css/feed.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript" src="/WebProject/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/WebProject/js/count.js"></script>
</head>
<body>
	<%
		Member member = (Member)session.getAttribute("member");
	%>
	<div class="feed-write">
		<form name="feedform" action="/WebProject/FeedOutputControl?action=add_department" method="post" accept-charset="utf-8">
			<div class="feed-write2"> 
				<textarea id="feed" name="content" placeholder="content"></textarea>
			</div>
			<div class="feed-submit">
				<span id="counter">###</span>	    
				<span><input type="submit" class="button" value="POST" /></span>
				<input type="hidden" name="category" value="<%=member.getDepartment()%>"/>
				<input type="hidden" name="name" value="<%=member.getName() %>"/>
				<input type="hidden" name="email" value="<%=member.getEmail() %>"/>
			</div>
		</form>
	</div>
</body>


</html>