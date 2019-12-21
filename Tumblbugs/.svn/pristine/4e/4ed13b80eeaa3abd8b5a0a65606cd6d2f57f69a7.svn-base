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
				<li><span id="s_right">></span>&nbsp;&nbsp; <a href="http://localhost:9090/tumblbugs/help/sponcenter">후원자 센터</a></li>&nbsp;&nbsp;
				<li><span id="s_right">></span>&nbsp;&nbsp; <a href="http://localhost:9090/tumblbugs/help/sponcenter/a1">1. 프로젝트 밀어주기(후원하기)</a></li>
			</ul>
			<input type="search" id="query" placeholder="검색">
		</nav>
		<div id="container_category">
			<div id="category_header">
				<h1>1. 프로젝트 밀어주기(후원하기)</h1>
			</div>
			<div id="category_content">
				<section id="content_sec">
					<ul id="article_list">
						<c:forEach var="vo" items="${list}">
							<li id="article_list_item"><a href="http://localhost:9090/tumblbugs/help/sponcenter/a1/c1">${vo.faq_list_title}</a></li>
							<!-- <li id="article_list_item"><a href="http://localhost:9090/tumblbugs/help/sponcenter/a1/c2">내 후원현황에 후원내역이 보이지 않아요.</a></li>
							<li id="article_list_item"><a href="#">프로젝트 밀어주기가 무엇인가요?</a></li>
							<li id="article_list_item"><a href="#">제가 밀어준 프로젝트는 어떻게 확인할 수 있나요?</a></li>
							<li id="article_list_item"><a href="#">서베이 응답은 어떻게 하나요?</a></li>
							<li id="article_list_item"><a href="#">이미 펀딩이 끝난 프로젝트에는 참여할 수 없는건가요?</a></li>
							<li id="article_list_item"><a href="#">진행자에게 문의할 수 있는 방법에는 어떤 것이 있나요?</a></li>
							<li id="article_list_item"><a href="#">하나의 프로젝트에서 여러 번 밀어주는 것도 가능한가요?(다중 후원)</a></li>
							<li id="article_list_item"><a href="#">결제한 프로젝트에 대한 현금영수증 발급이 가능한가요?</a></li>
							<li id="article_list_item"><a href="#">밀어준 프로젝트 진행자가 알 수 있는 제 정보는 무엇이 있나요?</a></li>
							<li id="article_list_item"><a href="#">펀딩 마감 전에 후원을 철회하거나 금액을 변경할 수 있나요?</a></li> -->
						</c:forEach>
					</ul>
				</section>
			</div>
		</div>
	</div>
	<jsp:include page="help_footer.jsp"></jsp:include>
</body>
</html>