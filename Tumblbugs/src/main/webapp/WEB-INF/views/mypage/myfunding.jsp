<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>텀블벅스 :: tumblbugs</title>
<script src="http://localhost:9090/tumblbugs/js/jquery-3.4.1.min.js"></script>
<script src="http://localhost:9090/tumblbugs/js/am-pagination.js"></script>
<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/main.css">
<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/am-pagination.css">
<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/mypage.css">
<link rel="icon" href="http://localhost:9090/tumblbugs/images/tumblbugs_img_logo.ico" type="image/x-icon">
<script>
	$(document).ready(function() {
		var category = '${category}';
		if(category == null || category == "") {
			category = "all";
		}
		
		$("nav #" + category + " #list_count").css("background-color", "#1d85ea");
		$("li#" + category).addClass("select_tab");
		$("#search_result").hide();
		
		//검색 결과 출력
		function search(keyword) {
			$(".funding_list#search_result a").remove();
			$(".funding_list#search_result .list_none").remove();
			
			$.ajax({
				url: "http://localhost:9090/tumblbugs/myfunding/search?search=" + keyword,
				success: function(data) {
					var obj = JSON.parse(data);
					var appendData = "";
					
					if(obj.flist.length == 0) {
						appendData = "<div class='list_none'><i class='fas fa-search'></i><div>검색 결과가 없습니다.</div></div>";
					} else {
						for(i=0;i<obj.flist.length;i++) {
							appendData += "<a href='http://localhost:9090/tumblbugs/myfunding/detail?funding_id="+ obj.flist[i].funding_id +"'>"
												+ "<table>"
													+ "<tr>"
														+ "<td colspan='2'><b>" + obj.flist[i].funding_date + "</b></td>"
														+ "<td>후원번호 <b>" + obj.flist[i].funding_id + "</b></td>"
													+ "</tr>"
													+ "<tr>"
														+ "<td class='funding_image'><img id='project_main_img' src='http://localhost:9090/tumblbugs/upload/"
															+ obj.flist[i].pj_simg +"'></td>"
														+ "<td class='funding_detail'>"
															+ "<div class='project_status'>" + obj.flist[i].project_status + "</div>"
															+ "<div class='project_title'><b>" + obj.flist[i].pj_title + "<span class='creator_name'>"
															+ obj.flist[i].name + "</span></b></div>"
															+ "<div class='payment_status'><b>" + obj.flist[i].payment_status + "</b></div>"
															+ "<div class='funding_price'>"
																+ "<b>" + obj.flist[i].total_funding_price + "원</b>을 후원하셨습니다."
															+ "</div>"
														+ "</td>"
														+ "<td><i class='fas fa-angle-right'></i></td>"
													+ "</tr>"
												+ "</table>"
											+ "</a>";
						}
					}
					
					$(".funding_list#category_result").hide();
					$("nav li").removeClass("select_tab");
					$("nav li #list_count").css("background-color", "#999999");
					$("#paging").hide();
					
					$("span#searchResultCount").text(obj.flist.length);
					$(".funding_list#search_result").append(appendData).show();
				}
			});
		}
		
		function showCategoryResult() {
			$("nav li#" + category).addClass("select_tab");
			$("nav li#" + category + " #list_count").css("background-color", "#1d85ea");
			$(".funding_list#category_result").show();
			$(".funding_list#search_result").hide();
			$("#paging").show();
		}
		
		//후원 취소 알림
		if('${cancelResult}' == "1") {
			history.replaceState({}, null, "http://localhost:9090/tumblbugs/myfunding");
			$("#alertModal").show();
		}
		
		$("#modalClose i").click(function() {
			$("#alertModal").remove();
		});
		
		
		/** 검색 **/
		//검색창에 포커스 위치할 때 테두리를 파란색으로 변경
		$("#searchContent").focus(function() {
			$(".search span").css("border", "1px solid #1d85ea");
		});
		
		$("#searchContent").focusout(function() {
			$(".search span").css("border", "1px solid lightgray");
		});
		
		//검색창에 텍스트 입력시 돋보기 아이콘을 x아이콘으로 교체
		$("#searchContent").keyup(function() {
			if($(this).val() != "") {
				$("#searchClear").show();
				$("#searchIcon").hide();
				
				search($(this).val());
				
				$("nav li").removeClass("select_tab");
				$("nav li #list_count").css("background-color", "#999999");
			} else {
				$("#searchClear").hide();
				$("#searchIcon").show();
				
				showCategoryResult();
			}
		});
		
		//x아이콘 클릭 시 검색창 초기화
		$("#searchClear").click(function() {
			$("#searchContent").val("");
			$("#searchClear").hide();
			$("#searchIcon").show();
			
			showCategoryResult();
		});
		
		
		/** 페이징 **/
		var pager = jQuery('#ampaginationsm').pagination({
		    maxSize: 5,	    			// max page size
		    totals: '${dbCount}',		// total pages
		    page: '${page}',			// initial page		
		    pageSize: '${pageSize}',	// max number items per page
		
		    // custom labels		
		    lastText: '&raquo;&raquo;', 		
		    firstText: '&laquo;&laquo;',		
		    prevText: '&laquo;',		
		    nextText: '&raquo;',
				     
		    btnSize:'sm'	// 'sm'  or 'lg'
		});
		
		jQuery('#ampaginationsm').on('am.pagination.change',function(e){
		   jQuery('.showlabelsm').text('The selected page no: '+e.page);
		   if('${category}' != null) {
			   $(location).attr('href', "http://localhost:9090/tumblbugs/myfunding?category=" + '${category}' + "&page="+e.page);
		   } else {
			   $(location).attr('href', "http://localhost:9090/tumblbugs/myfunding?page="+e.page);
		   }
	    });
	});
</script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div id="funding_history">
		<div id="alertModal">
			<div>
				<div id="modalTitle">알림</div>
				<div id="modalClose"><i class="fas fa-times"></i></div>
			</div>
			<div id="alertMessage">후원을 취소하셨습니다.</div>
		</div>
		<section class="page_title">
			<span><img src="http://localhost:9090/tumblbugs/upload/${member.profile_simg }" id="img1"></span>
			<div>${member.name }님의 후원 현황</div>
		</section>
		<section class="page_content">
			<article id="page_content_tab">
				<nav>
					<a href="http://localhost:9090/tumblbugs/myfunding?category=all">
						<li id="all">
							<span>모두 보기</span>
							<span id="list_count">${fundingCount.totalCount }</span>
					</li></a>
					<a href="http://localhost:9090/tumblbugs/myfunding?category=ongoing">
						<li id="ongoing">
							<span>펀딩 진행중</span>
							<span id="list_count">${fundingCount.ongoingCount }</span>
						</li></a>
					<a href="http://localhost:9090/tumblbugs/myfunding?category=payment">
						<li id="payment">
							<span>결제 완료</span>
							<span id="list_count">${fundingCount.paymentCount }</span>
						</li></a>
				</nav>
				<div class="search">
					<span>
						<input id="searchContent" type="text" placeholder="프로젝트, 창작자를 검색하세요">
						<i class="fas fa-search" id="searchIcon"></i>
						<i class="fas fa-times" id="searchClear" style="display: none; cursor: pointer;"></i>
					</span>
				</div>
			</article>
			<article class="page_content_funding_list">
				<div class="funding_list" id="category_result">
					<c:choose>
						<c:when test="${category eq 'all' || category eq null}">
							<div class="list_count"><i class="fas fa-list"></i>총 ${fundingCount.totalCount }건의 후원 결과가 있습니다.</div>
						</c:when>
						<c:when test="${category eq 'ongoing'}">
							<div class="list_count"><i class="fas fa-rocket"></i>총 ${fundingCount.ongoingCount }건의 펀딩 진행중인 후원이 있습니다.</div>
						</c:when>
						<c:when test="${category eq 'payment'}">
							<div class="list_count"><i class="far fa-credit-card"></i>총 ${fundingCount.paymentCount }건의 결제 완료된 후원이 있습니다.</div>
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${fn:length(flist) eq 0}">
							<div class="list_none">
								<c:choose>
									<c:when test="${category eq 'all'}">
										<i class="far fa-meh"></i>
										<div>후원 내역이 없습니다.</div>
									</c:when>
									<c:when test="${category eq 'ongoing'}">
										<i class="fas fa-rocket"></i>
										<div>펀딩 진행중인 후원이 없습니다.</div>
									</c:when>
									<c:when test="${category eq 'payment'}">
										<i class="far fa-credit-card"></i>
										<div>결제 완료된 후원이 없습니다.</div>
									</c:when>
								</c:choose>
							</div>
						</c:when>
						<c:otherwise>
							<c:forEach items="${flist}" var="fvo">
								<a href="http://localhost:9090/tumblbugs/myfunding/${fvo.funding_id }">
									<table>
										<tr>
											<td colspan="2"><b>${fvo.funding_date }</b></td>
											<td>후원번호 <b>${fvo.funding_id }</b></td>
										</tr>
										<tr>
											<td class="funding_image">
											<img id="project_main_img" src="http://localhost:9090/tumblbugs/upload/${fvo.pj_simg }"></td>
											<td class='funding_detail'>
												<div class='project_status'>${fvo.project_status }</div>
												<div class='project_title'>
													<b>${fvo.pj_title }<span class='creator_name'>${fvo.name }</span></b>
												</div>
												<div class='payment_status'><b>${fvo.payment_status }</b></div>
												<div class='funding_price'>
													<b>${fvo.total_funding_price }</b>을 후원하셨습니다.
												</div>
											</td>
											<td><i class='fas fa-angle-right'></i></td>
										</tr>
									</table>
								</a>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="funding_list" id="search_result">
					<div class="list_count"><i class="fas fa-search"></i>총 <span id="searchResultCount"></span>건의 검색 결과가 있습니다.</div>
				</div>
			</article>
			<c:if test="${fn:length(flist) ne 0}">
				<article id="paging"><div id="ampaginationsm"></div></article>
			</c:if>
		</section>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>