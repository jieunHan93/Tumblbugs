	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>텀블벅스 :: tumblbugs</title>
	<link rel="icon" href="http://localhost:9090/tumblbugs/images/tumblbugs_img_logo.ico" type="image/x-icon">
	<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/main.css">
	<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/mypage.css">
	<script src="http://localhost:9090/tumblbugs/js/jquery-3.4.1.min.js"></script>
	<script>
		$(document).ready(function(){
			$("#pw_chk_ok").hide();
			$("#pw_chk_fail").hide();
			
				  /* $("#nowpass").keyup(function(){
					  var pass = $("#nowpass").val();
					  $.ajax({
							 url:"select_profile_pass?pass="+pass,
							 success:function(result){			
								 
								 if(result == '1'){
								
									 $("#pw_chk_ok").show();
									 $("#pw_chk_fail").hide();
									 $('#pass').attr('disabled', false);
									 $("#pass").focus();							 
									 
								 }else{
									 
									 $('#pass').attr('disabled', true);
									 $("#pw_chk_ok").hide();
									 $("#pw_chk_fail").shows();					 
								 	return false;
								 }  
							 }
					  });
				  });
				
		
				 
				  $("#name").focusout(function(){
					  	var nameVal = $("#name").val();			
						var nameExp = /^[가-힣a-zA-Z]+$/;
		
						if (nameVal.match(nameExp) != null) {	
							
						  }else {  
							  alert("한글이나 영문으로만 사용해주세요.")		
						  }	  
				  });
				 
				  $("#website").focusout(function(){
					  	var nameVal = $("#website").val();			
						var nameExp =   /^(file|gopher|news|nntp|telnet|https?|ftps?|sftp):\/\/([a-z0-9-]+\.)+[a-z0-9]{1,30}.*$/;
		
						if (nameVal.match(nameExp) != null) {	
							 
						  }else {  
							  alert("웹사이트형식으로해주세요.ex(http://www.dd.com)")		
						  }	  
				  });
				  $("#phone").focusout(function(){
					  	var nameVal = $("#phone").val();			
						var nameExp =  /(\d{3}).*(\d{4}).*(\d{4})/;
		
						if (nameVal.match(nameExp) != null) {	
							
						  }else {  
							  alert("하이픈 제외 00000000000형식으로 해주세요.11자리수")		
						  }	  
				  }); */
			
			/** 프로필 사진 미리보기 **/
			function readInputFile(input) {
			    if(input.files && input.files[0]) {
			        var reader = new FileReader();
			        reader.onload = function (e) {
			            $('#profile_img_preview').css('background-image','url('+e.target.result+')');
			        }
			        reader.readAsDataURL(input.files[0]);
			    }
			}
			
			/** 프로필 사진 미리보기 업로드 **/
			$("#profile_img").change(function() {
				readInputFile(this);
			});
			
			//수정하기 버튼 클릭
			$("#profile_editor_submit").click(function() {
				
				//폼 체크
				if($("input#name").val() == "") {
					alert("이름은 필수 입력 사항입니다.");
					$("input#name").focus();
				} else if($("input#nowpass").val() == "") {
					alert("현재 비밀번호를 입력해주세요.");
					$("input#nowpass").focus();
				} else if($("input#pass").val() == "") {
					alert("변경할 비밀번호를 입력해주세요.");
					$("input#pass").focus();
				} else {
					
					//기존 비밀번호 확인
					$.ajax({
						url:"select_profile_pass?pass=" + $("input#nowpass").val(),
						success:function(result){			
							
							if(result == "1"){
								//기존 비밀번호 일치
								profileUpdateForm.submit();
							}else{
								//기존 비밀번호 불일치
								alert("현재 비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
								$("input#nowpass").val("").focus();
							}
						}
					});
				}
				
			});
			
			//업데이트 결과 show
			$(".updateResult").hide();
			
			var updateResult = '${updateResult}';
			
			if(updateResult != null && updateResult != "") {
				$("#" + updateResult).show();
				history.replaceState({}, null, "http://localhost:9090/tumblbugs/mypage/profile");
			}
		});
	</script>
	<style>
		#success {
			background-color: #48e29c;
			color: white;
			text-align: center;
			padding: 5px 0px;
		}
		#fail {
			background-color: #fb7c7b;
			color: white;
			text-align: center;
			padding: 5px 0px;
		}
	</style>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div>
		<div>
			<section id="mypage_profile_header">
				<div id="mypage_profile_header_container">
					<h2>프로필 설정</h2>
					<div id="mypage_nav">
						<a href="http://localhost:9090/tumblbugs/mypage/profile"><span>프로필 설정</span></a>
						<a href="http://localhost:9090/tumblbugs/mypage/payment"><span>지불정보 설정</span></a>
					</div>
				</div>
			</section>
		</div>	
		<div id="mypage_profile_main_container">
			<div id="profile_editor">
				<div class="updateResult" id="success">성공적으로 업데이트 되었습니다.</div>
				<div class="updateResult" id="fail">업데이트에 실패하였습니다.</div>
				<form action="http://localhost:9090/tumblbugs/profile_proc" method="post" name="profileUpdateForm" enctype="multipart/form-data">
					<div>
						<label class="profile_editor_label">프로필 사진</label>
						<div id="profilel_editor_img" >
							<span id="profile_img_preview" style="background-image: url(http://localhost:9090/tumblbugs/upload/${mvo.profile_simg})"></span>
							<div>
								<input type="file" id="profile_img" name="profile_cimg" accept=".jpg, .gif, .png">
								<span>사이즈는 가로 200px, 세로 250px에 최적화 되어 있으며<br>jpg, gif, png파일을 지원합니다.</span>
							</div>
						</div>
					</div>
					<div>
						<label class="profile_editor_label">이메일</label>
						<input type="text" name="email" value="${mvo.email }" readonly>
						<span class="profile_input_guide">이메일은 변경이 불가능합니다.</span>
					</div>
					<div>
						<label class="profile_editor_label">비밀번호 설정</label>
						<input type="password" class="form-control" placeholder="현재 비밀번호" name="nowpass" id="nowpass">
						<input type="password" class="form-control" placeholder="변경할 비밀번호" name="pass" id="pass" maxlength="40">
						<br>
						<span id="pw_chk_ok" style="color: #1e90ff;	font-size: 12px;">원래 비밀번호와 일치합니다.변경할 비밀번호를 입력해주세요.</span>
						<span id="pw_chk_fail" style="color: #1e90ff;	font-size: 12px;">비밀번호가 일치하지않습니다.</span>
					</div>
					<div>
						<label class="profile_editor_label">이름</label>
						<input type="text" class="form-control" value="${mvo.name}" name="name" id="name" maxlength="10">
					</div>
					<div>
						<label class="profile_editor_label">소개</label>
						<textarea class="form-control" name ="intro" maxlength="300">${mvo.intro}</textarea>
						<span class="profile_input_guide">300자 이내의 자기소개를 입력해주세요.</span>
					</div>
					<div>
						<label class="profile_editor_label">웹사이트</label>
						<input type="text" class="form-control" value="${mvo.website}" name="website" id="website">
						<span class="profile_input_guide">웹사이트가 있다면 주소를 입력해주세요.</span>
					</div>
					<div id="profile_editor_phone">
						<label class="profile_editor_label">전화번호</label>
						<input type="text" class="form-control" value="${mvo.phone}" name="phone" maxlength="11">
						<span class="profile_input_guide">전화번호를 입력해 주세요. 밀어주기 및 후원 선물 배송 시 연락을 위해 사용됩니다.</span>
					</div>
					<div>
						<button id="profile_editor_submit" type="button">수정하기</button>
					</div>
				</form>
			</div>
			<div id="profile_pre">
				<div id="profile_pre_header_space"></div>
				<div id="profile_pre_header">
					<div>프로필 카드 미리보기</div>
					<div id="profile_pre_header_card">
						<span id="profile_pre_header_card_icon" style="background-image: url(http://localhost:9090/tumblbugs/upload/${mvo.profile_simg})"></span>
						<span id="profile_pre_header_card_name">${mvo.name }</span>
					</div>
				</div>
				<div id="profile_pre_middle">
					<a href="http://localhost:9090/tumblbugs/projects/${mvo.member_id }"><i class="fas fa-check-circle"></i><span>${mvo.pj_count}개의 프로젝트</span></a>의 창작자
				</div>
				<a href="http://localhost:9090/tumblbugs/myfunding"><div id="profile_pre_footer"><span>후훤 현황 자세히보기</span></div></a>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>