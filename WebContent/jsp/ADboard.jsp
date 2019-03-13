<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*"%>
<jsp:useBean id="adlist" class="java.util.ArrayList" scope="request"/>    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	header{
		width:800px;
		height:20px;
		border:solid;
		margin:0 auto;
		text-align:left;
	}
	section{
		overflow:hidden;
		width:800px;
		height:800px;
		border:solid;
		margin:0 auto;
	}
	footer{
		width:800px;
		height:50px;
		border:solid;
		margin:0 auto;
		text-align:center;
	}
	a{
		text-decoration:none;
	}
	.image{
		width:390px;
		height:140px;
		border:solid;
		text-align:center;
		background:gray;
		float:left
	}
	.context{
		width:390px;
		height:140px;
		overflow:hidden;
		float:right;
		border:solid
	}
</style>
<body>

	<header><a href="/WebProject/AdControl?action=out">교외</a> / 
			<a href="/WebProject/AdControl?action=in">교내</a>
	</header>
	<section>
		<table border="1">
	
		<tr>
			<th width = "50">id</th>
			<th width = "500">제목</th>
			<th width = "200">글쓴이</th>
			<th width = "200">기간</th>		
		</tr>
		<%
			for (int i=0; i<adlist.size(); i++) {
				Ad ad = (Ad)adlist.get(i);
			
		%>
		<tr>
			<td><%=ad.getId()%></td>
			<td><a href="/WebProject/AdControl?action=view&id=<%=ad.getId()%>">
					<%=ad.getTitle()%></a></td>
			<td><%=ad.getAuthor() %></td>
			<td><%=ad.getDate() %></td>
		</tr>
		<%
			}
		%>

	</table>

	</section>
	<footer>
		<form action="/WebProject/AdControl?action=write" method="post">
			<input type="submit" value="글 쓰기">
		</form>
	</footer>
</body>
</html>