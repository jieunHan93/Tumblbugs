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
body>div#logindiv1{

width:1080px;
margin: auto;

}
body>div#logindiv1>section#section1 {
border:1px solid #dcdcdc;
display: inline-block;
margin: 100px 0 100px 360px;
padding: 20px 50px 50px 50px;
box-shadow: 0px 0px 0px 1px rgba(0,0,0,0.1);
border-radius: 5px 5px 5px 5px; 
}


body>div#logindiv1>section#section1>div#div1>b#b1{
display: inline-block;
padding-left:100px;
color: LightGray;
border-bottom: 1px solid LightGray;x
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

input#email,input#email2{
margin: 5px 0 0 0;
padding: 10px 20px 10px 10px;
width: 270px;
border: 1px solid #dcdcdc;
border-radius: 5px 5px 5px 5px; 
}
input#email:hover{
border-color: #1d85ea;
}
input#email2:hover{
border-color: #1d85ea;
}
input#email:focus{
border-color: #1d85ea;
}
input#email2:focus{
border-color: #1d85ea;
}
input#name {
margin: 0px 0 0 0;
padding: 10px 40px 10px 10px;
width: 270px;
border: 1px solid #dcdcdc;
border-radius: 5px 5px 5px 5px; 
}
input#name:hover{
border-color: #1d85ea;
}
input#name:focus{
border-color: #1d85ea;
}
input#pass,input#pass2{
margin: 5px 0 0 0;
padding: 10px 40px 10px 10px;
width: 270px;
border: 1px solid #dcdcdc;
border-radius: 5px 5px 5px 5px; 
}
input#pass:hover,input#pass2:hover{
border-color: #1d85ea;
}
input#pass:focus,input#pass2:focus{
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
color:#1d85ea;
font-size: 20px;
text-align: center;
}
div#div2 h2{
margin: 25px 0 0px 0;
padding-top:25px;
font-size: 15px;
border-top: 1px solid #dcdcdc;
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
color: #F07878;
text-decoration:none;
}
b#b4{
margin-top: 20px;
text-decoration: none;
display: inline-block;
color: Gray;
}
b#b5{
text-decoration: none;
display: inline-block;
color: Gray;
margin-top: 20px;
}
b#b6{
text-decoration: none;
display: inline-block;
color: Gray;
margin-top: 20px;
}
span#emailcheck,
span#pwcheck,
span#pwcheckform,
span#emailcheckform,
span#namecheck,
span#namecheckform,
span#emailcheckformre,
span#pwcheckformre,
span#emailchecksame
{
color: #1e90ff;
font-size: 12px;
}

</style>
<script type="text/javascript">

 
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
			
			var nameVal = $("#name").val();			
			var nameExp = /^[가-힣a-zA-Z]+$/;

			if (nameVal.match(nameExp) != null) {	
				$("#namecheck").hide();
				$("#namecheckform").hide();				
			  }else {  
					$("#namecheck").hide();
					$("#namecheckform").show();	
			  }
		}
		
		if($("#name").val() == ""){

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
				
			  }
			  else {
				 $("#pwcheckform").show();
			
			  }
		}
	
	}) 
	
	$("#pass2").focusout(function() {
		
		
		if($("#pass").val() != $("#pass2").val()){
			$("#pwcheckformre").show();
			
		}else{
			$("#pwcheckformre").hide();
		
		}
	});
	
	$("#btnlogin").click(function(){
		
		
        
		if($("#name").val() == "" ){
			alert("이름입력");
			return false;
		}else{
			var nameVal = $("#name").val();			
			var nameExp = /^[가-힣a-zA-Z]+$/;

			if (nameVal.match(nameExp) == null) {	
					return false;	
			}
	
		}
		if($("#email").val() == "" ){
			return false;
		}else{
			var emailVal = $("#email").val();			
			var emailExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			
			if (emailVal.match(emailExp) == null) {				
					return false;
			}else{
				
				$.ajax({
					 url: "reg_email_chk?email="+$("#email").val(), 
					 success: function(result){
						 
					   if(result == '1'){
							$("#emailchecksame").show();
							$("#emailcheckform").hide();
					   }else{
							$("#emailchecksame").hide();
							$("#emailcheckform").hide();
							return false;
					   }
					   
				 }});	
			}
	
			
		}
		

		if($("#pass").val() == "" ){
			alert("비밀번호입력");
			return false;
		}else{
			var pwVal = $("#pass").val();
			var pwExp = /^[A-Za-z0-9]{4,30}$/;
			
			if (pwVal.match(pwExp) == null) {
				return false;
			}			
		}
		
		if($("#pass2").val() == "" ){
			alert("비밀번호입력");
			return false;
		}else if($("#pass").val() != $("#pass2").val()){
			return false;
		}else{
			alert("등록된 이메일로 인증 주소가 전송되었습니다.이메일로 접속하여 주소를 클릭후 인증해 주세요.");
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
				<b id="b2">회원가입</b>
				<b id="b3"></b> 
					<form action="/tumblbugs/reg_proc" method="post">
						<ul id="ul1">
							<li id="li1">
								<b id="b4">이름</b><br>
								<input type="text" name="name" id="name" placeholder="이름을 입력" maxlength="10">
								<br>
								<span id="namecheck">이름을 입력하세요.</span>
								<span id="namecheckform">한글과 영어 단어만 입력하세요.</span>
							</li>
							<li id="li2">
								<b id="b5">이메일</b><br>
								<input type="text" name="email" id="email" placeholder="이메일주소">
								<br>
								<span id="emailcheck">이메일을 입력하세요</span>
								<span id="emailcheckform">이메일 형식을 맞춰주세요. ex)abc@abc.com</span>
								<span id="emailchecksame">이미 등록된 이메일이 있습니다.</span>
							</li>
							<!-- <li id="li3">
								<input type="text" name="email2" id="email2" placeholder="이메일주소재입력">
								<br>
								<span id="emailcheckformre">이메일이 일치하지 않습니다</span>
							</li> -->
							<li	id="li4">
								<b id="b6">비밀번호</b><br>
								<input type="password" name="pass" id="pass" placeholder="비밀번호 입력">
								<br>
								<span id="pwcheck">비밀번호를 입력해주세요.</span>
								<span id="pwcheckform">비밀번호 형식을 맞춰주세요.4자 이상</span>
							</li>
							<li id="li5">
								<input type="password" name="pass2" id="pass2" placeholder="비밀번호 재입력">
								<br><span id="pwcheckformre">비밀번호가 일치하지 않습니다</span>
							</li>
							<li id="li6">
								<button type="submit" id="btnlogin">회원가입</button>
							</li>
						</ul>
					</form>
						
					<div id="div2">
						<h1>이미 계정이 있으신가요?</h1>
						<a href="http://localhost:9090/tumblbugs/login" ><h2>기존 계정으로 로그인하기</h2></a>
					</div>
						
				</div>
			
		</section>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>