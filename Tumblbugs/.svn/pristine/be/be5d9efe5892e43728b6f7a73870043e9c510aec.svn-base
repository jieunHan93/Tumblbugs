<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.tumblbugs.vo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>텀블벅스 헬프센터</title>
<script src="http://localhost:9090/tumblbugs/js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/main.css">
</head>
<body>
	<jsp:include page="help_header.jsp"></jsp:include>
	<div id="main">
		<section id="sec1">
			<div id="sec1_inner">
				<h1>무엇을 도와드릴까요?</h1>
				<input type="search" id="query" placeholder="검색">
				<p>
					<a href="http://localhost:9090/tumblbugs/help/helpsearch" id="tag">결제</a>
					<a href="#" id="tag">후원자</a>
					<a href="#" id="tag">수수료</a>
					<a href="#" id="tag">홍보</a>
					등으로 검색해보세요.
				</p>
			</div>
		</section>
		<div id="container">
			<section id="sec2">
				<h2>자주 묻는 질문들</h2>
				<ul id="ul1">
					<c:forEach var="vo" items="${flist}" begin="0" end="7">
						<li id="sec2_item"><a href="http://localhost:9090/tumblbugs/help/sponcenter/a1/c1">${vo.faq_list_title}</a></li>
					</c:forEach>
				</ul>
			</section>
			<section id="sec3">
				<h2>주제별로 살펴보기</h2>
				<div id="topic">
					<div id="topic_title">
						<a href="http://localhost:9090/tumblbugs/help/sponcenter">후원자 센터</a>
						<p>프로젝트 후원, 결제, 선물 수령 및 창작자와의 소통에 관한<br>질문들을 안내드립니다.</p>
					</div>
					<div id="topic_content">
						<ul>
							<li><a href="http://localhost:9090/tumblbugs/help/sponcenter/a1">1. 프로젝트 밀어주기(후원하기)</a></li>
							<li><a href="http://localhost:9090/tumblbugs/help/sponcenter/a2">2. 결제하기</a></li>
							<li><a href="http://localhost:9090/tumblbugs/help/sponcenter/a3">3. 선물 전달받기</a></li>
							<li><a href="http://localhost:9090/tumblbugs/help/sponcenter/a4">4. 기타</a></li>
						</ul>
					</div>
				</div>
			</section>
			<section id="sec4">
				<div id="topic2">
						<div id="topic_title">
							<a href="http://localhost:9090/tumblbugs/help/createcenter">창작자 센터</a>
							<p>프로젝트 개설부터 펀딩 진행, 선물 실행, 후속 처리 및<br>후원자와의 소통과 관련하여 알려드립니다.</p>
						</div>
						<div id="topic_content">
							<ul>
								<li><a href="http://localhost:9090/tumblbugs/help/createcenter/a1">1. 텀블벅스 플랫폼 알아보기</a></li>
								<li><a href="http://localhost:9090/tumblbugs/help/createcenter/a2">2. 텀블벅스 펀딩 준비하기</a></li>						
								<li><a href="http://localhost:9090/tumblbugs/help/createcenter/a3">3. 텀블벅스에 프로젝트 올리기</a></li>
								<li><a href="http://localhost:9090/tumblbugs/help/createcenter/a4">4. 펀딩 시작하고 후원자 만나기</a></li>
								<li><a href="http://localhost:9090/tumblbugs/help/createcenter/a5">5. 펀딩 마감 후 선물 전달하기/마무리하기</a></li>
							</ul>
						</div>
				</div>
			</section>
			<section id="sec5">
				<div id="topic3">
						<div id="topic_title">
							<a href="http://localhost:9090/tumblbugs/help/commoncenter">공통 사항</a>
							<p>텀블벅스에 대한 일반적인 질문들 및 계정 사용에 관한<br>질문들을 안내드려요.</p>
						</div>
						<div id="topic_content">
							<ul>
								<li><a href="http://localhost:9090/tumblbugs/help/commoncenter/a1">1. 텀블벅스 소개</a></li>
								<li><a href="http://localhost:9090/tumblbugs/help/commoncenter/a2">2. 계정 설정 및 기타</a></li>
							</ul>
						</div>
				</div>
			</section>
		</div>
		<div id="help_answer">
			<section id="help_qna">
				<p>질문에 대한 답을 찾지 못하셨나요?</p>
				<a href="http://localhost:9090/tumblbugs/help/helpq">문의하기</a>
			</section>
		</div>
	</div>
	<jsp:include page="help_footer.jsp"></jsp:include>
</body>
</html>