<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>텀블벅스 1:1문의</title>
<script src="http://localhost:9090/tumblbugs/js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/main.css">
<script src="https://kit.fontawesome.com/6de59477c1.js" crossorigin="anonymous"></script>
<script>
	$(document).ready(function() {
		$("div#article_container a.question_num").click(function() {
			var id = $(this).attr("id");
			var value = $("input[type=hidden]#"+id).val();
			//alert(value);
			  $("div#article_main>div").remove();
		      $.ajax({
		         url : "http://localhost:9090/tumblbugs/help/sponcenter/ajax?faq_num="+value,
		         success : function(data) {

		             var jsonObj = JSON.parse(data);
		             //alert(jsonObj.list.length);
					 var str = "";
		             for(i=0;i<jsonObj.list.length;i++){
		               str +='<div id="article_header">'
		                     +'<h2 id="article_title">'+jsonObj.list[i].faq_list_title+'</h2>'
		                     +'<p>'+jsonObj.list[i].reg_date+'</p>'
		                     +'</div>'
		                     +'<div id="article_info">'+jsonObj.list[i].faq_content+'</div>';
		             }
		             $("div#article_main").append(str);
		         }
		      });
		});
		
	});
</script>
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
						<input type="hidden" id="${vo.faq_num}" value="${vo.faq_num}">
						<li><a href="#" class="question_num" id="${vo.faq_num}" >${vo.faq_list_title}</a></li>
					</c:forEach>									
				</ul>
				<a href="http://localhost:9090/tumblbugs/help/sponcenter/a1">더보기</a>
			</section>
			<article id="article">
				<div id="article_main">
					<%-- <div id="article_header">
						<h2 id="article_title">크라우드 펀딩과 후원이란 무엇인가요?</h2>
						<p>16시간 전 업데이트</p>
					</div>
					<div id="article_info">${aaa}</div> --%>
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