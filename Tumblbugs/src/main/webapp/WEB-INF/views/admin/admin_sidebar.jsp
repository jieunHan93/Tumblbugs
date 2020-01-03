<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/main.css">
<script src="https://kit.fontawesome.com/6de59477c1.js" crossorigin="anonymous"></script>
<style>
html, body {height: 100%;}
div#admin_sidebar{
	width: 320px;
	height: 100%;
	position: fixed;
	background-color: #191919;
	display: inline-block;
	z-index:1;
}
div#admin_sidebar>div#admin_sidebar_p1{margin-bottom: 50px;}
div#admin_sidebar>div#admin_sidebar_p1>img {
	display:block;
	width:100px;
	height:100px;
	margin: 0 auto;
	padding: 20px;
}
div#admin_sidebar>div#admin_sidebar_p1>p,
div#admin_sidebar>div#admin_sidebar_p1>a p {color: #ccc;text-align: center;}
div#admin_sidebar>div#admin_sidebar_p2>div#p2_content p {
	/* width:100px; */
	color: #ccc;
	text-align: left;
	display: inline-block;
	font-size: 15px;
}
div#admin_sidebar>div#admin_sidebar_p1>p:nth-child(2) {margin-bottom: 20px;}
#admin_sidebar i {
	color: #ccc;
	margin: 20px 40px;
	font-size: 15px;
	width: 15px;
}
ul#p2_content_detail{
	color:#ccc;
	list-style: square;
	padding-left:100px;
	margin-bottom:0px;
}
ul#p2_content_detail li {
	padding-bottom:13px;
	font-size:15px;
}
ul#p2_content_detail li a{
	text-decoration: none;
	color:#ccc;
}
div#p2_content{
	cursor: pointer;
}
</style>
<script>
	$(document).ready(function(){
		$("ul#p2_content_detail").hide();
		$(".project_menu").click(function(){
			$("ul#p2_content_detail").slideToggle("slow");
		});
	});
</script>
</head>
<body>
	    <div id="admin_sidebar">
			<div id="admin_sidebar_p1">
				<img src="http://localhost:9090/tumblbugs/images/admin_man.png">
				<p>admin</p>
				<p>2019.11.28 12:33</p>
				<a href="#"><p>로그아웃</p></a>
			</div>
			<div id="admin_sidebar_p2">
				<div id="p2_content" class="project_menu">
					<i class="fas fa-project-diagram"></i><p>프로젝트</p>
				</div>
					<ul id="p2_content_detail">
						<li><a href="http://localhost:9090/tumblbugs/admin/projects">관리</a></li>
						<li><a href="http://localhost:9090/tumblbugs/admin/banner">배너 등록</a></li>
					</ul>
				<div id="p2_content">
					<i class="fas fa-layer-group"></i><a href="http://localhost:9090/tumblbugs/admin/collection"><p>기획전</p></a>
				</div>
				<div id="p2_content">
					<i class="fas fa-question"></i><a href="http://localhost:9090/tumblbugs/admin"><p>1:1 문의</p></a>
				</div>
				<div id="p2_content">
					<i class="far fa-lightbulb"></i><a href="http://localhost:9090/tumblbugs/admin/faq"><p>자주 묻는 질문</p></a>
				</div>
				<div id="p2_content">
					<i class="far fa-clipboard"></i></i><a href="http://localhost:9090/tumblbugs/admin/notice"><p>공지사항</p></a>
				</div>
				<div id="p2_content">
					<i class="far fa-user"></i><a href="http://localhost:9090/tumblbugs/admin/member"><p>회원 관리</p></a>
				</div>	
			</div>
		</div>
</body>
</html>