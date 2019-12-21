<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%-- <% boolean result = true; %> --%>
<% String sid = (String)session.getAttribute("semail");
	 if(sid != "" && sid != null) {
 }
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  	<script src="https://kit.fontawesome.com/6de59477c1.js" crossorigin="anonymous"></script>
  	<script>
  	$(document).ready(function(){
  		$( window ).scroll( function() {
    		if ( $( this ).scrollTop() > 200 ) {
    			$( '.top' ).fadeIn();
    		} else {
    			$( '.top' ).fadeOut();
    		}
    	} );
    	$( '.top' ).click( function() {
    		$( 'html, body' ).animate( { scrollTop : 0 }, 400 );
    		return false;
    	} );
		$("div#modal_all_project>div").click(function(){
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
		
		$("div#categories>div").click(function(){
			var menu_id = $(this).attr("id");
			sessionStorage.clear();
			sessionStorage.setItem("category",menu_id);
			location.href="http://localhost:9090/tumblbugs/discover";
		});
		
		$("button#searchBtn").click(function(){
			var keyword = $("input#searchKeyword").val();
			searchProject(keyword);
		});
		
	    $("input#searchKeyword").keydown(function (key) {
	    	var keyword = $("input#searchKeyword").val();
	        if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
	        	searchProject(keyword);
	        }
	    });
	    $("input#searchKeyword2").keydown(function (key) {
	    	var keyword = $("input#searchKeyword2").val();
	        if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
	        	searchProject(keyword);
	        }
	    });
		
	    /** 자동완성 **/
	    $("input#searchKeyword2").keyup(function (e) {
	    	console.log($("input#searchKeyword2").val().length);
	    	if(e.keyCode == 17 || e.keyCode == 25 //ctrl
	    			|| e.keyCode == 192 //`
	    			|| e.keyCode == 27 // esc
	    			|| e.keyCode == 91 || e.keyCode == 92 || e.keyCode == 93// 윈도우 키
	    			|| e.keyCode == 13	// 엔터키
	    			|| e.keyCode == 16 //Shift
	    			|| e.keyCode == 20 //Caps Lock
	    			|| e.keyCode == 189 //-
	    			|| e.keyCode == 187 //=
	    			|| e.keyCode == 220 //\
	    			|| e.keyCode == 18 || e.keyCode == 21 //Alt
	    			|| e.keyCode == 145 //Scroll Lock
	    			|| e.keyCode == 19 //Pause Break
	    			|| e.keyCode == 45 //Insert
	    			|| e.keyCode == 33 //Page Up
	    			|| e.keyCode == 34 //Page Down
	    			|| e.keyCode == 144 //Num Lock
	    			|| e.keyCode == 144 //Num Lock
	    			|| e.keyCode == 111 || e.keyCode == 106 || e.keyCode == 109 || e.keyCode == 107 ///*-+
	    			|| e.keyCode == 46 //.
	    			|| e.keyCode == 113 || e.keyCode == 114 || e.keyCode == 119 || e.keyCode == 120
	    			|| e.keyCode == 121 || e.keyCode == 122 || e.keyCode == 123//F2 ~ F11
	    			|| e.keyCode == 37 || e.keyCode == 38 || e.keyCode == 39 || e.keyCode == 40  //방향키
	    			){
	    			return;
   			} else if($("input#searchKeyword2").val().length <= 1 && e.keyCode == 8){
   				$("div#search_keyword_list span#search_fail").remove();
   				$("div.search_keyword_content").remove();
   				return;
   			} 
	    	
	    	$("div#search_keyword_list span#search_fail").remove();
			$("div.search_keyword_content").remove();
			
	    	var keyword = $.trim($("input#searchKeyword2").val()); 
	    	console.log("keyword::" + keyword);
	    	if(keyword != ""){
	    		$.ajax({
					url: encodeURI("http://localhost:9090/tumblbugs/searching_list_proc?keyword="+keyword),
					success:function(result){
						if(result == "fail"){
							$("div#search_keyword_list>div:first-child").before("<span id='search_fail'>추천 검색어가 없습니다.</span>");
							$("div#search_keyword_list>div:first-child").show();
							$("div.keyword_content").show();
						} else {
							$("div.search_keyword_content").remove();
							var list = JSON.parse(result);
							console.log(result)
							var str = "";
							for(i=0;i<list.data.length;i++){
								str += '<div class="search_keyword_content"><a class="find_keyword">';
			          			str += '<i class="fas fa-history"></i><span>'+list.data[i].keyword+'</span>';
				          		str += '</a></div>';
							}
							$("div#search_keyword_list>div:first-child").before(str);
							$("a.find_keyword").click(function(){
				    			var keyword = $(this).find("span").text();
				    			searchProject(keyword);
				    		});
						}
					}
				});
	    	}
	 });
	    /** 모달 창 닫힐때 검색창 초기화 **/
	    $("div#searchMenuModal").on('hide.bs.modal', function(){
	    	$("input#searchKeyword2").val("");
	    	$("div#search_keyword_list>span:first-child").remove();
			$("div.search_keyword_content").remove();
	    });
		/** 상위 검색 링크 불러오기 **/
	    $.ajax({
			url: "http://localhost:9090/tumblbugs/search_list_proc",
			success:function(result){
				if(result == "fail"){
					
				} else {
					var list = JSON.parse(result);
					var str = "";
					for(i=0;i<list.data.length;i++){
						str += '<div class="keyword_content"><a class="find_keyword">';
	          			str += '<i class="fas fa-search"></i><span>'+list.data[i].keyword+'</span>';
		          		str += '</a></div>';
					}
					$("div#search_keyword_list").append(str);
					
					$("a.find_keyword").click(function(){
		    			var keyword = $(this).find("span").text();
		    			searchProject(keyword);
		    		});
				}
			}
		});
	    
	    
	    searchProject = function (keyword){
			if(keyword != ""){
				sessionStorage.clear();
				sessionStorage.setItem("search",keyword);
				location.href="http://localhost:9090/tumblbugs/discover?keyword="+keyword;
			}
	    };
	});
	</script>
</head>
<body>
	<header>
		<div id="header_nav">
			<div id="header_nav_left">
				<button type="button" data-toggle="modal" data-target="#projectMenuModal"><img src="http://localhost:9090/tumblbugs/images/icon_nav.png">프로젝트 둘러보기</button>
				<a href="http://localhost:9090/tumblbugs/project_start"><span>프로젝트 올리기</span></a>
			</div>
			<div id="header_nav_center"><a href="http://localhost:9090/tumblbugs/index"><img src="http://localhost:9090/tumblbugs/images/tumblbugs_logo.png"></a></div>
			<button type="button" data-toggle="modal" data-target="#searchMenuModal" id="open_search_box"></button>
			<div id="header_nav_right">
				<% if(sid == null){ %>
				<a href="/tumblbugs/login">
					<span>로그인/회원가입</span>
					<div id="user_icon"></div>
				</a>
				<% }else{ %>
				<button id="mymenubtn" type="button" data-toggle="modal" data-target="#myMenuModal">${semail}<div id="user_icon"></div></button>
				<% } %>
			</div>
		</div>
	</header>
	
	  <!-- The Modal -->
	  <div class="modal" id="projectMenuModal">
	    <div class="modal-dialog modal-dialog-scrollable">
	      <div class="modal-content">
	      
	        <!-- Modal Header -->
	        <div class="modal-header">
	          <h1 class="modal-title">프로젝트  둘러보기</h1>
	          <button type="button" class="close" data-dismiss="modal">×</button>
	        </div>
	        
	        <!-- Modal body -->
	        <div class="modal-body">
	        	<div id="modal_search">
	        		<div>
	        			<div id="modal_search_title">검색</div>
	        			<div id="modal_search_box">
        					<input type="text" id="searchKeyword" placeholder="프로젝트를 검색해주세요">
        					<button id="searchBtn" type="button">검색하기</button>
	        			</div>
	        		</div>
	        	</div>
	        	<div id="modal_space"></div>
	        	<div id="modal_project_menu">
	        		<div id="modal_all_project">
	        			<div id="sort_all_project"><a><span>모든 프로젝트</span></a></div>
	        			<div id="sort_editorpick_project"><a><span>인기 추천 프로젝트</span></a></div>
	        			<div id="sort_rateup_project"><a><span>성공 임박 프로젝트</span></a></div>
	        			<div id="sort_new_project"><a><span>신규 추천 프로젝트</span></a></div>
	        		</div>
	        		<c:if test="${fn:length(sessionScope.clist) != 0}">
	        		<div id="modal_collection">
	        			<div>기획전</div>
	        			<c:forEach var="vo" items="${sessionScope.clist }">
	        				<div><a href="http://localhost:9090/tumblbugs/collections?col_id=${vo.col_id }"><span>${vo.col_name }</span></a></div>
	        			</c:forEach>
	        		</div>
	        		</c:if>
	        		<div id="modal_tag">
	        			<div>태그</div>
	        			<div id="tags">
	        				<div><a href="#"><span>#원터이즈커밍</span></a></div>
	        				<div><a href="#"><span>#창작자의도구상자</span></a></div>
	        				<div><a href="#"><span>#한국의멋</span></a></div>
	        				<div><a href="#"><span>#텀블벅미식회</span></a></div>
	        				<div><a href="#"><span>#집사생활</span></a></div>
	        				<div><a href="#"><span>#오늘의분위기</span></a></div>
	        				<div><a href="#"><span>#에코라이프</span></a></div>
	        				<div><a href="#"><span>#어덕행덕</span></a></div>
	        				<div><a href="#"><span>#기묘한이야기</span></a></div>
	        			</div>
	        		</div>
	        		
	        		<div id="modal_category">
	        			<div>카테고리</div>
	        			<div id="categories">
	        				<div id="게임"><a><span>게임</span></a></div>
	        				<div id="공연"><a><span>공연</span></a></div>
	        				<div id="디자인"><a><span>디자인</span></a></div>
	        				<div id="만화"><a><span>만화</span></a></div>
	        				<div id="미술"><a><span>미술</span></a></div>
	        				<div id="공예"><a><span>공예</span></a></div>
	        				<div id="사진"><a><span>사진</span></a></div>
	        				<div id="영화&비디오"><a><span>영화&비디오</span></a></div>
	        				<div id="푸드"><a><span>푸드</span></a></div>
	        				<div id="음악"><a><span>음악</span></a></div>
	        				<div id="출판"><a><span>출판</span></a></div>
	        				<div id="테크놀로지"><a><span>테크놀로지</span></a></div>
	        				<div id="패션"><a><span>패션</span></a></div>
	        				<div id="캠페인"><a><span>캠페인</span></a></div>
	        			</div>
	        		</div>
	        	</div>
	        </div>
	      </div>
	    </div>
	  </div>
	  
	    <!-- The Modal -->
	  <div class="modal" id="searchMenuModal">
	    <div class="modal-dialog">
	      <div class="modal-content">
	      
	        <!-- Modal Header -->
	        <div class="modal-header">
	          <div>
	          	<img src="http://localhost:9090/tumblbugs/images/icon_search.png">
	          	<input type="text" id="searchKeyword2" name="keyword" placeholder="검색어를 입력해주세요">
	          </div>
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        
	        <!-- Modal body -->
	        <div id="search_keyword_list" class="modal-body">
	        	<div id="top_list_menu">인기검색어</div>
	        </div>
	      </div>
	    </div>
	  </div>
	  
	    <!-- The Modal -->
	  <div class="modal" id="myMenuModal">
	    <div class="modal-dialog">
	      <div class="modal-content">
	      
	        <!-- Modal Header -->
	        <div class="modal-header">
	          <h1 class="modal-title">내 페이지</h1>
	          <button type="button" class="close" data-dismiss="modal">×</button>
	        </div>
	        
	        <!-- Modal body -->
	        <div class="modal-body">
	          <div id="myMenu_user_profil">
	          	<span id="myMenu_user_profil_icon"></span>
	          	<span id="myMenu_user_profil_name">유저명</span>
	          </div>
	          <div id="modal_space"></div>
	          <a href="http://localhost:9090/tumblbugs/mypage/message"><div>메시지</div></a>
	          <a href="http://localhost:9090/tumblbugs/myfunding"><div>내 후원현황</div></a>
	          <a href="http://localhost:9090/tumblbugs/myproject"><div>내가 만든 프로젝트</div></a>
	          <div id="modal_space"></div>
	          <a href="http://localhost:9090/tumblbugs/mypage/profile"><div>프로필 정보</div></a>
	          <a href="http://localhost:9090/tumblbugs/mypage/payment"><div>지불 정보 설정</div></a>
	          <a><div>로그아웃</div></a>
	        </div>
	        
	      </div>
	    </div>
	  </div>
	  
	  <button type="button" class="top"></button>
</body>
</html>