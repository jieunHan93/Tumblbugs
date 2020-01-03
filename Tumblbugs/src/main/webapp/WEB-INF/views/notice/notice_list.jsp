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
	<script src="http://localhost:9090/tumblbugs/js/am-pagination.js"></script>
	<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/am-pagination.css">
  	<script>
  		$(document).ready(function(){
  			var input= "input[value='${category}']";
  			var link = $(input).parent();
  			var category = '${category}';
  			$(link).css("color","#000000");
  			$(link).parent().css("border-bottom","2px solid #000000");
  			
  			var pager = jQuery('#ampaginationsm').pagination({
  				
  			    maxSize: 7,	    		// max page size
  			    totals: '${dbcount}',	// total pages	
  			    page: '${rpage}',		// initial page		
  			    pageSize: '${pagesize}',			// max number items per page
  			
  			    // custom labels		
  			    lastText: '&raquo;&raquo;', 		
  			    firstText: '&laquo;&laquo;',		
  			    prevText: '&laquo;',		
  			    nextText: '&raquo;',
  					     
  			    btnSize:'sm'	// 'sm'  or 'lg'		
  			});
  			jQuery('#ampaginationsm').on('am.pagination.change',function(e){
  				   jQuery('.showlabelsm').text('The selected page no: '+e.page);
  		           $(location).attr('href', "http://localhost:9090/tumblbugs/notice/list?category="+category+"&rpage="+e.page);         
  		    });
  			
  			$("#noticeSearch").click(function(){
  				 var searchVal = $("#input_notice_list_search").val();
  					location.href=("http://localhost:9090/tumblbugs/notice/list?category=all&searchVal="+searchVal);
  				
  			});
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
					<c:forEach var="vo" items="${list}" >
					<c:if test="${vo.event_waiting_date == null || vo.event_waiting_date <= 0}">
						<li class="notice_list_card_size" id="notice_li_card">
							<a href="http://localhost:9090/tumblbugs/notice/content?notice_id=${vo.notice_id}">
								<div class="notice_list_card">
									<c:if test="${vo.notice_sthumbnail != null }">
										<div class="notice_list_card_img"><img src="http://localhost:9090/tumblbugs/resources/upload/${vo.notice_sthumbnail }"></div>
									</c:if>
									<div class="notice_list_card_content">
										<div class="notice_list_card_status"><span>${vo.notice_category }</span>
											<c:if test="${vo.event_extra_date >= 0}"> 
												<span>진행중</span>
											</c:if>
											<c:if test="${vo.event_extra_date < 0}"> 
												<span>종료</span>
											</c:if>
									</div>
										<div class="notice_list_card_title">${vo.notice_title}</div>
										<div class="notice_list_card_date">${vo.notice_reg_date }</div>
									</div>
								</div>
							</a>
						</li>
					</c:if>
					</c:forEach>
					
						<li class="notice_list_card_size">
						<div id="notice_list_paging_box"><div id="ampaginationsm"></div></div>
						<div id="notice_list_search_box">
							<div id="notice_list_search">
								<input type="text" id="input_notice_list_search" val="검색">
								<button type="button" id="noticeSearch"><i class="fas fa-search"></i></button>
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