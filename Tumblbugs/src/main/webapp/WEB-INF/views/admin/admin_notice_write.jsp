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
<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/admin_notice.css">
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
			
			if($(this).val()=="이벤트"){
				$("#eventCategory").css('display','');
			}else{
				$("#eventCategory").css('display','none');
			}
		});
		
		$("#noticeWrite").click(function(){
			$("#notice_content").val(CKEDITOR.instances.notice_content.getData());
			
			if($("#nTitle").val() == '' || $("#nTitle").val() == null){
				alert("제목을 작성해주세요.");
				
			}else if($("#notice_content").val() == '' || $("#notice_content").val() == null){
				alert("내용을 작성해주세요.");
			}else{
				admin_notice.submit();
			}
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
								<td><input type="text" class="n_input" name="notice_title" id="nTitle"/></td>
							</tr>	
							<tr>
								<th>분류</th>
								<td>
									<select id="noticeCategory" name="notice_category" >
										<option value="공지사항">공지사항</option>
										<option value="이벤트">이벤트</option>
									</select>
								</td>
							</tr>
							<tr id="eventCategory">
								<th>이벤트 기간</th>
								<td><input type="date" name="notice_event_start" id="notice_event_start"/> ~ <input type="date" name="notice_event_end" id="notice_event_end"/></td>
							</tr>
							<tr>
								<th>썸네일</th>
								<td><input type="file" name="notice_cthumbnail"/></td>
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