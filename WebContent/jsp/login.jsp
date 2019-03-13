<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>144210</title>
<link href="/WebProject/css/login.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript" src="/WebProject/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/WebProject/js/login.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
			$('input:radio[class=internal]').click(function() {
				console.log("click");
				$('input.internal').prop("checked", true);
				$('div.internal').css('display','block');
				$('div.external').css('display','none');
			});
			
			$('input:radio[class=external]').click(function() {
				console.log("click");
				$('input.external').prop("checked", true);
				$('div.internal').css('display','none');
				$('div.external').css('display','block');
			});
		//이메일 중복확인 코드
		$('input.emailCheck').click(function() {
			var email = $('input.joinemail').val();
			$.ajax({
				type : 'POST',
				data : {
					userid : email
				},
				url : '/WebProject/jsp/emailCheck.jsp',
				success : function(result) {
					if (jQuery.trim(result) == '0') {
						alert('사용가능한 이메일주소 입니다.');
						$(".internal > input.joinemail").css('color',"Gray");
						$(".internal > input.joinemail").attr("readonly",true);
						$('.internal > input.joinname').focus();
						$('.internal > input.check').val("check");
					} else if (jQuery.trim(result) == '1') {
						alert('이미 가입된 학교 이메일 입니다.');
						$('.internal > input.joinemail').val("");
						$('.internal > input.joinemail').focus();
					} else if (jQuery.trim(result) == '2') {
						alert('값을 입력해주세요.');
						$('.internal > input.joinemail').val("");
						$('.internal > input.joinemail').focus();
					}else if (jQuery.trim(result) == '3') {
						alert('경기대학교 학교이메일을 입력해주세요.\n @kyonggi.ac.kr 을 포함해야 합니다.');
						$('.internal > input.joinemail').val("");
						$('.internal > input.joinemail').focus();
					}
				}
			})
		});
		
		$('input.emailCheck2').click(function() {
			var email = $('.external > input.joinemail').val();
			$.ajax({
				type : 'POST',
				data : {
					userid : email
				},
				url : '/WebProject/jsp/emailCheck2.jsp',
				success : function(result) {
					if (jQuery.trim(result) == '0') {
						alert('사용가능한 이메일주소 입니다.');
						$(".external > input.joinemail").css('color',"Gray");
						$(".external > input.joinemail").attr("readonly",true);
						$('.external > input.joinname').focus();
						$('.external > input.check').val("check");
					} else if (jQuery.trim(result) == '1') {
						alert('이미 가입된 학교 이메일 입니다.');
						$('.external > input.joinemail').val("");
						$('.external > input.joinemail').focus();
					} else if (jQuery.trim(result) == '2') {
						alert('값을 입력해주세요.');
						$('.external > input.joinemail').val("");
						$('.external > input.joinemail').focus();
					}else if (jQuery.trim(result) == '3') {
						alert('이메일을 입력해주세요.\n @을 포함해야 합니다.');
						$('.external > input.joinemail').val("");
						$('input.joinemail').focus();
					}
				}
			})
		});
		
		//학교 메일 인증 코드
		var str=null;
		$('.internal > input.sendEmail').click(function() {
			console.log("이메일인증");
			var click = $('.internal > input.sendEmail').val();
			var email = $('.internal > input.joinemail').val();
			if(click=='이메일 인증받기'){
				$.ajax({
					type : 'POST',
					data : {
						userid : email
					},
					url : '/WebProject/jsp/authEmail.jsp',
					success : function(result) {
						if (jQuery.trim(result) != '') {
							alert('인증번호를 전송하였습니다.');
							$('.internal > input.inputAuth').focus();
							$('.internal > input.sendEmail').val("인증번호 확인");
							str=null;
							str=jQuery.trim(result);
							console.log(str);
						}
					}
				})
			}else if(click=='인증번호 확인'){
				var input = $('.internal > input.inputAuth').val();
				if(str==input){
					alert('이메일 인증에 성공하였습니다.');
					$('.internal > input.joinname').focus();
					$('.internal > input.sendEmail').val("인증번호 확인");
					$(".internal > input.inputAuth").attr("readonly",true);
					$(".internal > input.inputAuth").css('color',"Gray");
					$('.internal > input.check2').val("check");
				}else if(str!=input){
					alert('인증번호가 올바르지 않습니다.');
				}
			}
		});
		
		$('.external > input.sendEmail2').click(function() {
			var click = $('.external > input.sendEmail2').val();
			var email = $('.external > input.joinemail').val();
			if(click=='이메일 인증받기'){
				$.ajax({
					type : 'POST',
					data : {
						userid : email
					},
					url : '/WebProject/jsp/authEmail.jsp',
					success : function(result) {
						if (jQuery.trim(result) != '') {
							alert('인증번호를 전송하였습니다.');
							$('.external > input.inputAuth').focus();
							$('.external > input.sendEmail2').val("인증번호 확인");
							str=null;
							str=jQuery.trim(result);
							console.log(str);
						}
					}
				})
			}else if(click=='인증번호 확인'){
				var input = $('.external > input.inputAuth').val();
				if(str==input){
					alert('이메일 인증에 성공하였습니다.');
					$('.external > input.check2').val("check");
					$('.external > input.joinname').focus();
					$('.external > input.sendEmail').val("인증번호 확인");
					$(".external > input.inputAuth").attr("readonly",true);
					$(".external > input.inputAuth").css('color',"Gray");
				}else if(str!=input){
					alert('인증번호가 올바르지 않습니다.');
				}
			}
		});
});
</script>
<style type="text/css">
div.joinBox input{
border-radius:70px;
}
div.joinBox input.emailCheck, div.joinBox input.emailCheck2 {
position: relative;top: -54px;right:-30px;width:110px;height:34px;background: none;border: 0;
}
div.joinBox input.joinname{
position:relative;top:-52px;
}
div.joinBox input.joindepartment{
position:relative;top:-52px;width: 100%;height:34px;margin-top:10px;margin-bottom:10px;
}
div.joinBox input.joinuserpw{
position:relative;top:-52px;
}

</style>
</head>
<body>
<div id="wrap">
	<div class="Box">
		<div class="imgBox">
			<img alt="PHONE" src="/WebProject/img/PHONE.PNG">
		</div>
		<div class="joinBox" style="padding-bottom:0;">
			<span></span>
			<form action="/WebProject/EventControl?action=join" method="post" class="join" name="join">
				<div class="name"><img alt="KGU" src="/WebProject/img/KGU.PNG"></div>
				
				<input type="radio" name="internal" value="경기대학생" class="internal"checked="checked" style="margin-left:45px;width:15px; height:15px;"><label style="font-size:13px;position:relative; bottom:3px;">경기대학생</label>
				<input type="radio" name="internal" value="외부회원" class="external" style="width:15px; height:15px;"><label style="font-size:13px;position:relative; bottom:3px;">외부회원</label><br>
				<div class="internal">
					<input class="joinemail" type="text" name="email" placeholder="  학교이메일">
					<input class="emailCheck" type="button" value="아이디 중복체크">
					<input class="check" type="hidden" value="uncheck">
					<input class="sendEmail" type="button" value="이메일 인증받기"style="positon:relative; float:left;width:140px;margin-right:20px;height:34px;">
					<input class="inputAuth" type="text" placeholder="  인증번호"style="position:relative; float:right;width:140px;top: -52px;">
					<input class="check2" type="hidden" value="uncheck">
					<br>
					<input class="joinname" type="text" name="name" placeholder="  이름">
					<br>
					<select class="joindepartment" type="text" name="department" placeholder="  소속학과" style="position: relative;top:-53px; width: 100%;height: 33px;margin-bottom: 10px;margin-top: 10px;">
					<option value="">-----학과를 선택해주세요-----</option>
					<option value="컴퓨터과학과">컴퓨터과학과</option>
	  				<option value="수학과">수학과</option>
	  				<option value="융합보안학과">융합보안학과</option>
	  				<option value="건축학과">건축학과</option>
					
					</select>
					<br>
					<input class="joinuserpw" type="password" name="userpw" placeholder="  비밀번호">
					<br>
					<input class="button1" type="submit" value="JOIN"style="position:relative;top:-52px;background-color:snow;border:0;">
				</div>
				
				
				
				<div class="external" style="display:none;">
					<input class="joinemail" type="text" name="email" placeholder="  이메일">
					<input class="emailCheck2" type="button" value="아이디 중복체크">
					<input class="check" type="hidden" value="uncheck">
					<input class="sendEmail2" type="button" value="이메일 인증받기"style="positon:relative; float:left;width:140px;margin-right:20px;height:34px;">
					<input class="inputAuth" type="text" placeholder="  인증번호"style="position:relative; float:right;width:140px;top: -52px;">
					<input class="check2" type="hidden" value="uncheck">
					<br>
					<input class="joinname" type="text" name="name" placeholder="  이름">
					<br>
					<input class="joindepartment" type="hidden" name="department" placeholder="  소속학과" value="외부회원">
					<input class="joinuserpw" type="password" name="userpw" placeholder="  비밀번호">
					<br>
					<input class="button1" type="submit" value="JOIN"style="position:relative;top:-52px;background-color:snow;border:0;">
				</div>
			</form> 
		</div>
		<div class="loginBox">
			<span></span>
			<form action="/WebProject/EventControl?action=login" method="post" class="login">
				<div class="name"><img alt="KGU" src="/WebProject/img/KGU.PNG"></div>
				<input class="loginemail" type="text" name="email" placeholder="  학교이메일 주소">
				<br>
				<input class="loginuserpw" type="password" name="userpw" placeholder="  비밀번호">
				<br>
				<input class="button2" type="submit" value="LOGIN" style="background-color:snow;border:0;">
			</form> 
		</div>
		<div class="questionBox">
			<p class="q">계정이 없으신가요?
			<p class="a">가입하기
		</div>
	</div>
</div>

</body>
</html>