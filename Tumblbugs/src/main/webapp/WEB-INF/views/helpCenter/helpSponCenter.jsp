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
				<li><span id="s_right">></span>&nbsp;&nbsp; 후원자 센터</li>
			</ul>
			<input type="search" id="query" placeholder="검색">
		</nav>
		<div id="container_category">
			<div id="category_header">
				<h1>후원자 센터</h1>
				<p id="category_header_p">프로젝트 후원, 결제, 선물 수령 및 창작자와의 소통에 관한 질문들을 안내드립니다.</p>
			</div>
			<div id="category_content">
				<section id="content_sec">
					<h3><a href="http://localhost:9090/tumblbugs/help/sponcenter/a1">1. 프로젝트 밀어주기 (후원하기)</a></h3>
					<ul id="article_list">
						<c:forEach var="vo" items="${slist_1}" begin="0" end="5">
							<li id="article_list_item"><a href="http://localhost:9090/tumblbugs/help/sponcenter/a1/c1">${vo.faq_list_title}</a></li>
						</c:forEach>
					</ul>
					<a href="http://localhost:9090/tumblbugs/help/sponcenter/a1" id="doc">문서 ${sponCount1}개 모두 보기</a>
				</section>
				<section id="content_sec">
					<h3><a href="http://localhost:9090/tumblbugs/help/sponcenter/a2">2. 결제하기</a></h3>
					<ul id="article_list">
						<c:forEach var="vo" items="${slist_2}" begin="0" end="5">
						<li id="article_list_item"><a href="#">${vo.faq_list_title}</a></li>
						</c:forEach>
					</ul>
					<a href="http://localhost:9090/tumblbugs/help/sponcenter/a2" id="doc">문서 ${sponCount2}개 모두 보기</a>
				</section>
				<section id="content_sec">
					<h3><a href="http://localhost:9090/tumblbugs/help/sponcenter/a3">3. 선물 전달받기</a></h3>
					<ul id="article_list">
						<c:forEach var="vo" items="${slist_3}" begin="0" end="5">
							<li id="article_list_item"><a href="#">${vo.faq_list_title}</a></li>
						</c:forEach>
					</ul>
				</section>
				<section id="content_sec">
					<h3><a href="http://localhost:9090/tumblbugs/help/sponcenter/a4">4. 기타</a></h3>
					<ul id="article_list">
						<c:forEach var="vo" items="${slist_4}" begin="0" end="5">
							<li id="article_list_item"><a href="#">${vo.faq_list_title}</a></li>
						</c:forEach>
					</ul>
				</section>
			</div>
		</div>
	</div>
	<jsp:include page="help_footer.jsp"></jsp:include>
</body>
</html>