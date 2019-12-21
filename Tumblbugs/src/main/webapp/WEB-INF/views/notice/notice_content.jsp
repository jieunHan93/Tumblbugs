<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>텀블벅스 :: tumblbugs</title>
	<link rel="icon" href="http://localhost:9090/tumblbugs/images/tumblbugs_img_logo.ico" type="image/x-icon">
	<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/main.css">
	<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/notice.css">
	<script src="http://localhost:9090/tumblbugs/js/jquery-3.4.1.min.js"></script>  	
	<script>
  		$(document).ready(function(){
  			var input= "input[value='${category}']";
  			console.log(input);
  			var link = $(input).parent();
  			$(link).css("color","#000000");
  			$(link).parent().css("border-bottom","2px solid #000000");
  		});
  	</script>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div id="notice_list_bk">
		<section id="notice_list_nav_bk">
			<div id="notice_list_header_title">공지사항</div>
			<div id="notice_list_header_nav_container">
				<div id="notice_list_header_nav">
					<div><a href="http://localhost:9090/tumblbugs/notice/list">전체<input type="hidden" value="all"></a></div>
					<div><a href="http://localhost:9090/tumblbugs/notice/list?category=notice">공지<input type="hidden" value="notice"></a></div>
					<div><a href="http://localhost:9090/tumblbugs/notice/list?category=event">이벤트<input type="hidden" value="event"></a></div>
				</div>
			</div>
		</section>
		
		<section>
			<div id="notice_content_detail">
				<div>
					<div id="notice_content_title">
						<div>
							<div id="notice_cotent_title_category">이벤트</div>
							<div id="notice_content_title_title">❝올해 가장 마음에 들었던 텀블벅 리워드를 제보해 주세요❞</div>
							<div id="notice_content_title_date">2019-11-22 13:53:42</div>
						</div>
					</div>
					<div id="notice_content_textarea">
						<!-- ckeditor -->
						<img src="http://localhost:9090/tumblbugs/images/notice_content_text1.png">
						<img src="http://localhost:9090/tumblbugs/images/notice_content_text2.png">
						<img src="http://localhost:9090/tumblbugs/images/notice_content_text3.png">
					</div>
					<div id="notice_content_bottom">
						<ul>
							<li>
								<span class="notice_content_bottom_page">이전글</span>	
								<span class="notice_content_bottom_category">공지사항</span>
								<a href="#"><span class="notice_content_bottom_title">캐릭터 격전지로 떠오른 ‘텀블벅’..웹툰 플랫폼 흥행작부터 크리에이터까지</span></a>
							</li>
							<li>
								<span class="notice_content_bottom_page">다음글</span>	
								<span class="notice_content_bottom_category">이벤트</span>
								<a href="#"><span class="notice_content_bottom_title">텀블벅, 맛과 건강 두 마리 토끼 잡는 푸드 프로젝트 활성화</span></a>
							</li>
						</ul>
						<div id="notice_content_button">
							<a id="notice_content_forward" href="http://localhost:9090/tumblbugs/notice/list?category=${category}">
								<button type="button">목록으로 돌아가기</button>
							</a>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>	
		
	<jsp:include page="../footer.jsp" />
</body>
</html>