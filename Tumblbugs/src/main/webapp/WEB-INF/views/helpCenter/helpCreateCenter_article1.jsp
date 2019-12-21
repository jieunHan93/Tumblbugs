<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>텀블벅스 1:1문의</title>
<script src="http://localhost:9090/tumblbugs/js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/main.css">
<script src="https://kit.fontawesome.com/6de59477c1.js" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="help_header.jsp"></jsp:include>
	<div id="q_container">
		<nav id="sub-nav">
			<ul>
				<li><a href="http://localhost:9090/tumblbugs/help">텀블벅스 헬프센터</a></li>&nbsp;&nbsp;
				<li><span id="s_right">></span>&nbsp;&nbsp; <a href="http://localhost:9090/tumblbugs/help/createcenter">창작자 센터</a></li>&nbsp;&nbsp;
				<li><span id="s_right">></span>&nbsp;&nbsp; <a href="http://localhost:9090/tumblbugs/help/createcenter/a1">1. 텀블벅스 플랫폼 알아보기</a></li>
			</ul>
			<input type="search" id="query" placeholder="검색">
		</nav>
		<div id="container_category">
			<div id="category_header">
				<h1>1. 텀블벅스 플랫폼 알아보기</h1>
			</div>
			<div id="category_content">
				<section id="content_sec">
					<ul id="article_list">
							<li id="article_list_item"><a href="#">텀블벅스 프로젝트 규칙</a></li>
							<li id="article_list_item"><a href="#">펀딩 수수료는 얼마인가요?</a></li>
							<li id="article_list_item"><a href="#">프로젝트 올리기는 무료인가요?</a></li>
							<li id="article_list_item"><a href="#">프로젝트를 진행하는 데에는 어떤 자격 요건이 있나요? (미성년자 필독)</a></li>
							<li id="article_list_item"><a href="#">해외에서도 프로젝트를 제안할 수 있나요?</a></li>
							<li id="article_list_item"><a href="#">프로젝트를 올리면 텀블벅스 또는 후원자들과 소유권을 나눠야 하나요?</a></li>
							<li id="article_list_item"><a href="#">공익적인 프로젝트도 아닌데, 텀블벅스에 올리는 것이 가능할까요?</a></li>
							<li id="article_list_item"><a href="#">제가 좀 사정이 어려운데요, 혹시 텀블벅스를 통해 기부를 받아도 될까요?</a></li>
							<li id="article_list_item"><a href="#">사람들이 제 아이디어를 훔치면 어쩌죠?</a></li>
					</ul>
				</section>
			</div>
		</div>
	</div>
	<jsp:include page="help_footer.jsp"></jsp:include>
</body>
</html>