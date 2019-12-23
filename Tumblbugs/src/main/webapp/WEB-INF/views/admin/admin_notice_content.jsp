<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>관리자 페이지</title>
<script src="http://localhost:9090/tumblbugs/js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/main.css">
<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/notice.css">
<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/admin_notice.css">
<script src="http://localhost:9090/tumblbugs/js/admin_notice.js"></script>
<script src="https://kit.fontawesome.com/6de59477c1.js" crossorigin="anonymous"></script>
<script src="http://localhost:9090/tumblbugs/ckeditor/ckeditor.js"></script>
</head>
<body>
	<div id="admin_mainpage">
		<jsp:include page="admin_sidebar.jsp"></jsp:include>
		<div id="admin_mainconent">
			<div id="admin_header">
				<p>공지사항</p>
			</div>
		   <div id="funding_history">
				<div class="funding_list" id="list_all">
				</div>
			</div>
			<div id="admin_notice_content">
			<section>
				<div id="notice_content_detail">
					<div>
						<div id="notice_content_title">
							<div>
								<div id="notice_cotent_title_category">${vo.notice_category}</div>
								<div id="notice_content_title_title">${vo.notice_title}</div>
								<c:if test="${vo.notice_category =='이벤트'}"> 
									<div id="notice_content_title_date" style="color:#1d85ea; font-weight:bold">이벤트 기간 : ${vo.notice_event_start} ~ ${vo.notice_event_end}</div>
								</c:if>
								<div id="notice_content_title_date">${vo.notice_reg_date}</div>
							</div>
						</div>
						<div id="notice_content_textarea">
							${vo.notice_content}
							<c:if test="${vo.notice_category =='이벤트'}"> 
								<div id="event_date">이벤트 기간 : ${vo.notice_event_start} ~ ${vo.notice_event_end}</div>
							</c:if>
						</div>
						<div id="notice_content_bottom">
							<ul>
								<li>
									<span class="notice_content_bottom_page">이전글</span>
									<c:if test="${vo.prev_id !='noData'}"> 	
										<span class="notice_content_bottom_category">${vo.prev_category}</span>
										<a href="http://localhost:9090/tumblbugs/admin/notice_content?notice_id=${vo.prev_id}">
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
										<a href="http://localhost:9090/tumblbugs/admin/notice_content?notice_id=${vo.next_id}">
											<span class="notice_content_bottom_title">${vo.next_title }</span></a>
									</c:if>
									<c:if test="${vo.next_id =='noData'}"> 
										<span class="notice_content_bottom_category" style="width:150px">다음글이 없습니다.</span>
									</c:if>
								</li>
							</ul>
							<div id="notice_content_button">
							</div>
						</div>
					</div>
				</div>
		</section>
				<div id="ContentBtnDiv">
					<a href="http://localhost:9090/tumblbugs/admin/notice_update?notice_id=${vo.notice_id}"><button>수정</button></a>
					<a href="http://localhost:9090/tumblbugs/admin/notice"><button>목록</button></a>
					<a href="http://localhost:9090/tumblbugs/admin/notice_delete?notice_id=${vo.notice_id}"><button>삭제</button></a>
				</div>
				
			</div>
		</div>
	</div>
</body>
</html>