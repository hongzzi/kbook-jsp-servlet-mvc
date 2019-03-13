<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

.container {
	position: relative;
	max-width: 650px;
	margin: auto;
	font-family: 'Nanum Gothic', serif;
}

.feed-write {
	max-width: 630px;
	height: 100%;
	background-color: white;
	padding: 10px; box-shadow : 0 4px 8px 0 rgba( 0, 0, 0, 0.2), 0 6px 20px
	0 rgba( 0, 0, 0, 0.19);
	text-align: center;
	border:1px solid LightGray;
    border-radius:3px;
	box-shadow: 0px 2px 7px lightgrey;
}

.feed-write2> textarea {
	resize: none;
	overflow: hidden;
	font-size: 18px;
	margin: auto;
}

.feed-write2 {
	padding: 10px;
}

.feed-submit {
	text-align: right;
	padding-right: 15px;
}

div.feed-submit input.button {
	background-color: #005766;
	border: none;
	color: white;
	padding: 10px 28px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
}
.blank2 { width:680px; height:50px;}
</style>

</head>
<body>
	<div class="container">
		<div class="feed-write">
			<p>
			<form name="" action="" method="post">
				<div class="feed-write2">
					<textarea name="text-write" cols="70" onkeydown="resize(this)"
						onkeyup="resize(this)"></textarea>
				</div>
				<div class="feed-submit">
					<span><input type="submit" class="button" value="POST" /></span>
				</div>
			</form>
		</div>
	<div class="blank2"></div>
		<div class="under">
			<jsp:include page="./importpage.jsp" />
		</div>
	
		<a href="#"> more </a>
	</div>

</body>



<script>
	function resize(obj) {
		obj.style.height = "1px";
		obj.style.height = (12 + obj.scrollHeight) + "px";
	}
</script>
</html>