<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	nanum{
		font-family : 'Nanum Gothic';
	}
	header{
		width:800px;
		height:50px;
		border:solid;
		margin:0 auto;
	}
	section{
		overflow:hidden;
		width:800px;
		height:600px;
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
</head>
<body>
	<form action="/WebProject/AdControl?action=add" method="post" enctype="multipart/form-data">
	<header>
		title : <input type="text" name="title" size=70>
		id : <input type="text" name="id"><br>
		author : <input type="text" name="author" size=30>
		date : <input type="text" name="date" size=30>
		type : <select name="type">
			<option value="in">교내</option>
			<option value="out">교외</option>
		</select>
	</header>
	<section>
		본문<br>
		<textarea type="text" name="body" cols="97" rows="38" >
		</textarea>
	</section>
	<footer>
	이미지 첨부<input type="file" name="image"><br>
	<input type=submit value="글 쓰기">
	</footer>
	</form>
</body>
</html>