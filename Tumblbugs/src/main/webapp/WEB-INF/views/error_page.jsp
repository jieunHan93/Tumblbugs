<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Insert title here</title>
	<script src="https://kit.fontawesome.com/6de59477c1.js" crossorigin="anonymous"></script>
	<style>
		section#error_page {
			width:1080px;
			margin:auto;
		}
		div#error_box{
			height:750px;
			width:1080px;
			text-align:center;
			display: table-cell;
        	vertical-align: middle;
        	font-family: 'SpoqaHanSans';
		}
		div#error_title>div{
			color:#e7e7e7;
			font-weight:bold;
			cursor:default;
		}
		div#error_title>div:first-child{
			font-size:180pt;
		}
		div#error_title i {
			margin-left: 30px;
   		 	margin-right: -15px;
		}
		div#error_title>div:nth-child(2){
			font-size:37pt;
		}
		button#error_button{
			padding:10px 15px;
			margin-top:20px;
			cursor:pointer;
			border-radius: 5px;
			background-color: #ccc;
			border:none;
			background-color: #1e90ff;
			color:white;
			font-weight: bold;
			font-size:15px;
		}
		button#error_button:hover{
			background-color: #1d85ea;
		}
	</style>
</head>
<body>
	<section id="error_page">
		<div id="error_box">
			<div id="error_title">
				<div>4<i class="fas fa-bomb"></i>4</div>
				<div>페이지를 찾을 수 없습니다</div>
			</div>
			
			<a href="http://localhost:9090/tumblbugs/index"><button id="error_button" type="button">텀블벅스 홈으로 돌아가기</button></a>
		</div>
	</section>
</body>
</html>