<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
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
							<div id="notice_cotent_title_category">${vo.notice_category}</div>
							<div id="notice_content_title_title">${vo.notice_title}</div>
							<div id="notice_content_title_date">${vo.notice_reg_date}</div>
						</div>
					</div>
					<div id="notice_content_textarea">
						${vo.notice_content}
					</div>
					<div id="notice_content_bottom">
						<ul>
							<li>
								<span class="notice_content_bottom_page">이전글</span>
								<c:if test="${vo.prev_id !='noData'}"> 	
									<span class="notice_content_bottom_category">${vo.prev_category}</span>
									<a href="http://localhost:9090/tumblbugs/notice/content?notice_id=${vo.prev_id}">
										<span class="notice_content_bottom_title">${vo.prev_title }</span></a>
								</c:if>
								<c:if test="${vo.prev_id =='noData'}"> 
									<span class="notice_content_bottom_category" style="width:150px">이전글이 없습니다.</span>
								</c:if>
							</li>
							<li>
								<span class="notice_content_bottom_page">다음글</span>	
								<c:if test="${vo.next_id !='noData'}"> 	
									<span class="notice_content_bottom_category">${vo.next_category}</span>
									<a href="http://localhost:9090/tumblbugs/notice/content?notice_id=${vo.next_id}">
										<span class="notice_content_bottom_title">${vo.next_title }</span></a>
								</c:if>
								<c:if test="${vo.next_id =='noData'}"> 
									<span class="notice_content_bottom_category" style="width:150px">다음글이 없습니다.</span>
								</c:if>
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