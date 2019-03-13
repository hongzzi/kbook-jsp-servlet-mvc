<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>144210</title>
<style type="text/css">
table {
       border-collapse: collapse;
}
html{
	background-color:#ECEBFF;
}
</style>
</head>
<body>
	<nav style="position:fixed;float:top;top:0;right:0;width: 100%;padding:0px; height:50px;margin:0px;z-index:1;"><jsp:include page="templateTop.jsp" /></nav>
	<table style="position:relative;top:70px;width: 100%; height: 100%; max-width:1300px; margin-left:auto;margin-right:auto; margin-top:0;margin-bottom:o;padding:0;">
		<tr height="80%">
			<td valign="top" style="width:235px;"><jsp:include page="templateCenterLeft.jsp" /></td>
			<td valign="top"><jsp:include page="FoodAD.jsp" /></td>
			<td valign="top" style="width:210px;"><jsp:include page="template_Right.jsp" /></td>
		</tr>
	</table>
</body>
</html>