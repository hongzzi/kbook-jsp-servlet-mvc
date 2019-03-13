<%@page import="model.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
div.container {
   width: 700px;
   border:1px solid lightGary;
   position:relative;
   margin:auto;
   font-family:"나눔스퀘어";
}
div.container table.friendsList{
   position:relative;
   width:500px;
   margin-right:200px;
}
div.container table.friendsList td.memberImg{
   width:100px;
}
div.container table.friendsList td.memberInfo{
   width:300px;
   font-size:17px;
}
div.container table.friendsList td.addFriend{
   width:100px;
}
div.container table.friendsList td.memberImg img{
   width:70px;
   height:70px;
   border-radius:70px;
}

div.container table.friendsList td.addFriend input.addFriend{
   width:30px;
   height:30px;
   border-radius:70px;
   background-image: url('../img/add.png');
   background-size: 30px 30px;
   border:0;
}
div.container table.friendsList td.addFriend input:hover{
   cursor:pointer;
}
</style>
<body>
<%ArrayList<Member> result = (ArrayList<Member>)session.getAttribute("result");
Member user = (Member)session.getAttribute("member"); %>

   <div class="container">
      <table class="friendsList">
         <%for(int i=0; i<result.size(); i++){
            %>
         <tr>
            <td class="memberImg"><img alt="멤버 사진" src="../img/user.PNG"></td>
            <td class="memberInfo"><%=result.get(i).getName() %><br><%=result.get(i).getDepartment() %></td>
            <td class="addFriend">
            <form action="/WebProject/EventControl?action=addFriend" method="post" class="login">
               <input type="hidden" name="useremail" value="<%=user.getEmail()%>">
               <input type="hidden" name="friendemail" value="<%=result.get(i).getEmail()%>">
               <input type="submit" class="addFriend" value="">
            </form>
            </td>
         </tr>
         <%} %>
      </table>
   </div>

</body>
</html>