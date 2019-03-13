<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Document</title> 
<style>
@import url (http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
	h2{
		font-family : 'Nanum Gothic';
	}
	.container{
		width:850px;
		height:500px;
		margin:0 auto;
	}
	.page{
		float:left;
		width:250px;
		height:250px;
		background-size:100% 100%;
		text-align:left;
		margin:10px;
		border:2px solid #dddddd;
	}
	div a{
		text-decoration:none;
		display:block;
		width:100%;
		height:100%;
	}
	#div1{
    	display: table;
    	width: 100%;
    	height: 100%;
	}

	#div2 {
	    display: table-cell;
	    width: 100%;
	    height: 100%;
	    text-align: center;
	    vertical-align: middle;
}

</style>
 </head> 
 <body> 
 	<h2>
 	<div class="container">
	<div class="page" style="background-image:url(/WebProject/img/chicken.png);"><a href="/WebProject/BistroControl?type=chicken" target="type">
					  <font size="4" color="black">&nbsp;&nbsp;치킨</font><br>
					  <font size="3" color="gray">&nbsp;Chicken</font></a>
					</div>
	<div class="page" style="background-image:url(/WebProject/img/pizza.png);"><a href="/WebProject/BistroControl?type=pizza" target="type">
					  <font size="4" color="black">&nbsp;&nbsp;피자</font><br>
					  <font size="3" color="gray">&nbsp;Pizza</font></a>
					</div>
	<div class="page" style="background-image:url(/WebProject/img/chinese.png);"><a href="/WebProject/BistroControl?type=chinese" target="type">
					  <font size="4" color="black">&nbsp;&nbsp;중국집</font><br>
					  <font size="3" color="gray">&nbsp;Chinese food</font></a>
					</div>
	<div class="page" style="background-image:url(/WebProject/img/japanese.png);"><a href="/WebProject/BistroControl?type=japanese" target="type">
					  <font size="4" color="black">&nbsp;&nbsp;일식</font><br>
					  <font size="3" color="gray">&nbsp;Japanese Food</font></a>
					</div>
	<div class="page" style="background-image:url(/WebProject/img/korean.png);"><a href="/WebProject/BistroControl?type=korean" target="type">
					  <font size="4" color="black">&nbsp;&nbsp;한식</font><br>
					  <font size="3" color="gray">&nbsp;Korean Food</font></a>
					</div>
	<div class="page" style="background-image:url(/WebProject/img/hotdog.png);"><a href="/WebProject/BistroControl?type=hotdog" target="type">
				      <font size="4" color="black">&nbsp;&nbsp;핫도그/부리또</font><br>
					  <font size="3" color="gray">&nbsp;Hotdog/Burrito</font></a>
					</div>
	</div>
	<div id="div1">
   		 <div id="div2">
			<iframe align="center" src="" width="400" height="200" name="type" frameborder="0"></iframe>
		</div>
	</div>
	</h2>
</body> 
</html> 