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
body>div#logindiv1>section#section1 {
border:1px solid LightGray;
border-radius: 5px 5px 5px 5px; 
display: inline-block;
margin: 100px 0 100px 360px;
padding: 20px 50px 50px 50px;
box-shadow: 0px 0px 1px 0px rgba(0,0,0,0.1);
}


body>div#logindiv1>section#section1>div#div1>b#b1{
display: inline-block;
padding-left:100px;
color: LightGray;
border-bottom: 1px solid LightGray;
}
body>div#logindiv1>section#section1>div#div1>b#b2{
display: inline-block;
color:Gray;
}

body>div#logindiv1>section#section1>div#div1>b#b3{
display: inline-block;
padding-right:100px;
color: LightGray;
border-bottom: 1px solid LightGray;
}

input#email {
margin: 20px 0 0 0;
padding: 10px 40px 10px 10px;
width: 260px;
border: 1px solid #cdcdcd;
border-radius: 5px 5px 5px 5px; 
}
input#email:hover{
border-color: #1d85ea;
}
input#email:focus{
border-color: #1d85ea;
}
input#pass{
margin: 10px 0 0 0;
padding: 10px 40px 10px 10px;
width: 260px;
border: 1px solid #cdcdcd;
border-radius: 5px 5px 5px 5px; 
}
input#pass:hover{
border-color: #1d85ea;
}
input#pass:focus{
border-color: #1d85ea;
}
button#btnlogin{
border  : none;
background  : none;
border-radius:5px 5px 5px 5px;
background-color:#1e90ff;
color: white;
margin: 20px 0 0 0 ;
padding: 13px 105px 13px 105px;
}
button#btnlogin:hover{
background-color: #1d85ea;
}
div#div2 h1{
margin: 25px 0 0 0;
color:Gray;
font-size: 22px;
}
div#div2 h2{
margin: 25px 0 50px 0;
padding-bottom:25px;
font-size: 15px;
border-bottom: 1px solid #cdcdcd;
text-align: center;
color: #1e90ff;
}
div#div2 h2:hover{
color: #1d85ea;
}
div#div2 a{
text-decoration:none;
}

div#div3 a{
margin:-20px 0 0px 25px;
text-align: center;
color: #1e90ff;
text-decoration:none;
}
div#div3 a{
color: #1d85ea;
}
span#emailcheck,
span#emailcheckform,
span#pwcheck,
span#pwcheckform{
color: #1e90ff;
font-size: 12px;
}

</style>
<script type="text/javascript">
$(document).ready(function(){
	$("#emailcheck").hide();
	$("#emailcheckform").hide();
	$("#pwcheck").hide();
	$("#pwcheckform").hide();
	
	$("#email").focus(function () {
		$("#emailcheck").hide();
		$("#emailcheckform").hide();
		$("#pwcheck").hide();
		$("#pwcheckform").hide();
	});
	
	$("#pass").focus(function () {
		$("#emailcheck").hide();
		$("#emailcheckform").hide();
		$("#pwcheck").hide();
		$("#pwcheckform").hide();
	});
	
	$("#email").focusout(function(){
		$("#emailcheck").hide();
		$("#emailcheckform").hide();
		$("#pwcheck").hide();
		$("#pwcheckform").hide();
		
		if($("#email").val() == "" ){
			$("#emailcheck").show();
			$("#emailcheckform").hide();
			$("#pwcheck").hide();
			$("#pwcheckform").hide();
			
		}else{
			
			$("#emailcheck").hide();
			$("#emailcheckform").hide();
			$("#pwcheck").hide();
			$("#pwcheckform").hide();
			
			var emailVal = $("#email").val();
			var emailExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			
			if (emailVal.match(emailExp) != null) {
				
				$("#emailcheck").hide();
				$("#emailcheckform").hide();
				
		    }else {
		    	
				$("#emailcheck").hide();
			    $("#emailcheckform").show();			    
					
			}
		}
		
	})
	
	$("#pass").focusout(function (){
		$("#emailcheck").hide();
		$("#emailcheckform").hide();
		$("#pwcheck").hide();
		$("#pwcheckform").hide();
		
		if($("#pass").val() == ""){
			
			$("#emailcheck").hide();
			$("#emailcheckform").hide();
			$("#pwcheck").show();
			$("#pwcheckform").hide();
			
		}else{
			
			$("#emailcheck").hide();
			$("#emailcheckform").hide();
			$("#pwcheck").hide();
			$("#pwcheckform").hide();
			
			var pwVal = $("#pass").val();
			var pwExp = /^[A-Za-z0-9]{4,30}$/;
			
			if (pwVal.match(pwExp) != null) {
				$("#pwcheck").hide();
				$("#pwcheckform").hide();
				
		    }else {
		    	
				$("#pwcheck").hide();
			    $("#pwcheckform").show();
			    
					
			}
		}
		
	});
		
	
	
});
</script>
</head>
<body> 

<jsp:include page="../header.jsp"></jsp:include>
	<div id="logindiv1">
		<section id="section1">
				<div id="div1">
				<b id="b1"></b>
				<b id="b2">로그인</b>
				<b id="b3"></b> 
					<form action="/tumblbugs/login_proc" method="POST" class="login" id="login">
						<ul id="ul1">
							<li id="li1">
								<input type="text" name="email" id="email" placeholder="이메일주소를입력하세요.">
							</li>
							<span id="emailcheck">이메일을 입력해 주세요.</span>
							<span id="emailcheckform">이메일형식을 맞춰주세요.abc@abc.com</span>
							<li>
								<input type="password" name="pass" id="pass" placeholder="비밀번호 입력하세요.">
							</li>							
							<span id="pwcheck">비밀번호를 입력해주세요.</span>
							<span id="pwcheckform">비밀번호형식을 맞춰주세요. 4자리 이상</span>
							<li>
								<button type="submit" id="btnlogin">로그인</button>
							</li>
						</ul>
					</form>
						
					<div id="div2">
						<h1>아직 계정이 없으신가요?</h1>
						<a href="http://localhost:9090/tumblbugs/reg" ><h2>텀블벅 가입하기</h2></a>
					</div>
						
					<div id="div3">
						<a href="http://localhost:9090/tumblbugs/idfound">혹시 비밀번호를 잊으셨나요?</a>
					</div>
					
				</div>
			
		</section>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>