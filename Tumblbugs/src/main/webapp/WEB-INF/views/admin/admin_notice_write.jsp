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
<script src="https://kit.fontawesome.com/6de59477c1.js" crossorigin="anonymous"></script>
<script src="http://localhost:9090/tumblbugs/ckeditor/ckeditor.js"></script>
<script>
	$(document).ready(function() {
		$(".funding_list#list_all").show();
		$("nav #list_all #list_count").css("background-color", "#1d85ea");
		$("#eventCategory").css('display','none');
		/***ck 에디터***/
		var editorConfig = {
		   filebrowserUploadUrl : "http://localhost:9090/tumblbugs/fileupload.do", //이미지 업로드
		};
		ck = CKEDITOR.replace("notice_content", editorConfig);
		CKEDITOR.config.height = 370;
		
		CKEDITOR.on('dialogDefinition', function( ev ){
		   var dialogName = ev.data.name;
		   var dialogDefinition = ev.data.definition;
		
		   switch (dialogName) {
		       case 'image': //Image Properties dialog
		       //dialogDefinition.removeContents('info');
		       dialogDefinition.removeContents('Link');
		       dialogDefinition.removeContents('advanced');
		        break;
		    }
		});
		
		$("#noticeCategory").on("change", function(){
			
			if($(this).val()=="event"){
				$("#eventCategory").css('display','');
			}else{
				$("#eventCategory").css('display','none');
			}
		});
		
		$("#noticeWrite").click(function(){
			$("#notice_content").val(CKEDITOR.instances.notice_content.getData());
			
			admin_notice.submit();
		});
		
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
	
	div#admin_notice_write {
		width: 1080px;
		position: absolute;
		margin: 70px 0px 0px 20px;
	}
	 table#notice_write_table, table#notice_write_table th, table#notice_write_table td {
		border-collapse: collapse;
	}
	 table#notice_write_table td {
	 	height: 30px;
	 }
	 table#notice_write_table tr#notice_write_table_item {
	 	background-color: #eeeded;
	 }
	 table#notice_write_table tr#notice_write_table_item2 {
	 	background-color: #ffffff;
	 } 
	 table#notice_write_table tr#notice_write_table_item2 a#td_a{
	 	text-decoration: underline;
	 	color: #1e90ff;
	 }
	 
	 /** 작성 테이블 **/
.n_input{
	width:98%;
	height:30px;
	border:1px solid #ccc;
	border-radius:4px;
	padding:5px;
	
}
#notice_write_table input[type=date]{
	width:30%;
	height:20px;
	border:1px solid #ccc;
	border-radius:4px;
	padding:5px;
	
}
#notice_write_table{
	width:90%;
	margin:auto;
	border:1px solid gray;
	border-radius:4px !important;
}
	
#notice_write_table tr:first-child th,
#notice_write_table tr:first-child td{
	border-top:1px solid gray;
} 
#notice_write_table tr, #notice_write_table th,
#notice_write_table td {
	border-bottom: 1px solid gray;
	border-collapse: collapse;
	width: 100%;
	padding: 10px;
}

#notice_write_table tr>td {
	border-collapse: collapse;
	text-align: left;
}

#notice_write_table td input, #notice_write_table td select
	{
	margin: 0px;
	padding: 0px;
}

#notice_write_table tr th {
	background: #F5F5F7;
	width: 16%;
	border:none;
}

#notice_write_table tr {
	height: 15px;
	padding: 10px;
}

#notice_write_table th:last-child, #notice_write_table td:last-child
	{
	width: 120px;
}
#notice_write_table td select {
	display: inline-block;
	vertical-align: center;
	width: 150px;
	border:1px solid #ccc;
	padding:5px;
	font-size:14px;
	border-radius:3px;
}
#writeBtnDiv{
	text-align:center;
	padding:20px 0px 15px 0px;
}
#writeBtnDiv button{
	padding:8px 30px 8px 30px;
	border:none;
	border-radius:4px;
	color:white;
	font-weight:500;
	background:#343434;
	cursor:pointer;
}
#notice_write_table tr:first-child>th{
	background-color: #343434;
	color: white;
	font-weight: bold;
}
</style>
</head>
<body>
	<div id="admin_mainpage">
		<jsp:include page="admin_sidebar.jsp"></jsp:include>
		<div id="admin_mainconent">
			<div id="admin_header">
				<p>공지사항 작성</p>
			</div>
		   <div id="funding_history">
				<div class="funding_list" id="list_all">
				</div>
			</div>
				<div id="admin_notice_write">
					<form action="http://localhost:9090/tumblbugs/admin/notice_write_proc" method="post" name="admin_notice" enctype="multipart/form-data">
						<table id="notice_write_table">
							<tr>
								<th colspan=2>공지사항 작성</th>
							</tr>
							<tr>
								<th>제목</th>
								<td><input type="text" class="n_input" name="notice_title"/></td>
							</tr>	
							<tr>
								<th>분류</th>
								<td>
									<select id="noticeCategory" name="notice_category" >
										<option value="notice">공지사항</option>
										<option value="event">이벤트</option>
									</select>
								</td>
							</tr>
							<tr id="eventCategory">
								<th>이벤트 기간</th>
								<td><input type="date" name="notice_event_start" id="notice_event_start"/> ~ <input type="date" name="notice_event_end" id="notice_event_end"/></td>
							</tr>
							<tr>
								<td colspan=2>
									<textarea name="notice_content" id="notice_content" placeholder="내용을 입력해 주세요.(최대 300자)" name="notice_content"></textarea>
								</td>
							</tr>
						</table>
					</form>
				<div id="writeBtnDiv">
					<a href="http://localhost:9090/tumblbugs/admin/notice"><button>목록</button></a>
					<button type="button" id="noticeWrite">작성</button>
				</div>
				
			</div>
		</div>
	</div>
</body>
</html>