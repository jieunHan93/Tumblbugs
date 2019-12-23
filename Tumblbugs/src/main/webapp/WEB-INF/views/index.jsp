<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- <script type="text/javascript"> 에러나요  jquery-3.4.1.min.js 추가 이후로 옮겨주세요.
$(document).ready(function(){
		 if(result != null && result == "true"){
			 alert("인증성공");
		 }
	});

</script> -->
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>텀블벅스 :: tumblbugs</title>
	<link rel="icon" href="http://localhost:9090/tumblbugs/images/tumblbugs_img_logo.ico" type="image/x-icon">
	<script src="http://localhost:9090/tumblbugs/js/jquery-3.4.1.min.js"></script>
	<script src="http://localhost:9090/tumblbugs/js/slick.min.js"></script>
	<script src="http://localhost:9090/tumblbugs/js/swiper.min.js"></script>
	<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/main.css">
	<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/swiper.min.css">
	<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/gh/kenwheeler/slick@1.8.1/slick/slick.css"/>
	<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/gh/kenwheeler/slick@1.8.1/slick/slick-theme.css"/>
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
        $('section#main_title1 div.multiple-items').slick({
			infinite: false,
			slidesToShow: 4,
			slidesToScroll: 4
		});
    	$('section#main_title2 div.multiple-items').slick({
			infinite: false,
			slidesToShow: 4,
			slidesToScroll: 4
		});
    	$('section#main_title3 div.multiple-items').slick({
			infinite: false,
			slidesToShow: 4,
			slidesToScroll: 4
		});
    	$('section#main_title4 div.multiple-items').slick({
			infinite: false,
			slidesToShow: 4,
			slidesToScroll: 4
		});
    	$('div#main_colection_banner div.multiple-items').slick({
			infinite: false,
			slidesToShow: 2,
			slidesToScroll: 2
		});
    	
		$("a.main_project_sort").click(function(){
			var menu_id = $(this).attr("id");
			/*alert(menu_id);*/
			if(menu_id == "sort_editorpick_project"){
				sessionStorage.clear();
				sessionStorage.setItem("ongoing","ongoing");
				sessionStorage.setItem("editorpick","1");
				sessionStorage.setItem("order","fav");
			} else if(menu_id == "sort_rateup_project") {
				sessionStorage.clear();
				sessionStorage.setItem("ongoing","ongoing");
				sessionStorage.setItem("rate","2");
				sessionStorage.setItem("editorpick","1");
				sessionStorage.setItem("order","deadline");
			} else if(menu_id == "sort_new_project"){
				sessionStorage.clear();
				sessionStorage.setItem("ongoing","ongoing");
				sessionStorage.setItem("editorpick","1");
				sessionStorage.setItem("order","new");
			} else {
				sessionStorage.clear();
			}
			location.href="http://localhost:9090/tumblbugs/discover";
		});
	});
  </script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
		
	<div id="main_header">
		<section>
			<div class="swiper-container">
				<div class="swiper-wrapper">
			      <div class="swiper-slide" id="main_slide1">
				      <a href="http://localhost:9090/tumblbugs/project_content">
				     	 <div id="swiper-content">
				     	 	<h1 class="swiper-title">수면을 위한<br>차, 옷, 향</h1>
				     	 	<div class="swiper-subtitle">일상에 스며들어 수면 루틴을 살표시 바꿔주는 것들</div>
				     	 </div>
				      </a>
			      </div>
			      <div class="swiper-slide" id="main_slide2">
			      	<a href="#">
				     	 <div id="swiper-content">
				     	 	<h1 class="swiper-title">당신이 두고 간<br>오늘의 조각들</h1>
				     	 	<div class="swiper-subtitle">뉴욕 브루클린 카페에서 바리스타로 일하며 기록한<카운터 일기></div>
				     	 </div>
				      </a>
			      </div>
			      <div class="swiper-slide" id="main_slide3">
			      	<a href="#">
				     	 <div id="swiper-content">
				     	 	<h1 class="swiper-title">오후에도 45℃<br>온도를 유지합니다</h1>
				     	 	<div class="swiper-subtitle">멋스럽고 간편한 비건가죽 도시락 가방</div>
				     	 </div>
				      </a>
			      </div>
			      <div class="swiper-slide" id="main_slide4">
			      	<a href="#">
				     	 <div id="swiper-content">
				     	 	<h1 class="swiper-title">드랙 처음 봐?<br>이렇게 사는 애도 있어</h1>
				     	 	<div class="swiper-subtitle">드랙아티스트 나나영롱킴 다큐멘터리 <나, 나></div>
				     	 </div>
				      </a>
			      </div>
			      <div class="swiper-slide" id="main_slide5">
			      	<a href="#">
				     	 <div id="swiper-content">
				     	 	<h1 class="swiper-title">막막한 진로 고민도<br>PT 받다요</h1>
				     	 	<div class="swiper-subtitle">프로진로고민러를 위한 고민 근육 기르기 가이드북</div>
				     	 </div>
				      </a>
			      </div>
			    </div>
			    <!-- Add Pagination -->
			    <div class="swiper-pagination"></div>
		  </div>
		</section>
	</div>
	
	<div id="main_content">
		<section id="main_title1" class="main_content_section">
		<div>
		  <div>
			<div id="main_content_title1">
			<a href="http://localhost:9090/tumblbugs/collections/spotlight">
				주목할 만한 프로젝트
				<svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" stroke-linecap="round" stroke-linejoin="round" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg" data-reactid="98"><polyline points="9 18 15 12 9 6"></polyline></svg>
			</a>
			</div>
			<div id="main_content_swiperBtn">
				<!-- <div class="swiper-button-prev swiper-button-white"></div>
    			<div class="swiper-button-next swiper-button-white"></div> -->
			</div>
		  </div>
		  <!-- slick -->
		  <div class="multiple-items">
		  	<c:forEach var="vo" items="${cplist }">
		  	<div>
		  		<div class="slick-card">
		      		<a href="http://localhost:9090/tumblbugs/project/${vo.pj_addr}">
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
	
	    <c:if test="${fn:length(main_clist) != 0}">
		<div id="main_colection_banner">
			<section class="main_content_section">
				<div id="main_banner_title">진행중인 기획전</div>
				<div class="multiple-items">
				<c:forEach var="vo" items="${main_clist }">
				 <a href="http://localhost:9090/tumblbugs/collections/${vo.col_addr }">
				 	<div class="main_banner_card">
				 		<div class="main_banner_card_img"><img src="http://localhost:9090/tumblbugs/upload/${vo.col_simg }"></div>
				 		<span class="main_banner_card_title">
				 			<div>${vo.col_name }</div>
				 		</span>
				 		<div class="main_banner_card_space"></div>
				 		<span class="main_banner_card_count">
				 			<span>${vo.pcount }</span>개의 프로젝트
				 		</span>
				 	</div>
				 </a>
				 </c:forEach>
				</div>
			</section>
		</div>
		</c:if>
		
		<c:if test="${fn:length(favlist) != 0}">
		<section id="main_title2" class="main_content_section">
		<div>
		  <div>
			<div id="main_content_title1">
			<a href="#" id="sort_editorpick_project" class="main_project_sort">
				인기 추천 프로젝트
				<svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" stroke-linecap="round" stroke-linejoin="round" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg" data-reactid="98"><polyline points="9 18 15 12 9 6"></polyline></svg>
			</a>
			</div>
		  </div>
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
		</c:if>
		
		<c:if test="${fn:length(ddlist) != 0}">
		<section id="main_title3" class="main_content_section">
		<div>
		  <div>
			<div id="main_content_title1">
			<a href="#" id="sort_rateup_project" class="main_project_sort">
			성공 임박 프로젝트
				<svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" stroke-linecap="round" stroke-linejoin="round" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg" data-reactid="98"><polyline points="9 18 15 12 9 6"></polyline></svg>
			</a>
			</div>
			<div id="main_content_swiperBtn">
				<!-- <div class="swiper-button-prev swiper-button-white"></div>
    			<div class="swiper-button-next swiper-button-white"></div> -->
			</div>
		  </div>
		  <!-- slick -->
		  <div class="multiple-items">
		  	<c:forEach var="vo" items="${ddlist }">
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
		</c:if>
		
		<c:if test="${fn:length(newlist) != 0}">
		<section id="main_title4" class="main_content_section">
		<div>
		  <div>
			<div id="main_content_title1">
			<a href="#" id="sort_new_project" class="main_project_sort">
				신규 추천 프로젝트
				<svg stroke="currentColor" fill="none" stroke-width="2" viewBox="0 0 24 24" stroke-linecap="round" stroke-linejoin="round" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg" data-reactid="98"><polyline points="9 18 15 12 9 6"></polyline></svg>
			</a>
			</div>
			<div id="main_content_swiperBtn">
				<!-- <div class="swiper-button-prev swiper-button-white"></div>
    			<div class="swiper-button-next swiper-button-white"></div> -->
			</div>
		  </div>
		  <!-- slick -->
		  <div class="multiple-items">
		  	<c:forEach var="vo" items="${newlist }">
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
		</c:if>
		
		
		<a id="main_back_color" href="http://localhost:9090/tumblbugs/project_start">
			<div id="main_banner_bot">
				<section class="main_content_section">
					<div>
						<h2>마음 속 프로젝트 아이디어, 텀블벅스에서 현실로</h2>
						<p>프로젝트를 위한 자금도 마련하고, 든든한 후원자 네트워크도 확보하세요</p>
					</div>
				</section>
			</div>
		</a>
	</div>
	
	<!-- <button type="button" class="top"></button> -->
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>