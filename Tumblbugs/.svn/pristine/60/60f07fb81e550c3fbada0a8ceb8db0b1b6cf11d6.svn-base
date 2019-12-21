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
			<div id="notice_list_content">
				<ul>
					<% for(int i=0; i<10; i++){ %>
					<li class="notice_list_card_size">
						<a href="http://localhost:9090/tumblbugs/notice/content?category=${category}">
							<div class="notice_list_card">
								<div class="notice_list_card_img"><img src="http://localhost:9090/tumblbugs/images/2019_best.jpg"></div>
								<div class="notice_list_card_content">
									<div class="notice_list_card_status"><span>이벤트</span><span>진행중</span></div>
									<div class="notice_list_card_title">"올해 가장 마음에 들었던 텀블벅 리워드를 제보해 주세요"</div>
									<div class="notice_list_card_date">2019.11.22</div>
								</div>
							</div>
						</a>
					</li>
					<% } %>
					<li class="notice_list_card_size">
						<div id="notice_list_paging_box">페이징!</div>
						<div id="notice_list_search_box">
							<div id="notice_list_search">
								<input type="text" id="input_notice_list_search" val="검색">
								<button type="button"><i class="fas fa-search"></i></button>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</section>
		
		
	</div>
	
	<jsp:include page="../footer.jsp" />
</body>
</html>