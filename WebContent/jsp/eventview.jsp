<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*"%>
<jsp:useBean id="bistrolist" class="java.util.ArrayList" scope="request"/>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>KBook</title>
</head>
<body>
	<h2>목록</h2>
	<table border="1">
		<tr>
			<th>음식점 이름</th>
			<th>음식점 번호</th>
			<th>영업 시간</th>
		</tr>
		<%
			for(int i=0; i<bistrolist.size();i++) {
				Bistro bistro = (Bistro)bistrolist.get(i);
		%>
		<tr>
			<td><%=bistro.getName()%></td>
			<td><%=bistro.getTel()%></td>
			<td><%=bistro.getOfficeHours()%></td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>