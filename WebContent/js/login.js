$(document).ready(function() {
		var boxTop = $('div.Box').height()/2-($('div.loginBox').height()/2+$('div.questionBox').height()/2);
		$('div.loginBox').css({'top':boxTop});
		$('div.questionBox').css({'top':boxTop});
		
		var boxTop2 = $('div.Box').height()/2-($('div.imgBox').height()/2);
		$('div.imgBox').css({'top':boxTop2});
		
		$('p.a').click(function(){
			if($('div.loginBox').css("display")=="block"){
				$('div.loginBox').css({"display":"none"});
			    $('div.joinBox').css({"display":"block"});
			    var boxTop2 = $('div.Box').height()/2-($('div.joinBox').height()/2+$('div.questionBox').height()/2);
				$('div.joinBox').css({"top":boxTop2});
				$('div.questionBox').css({"top":boxTop2});
				$('p.q').text("계정이 이미 있으신가요?");
				$('p.a').text("로그인하기");	
			}else if($('div.loginBox').css("display")=="none"){
				$('div.loginBox').css({"display":"block"});
			    $('div.joinBox').css({"display":"none"});
			    var boxTop2 = $('div.Box').height()/2-($('div.loginBox').height()/2+$('div.questionBox').height()/2);
				$('div.loginBox').css({"top":boxTop2});
				$('div.questionBox').css({"top":boxTop2});
				$('p.q').text("계정이 없으신가요?");
				$('p.a').text("가입하기");	
			}
		});
		$('input.button1').click(function(){
			if($('.internal').css('display')=='block'){
				if($('.internal > input.joinuserpw').val()==''){
					alert('비밀번호를 입력하세요');
					return false;
				}
				if($('.internal > input.joinname').val()==''){
					alert('이름을 입력하세요');
					return false;
				}
				if($('.internal > input.joindepartment').val()==''){
					alert('소속학과를 선택하세요');
					return false;
				}
				if($('.internal > input.check').val()=='uncheck'){
					alert('이메일 중복체크를 해주세요.');
					return false;
				}
				if($('.internal > input.check2').val()=='uncheck'){
					alert('학교 이메일 입력후 이메일 인증을 실행 해주세요.');
					return false;
				}
			}
			
			else if($('div.external').css('display')=='block'){
				if($('.external > input.joinuserpw').val()==''){
					alert('비밀번호를 입력하세요');
					return false;
				}
				if($('.external > input.joinname').val()==''){
					alert('이름을 입력하세요');
					return false;
				}
				if($('.external > input.check').val()=='uncheck'){
					alert('이메일 중복체크를 해주세요.');
					return false;
				}
				if($('.external > input.check2').val()=='uncheck'){
					alert('이메일 입력후 이메일 인증을 실행 해주세요.');
					return false;
				}
			}
			
		});
		$('input.button2').click(function(){
			if($('input.loginemail').val()==''){
				alert('학교 이메일을 입력하세요');
				return false;
			}
			/*if($('input.loginuserpw').val()==''){
				alert('비밀번호를 입력하세요');
				return false;
			}*/
		});
		
	});