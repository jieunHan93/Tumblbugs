<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>텀블벅스 :: tumblbugs</title>
<script src="http://localhost:9090/tumblbugs/js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/main.css">
<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/project_content.css">
<link rel="icon" href="http://localhost:9090/tumblbugs/images/tumblbugs_img_logo.ico" type="image/x-icon">
</head>
<script>
	$(document).ready(function() {
		$("#box3_sponser").show();
		
		//게시글 삭제
		$(".posting_box #community_delete").click(function() {
			if(confirm("게시글을 삭제하시겠습니까?")) {
				var community_id = $(this).closest(".dropdown").attr("id");
				
				$.ajax({
					url: "http://localhost:9090/tumblbugs/community_delete_proc?community_id=" + community_id,
					success: function(result) {
						if(result != "0") {
							location.reload();
						} else {
							alert("일시적인 오류로 삭제에 실패하였습니다.");
						}
					}
				});
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
						replyEach += "<div class='reply_each' id='" + obj.rlist[i].reply_id +"'>"
									+ "<span id='member_img'><img src='http://localhost:9090/tumblbugs/upload/"+ obj.rlist[i].profile_simg + "'></span>"
									+ "<div id='reply_each_right'>"
									+ "<div id='reply_writer_and_date'>"
									+ "<div id='member_name'>" + obj.rlist[i].name
									+ "<c:if test='${" + obj.rlist[i].email + " == vo.email }'>"
									+ "<span id='creator_label'>창작자</span>"
									+ "</c:if></div>"
									+ "<div id='reply_date'>" + obj.rlist[i].reply_date + "</div></div>"
									+ "<div id='reply_content'><span>" + obj.rlist[i].reply_content + "</span>";
									
						if('${sessionScope.semail}' == obj.rlist[i].email) {
							replyEach += "<button id='btn_reply_delete' type='button' style='margin-left: 7px'>삭제</button>";
						}
						replyEach += "</div></div></div>";
					}
					
					//로그인&후원자 회원만 댓글 작성란 show
					if('${sessionScope.semail}' != null && '${sessionScope.semail}' != "" && ('${fundingYn}' > 0 || '${sessionScope.semail}' == '${pvo.email}')) {
						replyEach += "<div class='reply_write'>";
						if('${sessionScope.svo.profile_simg}' != null && '${sessionScope.svo.profile_simg}' != "") {
							replyEach += "<span id='member_img'><img src='http://localhost:9090/tumblbugs/upload/" + '${sessionScope.svo.profile_simg}' + "'></span>";
						} else {
							replyEach += "<span id='member_img'><img id='default_profile_img' src='http://localhost:9090/tumblbugs/images/avatar_2.png'></span>";
						}
						replyEach += "<input type='text' id='reply_write_content'><button id='btn_reply_write' type='button'>올리기</button></div>";
					}
					
					$(".reply_list#" + community_id).append(replyEach).slideToggle();
					
					//댓글 등록
					$(".reply_list #btn_reply_write").click(function() {
						var community_id = $(this).closest(".reply_list").attr("id");
						var reply_content = $(this).siblings("input#reply_write_content").val();
						
						if(reply_content == "") {
							alert("댓글을 입력해주세요.");
							$(this).siblings("input#reply_write_content").focus();
						} else {
							
							$.ajax({
								url: "http://localhost:9090/tumblbugs/community_reply_write_proc?community_id=" + community_id + "&reply_content=" + reply_content,
								success: function(data) {
									var newReply = JSON.parse(data);
									
									if(newReply.reply_id != null && newReply.reply_id != "") {
										var appendData = "<div class='reply_each' id='" + newReply.reply_id +"'>"
											+ "<span id='member_img'><img src='http://localhost:9090/tumblbugs/upload/"+ newReply.profile_simg + "'></span>"
											+ "<div id='reply_each_right'>"
											+ "<div id='reply_writer_and_date'>"
											+ "<div id='member_name'>" + newReply.name
											+ "<c:if test='${" + newReply.email + " == vo.email }'>"
											+ "<span id='creator_label'>창작자</span>"
											+ "</c:if></div>"
											+ "<div id='reply_date'>" + newReply.reply_date + "</div></div>"
											+ "<div id='reply_content'><span>" + newReply.reply_content + "</span>"
											+ "<button id='btn_reply_delete' type='button' style='margin-left: 7px'>삭제</button>"
											+ "</div></div></div>";
										
										var id = $(".reply_list#" + community_id + " .reply_each").last().attr("id");
										$(".reply_each#" + id).after(appendData);
										$("input#reply_write_content").val("");
										
										getRcount(community_id);
									} else {
										alert("댓글 등록에 실패했습니다.");
									}
								}
							});
						}
					});
					
					//댓글 삭제
					$(".reply_each #btn_reply_delete").click(function() {
						var reply_id = $(this).closest(".reply_each").attr("id");
						
						if(confirm("댓글을 삭제하시겠습니까?")) {
							$.ajax({
								url: "http://localhost:9090/tumblbugs/community_reply_delete_proc?reply_id=" + reply_id,
								success: function(result) {
									if(result != "0") {
										$(".reply_each#" + reply_id).remove();
										getRcount(community_id);
									}
								}
							});
						}
					});
					
					
				}
			});
			
			$(this).siblings(".reply_count_reply_show").show();
			$(this).hide();
		});
		
		//댓글 등록&삭제 후 댓글 count 업데이트
		function getRcount(community_id) {
			$.ajax({
				url: "http://localhost:9090/tumblbugs/rcount?community_id=" + community_id,
				success: function(rcount) {
					$(".posting_box#" + community_id).find("span#rcount").text(rcount);
					$(".posting_box#" + community_id).find("b#rcount").text(rcount);
				}
			});
		}
		
		//댓글 접기
		$("div.reply_count_reply_show").click(function() {
			var community_id = $(this).attr("id");
			$(this).siblings(".reply_count_original").show();
			$(this).hide();
			
			$(".reply_list#" + community_id).slideToggle().empty();
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
						<div id="community_top">
							<c:choose>
								<c:when test="${empty sessionScope.semail}">
									<!-- 미로그인 회원 -->
									<div class="white_box" id="box1_login_request">
										<a href="http://localhost:9090/tumblbugs/login">
											<span id="member_img"><img src="http://localhost:9090/tumblbugs/images/avatar_2.png" id="default_member_image"></span>
											<span id="message">로그인해주세요</span>
										</a>
									</div>
								</c:when>
								<c:when test="${sessionScope.semail == pvo.email}">
									<div class="white_box" id="box3_sponser">
										<a href="http://localhost:9090/tumblbugs/project/${pvo.pj_addr }/community/new">
											<span id="member_img"><img src="http://localhost:9090/tumblbugs/upload/${sessionScope.svo.profile_simg }"></span>
											<span id="message">후원자들에게 소식을 전해보세요</span>
										</a>
									</div>
								</c:when>
								<c:when test="${fundingYn eq 0}">
									<!-- 비후원자 회원 -->
									<div class="white_box" id="box2_nonsponser">
										<span id="member_img"><img src="http://localhost:9090/tumblbugs/upload/${sessionScope.svo.profile_simg }"></span>
										<span id="message">후원자만 글을 쓸 수 있어요</span>
									</div>
								</c:when>
								<c:when test="${fundingYn > 0}">
									<!-- 후원자 -->
									<div class="white_box" id="box3_sponser">
										<a href="http://localhost:9090/tumblbugs/project/${pvo.pj_addr }/community/new">
											<span id="member_img"><img src="http://localhost:9090/tumblbugs/upload/${sessionScope.svo.profile_simg }"></span>
											<span id="message">창작자에게 응원의 한 마디를!</span>
										</a>
									</div>
								</c:when>
							</c:choose>
						</div>
						<div id="community_tab">
							<span id="all_posting">모든 게시글</span>
							<span id="creator_posting">창작자 업데이트</span>
						</div>
						<div class="posting_list" id="all_posting">
							<c:choose>
								<c:when test="${fn:length(clist) != 0}">
									<c:forEach var="cvo" items="${clist}" varStatus="status">
										<div class="posting_box" id="${cvo.community_id}">
											<div id="posting_header">
												<span id="member_img"><img src="http://localhost:9090/tumblbugs/upload/${cvo.profile_simg }"></span>
												<div>
													<div id="member_name">${cvo.name }
														<c:if test="${pvo.email == cvo.email }">
															<span id="creator_label">창작자</span>
														</c:if>
													</div>
													<div id="posting_log">
														<c:choose>
															<c:when test="${not empty cvo.community_udate}">
																<span class="timeago">${cvo.community_udate }</span>
																<span>수정됨</span>
															</c:when>
															<c:otherwise>
																<span class="timeago">${cvo.community_date }</span>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
												<c:if test="${sessionScope.semail == cvo.email }">
													<div class="dropdown" id="${cvo.community_id }">
														<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
													    <i class="fas fa-ellipsis-v"></i>
													  	</button>
														<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
														    <a class="dropdown-item" id="community_update" href="http://localhost:9090/tumblbugs/project/${pvo.pj_addr}/community/update/${cvo.community_id}">수정</a>
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
														<span id="rcount">${cvo.rcount }</span>
													</div>
													<div class="reply_count_reply_show" id="${cvo.community_id }">	<!-- 게시글 id를 id로 준다. -->
														<span><b id="rcount">${cvo.rcount }</b>개의 댓글이 있습니다.</span>
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
										<c:if test="${pvo.email == cvo.email }">
										<div class="posting_box" id="${cvo.community_id}">
											<div id="posting_header">
												<span id="member_img"><img src="http://localhost:9090/tumblbugs/upload/${cvo.profile_simg }"></span>
												<div>
													<div id="member_name">${cvo.name }<span id="creator_label">창작자</span></div>
													<div id="posting_log">
														<c:choose>
															<c:when test="${not empty cvo.community_udate}">
																<span class="timeago">${cvo.community_udate }</span>
																<span>수정됨</span>
															</c:when>
															<c:otherwise>
																<span class="timeago">${cvo.community_date }</span>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
												<c:if test="${sessionScope.semail == cvo.email }">
												<div class="dropdown" id="${cvo.community_id }">
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
														<span><b id="rcount">${cvo.rcount }</b>개의 댓글이 있습니다.</span>
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
				</div>
				<jsp:include page="project_content_aside.jsp"></jsp:include>
			</div>
		</section>
	</div>
</body>
</html>