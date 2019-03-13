<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="dao.MemberDAO" %>
<%
String email = request.getParameter("userid");
System.out.println("????????");
System.out.println("이메일 중복 체크 : " + email);
MemberDAO dao = new MemberDAO();
try{
	boolean isCheck = dao.emailCheck(email);
	if(email.equals("")){
		int result=2;
		out.write(result+"");
	}else if(!email.contains("@")){
		int result=3;
		out.write(result+"");
	}else{
		if(isCheck){
			int result=1;
			out.write(result+"");
		}else if(!isCheck){
			int result=0;
			out.write(result+"");
		}	
	}
}catch(Exception e){
		System.out.println(e.toString());
		e.printStackTrace();

}
%>