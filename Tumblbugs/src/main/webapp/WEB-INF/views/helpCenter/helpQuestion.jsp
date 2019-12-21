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
				<li><a href="#">텀블벅스 헬프센터</a></li>&nbsp;&nbsp;
				<li><span id="s_right">></span>&nbsp;&nbsp; 문의등록</li>
			</ul>
			<input type="search" id="query" placeholder="검색">
		</nav>
		<h1>텀블벅스에 문의하기</h1>
		<div id="q_warning">
			<ul>
				<li>이메일 주소와 함께 문의를 남겨주세요. 영업일 기준 2일 내에 답변 드리겠습니다.</li>
				<li style="margin-top: 0.5em;">특정 프로젝트에 관한 질문은 해당 프로젝트 페이지 <b>창작자에게 문의하기</b>를 이용해 주세요.</li>
			</ul>
		</div>
		<div id="q_type_main">
			<h3>문의 유형</h3>
			<select onchange="location.href=this.value">
				<option value="http://localhost:9090/tumblbugs/help/helpq">도움이 필요한 주제를 골라주세요</option>
				<option value="http://localhost:9090/tumblbugs/help/helpq/spon1">[후원자] 밀어주기(후원), 결제</option>
				<option value="http://localhost:9090/tumblbugs/help/helpq/spon2">[후원자] 후원내역 관리, 선물 수령</option>
				<option value="http://localhost:9090/tumblbugs/help/helpq/create1">[창작자] 프로젝트 올리기, 공개검토</option>
				<option value="http://localhost:9090/tumblbugs/help/helpq/create2">[창작자] 프로젝트 관리, 정산, 선물 실행</option>
				<option value="http://localhost:9090/tumblbugs/help/helpq/common1">[일반] 가입, 탈퇴, 계정 관리</option>
				<option value="http://localhost:9090/tumblbugs/help/helpq/common2">[일반] 사용상의 불편, 버그</option>
				<option value="http://localhost:9090/tumblbugs/help/helpq/common3">[일반] 기타 문의</option>
			</select>
		</div>
		<div id="q_question">
			<section id="sec2">
				<h2>자주 묻는 질문들</h2>
				<ul id="ul1">
					<c:forEach var="vo" items="${flist}">
						<li id="sec2_item"><a href="#">${vo.faq_list_title}</a></li>
					</c:forEach>
					<!-- <li id="sec2_item"><a href="#" style="margin-left: 12px;">결제에 실패했습니다. 재결제는 어떻게 하나요?</a></li>
					<li id="sec2_item"><a href="#">예약해 둔 결제수단을 변경하고 싶어요.</a></li>
					<li id="sec2_item"><a href="#" style="margin-left: 12px;">텀블벅 프로젝트 규칙</a></li>
					<li id="sec2_item"><a href="#">펀딩 수수료는 얼마인가요?</a></li>
					<li id="sec2_item"><a href="#" style="margin-left: 12px;">프로젝트를 올리려면 어떻게 해야 하나요?</a></li>
					<li id="sec2_item"><a href="#">어떻게 하면 프로젝트 홍보를 잘 할 수 있을까요?</a></li>
					<li id="sec2_item"><a href="#" style="margin-left: 12px;">모금액 정산 일정을 알고 싶어요.</a></li> -->
				</ul>
			</section>
		</div>
		<div id="q_partnership">
			<section id="sec2">
				<h2>파트너십 문의</h2>
				<ul id="ul2">
					<li id="sec2_item">텀블벅스에 기업 차원 협력을 제안하고 싶으신가요? 저희 <b><a href="#" id="partner_a" style="color:#1e90ff;">파트너십 이메일</a></b>
						<small>(partnership@tumblbugs.com)</small>로 문의 부탁드립니다.
					</li>
				</ul>
			</section>
		</div>
	</div>
	<jsp:include page="help_footer.jsp"></jsp:include>
</body>
</html>