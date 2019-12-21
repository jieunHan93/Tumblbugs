<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>관리자 페이지 메인</title>
<script src="http://localhost:9090/tumblbugs/js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/main.css">
<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/notice.css">
<script src="https://kit.fontawesome.com/6de59477c1.js" crossorigin="anonymous"></script>
<script src="http://localhost:9090/tumblbugs/ckeditor/ckeditor.js"></script>
<script>
	$(document).ready(function() {
		$(".funding_list#list_all").show();
		$("nav #list_all #list_count").css("background-color", "#1d85ea");
		$("#eventCategory").css('display','none');
		
		//탭 선택
		$("nav li").click(function() {
			var id = $(this).attr("id");
			
			$("nav li").removeClass("select_tab");
			$("nav li #list_count").css("background-color", "#999999");
			$(this).addClass("select_tab");
			$(this).find("#list_count").css("background-color", "#1d85ea");
			
			$(".funding_list").hide();
			$(".funding_list#" + id).show();
		});
		//1:1문의
	});
</script>
<style>
body {background-color: #f7f7f7;}
div#admin_mainpage{
	/* display: inline-block; */
}
div#admin_mainconent{
	display: inline-block;
	margin: 0;
	position: absolute;
	margin-left: 340px;
}
div#admin_mainconent>div#admin_header{
	border-bottom:1px solid #ccc;
	border-right:1px solid #ccc;
	width: 1100px;
	height: 70px;
	line-height:70px;
	background-color: #ffffff;
	display: inline-block;
	color: #1e90ff;
}
div#admin_mainconent>div#admin_header p {
	margin-left: 20px;
}

	#funding_history{
		position: absolute;
		margin-left: 20px;
	}
	#funding_history section.page_content {
		background-color: #f6f5f5;
	}
	#funding_history article {
		width: 1080px;
		margin: auto;
	}
	#funding_history li {list-style-type: none;}
	
	
	/* 탭 */
	#funding_history article#page_content_tab {
		padding: 20px 0px 20px 0px;
	}
	#funding_history #page_content_tab nav,
	#funding_history #page_content_tab li,
	#funding_history .search {
		display: inline-block;
		font-size: 10.5pt;
	}
	#funding_history #page_content_tab li {
		border-radius: 4px;
		padding: 8px 10px 8px 10px;
		margin-right: 8px;
		cursor: pointer;
	}
	#funding_history #page_content_tab li:hover {
		background-color: rgba(0,0,0,.05);
	}
	#funding_history #page_content_tab li span#list_count {
		display: inline-block;
		margin-left: 10px;
		border-radius: 5px;
		width: 26px;
		font-size: 10pt;
		text-align: center;
		background-color: #999999;
		color: white;
	}
	
#funding_history .select_tab {
	background-color: rgba(0,0,0,.05);
	color: #1d85ea;
}

#ContentBtnDiv{
	text-align:center;
	padding:20px 0px 15px 0px;
}
#ContentBtnDiv button{
	padding:8px 30px 8px 30px;
	border:none;
	border-radius:4px;
	color:white;
	font-weight:500;
	background:#343434;
	cursor:pointer;
}

</style>
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
							</div>
						</div>
					</div>
				</div>
		</section>
				<div id="ContentBtnDiv">
					<button>수정</button>
					<a href="http://localhost:9090/tumblbugs/admin/notice"><button>목록</button></a>
					<button>삭제</button>
				</div>
				
			</div>
		</div>
	</div>
</body>
</html>