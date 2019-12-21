<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://localhost:9090/tumblbugs/js/jquery-3.4.1.min.js"></script>
<script src="http://localhost:9090/tumblbugs/ckeditor/ckeditor.js"></script>
<script src="http://localhost:9090/tumblbugs/js/jquery.timeago.js"></script>
<script src="http://localhost:9090/tumblbugs/js/jquery.timeago.ko.js"></script>
<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/project_content.css">
<title>Insert title here</title>
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
		
		//커뮤니티 게시글 등록
		$("#community_submit").click(function() {
			var content = CKEDITOR.instances.ckeditor_content.getData();
			$("#ckeditor_content").val(content);
			
			if($("#ckeditor_content").val() == "") {
				alert("게시글 내용을 입력해주세요.");
				CKEDITOR.instances.ckeditor_content.focus();
			} else {
				//alert("올리기");
				community_write_form.submit();
			}
		});
		
		//게시글 작성하기(창작자에게 응원의 한 마디를)
		$("#box3_sponser").show();
		$("#box3_sponser").click(function() {
			$("#community_content>div").hide();
			$("#box4_community_write").show();
			CKEDITOR.instances.ckeditor_content.focus();
		});
		
		//게시글 작성하기 → 커뮤니티로 돌아가기
		$("#btn_back_to_community").click(function() {
			CKEDITOR.instances.ckeditor_content.setData("");
			
			$("#community_content>#community_top").show();
			$("#community_content>#community_tab").show();
			$("#community_content>#all_posting").show();
			$("#box4_community_write").hide();
		});
		
		//게시글 수정
		$("#community_update").click(function() {
			alert("수정");
		});
		
		//게시글 삭제
		$("#community_delete").click(function() {
			if(confirm("게시글을 삭제하시겠습니까?")) {
				//삭제 로직
				location.reload();
			}
		});
		
		//게시글 목록 탭
		$("#community_tab span").click(function() {
			//모든 열려있는 슬라이드 토글을 닫고, 댓글리스트도 비운다.
			$(".reply_list").empty().slideUp();
			$(".reply_count_original").show();
			$(".reply_count_reply_show").hide()
			
			var id = $(this).attr("id");
			$("#community_tab span").css("color", "#757575").css("background-color", "transparent");
			$("div.posting_list").hide();
			
			$("#community_tab span#" + id).css("color", "#494949").css("background-color", "#d9d9d9");
			$("div#" + id).show();
		});
		
		//댓글 슬라이드 토글
		//댓글 보기
		$("div.reply_count_original").click(function() {
			var community_id = $(this).attr("id");
			
			$.ajax({
				url: "http://localhost:9090/tumblbugs/community_reply_list?community_id=" + community_id,
				success: function(data) {
					var obj = JSON.parse(data);
					
					var replyEach = "";
					for(i=0;i<obj.rlist.length;i++) {
						replyEach += "<div class='reply_each'>"
									+ "<span id='member_img'><img src='http://localhost:9090/tumblbugs/upload/"+ obj.rlist[i].profile_simg + "'></span>"
									+ "<div id='reply_each_right'>"
									+ "<div id='reply_writer_and_date'>"
									+ "<div id='member_name'>" + obj.rlist[i].name
									+ "<c:if test='${" + obj.rlist[i].email + " == vo.email }'>"
									+ "<span id='creator_label'>창작자</span>"
									+ "</c:if></div>"
									+ "<div id='reply_date'>" + obj.rlist[i].reply_date + "</div></div>"
									+ "<div id='reply_content'><span>" + obj.rlist[i].reply_content + "</span>"
									+ "<c:if test='${sessionScope.svo.sid == " + obj.rlist[i].email "}'>"
									+ "<button id='btn_reply_delete' type='button' style='margin-left: 7px'>삭제</button></c:if>"
									+ "</div></div></div>";
					}
					
					replyEach += "<div class='reply_write'>"
									+ "<span id='member_img'><img src='http://localhost:9090/tumblbugs/images/avatar_2.png'></span>"
									+ "<input type='text' id='reply_write_content'>"
									+ "<button id='btn_reply_write' type='button'>올리기</button></div>";
					
					$(".reply_list#" + community_id).append(replyEach).slideToggle();
					
					//댓글 등록
					$("#btn_reply_write").click(function() {
						alert("댓글 등록");
					});
					
					//댓글 삭제
					$("#btn_reply_delete").click(function() {
						if(confirm("댓글을 삭제하시겠습니까?")) {
							alert("삭제");
						}
					});
				}
			});
			
			$(this).siblings(".reply_count_reply_show").show();
			$(this).hide();
		});
		
		
		
		//댓글 접기
		$("div.reply_count_reply_show").click(function() {
			var community_id = $(this).attr("id");
			$(this).siblings(".reply_count_original").show();
			$(this).hide();
			
			$(".reply_list#" + community_id).slideToggle().empty();
		});
		
		
	});
</script>
</head>
<body>
	<div id="community_content">
		<div id="community_top">
			<!-- 미로그인 회원 -->
			<div class="white_box" id="box1_login_request">
				<a href="#">
					<span id="member_img"><img src="http://localhost:9090/tumblbugs/images/avatar_2.png"></span>
					<span id="message">로그인해주세요</span>
				</a>
			</div>
			<!-- 비후원자 회원 -->
			<div class="white_box" id="box2_nonsponser">
				<span id="member_img"><img src="http://localhost:9090/tumblbugs/images/project_content/profile_sample.jpg"></span>
				<span id="message">후원자만 글을 쓸 수 있어요</span>
			</div>
			<!-- 후원자 -->
			<div class="white_box" id="box3_sponser">
				<span id="member_img"><img src="http://localhost:9090/tumblbugs/images/project_content/profile_sample.jpg"></span>
				<span id="message">창작자에게 응원의 한 마디를!</span>
			</div>
		</div>
		<!-- 커뮤니티 글 작성 -->
		<div id="box4_community_write">
			<div><button id="btn_back_to_community"><i class="fas fa-angle-left"></i> &nbsp;커뮤니티로 돌아가기</button></div>
			<div class="white_box" id="editor">
				<div>게시글 작성하기</div>
				<form action="community_write_proc" method="post" name="community_write_form" enctype="multipart/form-data">
					<input type="hidden" name="email" value="test@naver.com">
					<input type="hidden" name="pj_id" value="PJ00001">
					<textarea class="form-control" id="ckeditor_content" name="community_content"></textarea>
				</form>
				<div>
					<button type="button" id="community_submit"><i class="fas fa-check"></i> &nbsp;올리기</button>
				</div>
			</div>
		</div>
		<div id="community_tab">
			<span id="all_posting">모든 게시글</span>
			<span id="creator_posting">창작자 업데이트</span>
		</div>
		<div class="posting_list" id="all_posting">
			<c:choose>
				<c:when test="${fn:length(clist) != 0}">
					<c:forEach var="cvo" items="${clist}" varStatus="status">
						<div class="white_box" id="posting_box">
							<div id="posting_header">
								<span id="member_img"><img src="http://localhost:9090/tumblbugs/upload/${cvo.profile_simg }"></span>
								<div>
									<div id="member_name">${cvo.name }
										<c:if test="${vo.email == cvo.email }">
											<span id="creator_label">창작자</span>
										</c:if>
									</div>
									<div id="posting_log">
										<span class="timeago">${cvo.community_date }</span>
										<c:if test="${not empty cvo.community_udate}">
										<span>수정됨</span>
										</c:if>
									</div>
								</div>
								<c:if test="${sessionScope.svo.sid == cvo.email }">
									<div class="dropdown">
										<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									    <i class="fas fa-ellipsis-v"></i>
									  	</button>
										<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
										    <a class="dropdown-item" id="community_update">수정</a>
										    <a class="dropdown-item" id="community_delete">삭제</a>
									  </div>
									</div>
								</c:if>
							</div>
							<div id="posting_content">${cvo.community_content }</div>
							<div id="posting_reply">
								<div class="reply_count">
									<div class="reply_count_original" id="${cvo.community_id }">	<!-- 게시글 id를 id로 준다. -->
										<i class="fas fa-comment"></i>&nbsp;&nbsp;
										<span id="reply_count">${cvo.rcount }</span>
									</div>
									<div class="reply_count_reply_show" id="${cvo.community_id }">	<!-- 게시글 id를 id로 준다. -->
										<span><b>${cvo.rcount }</b>개의 댓글이 있습니다.</span>
										<span id="reply_roll_up"><i class="fas fa-angle-up"></i> 댓글 접기</span>
									</div>
								</div>
								<div class="reply_list" id="${cvo.community_id }"></div>	<!-- 게시글 id를 id로 준다. -->
							</div>
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<div id="none">
						<i class="far fa-meh"></i>
						<div><b>게시글이 없습니다.</b></div>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="posting_list" id="creator_posting">
			<c:choose>
				<c:when test="${fn:length(clist) != 0}">
					<c:forEach var="cvo" items="${clist}">
						<c:if test="${vo.email == cvo.email }">
						<div class="white_box" id="posting_box">
							<div id="posting_header">
								<span id="member_img"><img src="http://localhost:9090/tumblbugs/upload/${cvo.profile_simg }"></span>
								<div>
									<div id="member_name">${cvo.name }<span id="creator_label">창작자</span></div>
									<div id="posting_log">
										<span class="timeago">${cvo.community_date }</span>
										<c:if test="${not empty cvo.community_udate}">
										<span>수정됨</span>
										</c:if>
									</div>
								</div>
								<c:if test="${sessionScope.svo.sid == cvo.email }">
								<div class="dropdown">
									<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								    <i class="fas fa-ellipsis-v"></i>
								  	</button>
									<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
									    <a class="dropdown-item" id="community_update">수정</a>
									    <a class="dropdown-item" id="community_delete">삭제</a>
								  </div>
								</div>
								</c:if>
							</div>
							<div id="posting_content">${cvo.community_content }</div>
							<div id="posting_reply">
								<div class="reply_count">
									<div class="reply_count_original" id="${cvo.community_id }">	<!-- 게시글 id를 id로 준다. -->
										<i class="fas fa-comment"></i>&nbsp;&nbsp;
										<span id="reply_count">${cvo.rcount }</span>
									</div>
									<div class="reply_count_reply_show" id="${cvo.community_id }">	<!-- 게시글 id를 id로 준다. -->
										<span><b>${cvo.rcount }</b>개의 댓글이 있습니다.</span>
										<span id="reply_roll_up"><i class="fas fa-angle-up"></i> 댓글 접기</span>
									</div>
								</div>
								<div class="reply_list" id="${cvo.community_id }"></div>	<!-- 게시글 id를 id로 준다. -->
							</div>
						</div>
						</c:if>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<div id="none">
						<i class="far fa-meh"></i>
						<div><b>게시글이 없습니다.</b></div>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</body>
</html>