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
border:1px solid LightGray;
border-radius: 5px 5px 5px 5px; 
/* display: inline-block; */
/* margin: 100px 0 100px 360px; */
margin:auto;
margin-top:100px;
margin-bottom:100px;
display:table;
padding: 20px 50px 50px 50px;
box-shadow: 0px 0px 1px 0px rgba(0,0,0,0.1);
}


body>div#logindiv1>div#bodysectiondiv>section#section1>div#div1>b#b1{
display: inline-block;
padding-left:100px;
color: LightGray;
border-bottom: 1px solid LightGray;
}
body>div#logindiv1>div#bodysectiondiv>section#section1>div#div1>b#b2{
display: inline-block;
color:Gray;
}

body>div#logindiv1>div#bodysectiondiv>section#section1>div#div1>b#b3{
display: inline-block;
padding-right:100px;
color: LightGray;
border-bottom: 1px solid LightGray;
}
div#bodysectiondiv{
margin: auto;

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
span#pwcheckform,
span#login_success,
span#login_fail,
span#msglogin
{
color: #1e90ff;
font-size: 12px;
margin: 0px 0 -15px 0;
display: table;
}

</style>
<script type="text/javascript">

$(document).ready(function(){
	 $("#btnlogin").click(function(){
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
						}else{
						 	if('${requestUrl}' != null && '${requestUrl}' != "") {
						 		location.href = '${requestUrl}';
						 	} else {
						 		location.href = 'http://localhost:9090/tumblbugs/index';
						 	}
						}			
					}
			});
		}
		  
		
	}); 
	
});
</script>
</head>
<body> 

<jsp:include page="../header.jsp"></jsp:include>
	<div id="logindiv1">
		<div id="bodysectiondiv">
			<section id="section1">
					<div id="div1">
					<b id="b1"></b>
					<b id="b2">로그인</b>
					<b id="b3"></b> 
						<form name="login_proc" action="/tumblbugs/login_proc" method="POST" class="login" id="login">
							<ul id="ul1">
								<span id="msglogin"></span>
								<li id="li1">
									<input type="text" name="email" id="email" placeholder="이메일 주소를 입력하세요." >
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