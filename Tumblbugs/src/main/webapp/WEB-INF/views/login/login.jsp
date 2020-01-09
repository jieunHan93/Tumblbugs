<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>로그인</title>
<script src="http://localhost:9090/tumblbugs/js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/main.css">
<style>
*{
list-style-type: none;
}
body>div#logindiv1{
	margin: auto;
	width: 1080px;
}
body>div#logindiv1>div#bodysectiondiv>section#section1 {
	width: 310px;
    box-shadow: 0 1px 2px 1px #efefef;
    border: 1px solid #e4e4e4;
	border-radius: 5px 5px 5px 5px;
	margin:auto;
	margin-top:100px;
	margin-bottom:100px;
	padding: 40px 30px;
	font-size: 10pt;
	text-align: center;
}
#login_title_line {
	border-top: 1px solid #e4e4e4;
}

#div1 #login_title{
	display: inline-block;
	padding: 5px;
	color: gray;
	margin-top: -15px;
	background-color: white;
	font-weight: bold;
}
div#bodysectiondiv{
	margin: auto;
}
input#email {
	margin-top: 35px;
	width: 100%;
	padding: 12px;
	border: 1px solid #e4e4e4;
	border-radius: 5px;
}
input#email:hover{
	border-color: #1d85ea;
}
input#email:focus{
	border-color: #1d85ea;
}
input#pass{
	margin-top: 10px;
	width: 100%;
	padding: 12px;
	border: 1px solid #e4e4e4;
	border-radius: 5px;
}
input#pass:hover{
	border-color: #1d85ea;
}
input#pass:focus{
	border-color: #1d85ea;
}
button#btnlogin{
	width: 100%;
	padding: 13px 0px;
	border: none;
	border-radius:5px;
	background-color:#1e90ff;
	color: white;
	margin-top: 20px;
	font-weight: bold;
}
button#btnlogin:hover{
background-color: #1d85ea;
}
div#div2 h1{
	margin: 30px 0 7px 0;
	color:Gray;
	font-size: 10pt;
}
div#div2 h2{
	padding-bottom:25px;
	font-size: 10pt;
	border-bottom: 1px solid #e4e4e4;
	color: #1e90ff;
	margin-bottom: 30px;
}
div#div2 h2:hover{
	color: #1d85ea;
}
div#div2 a{
	text-decoration:none;
}
div#div3 a{
	color: #1e90ff;
	text-decoration:none;
	padding-bottom: 30px;
}
div#div3 a{
color: #1d85ea;
}
span#msglogin
{
	color: #1e90ff;
	font-size: 12px;
	margin: 0px 0 -15px 0;
	display: table;
}
</style>
<script>
	$(document).ready(function(){
		$("#btnlogin").click(function(){
			login();
		}); 
		
		$("input#pass").keydown(function (key) {
			if(key.keyCode == 13){
				login();
			}

		});
		
		function login() {
			if($("#email").val() == "") {
				alert("이메일 주소를 입력해주세요.");
				$("#email").focus();
			 } else if($("#pass").val() == "") {
				 alert("비밀번호를 입력해주세요.");
				 $("#pass").focus();
			 } else {
				 $.ajax({
						url:"http://localhost:9090/tumblbugs/login_proc?pass="+$("#pass").val()+"&email="+$("#email").val(),
						success: function(result){
							if(result == 'false'){
								$("#msglogin").html("아이디 또는 비밀번호가 올바르지 않습니다.");
								$("#email").val("").focus();
								$("#pass").val("");
							}if(result == 'n'){
								$("#msglogin").html("사용할 수 없는 이메일입니다.");
								$("#email").val("").focus();
								$("#pass").val("");
							}else if(result =='y'){
								if('${requestUrl}' != null && '${requestUrl}' != "") {
							 		location.href = '${requestUrl}';
							 	} else {
							 		location.href = 'http://localhost:9090/tumblbugs/index';
							 	}
							}			
						}
				});
			}
		}
	});
</script>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
	<div id="logindiv1">
		<div id="bodysectiondiv">
			<section id="section1">
					<div id="div1">
						<div id="login_title_line">
							<div id="login_title">로그인</div>
						</div>
						<form name="login_proc" action="/tumblbugs/login_proc" method="POST" class="login" id="login">
							<ul id="ul1">
								<span id="msglogin"></span>
								<li id="li1">
									<input type="email" name="email" id="email" placeholder="이메일 주소를 입력하세요." autocomplete="off" required>
								</li>
								<li>
									<input type="password" name="pass" id="pass" placeholder="비밀번호 입력하세요.">
								</li>
								<li>
									<button type="button" id="btnlogin">로그인</button>
								</li>
							</ul>
						</form>
						<div id="div2">
							<h1>아직 계정이 없으신가요?</h1>
							<a href="http://localhost:9090/tumblbugs/reg" ><h2>텀블벅 가입하기</h2></a>
						</div>
						<div id="div3">
							<a href="http://localhost:9090/tumblbugs/found">혹시 비밀번호를 잊으셨나요?</a>
						</div>
					</div>
			</section>
		</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>