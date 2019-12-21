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
		<div id="article_container">
			<section id="article_sidebar">
				<h3>이 섹션의 문서</h3>
				<ul>
					<c:forEach var="vo" items="${list}" begin="0" end="9">
						<li><a href="http://localhost:9090/tumblbugs/help/sponcenter/a1/c1">${vo.faq_list_title}</a></li>
						<!-- <li><a href="http://localhost:9090/tumblbugs/help/sponcenter/a1/c2">내 후원현황에 후원내역이 보이지 않아요.</a></li>
						<li><a href="#">프로젝트 밀어주기가 무엇인가요?</a></li>
						<li><a href="#">제가 밀어준 프로젝트는 어떻게 확인할 수 있나요?</a></li>
						<li><a href="#">서베이 응답은 어떻게 하나요?</a></li>
						<li><a href="#">이미 펀딩이 끝난 프로젝트에는 참여할 수 없는건가요?</a></li>
						<li><a href="#">진행자에게 문의할 수 있는 방법에는 어떤 것이 있나요?</a></li>
						<li><a href="#">하나의 프로젝트에서 여러 번 밀어주는 것도 가능한가요?(다중 후원)</a></li>
						<li><a href="#">결제한 프로젝트에 대한 현금영수증 발급이 가능한가요?</a></li>
						<li><a href="#">밀어준 프로젝트 진행자가 알 수 있는 제 정보는 무엇이 있나요?</a></li>	 -->
					</c:forEach>									
				</ul>
				<a href="http://localhost:9090/tumblbugs/help/sponcenter/a1">더보기</a>
			</section>
			<article id="article">
				<div id="article_main">
					<div id="article_header">
						<h2 id="article_title">크라우드 펀딩과 후원이란 무엇인가요?</h2>
						<p>16시간 전 업데이트</p>
					</div>
					<div id="article_info">
						${aaa}
						<!-- <h2 id="title_info">크라우드펀딩이란 무엇이죠?</h2>
						<p>크라우드펀딩은 아이디어는 있지만 실행을 위한 자금이 부족한 개인 또는 팀이 
						다수의 사람들(Crowd)로부터 돈을 모금(Funding)하는 것을 말합니다.
						</p>
						<p>&nbsp;</p>
						<h2 id="title_info">텀블벅에서의 펀딩은 어떤 방식으로 진행되나요?</h2>
						<p>창작자는 만들고자 하는 창작물에 대한 이야기와 아이디어, 구체적인 계획, 선물의 스펙 등을 담은 프로젝트 페이지를 생성하여 플랫폼에 게시합니다.
						 게시된 프로젝트는 플랫폼을 통해 불특정 다수에게 노출되고, 이용자들은 원하는 프로젝트에 밀어주기(후원)을 통해 펀딩에 참여하여 후원자가 됩니다.
						 결제는 즉시 진행되지 않고 사전에 설정한 마감일 기준 목표 금액을 달성한 경우에만 진행됩니다.
						 후원금이 프로젝트 설계 당시 설정한 목표 금액에 도달하지 못할 경우 예약된 결제는 취소되며 창작자에게 전달되는 금액은 없습니다.
						</p>
						<p>결제된 금액은 창작자에게 전달되어 후원자와 약속한 프로젝트를 진행하고 선물을 만드는 데에 쓰이게 됩니다.
						 이를 통해 만들어진 창작의 결과물은 펀딩에 참여한 후원자에게 선물로 제공됩니다.
						</p>
						<p>창작자는 전달받은 금액을 반드시 프로젝트를 통해 후원자와 약속한 창작물을 만드는 데에 사용하고,
						 선물이 약속한대로 전달될 수 있도록 최선의 노력을 다해야 합니다. 단, 불가피한 선물의 변경 및 지연 등이 발생할 경우
						 창작자는 후원자에게 이를 성실히 설명하고 합의해야 할 의무가 있습니다.
						 지연 및 실패를 비롯한 프로젝트의 예상과 다른 진행 사항이 발생한 경우 그 책임은 창작자에게 있습니다.
						</p>
						<p>&nbsp;</p>
						<h2 id="title_info">밀어주기(후원)란 무엇인가요?</h2>
						<p>프로젝트 밀어주기는 창작자들이 구상하는 프로젝트가 실제로 구현될 수 있도록 일정한 금액을 지불하여 돕는 것입니다.
						 여러분은 창작자를 향한 지지와 도움을 더하고, 프로젝트를 통해 만들어지는 선물을 받아보시게 됩니다.
						</p>
						<p>다만 텀블벅에서 이루어지는 펀딩은 아직 구현되지 않은 아이디어를 후원을 통해 함께 완성해나가는 일입니다.
						 이 때문에 플랫폼 특성상 밀어주기(후원)는 완성된 제품을 주문받아 즉시 배송하는 구매와는 맥락이 다릅니다.
						 아이디어와 시제품 단계에서 후원을 받는 것이기에 계획한 프로젝트 및 선물이 예상과 달리 진행될 가능성이 존재하는 것이 사실입니다.
						 그러나 텀블벅의 후원이 일반적인 구매와 맥락은 살짝 다를지라도 진행자는 창작을 위해 받은 후원에 상응하는 보상을 성실하게 제공할 책임이 있습니다.
						</p>
						<p>&nbsp;</p>
						<h2 id="title_info">텀블벅은 이 과정에서 무엇을 하나요?</h2>
						<p>텀블벅은 창작을 위한 새로운 시도를 소개하고 아이디어가 후원자를 만나 세상에 나올 수 있게 하는 플랫폼 서비스를 제공합니다.</p> -->
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
					<a href="http://localhost:9090/tumblbugs/help/helpq">1:1 문의하기</a>
				</div>
			</article>
		</div>
	</div>
	<jsp:include page="help_footer.jsp"></jsp:include>
</body>
</html>