<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String email = request.getParameter("email");%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<script src="http://localhost:9090/tumblbugs/js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/main.css">
<style>
	*{
		list-style-type: none;
	}
	#join{
		width:1080px;
		margin: auto;
		padding: 100px 0px;
	}
	#join #section1 {
		border: 1px solid #e4e4e4;
		width: 310px;
		margin: auto;
		padding: 40px 30px;
		box-shadow: 0 1px 2px 1px #efefef;
		border-radius: 5px;
		text-align: center;
		font-size: 10pt;
	}
	
	#join_title_line {
		border-top: 1px solid #e4e4e4;
	}
	
	#div1 #join_title{
		display: inline-block;
		padding: 5px 7px;
		color: gray;
		margin-top: -15px;
		background-color: white;
		font-weight: bold;
		font-size: 10.5pt;
	}
	#join #input_title {
		margin-top: 15px;
		margin-bottom: 5px;
		color: #757575;
		text-align: left;
	}
	
	#join input:hover, #join input:focus {
		border-color: #1d85ea;
	}
	
	#join input {
		width: 100%;
		padding: 12px;
		border: 1px solid #e4e4e4;
		border-radius: 5px;
	}
	input#pass2 {
		margin-top: 8px;
	}
	
	button#btnJoin{
		width: 100%;
		border: none;
		border-radius: 5px;
		background-color:#1e90ff;
		color: white;
		font-weight: bold;
		margin-top: 20px;
		padding: 12px 0px;
	}
	button#btnJoin:hover{
		background-color: #1d85ea;
	}
	div#div2 h1{
		margin-top: 25px;
		padding: 25px 0px 5px 0px;
		color: #757575;
		font-size: 10pt;
		text-align: center;
		border-top: 1px solid #efefef;
	}
	div#div2 h2{
		font-size: 10pt;
		text-align: center;
		color: #1e90ff;
	}
	div#div2 h2:hover{
		color: #1d85ea;
	}
	div#div2 a{
		text-decoration:none;
	}
	div#emailcheck,
	div#pwcheck,
	div#pwcheckform,
	div#emailcheckform,
	div#namecheck,
	div#namecheckform,
	div#emailcheckformre,
	div#pwcheckformre,
	div#emailchecksame
	{
		color: #1e90ff;
		font-size: 12px;
		text-align: left;
		padding-top: 3px;
	}
</style>
<script>
$(document).ready(function(){
	$("#emailcheck").hide();
	$("#pwcheck").hide();
	$("#pwcheckform").hide();
	$("#emailcheckform").hide();
	$("#namecheck").hide();
	$("#namecheckform").hide();
	$("#emailcheckformre").hide();
	$("#pwcheckformre").hide();
	$("#emailchecksame").hide();
	
 	$("#name").focusout(function(){
		if($("#name").val() == ""){
			$("#namecheck").show();
			$("#namecheckform").hide();
		}else{
			$("#namecheck").hide();
			
			/* var nameVal = $("#name").val();			
			var nameExp = /^[가-힣a-zA-Z]+$/;

			if (nameVal.match(nameExp) != null) {	
				$("#namecheck").hide();
				$("#namecheckform").hide();				
			}else {  
					$("#namecheck").hide();
					$("#namecheckform").show();	
			} */
		}
	})
	
	$("#email").focusout(function(){
		if($("#email").val() == "" ){
			$("#emailcheck").show();
			$("#pwcheck").hide();
			$("#pwcheckform").hide();
			$("#emailcheckform").hide();
			$("#emailchecksame").hide();
		}else{
			$("#emailcheck").hide();
			$("#pwcheck").hide();
			$("#pwcheckform").hide();
			$("#emailcheckform").hide();
		
			
			var emailVal = $("#email").val();
			var emailExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			if (emailVal.match(emailExp) != null) {
				$("#emailcheck").hide();
				$("#pwcheck").hide();
				$("#pwcheckform").hide();
				$("#emailcheckform").hide();
				/* ajax function  안에서 정의된 메소드는 밖으로 못나감  */
				 $.ajax({
					 url: "reg_email_chk?email="+$("#email").val(), 
					 success: function(result){
						 
					   if(result == '1'){
							$("#emailchecksame").show();
							$("#emailcheckform").hide();
					   }else{
							$("#emailchecksame").hide();
							$("#emailcheckform").hide();
					   }
				 }});	
			  
			  } else {
			  
				$("#emailcheckform").show();
				$("#emailcheck").hide();
				$("#pwcheck").hide();
				$("#pwcheckform").hide();
			}
		}
	})

 
	$("#pass").focusout(function() {
		if($("#pass").val() == "" ){
			$("#pwcheckform").hide();
			$("#pwcheck").show();
		}else{
			$("#pwcheck").hide();
			var pwVal = $("#pass").val();
			var pwExp = /^[A-Za-z0-9]{4,30}$/;
			
			if (pwVal.match(pwExp) != null) {
				$("#pwcheckform").hide();
			} else {
				$("#pwcheckform").show();
			}
		}
	}) 
	
	$("#pass2").focusout(function() {
		if($("#pass").val() != "" && $("#pass2").val() != "") {
			if($("#pass").val() != $("#pass2").val()){
				$("#pwcheckformre").show();
			}else{
				$("#pwcheckformre").hide();
			}
		}
	});
 	
 	
	$("#btnJoin").click(function(){
		if($("#name").val() == "") {
			alert("이름을 입력해주세요.");
			$("#name").focus();
		} else if($("#email").val() == "") {
			alert("이메일 주소를 입력해주세요.");
			$("#email").focus();
		} else if($("#pass").val() == "") {
			alert("비밀번호를 입력해주세요.");
			$("#pass").focus();
		} else if($("#pass2").val() == "" || ($("#pass").val() != $("#pass2").val())) {
			alert("비밀번호를 확인해주세요.");
			$("#pass2").focus();
		} else {
			joinForm.submit();
		}
	});
	
	
});
</script>
</head>
<body> 

<jsp:include page="../header.jsp"></jsp:include>
	<div id="join">
		<section id="section1">
				<div id="div1">
					<div id="join_title_line">
						<div id="join_title">회원가입</div>
					</div>
					<form action="/tumblbugs/reg_proc" method="post" name="joinForm">
						<ul id="ul1">
							<li id="li1">
								<div id="input_title">이름</div>
								<input type="text" name="name" id="name" placeholder="사용하실 이름을 입력해주세요" maxlength="10" autocomplete="off">
								<!-- <div id="namecheck">이름을 입력하세요.</div> -->
								<!-- <div id="namecheckform">한글과 영어 단어만 입력하세요.</div> -->
							</li>
							<li id="li2">
								<div id="input_title">이메일 주소</div>
								<input type="text" name="email" id="email" placeholder="이메일 주소를 입력해주세요" autocomplete="off">
								<!-- <div id="emailcheck">이메일 주소를 입력하세요</div> -->
								<div id="emailcheckform">이메일 형식을 맞춰주세요. ex)abc@tumblbugs.com</div>
								<div id="emailchecksame">이미 등록된 이메일입니다.</div>
							</li>
							<li	id="li4">
								<div id="input_title">비밀번호</div>
								<input type="password" name="pass" id="pass" placeholder="비밀번호를 입력헤주세요">
							</li>
							<li id="li5">
								<input type="password" name="pass2" id="pass2" placeholder="비밀번호를 확인합니다">
								<!-- <div id="pwcheck">비밀번호를 입력해주세요.</div> -->
								<div id="pwcheckform">비밀번호는 4자리 이상이어야 합니다.</div>
								<div id="pwcheckformre">비밀번호가 일치하지 않습니다</div>
							</li>
							<li id="li6">
								<button type="button" id="btnJoin">회원가입</button>
							</li>
						</ul>
					</form>
					<div id="div2">
						<h1>이미 계정이 있으신가요?</h1>
						<a href="http://localhost:9090/tumblbugs/login"><h2>기존 계정으로 로그인하기</h2></a>
					</div>
				</div>
		</section>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>