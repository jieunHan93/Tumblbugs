<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>텀블벅스 관리자 로그인</title>
<script src="http://localhost:9090/tumblbugs/js/jquery-3.4.1.min.js"></script>
<script src="https://kit.fontawesome.com/6de59477c1.js" crossorigin="anonymous"></script>
<script>
	$(document).ready(function() {
		$("button#admin_btn").click(function() {
			if($("#id").val() == "") {
				alert("아이디 입력해주세요");
				$("#id").focus();
			}else if($("#pass").val() == ""){
				alert("비밀번호를 입력해주세요");
				$("#pass").focus();
			}/* else{
				loginForm.submit();
			} */
		});
	});
</script>
<style>
* {font-family: 'SpoqaHanSans';}
body,html {background-color: #f7f7f7;}
div#admin_login_main{
	position: absolute;
    top: 50%;
    left: 50%;
    margin-top: -170px;
    margin-left: -151px;
}
div#admin_login{
	width: 300px;
	height:60px;
	margin:0 auto;
	text-align: center;
	border-left: 1px solid #ddd;
	border-right: 1px solid #ddd;
	border-top: 1px solid #ddd;
}
div#admin_info{
	border:1px solid #ddd;
	margin:0 auto;
	text-align: center;
	width: 300px;
	height:200px;
}
div#admin_info>div#admin_id, div#admin_info>div#admin_pass{
	background-color: #ffffff;
	width: 200px;
	height: 40px;
	line-height:40px;
	padding-left:10px;
	margin: 20px auto;
}
div#admin_info>div#admin_id i, div#admin_info>div#admin_pass i {color: #ccc;}
div#admin_info>div#admin_id input, div#admin_info>div#admin_pass input{width:160px;border: 0;margin-left: 5px;}
div#admin_info>button#admin_btn{
	border:0;
	width: 210px;
	height: 40px;
	color: #ffffff;
	background-color: #1e90ff;
	cursor: pointer;
	font-weight: bold;
}
input:focus {
	outline: none;
}
</style>
</head>
<body>
	<div id="admin_login_main">
		<div id="admin_login">
			<p>관리자 로그인</p>
		</div>
		<div id="admin_info">
			<div id="admin_id">
				<i class="far fa-user"></i>
				<input type="text" placeholder="아이디" id="id">
			</div>
			<div id="admin_pass">
				<i class="fas fa-lock"></i>
				<input type="text" placeholder="비밀번호" id="pass">
			</div>
			<button type="button" id="admin_btn">로그인</button>
		</div>
	</div>
</body>
</html>