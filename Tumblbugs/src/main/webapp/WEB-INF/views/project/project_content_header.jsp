<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://localhost:9090/tumblbugs/js/jquery-3.4.1.min.js"></script>
<script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script>
	$(document).ready(function() {
		//미리보기 설정
		if('${preview}' == "y") {
			$("a:not(.active)").css("pointer-events","none").css("cursor","default").css("opacity","0.6");
			$("button").css("pointer-events","none").css("cursor","default").css("opacity","0.6");
		}
		
		var menu = '${tab}';
		if(menu == "") {
			menu = "story";
		} else {
			$(document).scrollTop($("#menu_tab").offset().top);
		}
		
		$("#menu_tab>nav>a#" + menu).addClass("selected_menu");
		
		//메뉴 탭 상단 고정
		var tabOffset = $("section#menu_tab").offset();
		$(window).scroll(function() {
			if($(document).scrollTop() > tabOffset.top) {
				$("section#menu_tab").addClass("fixation");
			} else {
				$("section#menu_tab").removeClass("fixation");
			}
		});
		
		//카테고리 목록으로 이동
		$("a#category").click(function(){
			sessionStorage.clear();
			sessionStorage.setItem("category",'${pvo.pj_category}');
			location.href="http://localhost:9090/tumblbugs/discover";
		});
		
		$("#shareModalBackground").hide();
		$("#shareModal").hide();
		
		//공유하기 모달
		$("#shareProject").click(function() {
			$("#shareModalBackground").show();
			$("#shareModal").show();
		});
		
		$("#shareModal #times").click(function() {
			$("#shareModalBackground").hide();
			$("#shareModal").hide();
		});
		
		$("#shareKakaoTalk a").click(function() {
			shareKakaotalk();
		});
		
		//카카오톡 공유
		function shareKakaotalk() {
	        Kakao.init("77213dce7d91d4ec2bd5e608ef304498");      // 사용할 앱의 JavaScript 키를 설정
	        Kakao.Link.sendDefault({
	              objectType:"feed"
	            , content : {
	                  title: "${pvo.pj_title}"   // 콘텐츠의 타이틀
	                , description: "${pvo.pj_summary}"   // 콘텐츠 상세설명
	                , imageUrl:"http://localhost:9090/tumblbugs/upload/" + '${pvo.pj_simg}'   // 썸네일 이미지
	                , link : {
	                      mobileWebUrl:"http://localhost:9090/tumblbugs/project/" + '${pvo.pj_addr}'   // 모바일 카카오톡에서 사용하는 웹 링크 URL
	                    , webUrl:"http://localhost:9090/tumblbugs/project/" + '${pvo.pj_addr}' // PC버전 카카오톡에서 사용하는 웹 링크 URL
	                }
	            }
	            , buttons : [
	                {
	                      title:"${pvo.pj_title}"    // 버튼 제목
	                    , link : {
	                        mobileWebUrl:"http://localhost:9090/tumblbugs/project/" + '${pvo.pj_addr}'   // 모바일 카카오톡에서 사용하는 웹 링크 URL
	                      , webUrl:"http://localhost:9090/tumblbugs/project/" + '${pvo.pj_addr}' // PC버전 카카오톡에서 사용하는 웹 링크 URL
	                    }
	                }
	            ]
	        });
	    }
	});
</script>
</head>
<body>
	<section id="overview">
		<div>
			<a id="category" class="active">${pvo.pj_category }</a>
			<div id="title">${pvo.pj_title }</div>
			<div id="creator">
				<span id="creator_img"><img src="http://localhost:9090/tumblbugs/upload/${mvo.profile_simg }"></span>
				<span id="creator_name"><a href="http://localhost:9090/tumblbugs/projects/${mvo.member_id}" class="active">${mvo.name }</a></span>
			</div>
		</div>
		<div>
			<div id="main_img"><img src="http://localhost:9090/tumblbugs/upload/${pvo.pj_simg }"></div>
			<div id="introduction">
				<div>
					<div class="introduction_subtitle">모인금액</div>
					<span class="introduction_value">${pvo.total_funding_price }</span>
					<span class="introduction_quantity">원</span>
					<span id="percentage">${pvo.achievement_rate }%</span>
				</div>
				<div>
					<div class="introduction_subtitle">남은시간</div>
					<span class="introduction_value">
						<c:choose>
							<c:when test="${pvo.remaining_days >= 0}">${pvo.remaining_days + 1 }</c:when>
							<c:otherwise>0</c:otherwise>
						</c:choose>
					</span>
					<span class="introduction_quantity">일</span>
				</div>
				<div>
					<div class="introduction_subtitle">후원자</div>
					<span class="introduction_value">${pvo.total_sponsor_count }</span>
					<span class="introduction_quantity">명</span>
				</div>
				<div id="funding_information">
					<div id="funding_information_title">펀딩 진행중</div>
					<div id="funding_information_content">목표 금액인 ${pvo.pj_price }원이 모여야만 결제됩니다.<br>결제는 ${pvo.pj_pay_date }에 다함께 진행됩니다.</div>
				</div>
				<div>
					<c:choose>
						<c:when test="${pvo.remaining_days >= 0 }">
							<a href="http://localhost:9090/tumblbugs/${pvo.pj_addr}/funding/step1">
								<button type="button" class="goFunding">프로젝트 밀어주기</button>
							</a>
						</c:when>
						<c:otherwise>
							<button type="button" class="goFunding" id="end" disabled>밀어주기가 마감되었습니다</button>
						</c:otherwise>
					</c:choose>
					<button type="button" id="shareProject">
						<svg width="20px" height="22px" viewBox="0 0 20 22" version="1.1" xmlns="http://www.w3.org/2000/svg">
							<title>ic_share_B</title>
							<g id="PC" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
								<g id="Asset" transform="translate(-152.000000, -414.000000)">
									<g id="btn_share-copy-2" transform="translate(131.000000, 399.000000)">
										<g id="ic_share_B" transform="translate(19.000000, 14.000000)">
											<g id="ic_share">
												<rect id="Rectangle-Copy-9" fill-rule="nonzero" x="0" y="0" width="24" height="24"></rect>
												<g id="share-2" transform="translate(3.000000, 2.000000)" stroke="#5C5C5C" stroke-linecap="round" stroke-linejoin="round" stroke-width="2">
													<circle id="Oval" cx="15" cy="3" r="3"></circle><circle id="Oval" cx="3" cy="10" r="3"></circle>
													<circle id="Oval" cx="15" cy="17" r="3"></circle>
													<path d="M5.59,11.51 L12.42,15.49" id="Path"></path>
													<path d="M12.41,4.51 L5.59,8.49" id="Path"></path>
												</g>
											</g>
										</g>
									</g>
								</g>
							</g>
						</svg>
					</button>
				</div>
			</div>
		</div>
	</section>
	<section id="menu_tab">
		<nav>
			<c:set var="content" value="project"/>
			<c:set var="addr" value="${pvo.pj_addr}"/>
			<c:if test="${not empty preview}">
				<c:set var="content" value="preview"/>
				<c:set var="addr" value="${pvo.pj_id}"/>
			</c:if>
			<a class="active" id="story" href="http://localhost:9090/tumblbugs/${content}/${addr}/story">스토리</a>
			<a class="active" id="community" href="http://localhost:9090/tumblbugs/${content}/${addr}/community">커뮤니티
				<c:if test="${pvo.community_count ne '0'}">
					<span id="community_count">${pvo.community_count}</span>
				</c:if>
			</a>
			<a class="active" id="policy" href="http://localhost:9090/tumblbugs/${content}/${addr}/policy">펀딩 안내</a>
		</nav>
	</section>
	<div id="shareModalBackground"></div>
	<div id="shareModal">
		<div id="shareModalHeader">
			<div id="modalTitle">프로젝트 공유하기</div>
			<div id="times"><i class="fas fa-times"></i></div>
		</div>
		<div id="shareModalBody">
			<div id="shareFacebook"><a href="http://www.facebook.com/sharer/sharer.php?u=http://127.0.0.1:9090/tumblbugs/project/${pvo.pj_addr}" target="blank" onClick="window.open(this.href, '', 'width=400, height=550'); return false;"><i class="fab fa-facebook-f"></i>&nbsp;&nbsp;페이스북 공유하기</a></div>
			<div id="shareTwitter"><a href="http://twitter.com/intent/tweet?url=http://localhost:9090/tumblbugs/project/${pvo.pj_addr}" target="blank" onClick="window.open(this.href, '', 'width=400, height=550'); return false;"><i class="fab fa-twitter"></i>&nbsp;&nbsp;트위터 공유하기</a></div>
			<div id="shareKakaoTalk"><a><i class="fas fa-comment"></i>&nbsp;&nbsp;카카오톡 공유하기</a></div>
		</div>
	</div>
</body>
</html>