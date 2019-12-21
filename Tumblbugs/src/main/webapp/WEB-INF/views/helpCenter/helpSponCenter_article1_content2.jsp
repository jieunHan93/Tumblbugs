	<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
		<div id="article_container">
			<section id="article_sidebar">
				<h3>이 섹션의 문서</h3>
				<ul>
					<li><a href="http://localhost:9090/tumblbugs/help/sponcenter/a1/c1">크라우드펀딩과 후원이란 무엇인가요?</a></li>
					<li><a href="http://localhost:9090/tumblbugs/help/sponcenter/a1/c2">내 후원현황에 후원내역이 보이지 않아요.</a></li>
					<li><a href="#">프로젝트 밀어주기가 무엇인가요?</a></li>
					<li><a href="#">제가 밀어준 프로젝트는 어떻게 확인할 수 있나요?</a></li>
					<li><a href="#">서베이 응답은 어떻게 하나요?</a></li>
					<li><a href="#">이미 펀딩이 끝난 프로젝트에는 참여할 수 없는건가요?</a></li>
					<li><a href="#">진행자에게 문의할 수 있는 방법에는 어떤 것이 있나요?</a></li>
					<li><a href="#">하나의 프로젝트에서 여러 번 밀어주는 것도 가능한가요?(다중 후원)</a></li>
					<li><a href="#">결제한 프로젝트에 대한 현금영수증 발급이 가능한가요?</a></li>
					<li><a href="#">밀어준 프로젝트 진행자가 알 수 있는 제 정보는 무엇이 있나요?</a></li>										
				</ul>
				<a href="http://localhost:9090/tumblbugs/help/sponcenter/a1">더보기</a>
			</section>
			<article id="article">
				<div id="article_main">
					<div id="article_header">
						<h2 id="article_title">내 후원현황에 후원내역이 보이지 않아요.</h2>
						<p>7분전 업데이트</p>
					</div>
					<div id="article_info">
						<p>결제가 확실히 되어 텀블벅으로부터 결제 성공 관련 문자와 이메일을 받으셨는데도 내 후원현황에 후원하신 프로젝트가 안 보이신다면,
						당시 다른 계정으로 가입을 하고 결제하셨을 가능성이 있습니다. 
						</p>
						<p>텀블벅 서비스 특성상 결제가 프로젝트를 밀어줄 당시에 곧바로 진행되지 않기에 종종 이런 문제를 겪으시는 경우가 있습니다.
						</p>
						<p><a href="#" id="info_a">1:1 문의하기</a>를 통하여 확인 가능한 휴대폰 번호와 후원하신 프로젝트명을 알려주세요. 운영진이 확인을 도와드리겠습니다.
						</p>
					</div>
				</div>
				<footer>
					<div id="article_footer">
						<span id="s1">도움이 되었습니까?</span>
						<div id="article_footer_ox">
							<a href="#">예</a>
							<a href="#">아니오</a>
						</div>
						<span id="s2">550명 중 517명이 도움이 되었다고 했습니다.</span>
					</div>
				</footer>
				<div id="article_relatives">
					<div id="recent_article">
						<h3>최근 본 문서</h3>
						<ul id="ul_article">
							<li><a href="#">내 후원현황에 후원내역이 보이지 않아요.</a></li>
							<li><a href="#">서베이 응답은 어떻게 하나요?</a></li>
							<li><a href="#">텀블벅 프로젝트 규칙</a></li>
							<li><a href="#">밀어준 프로젝트 진행자가 알 수 있는 제 정보는 무엇이 있나요?</a></li>
							<li><a href="#">결제한 프로젝트에 대한 현금영수증 발급이 가능한가요?</a></li>
						</ul>
					</div>
					<div id="related_article">
						<h3>관련 문서</h3>
						<ul id="ul_article">
							<li><a href="#">펀딩 수수료는 얼마인가요?</a></li>
							<li><a href="#">프로젝트 올리려면 어떻게 해야 하나요?</a></li>
							<li><a href="#">결제가 실패했습니다. 재결제는 어떻게 하나요?</a></li>
							<li><a href="#">내 후원현황에 후원내역이 보이지 않아요.</a></li>
							<li><a href="#">후원 선물로 제공되는 품목에 따른 필수 확인사항</a></li>
						</ul>
					</div>
				</div>
				<div id="article_more_question">
					<p>질문에 대한 답을 찾지 못하셨나요?</p>
					<a href="#">1:1 문의하기</a>
				</div>
			</article>
		</div>
	</div>
	<jsp:include page="help_footer.jsp"></jsp:include>
</body>
</html>