<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="controller.*" %>
<%
String email = request.getParameter("userid");
Email sendEmail = new Email();
String auth = sendEmail.RandomNum();
if(sendEmail.sendEmail(email,auth)){
	out.write(auth+"");
}else if(!sendEmail.sendEmail(email,auth)){
	int result=0;
	out.write("");
}
%>