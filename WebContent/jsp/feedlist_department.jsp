<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@page import="model.*"%>
<%@page import="dao.*"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link href="../css/feed.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
</head>
<body>
		<%
			FeedDAO fdao = new FeedDAO();
			ArrayList<Feed> feedList = new ArrayList<Feed>();
			Member user = (Member)session.getAttribute("member");
			feedList=fdao.getFeed_category(user.getDepartment());
			int fsize=feedList.size();
		%>
	<div class="list">
		<% 
			for( int i=(fsize-1); i>=0; i--) {
						
		%>
		
		<ol class="feed-output">
			<div class="feedstyle">
				<div class="feed-upper">
					<div class="userimg">
						<img src="/WebProject/img/avatar2.png" />
					</div>
					<div class="divalign1"><div class="name"><%= feedList.get(i).getName()%></div>
					<span class="time"> <%=feedList.get(i).getDate().toString() %> </span></div>
				</div>
				<hr class="style3">
				<div class="feed-center">
					<p>
						<%= feedList.get(i).getContent()%>
					</p>
				</div>
				<div class="feed-bottom">
					<button type="button">reply</button>
				</div>
				<hr class="style6">
				<div class="replystyle">
					<div class="ru"><table>
					<tr><td><!--댓글이 존재한다면 불러오기 if() --></td></tr>
					</table></div>
					<div class="rb">
					<form method="post" name="reply" class="replyform" action="/WebProject/FeedComment?action=add">
							<span class="imgstyle"><img src="../img/avatar5.png" style="width:35px;border-radius:70px;"/></span>
							<span><textarea name="replycontent" rows="1" cols="60" style="width: 500px; height: 25px"></textarea>
							<input type="hidden" value="<%= feedList.get(i).getFeedNum() %>" name="feednum"/> 
							<input type="submit" class="button3" value="등록" /></span>
					</form></div>
				</div>
			</div>
		</ol>
		<% } %>
	</div>
</body>
</html>