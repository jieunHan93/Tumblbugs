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
				<li><span id="s_right">></span>&nbsp;&nbsp; <a href="http://localhost:9090/tumblbugs/help/sponcenter/a2">2. 결제하기</a></li>
			</ul>
			<input type="search" id="query" placeholder="검색">
		</nav>
		<div id="container_category">
			<div id="category_header">
				<h1>2. 결제하기</h1>
			</div>
			<div id="category_content">
				<section id="content_sec">
					<ul id="article_list">
						<li id="article_list_item"><a href="#">결제에 실패했습니다. 재결제는 어떻게 하나요?</a></li>
						<li id="article_list_item"><a href="#">예약해 둔 결제수단을 변경하고 싶어요.</a></li>
						<li id="article_list_item"><a href="#">결제가 완료되고 네이버페이 정기결제 해지 알림을 받았어요.</a></li>
						<li id="article_list_item"><a href="#">어떤 결제수단을 지원하나요?</a></li>
						<li id="article_list_item"><a href="#">밀어주기를 완료했는데 언제 결제되나요?</a></li>
						<li id="article_list_item"><a href="#">프로젝트의 결제상태가 "결제 누락"으로 표시됩니다. 결제 누락은 무엇인가요?</a></li>
						<li id="article_list_item"><a href="#">결제 문자에 "정기과금", "자동이체 등록"이라고 떴어요. 매월 이체되는 건가요?</a></li>
						<li id="article_list_item"><a href="#">등록된 지불정보의 삭제는 어떻게 해야 하죠?</a></li>
						<li id="article_list_item"><a href="#">텀블벅스에 제 카드 정보가 저장되는 건가요?</a></li>
					</ul>
				</section>
			</div>
		</div>
	</div>
	<jsp:include page="help_footer.jsp"></jsp:include>
</body>
</html>