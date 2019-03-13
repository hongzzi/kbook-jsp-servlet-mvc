<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="ad" class="model.Ad" scope="request"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	header{
		width:800px;
		height:30px;
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
</style>
<body>

	<header>제목 : <jsp:getProperty name="ad" property="title"/></header>
	<section>
		글번호 : <jsp:getProperty name="ad" property="id"/> <br>
		글쓴이 : <jsp:getProperty name="ad" property="author"/><br>
		글내용 : <jsp:getProperty name="ad" property="body"/><br>
		이벤트 기간 : <jsp:getProperty name="ad" property="date"/><br>
		이미지 : <img src="/WebProject/ADupload/<jsp:getProperty name="ad" property="image"/>"/>
	</section>
	<footer>
	<form action="AdControl?action=delete&id=<%=ad.getId()%>" method="post">
			<input type="submit" value="삭제">
		</form>
	<a href="AdControl">광고창으로 돌아가기</a>
	</footer>
</body>
</html>