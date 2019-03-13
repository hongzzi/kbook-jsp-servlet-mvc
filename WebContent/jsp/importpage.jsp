<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
div.userimg img{ width:60px; border-radius:70px;}
.userimg{ padding-left:10px; float:left;}
div.feed-bottom button {
	font-family: 'Nanum Gothic', serif;
	background-color: #005766;
	border: none;
	color: white;
	padding: 8px 26px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	boder-radius:7px;
}
hr.importpage{ color:#EAEAEA;}
.feed-output{
	font-family: 'Nanum Gothic', serif;
	max-width:630px;
	height:100%;
	background-color:white;
	padding:10px;
    border:1px solid LightGray;
    border-radius:3px;
	box-shadow: 0px 2px 7px lightgrey;
}
.feed-output>H4 {padding-left:10px;}
.feed-output>span {padding-left:10px;}
.feed-upper {
	width:610px;
	height:60px;
	padding:10px;
	}
.feed-upper>name {font-size:20px;}
.feed-center>p { font-size:15px; text-align:left; padding:10px; clear:both;}
.feed-bottom { text-align:right; padding-right:15px; }
.reply-form {
	padding-left:20px;}
.reply-form>img {width:30px;}
.reply-form>textarea { 
	resize: none;
	overflow: hidden;
	font-size: 12px;
	margin: auto;
	border-radius:10px; }
</style>
</head>
<body>

		<div class="list">
			<% for(int i=0; i<10; i++) { %>
				<ol class="feed-output">
					<div class="feed-all">
						<div class="feed-upper">
							<div class="userimg"><img src="../img/avatar2.png" /></div>
							<div class="name">  Name</div>
							<span class="time">  10min <!-- 시간불러오기 --> </span>
						</div>
						<hr>
						<div class="feed-center">
							<p>내용출력<br><br><br></p>
						</div>
						<div class="feed-bottom">
							<button type="button"> reply </button>
						</div>
						<hr class="importpage">
						<div class="reply-form">
							<img src="../img/avatar5.png" />
							<textarea name="reply-write" cols="75" onkeydown="resize(this)" onkeyup="resize(this)"></textarea>
							<input type="submit" class="button3" value="등록하기" />
							</form>
							<% //댓글이 존재한다면 불러오기 if() %>

						</div>
					</div>
				</ol>
				<div class="blank"></div>
			<% } %>
		</div>


</body>
<script>
	function resize(obj) {
		obj.style.height = "1px";
		obj.style.height = (12 + obj.scrollHeight) + "px";
	}
</script>
</html>