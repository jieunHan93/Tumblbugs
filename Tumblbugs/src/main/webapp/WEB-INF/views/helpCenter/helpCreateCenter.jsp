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
				<li><span id="s_right">></span>&nbsp;&nbsp; 창작자 센터</li>
			</ul>
			<input type="search" id="query" placeholder="검색">
		</nav>
		<div id="container_category">
			<div id="category_header">
				<h1>창작자 센터</h1>
				<p id="category_header_p">프로젝트 개설부터 펀딩 진행, 선물 실행, 후속 처리 및 후원자와의 소통과 관련하여 알려드립니다.</p>
			</div>
			<div id="category_content">
				<section id="content_sec">
					<h3><a href="http://localhost:9090/tumblbugs/help/createcenter/a1">1. 텀블벅스 플랫폼 알아보기</a></h3>
					<ul id="article_list">
						<c:forEach var="vo" items="${clist_1}" begin="0" end="5">
							<li id="article_list_item"><a href="#">${vo.faq_list_title}</a></li>
						</c:forEach>
					</ul>
					<a href="http://localhost:9090/tumblbugs/help/createcenter/a1" id="doc">문서 ${createCount1}개 모두 보기</a>
				</section>
				<section id="content_sec">
					<h3><a href="http://localhost:9090/tumblbugs/help/createcenter/a2">2. 텀블벅스 펀딩 준비하기</a></h3>
					<ul id="article_list">
						<c:forEach var="vo" items="${clist_2}" begin="0" end="5">
							<li id="article_list_item"><a href="#">${vo.faq_list_title}</a></li>
						</c:forEach>
					</ul>
					<a href="http://localhost:9090/tumblbugs/help/createcenter/a2" id="doc">문서 ${createCount2}개 모두 보기</a>
				</section>
				<section id="content_sec">
					<h3><a href="http://localhost:9090/tumblbugs/help/createcenter/a3">3. 텀블벅스에 프로젝트 올리기</a></h3>
					<ul id="article_list">
						<c:forEach var="vo" items="${clist_3}" begin="0" end="5">
							<li id="article_list_item"><a href="#">${vo.faq_list_title}</a></li>
						</c:forEach>
					</ul>
					<a href="http://localhost:9090/tumblbugs/help/createcenter/a3" id="doc">문서 ${createCount3}개 모두 보기</a>
				</section>
				<section id="content_sec">
					<h3><a href="http://localhost:9090/tumblbugs/help/createcenter/a4">4. 펀딩 시작하고 후원자 만나기</a></h3>
					<ul id="article_list">
						<c:forEach var="vo" items="${clist_4}" begin="0" end="5">
							<li id="article_list_item"><a href="#">${vo.faq_list_title}</a></li>
						</c:forEach>
					</ul>
					<a href="http://localhost:9090/tumblbugs/help/createcenter/a4" id="doc">문서 ${createCount4}개 모두 보기</a>
				</section>
				<section id="content_sec">
					<h3><a href="http://localhost:9090/tumblbugs/help/createcenter/a5">5. 펀딩 마감 후 선물 전달하기/마무리하기</a></h3>
					<ul id="article_list">
						<c:forEach var="vo" items="${clist_5}" begin="0" end="5">
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