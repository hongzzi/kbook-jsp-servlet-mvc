<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link href="../css/feed.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
</head>
<body>
	<%Member member = (Member)session.getAttribute("member"); %>
	<div class="container">
		<h2><%=member.getDepartment()%></h2>
		<jsp:include page="feedwrite_department.jsp" />
		<div class="blank2"></div>
		<jsp:include page="feedlist_department.jsp" />
	</div>
	
</body>
</html>