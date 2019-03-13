<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@page import="model.*"%>
<%@page import="dao.*"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link href="/WebProject/css/feed.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	var page=1;
	
	$(window).scroll(function() {
	    if ($(window).scrollTop() == $(document).height() - $(window).height()) {
	      console.log(++page);
	      $("#feed2").append("<%="_^_^^_^_^_^_ �콿�콿 "%>");
	      
	    }
	});
	
	$(document).ready(function(){ //DOM�� �غ�ǰ�
		$('.show').click(function(){ // ID�� toggleButton�� ��Ҹ� Ŭ���ϸ�
	var state = $('.replystyle').css('display'); // state ������ ID�� moreMenu�� ����� display�� �Ӽ��� '����'
	if(state == 'none'){ // state�� none �����ϰ�� 
				$('.replystyle').show(); // ID�� moreMenu�� ��Ҹ� show();
	}else{ $('.replystyle').hide(); // ID�� moreMenu�� ��Ҹ� hide();			
			}
		});
	});
</script>
</head>
<body>
		<%	FeedDAO fdao = new FeedDAO();
			ArrayList<Feed> feedList = new ArrayList<Feed>();
			Member user = (Member)session.getAttribute("member");
			ArrayList<Member> friendsList=(ArrayList<Member>)session.getAttribute("friendsList");
			feedList=fdao.getFeed_email(user.getEmail());
			for(int i=0; i<friendsList.size();i++){
				ArrayList<Feed> feedList2 = fdao.getFeed_email(friendsList.get(i).getEmail());
				for(int j=0; j<feedList2.size(); j++){
					feedList.add(feedList2.get(j));
				}
			}
			int fsize=feedList.size();	%>
			
	<div class="list" id="feed2">
		<%  for( int i=(fsize-1); i>(fsize-3); i--) {%>
		<ol class="feed-output">
			<div class="feedstyle" id="feed1">
				<div class="feed-upper">
					<div class="userimg">
						<img src="/WebProject/img/avatar2.png" />
					</div>
					<div class="divalign1"><div class="name"><%= feedList.get(i).getName()%></div>
					<span class="time"> <%=feedList.get(i).getDate().toString() %> </span></div>
				</div>
				<hr class="style3">
				<div class="feed-center">
					<p><%= feedList.get(i).getContent()%>
					</p>
				</div>
				<div class="feed-bottom">
					<button type="button" class="show">reply</button>
				</div>
				<div class="replystyle">
					<hr class="style6">
					<div class="recomment"><table>
					<tr><td><span class="re-name">name</span> �� <span class="re-content">content</span></td></tr>
					</table></div>
					<div class="rb">
					<form method="post" name="reply" class="replyform" action="/WebProject/FeedComment?action=add">
							<span class="imgstyle"><img src="/WebProject/img/avatar5.png" style="width:35px;border-radius:70px;"/></span>
							<span><textarea name="replycontent" rows="1" cols="60" style="width: 500px; height: 25px"></textarea>
							<input type="hidden" value="<%= feedList.get(i).getFeedNum() %>" name="feednum"/> 
							<input type="submit" class="button3" value="Ȯ��" /></span>
					</form></div>
				</div>
			</div>
		</ol>
		<% } %>
	</div>
</body>
</html>