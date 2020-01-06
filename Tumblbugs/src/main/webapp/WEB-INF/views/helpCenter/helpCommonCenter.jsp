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
				<li><span id="s_right">></span>&nbsp;&nbsp; 공통 사항</li>
			</ul>
			<input type="search" id="query" placeholder="검색">
		</nav>
		<div id="container_category">
			<div id="category_header">
				<h1>공통 사항</h1>
				<p id="category_header_p">텀블벅스에 대한 일반적인 질문들 및 계정 사용에 관한 질문들을 안내드려요.</p>
			</div>
			<div id="category_content">
				<section id="content_sec">
					<h3><a href="http://localhost:9090/tumblbugs/help/commoncenter/a1">1. 텀블벅스 소개</a></h3>
					<ul id="article_list">
						<c:forEach var="vo" items="${colist_1}" begin="0" end="5">
							<li id="article_list_item"><a href="#">${vo.faq_list_title}</a></li>
						</c:forEach>
					</ul>
				</section>
				<section id="content_sec">
					<h3><a href="http://localhost:9090/tumblbugs/help/commoncenter/a2">2. 계정 설정 및 기타</a></h3>
					<ul id="article_list">
						<c:forEach var="vo" items="${colist_2}" begin="0" end="5">
							<li id="article_list_item"><a href="#">${vo.faq_list_title}</a></li>
						</c:forEach>
					</ul>
					<a href="http://localhost:9090/tumblbugs/help/commoncenter/a2" id="doc">문서 ${commonCount1}개 모두 보기</a>
				</section>
			</div>
		</div>
	</div>
	<jsp:include page="help_footer.jsp"></jsp:include>
</body>
</html>