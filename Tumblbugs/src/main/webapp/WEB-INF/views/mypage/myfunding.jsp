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
		var param = {"name": "category", "value": "all"};
		
		$(".funding_list#all").show();
		$("nav #all #list_count").css("background-color", "#1d85ea");
		
		list(param);
		
		/**
		후원 목록 출력 함수 - object를 파라미터로 받는다.
		**/
		function list(param, page) {
			$(".funding_list a").remove();
			$(".funding_list .list_none").remove();
			
			//페이징 시 해당 조건을 같이 파라미터로 넘겨주기 위해 리스트 필터링 조건에 쓰인 값을 전역변수에 저장해놓는다.
			param = {"name":param.name, "value":param.value};
			
			$.ajax({
				url: "http://localhost:9090/tumblbugs/funding_list?" + param.name + "=" + param.value,
				success: function(data) {
					var obj = JSON.parse(data);
					var appendData = "";
					
					if(obj.flist.length == 0) {
						if(param.name == "search") {
							appendData = "<div class='list_none'><i class='fas fa-search'></i><div>검색 결과가 없습니다.</div></div>";
						} else if(param.name == "category") {
							if(param.value == "all") {
								appendData = "<div class='list_none'><i class='far fa-meh'></i><div>후원 내역이 없습니다.</div></div>";
							} else if(param.value == "ongoing") {
								appendData = "<div class='list_none'><i class='fas fa-rocket'></i><div>펀딩 진행중인 후원이 없습니다.</div></div>";
							} else if(param.value == "payment") {
								appendData = "<div class='list_none'><i class='far fa-credit-card'></i><div>결제 완료된 후원이 없습니다.</div></div>";
							}
						}
					} else {
						for(i=0;i<obj.flist.length;i++) {
							//프로젝트 상태
							/* var project_status = "";
							if(obj.flist[i].remaining_days >= 0) {
								project_status = "펀딩 진행중";
							} else {
								if(obj.flist[i].achievement_rate >= 100) {
									project_status = "펀딩 성공";
								} else {
									project_status = "무산";
								}
							}
							
							//결제 상태
							var payment_status = "";
							if(obj.flist[i].payment_complete_yn == 'n') payment_status = "미결제";
							else payment_status = "결제 완료"; */
							
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
															+ "<div class='project_status'>" + project_status + "</div>"
															+ "<div class='project_title'><b>" + obj.flist[i].pj_title + "<span class='creator_name'>"
															+ obj.flist[i].name + "</span></b></div>"
															+ "<div class='payment_status'><b>" + payment_status + "</b></div>"
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
					
					if(param.name == "category") {
						$(".funding_list#" + param.value).append(appendData);
					} else if(param.name == "search") {
						$("span#searchResultCount").text(obj.flist.length);
						$(".funding_list#search").append(appendData);
					}
				}
			});
		}
		
		
		//탭 선택
		$("nav li").click(function() {
			tabChange($(this).attr("id"));
		});
		
		
		function tabChange(id) {
			$("nav li").removeClass("select_tab");
			$("nav li #list_count").css("background-color", "#999999");
			$("nav li#" + id).addClass("select_tab");
			$("nav li#" + id + " #list_count").css("background-color", "#1d85ea");
			
			//리스트를 다시 불러오는 함수 호출
			list({"name":"category", "value": id});
			
			$(".funding_list").hide();
			$(".funding_list#" + id).show();
		}
		
		
		//후원 취소 알림
		if('${cancelResult}' == "1") {
			history.replaceState({}, null, "http://localhost:9090/tumblbugs/myfunding");
			$("#alertModal").show();
		}
		
		$("#modalClose i").click(function() {
			$("#alertModal").remove();
		});
		
		
		/** 페이징 **/
		var pager = jQuery('#ampaginationsm').pagination({
		    maxSize: 5,	    		// max page size
		    totals: '${dbCount}',	// total pages
		    page: '${page}',		// initial page		
		    pageSize: '${pageSize}',			// max number items per page
		
		    // custom labels		
		    lastText: '&raquo;&raquo;', 		
		    firstText: '&laquo;&laquo;',		
		    prevText: '&laquo;',		
		    nextText: '&raquo;',
				     
		    btnSize:'sm'	// 'sm'  or 'lg'		
		});
		
		jQuery('#ampaginationsm').on('am.pagination.change',function(e){
			   jQuery('.showlabelsm').text('The selected page no: '+e.page);
	           $(location).attr('href', "http://localhost:9090/tumblbugs/myfunding?page="+e.page+ "&" + param.name + "=" + param.value);
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
				
				list({"name": "search", "value": $(this).val()});
				
				$("nav li").removeClass("select_tab");
				$("nav li #list_count").css("background-color", "#999999");
				
				$(".funding_list").hide();
				$(".funding_list#search").show();
			} else {
				$("#searchClear").hide();
				$("#searchIcon").show();
				tabChange("all");
			}
		});
		
		//x아이콘 클릭 시 검색창 초기화
		$("#searchClear").click(function() {
			$("#searchContent").val("");
			$("#searchClear").hide();
			$("#searchIcon").show();
			
			tabChange("all");
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
					<li class="select_tab" id="all">
						<span>모두 보기</span>
						<span id="list_count">${fundingCount.totalCount }</span>
					</li>
					<li id="ongoing">
						<span>펀딩 진행중</span>
						<span id="list_count">${fundingCount.ongoingCount }</span>
					</li>
					<li id="payment">
						<span>결제 완료</span>
						<span id="list_count">${fundingCount.paymentCount }</span>
					</li>
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
				<div class="funding_list" id="search">
					<div class="list_count"><i class="fas fa-search"></i>총 <span id="searchResultCount"></span>건의 검색 결과가 있습니다.</div>
				</div>
				<div class="funding_list" id="all">
					<div class="list_count"><i class="fas fa-list"></i>총 ${fundingCount.totalCount }건의 후원 결과가 있습니다.</div>
				</div>
				<div class="funding_list" id="ongoing">
					<div class="list_count"><i class="fas fa-rocket"></i>총 ${fundingCount.ongoingCount }건의 펀딩 진행중인 후원이 있습니다.</div>
				</div>
				<div class="funding_list" id="payment">
					<div class="list_count"><i class="far fa-credit-card"></i>총 ${fundingCount.paymentCount }건의 결제 완료된 후원이 있습니다.</div>
				</div>
			</article>
			<article id="paging"><div id="ampaginationsm"></div></article>
		</section>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>