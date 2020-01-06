<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>텀블벅스 :: tumblbugs</title>
	<link rel="icon" href="http://localhost:9090/tumblbugs/images/tumblbugs_img_logo.ico" type="image/x-icon">
	<script src="http://localhost:9090/tumblbugs/js/jquery-3.4.1.min.js"></script>
	<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/main.css">
	<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/am-pagination.css">
	<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/myproject.css">
	<script src="http://localhost:9090/tumblbugs/js/am-pagination.js"></script>
<script>
	$(document).ready(function(){
		$(".update_project_page").click(function(){
			var pj_id = $(this).attr("id");
			location.href = "http://localhost:9090/tumblbugs/project_start_upload?pj_id="+pj_id; 
		});
		
		$(".delete_project_page").off().on('click', function(){
			var pj_id = $(this).attr("id");
			var conf_val = confirm('프로젝트를 삭제하시겠습니까? 작성 중인 모든 내용이 삭제됩니다.');
			
			if(conf_val){
				$.ajax({url: 'http://localhost:9090/tumblbugs/delete_project_proc?pj_id='+pj_id, success : function(res) {
					location.reload();
	   			}});
				
			}
		});
		
		var pager = jQuery('#ampaginationsm').pagination({
		
		    maxSize: 7,	    		// max page size
		    totals: '${dbcount}',	// total pages	
		    page: '${page}',		// initial page		
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
	           $(location).attr('href', "http://localhost:9090/tumblbugs/projects/" + '${mvo.member_id}' +"?page="+e.page);
	    });
		
 	});
</script> 
</head>

<body>
	<jsp:include page="../header.jsp" />
	<div>
		<section id="myproject_bk">
			<div id="myproject_header_info">
				<div id="myproject_header_info_icon">
					<div style="background-image: url('http://localhost:9090/tumblbugs/upload/${mvo.profile_simg}')"></div>
				</div>
				<h1>${mvo.name}</h1>
				<c:if test="${mvo.website != 'null' && mvo.website != null && mvo.website !=''}"> 
					<p id="myproject_header_info_web"><a href="${mvo.website}">${mvo.website}</a></p>
				</c:if>
				<c:if test="${mvo.website == 'null'}"> 
					<p id="myproject_header_info_web"><a>창작자 웹사이트가 없습니다!</a></p>
				</c:if>
				<p id="myproject_header_info_detail"><i class="fas fa-check-circle"></i><span>${pj_count}개 프로젝트의 창작자</span></p>
			</div>
		</section>
		<section>
			<div id="myproject_body">
				<div id="myproject_content_box">
					<div id="delete_fail_message"></div>
					<div id="project_content_box_title">
						<h3>만든 프로젝트</h3><span>${pj_count}</span>개
					</div>
					<div id="project_content_card_box">
						
						<!-- 카드 한장 -->
						<c:forEach var="vo" items="${list}" >
							<fmt:formatNumber var= "total_price" value= "${vo.total_price}" />
							<c:if test="${(vo.total_price/vo.pj_price)*100 != 'NaN'}"> 
								<fmt:parseNumber var= "per_total" integerOnly= "true" value= "${(vo.total_price/vo.pj_price)*100}" />
							</c:if>
							<c:if test="${(vo.total_price/vo.pj_price)*100 == 'NaN'}"> 
								<fmt:parseNumber var= "per_total" integerOnly= "true" value= "0" />
							</c:if>
							
							<div class="project_card">
								<c:if test="${sessionScope.semail eq mvo.email}">
								<!-- Default dropright button -->
								<div class="btn-group dropright">
								  	<button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								  		<i class="fas fa-ellipsis-v"></i>
								  	</button>
							  		<div class="dropdown-menu">
							  			<div class="dropdown-item"><a id="${vo.pj_id}" class="update_project_page" style="cursor:pointer">수정</a></div>
							  			<c:if test="${vo.pj_check_yn !='y' || vo.start_extra_date > 0}"> 
										   		<div class="dropdown-item"><a id="${vo.pj_id}" class="delete_project_page" style="cursor:pointer">삭제</a></div>
								   		</c:if>
									    <div class="dropdown-item"><a href="http://localhost:9090/tumblbugs/myproject/delivery?pj_id=${vo.pj_id }&page=${page}" style="cursor:pointer">선물배송</a></div>
								  	</div>
								</div>
								</c:if>
								<c:if test="${vo.pj_addr != null && vo.pj_check_yn == 'y'}"> 
								<a class="project_card_img_link" href="http://localhost:9090/tumblbugs/project/${vo.pj_addr}">
									<div class="project_card_img_box">
										<c:if test="${vo.pj_simg != null}"> 
											<img class="project_card_img" src="http://localhost:9090/tumblbugs/upload/${vo.pj_simg}">
										</c:if>
										<c:if test="${vo.pj_simg == null}">
											<img class="project_card_img" src="http://localhost:9090/tumblbugs/upload/tmp_img.jpg">
										</c:if>
									</div>
								</a>
								</c:if>
								<c:if test="${vo.pj_addr == null || vo.pj_check_yn != 'y'}"> 
									<div class="project_card_img_box">
										<c:if test="${vo.pj_simg != null}"> 
											<img class="project_card_img" src="http://localhost:9090/tumblbugs/upload/${vo.pj_simg}">
										</c:if>
										<c:if test="${vo.pj_simg == null}">
											<img class="project_card_img" src="http://localhost:9090/tumblbugs/upload/tmp_img.jpg">
										</c:if>
									</div>
								</c:if>
								
								<div class="project_card_content">
									<h3 class="project_card_content_title">
									<c:if test="${vo.pj_addr != null && vo.pj_check_yn == 'y'}"> 
										<a href="http://localhost:9090/tumblbugs/project/${vo.pj_addr}">${vo.pj_title}</a>
									</c:if>
									<c:if test="${vo.pj_addr == null || vo.pj_check_yn != 'y'}"> 
										<a>${vo.pj_title}</a>
									</c:if>
									</h3>
									<p class="project_card_content_creator">${mvo.name}의 프로젝트</p>
									<p class="project_card_content_detail">${vo.pj_summary}</p>
									
								</div>
								<div class="progress project_card_content_progress">
							  		<div class="progress-bar" role="progressbar" aria-valuenow="${per_total}%" aria-valuemin="0" aria-valuemax="100" style="width:${per_total}%"></div>
								</div>
									<div class="project_card_bottom_info">
										<div class="project_card_bottom_info_left">
											<span>모인 금액</span>
											<span>${total_price}원<span> ${per_total}%</span></span>
										</div>
										<div class="project_card_bottom_info_right">
											<c:if test="${vo.pj_check_yn == 'y' && vo.pj_extra_date >= 1}"> 
												<c:if test="${vo.start_extra_date > 0}">
														<span>시작까지</span>
														<span>${vo.start_extra_date}일</span>
												</c:if>
												<c:if test="${vo.start_extra_date <= 0}">
													<c:if test="${vo.pj_extra_date != 0}">
														<span>남은 시간</span>
														<span>${vo.pj_extra_date+1}일</span>
													</c:if>
												</c:if>
											</c:if>
											<c:if test="${vo.pj_check_yn == 'y' && vo.pj_extra_date == 0}"> 
												<span>남은 시간</span>
												<span style='color:rgb(224,90,107)'>오늘마감!</span>
											</c:if>
											<c:if test="${vo.pj_check_yn == 'n'}"> 
												<span style='color:rgb(224,90,107)'>승인 실패</span>
											</c:if>
											<c:if test="${vo.pj_check_yn == 'c'}"> 
												<span style='color:rgb(54,112,241)'>검토 중</span>
											</c:if>
											<c:if test="${vo.pj_check_yn == null}"> 
												<span>작성 중</span>
											</c:if>
											<c:if test="${vo.pj_check_yn == 'y' && vo.pj_extra_date < 0}"> 
												<c:if test="${vo.pj_extra_date < 0 && per_total >= 100}"> 
													<span class="project_card_status_success">성공!</span>
												</c:if>
												<c:if test="${vo.pj_extra_date < 0 && per_total < 100}"> 
													<span class="project_card_status_success">무산!</span>
												</c:if>
											</c:if>
										</div>
									</div>
							</div>
						</c:forEach>
						<c:if test="${fn:length(list) ne 0}">
							<div id="paging"><div id="ampaginationsm"></div></div>
						</c:if>
					</div>
				</div>
			</div>
		</section>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>