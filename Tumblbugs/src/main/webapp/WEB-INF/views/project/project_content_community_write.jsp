<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://localhost:9090/tumblbugs/js/jquery-3.4.1.min.js"></script>
<script src="http://localhost:9090/tumblbugs/ckeditor/ckeditor.js"></script>
<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/main.css">
<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/project_content.css">
<link rel="icon" href="http://localhost:9090/tumblbugs/images/tumblbugs_img_logo.ico" type="image/x-icon">
</head>
<script>
	$(document).ready(function() {
	   var editorConfig = {
		   filebrowserUploadUrl : "http://localhost:9090/tumblbugs/fileupload.do", //이미지 업로드
		};
		
		CKEDITOR.replace("ckeditor_content", editorConfig);
		CKEDITOR.config.height = 350;
		
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
		
		//게시글 수정
		if('${writeCase}' == "update") {
			$("#editor>div:first-child").text("게시글 수정하기");
			$("#editor button").html("<i class='fas fa-check'></i> &nbsp;수정하기");
			$("#editor form").attr("action", "http://localhost:9090/tumblbugs/community_update_proc");
		}
		
		//커뮤니티 게시글 등록/수정
		$("#community_write").click(function() {
			var content = CKEDITOR.instances.ckeditor_content.getData();
			$("#ckeditor_content").val(content);
			
			if($("#ckeditor_content").val() == "") {
				alert("게시글 내용을 입력해주세요.");
				CKEDITOR.instances.ckeditor_content.focus();
			} else {
				community_write_form.submit();
			}
		});
		
	});
</script>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div id="project_content">
		<jsp:include page="project_content_header.jsp"></jsp:include>
		<section id="menu_content">
			<div>
				<div class="menu_content" id="community">
					<div id="community_content">
						<!-- 커뮤니티 글 작성 -->
						<div id="box4_community_write">
							<div>
								<a href="http://localhost:9090/tumblbugs/project/${vo.pj_addr}/community">
									<button id="btn_back_to_community"><i class="fas fa-angle-left"></i> &nbsp;커뮤니티로 돌아가기</button>
								</a>
							</div>
							<div class="white_box" id="editor">
								<div>게시글 작성하기</div>
								<form action="http://localhost:9090/tumblbugs/community_write_proc" method="post" name="community_write_form" enctype="multipart/form-data">
									<c:if test="${not empty cvo.community_id }">
										<input type="hidden" name="community_id" value="${cvo.community_id }">
									</c:if>
									<input type="hidden" name="email" value="${sessionScope.semail }">
									<input type="hidden" name="pj_id" value="${vo.pj_id }">
									<textarea class="form-control" id="ckeditor_content" name="community_content">
										<c:if test="${not empty cvo.community_content}">${cvo.community_content}</c:if>
									</textarea>
								</form>
								<div>
									<button type="button" id="community_write"><i class="fas fa-check"></i> &nbsp;올리기</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<jsp:include page="project_content_aside.jsp"></jsp:include>
			</div>
		</section>
	</div>
</body>
</html>