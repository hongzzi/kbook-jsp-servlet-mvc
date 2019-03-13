<%@page import="model.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link href="/WebProject/css/right.css" rel="stylesheet" type="text/css">
</head>
<body>
<table class="friends">
<%
	ArrayList<Member> friendsList=(ArrayList<Member>)session.getAttribute("friendsList");
Member member = (Member)session.getAttribute("member");
%>
	<tr>
		<td>
			<div class="tableName"><%=member.getDepartment() %> 친구 목록</div>
		</td>
	</tr>
		<%for(int i=0; i<friendsList.size(); i++){
			if(member.getDepartment().equals(friendsList.get(i).getDepartment())==true){
				%>
				<tr>
				<td>
					<div class="box">
						<div class="img"><img alt="KGU" src="../img/user.PNG" style="width: 40px; height: 40px;border-radius: 50px 50px 50px 50px;"></div>
						<div class="name"><%=friendsList.get(i).getName()%></div>
					</div>
				</td>
				</tr>
			<%
			}else if(!friendsList.get(i).getDepartment().equals(member.getDepartment())){
			}
		} %>
</table>

</body>
</html>