<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>텀블벅스</title>
<script src="http://localhost:9090/tumblbugs/js/jquery-3.4.1.min.js"></script>
<script src="http://localhost:9090/tumblbugs/js/slick.min.js"></script>
<script src="http://localhost:9090/tumblbugs/js/swiper.min.js"></script>
<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/main.css">
<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/swiper.min.css">
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/gh/kenwheeler/slick@1.8.1/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/gh/kenwheeler/slick@1.8.1/slick/slick-theme.css"/>
<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/funding.css">
<style>
	#step3_content_header {
		padding: 20px;
		text-align: center;
	}
	#step3_content_header>div {
		padding: 15px;
	}
	#step3_content_header #header_title {
		width: 250px;
		font-size: 20pt;
		border-bottom: 2px solid #1d85ea;
		margin: auto;
	}
	#step3_content_body {
		font-size: 9.5pt;
	}
	#step3_content_button {
		padding: 30px 0px;
	}
	#editorpick_project>div:first-child {
		font-weight: bold;
	}
</style>
<script>
	$(document).ready(function () {
	    var swiper = new Swiper('div#main_header>section>div.swiper-container', {
	        spaceBetween: 30,
	        centeredSlides: true,
	        autoplay: {
	          delay: 5000,
	          disableOnInteraction: false,
	        },
	        pagination: {
	          el: '.swiper-pagination',
	          clickable: true,
	        },
	        navigation: {
	            nextEl: '.swiper-button-next',
	            prevEl: '.swiper-button-prev',
	        }
	        
	    });
	    
		$('div.multiple-items').slick({
			infinite: false,
			slidesToShow: 4,
			slidesToScroll: 4
		});
	});
</script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div id="funding_step3">
		<div id="project_info">
			<div>
				<a id="backToProject" href="http://localhost:9090/tumblbugs/project/${project.pj_addr }"><i class="fas fa-angle-left"></i> 프로젝트로 돌아가기</a>
				<div id="project_title">${project.pj_title }</div>
			</div>
		</div>
		<div id="step3_content">
			<div id="step3_content_header">
				<div id="header_title">축하합니다</div>
				<div>${nthSupporter }번째 공식 후원자가 되셨습니다</div>
			</div>
			<div id="step3_content_body">프로젝트가 목표금액을 모두 달성할 경우에만 <b>${project.pj_pay_date }</b>에 자동 결제됩니다. 목표액에 미달할 경우 예정된 모든 결제는 자동으로 취소됩니다.</div>
			<div id="step3_content_button">
				<a href="http://localhost:9090/tumblbugs/index"><button type="button"><i class="fas fa-home"></i> 메인으로 가기</button></a>
				<a href="http://localhost:9090/tumblbugs/myfunding"><button type="button"><i class="far fa-list-alt"></i> 내 후원현황 보기</button></a>
			</div>
			<div id="editorpick_project">
				<div>추천 프로젝트</div>
				<section id="main_title2" class="main_content_section">
				<div>
					<!-- slick -->
					<div class="multiple-items">
						<c:forEach var="vo" items="${favlist }">
						<div>
					  		<div class="slick-card">
					      		<a href="http://localhost:9090/tumblbugs/project/${vo.pj_addr }">
					      			<img id="product_img" src="http://localhost:9090/tumblbugs/upload/${vo.pj_simg }">
					      			<div class="slick-card-content">
					      				<div class="slick-card-content-title">
					      					<h1>${vo.pj_title }</h1>
					      					<p>${vo.name }</p>
					      				</div>
					      				<div class="progress">
										  	<div class="progress-bar" role="progressbar" aria-valuenow="${vo.progress }" aria-valuemin="0" aria-valuemax="100" style="width:${vo.progress }%"></div>
										</div>
					      				<div class="slick-card-content-others">
					      					<div>
					      						<c:choose>
					      							<c:when test="${vo.status eq '진행중'}">
					      								<i class="far fa-calendar-alt"></i>
					      								<c:choose>
					      									<c:when test="${vo.remaining_days != '0' }">
					      										<span>${vo.remaining_days }일 남음</span>
					      									</c:when>
					      									<c:otherwise>
					      										<span>오늘 마감</span>
					      									</c:otherwise>
					      								</c:choose>
					      							</c:when>
					      							<c:when test="${vo.status eq '펀딩 성공'}">
				      									<i class="fas fa-gift" style="color:#1e90ff;"></i>
				      									<span style="color:#1e90ff;">${vo.status}</span>
				      								</c:when>
				      								<c:when test="${vo.status eq '펀딩 무산'}">
				      									<i class="fas fa-rocket" style="color:#757575;"></i>
				      									<span style="color:#757575;">${vo.status}</span>
				      								</c:when>
					      						</c:choose>
					      					</div>
					      					<div>
					      						<span>${vo.funding }원</span>
					      						<span>${vo.progress }%</span>
					      					</div>
					      				</div>
					      			</div>
					      		</a>
					      	</div>
					  	</div>
						</c:forEach>
					</div>
				</div>
				</section>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>