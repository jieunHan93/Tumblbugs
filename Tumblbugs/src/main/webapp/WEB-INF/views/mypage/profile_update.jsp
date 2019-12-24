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
</head>

<script type="text/javascript">
$(document).ready(function(){	
	$("#pw_chk_ok").hide();
	$("#pw_chk_fail").hide();
	
		  $("#nowpass").keyup(function(){
			  var pass = $("#nowpass").val();
			  $.ajax({
					 url:"select_profile_pass?pass="+pass,
					 success:function(result){			
						 
						 if(result == '1'){
						
							 $("#pw_chk_ok").show();
							 $("#pw_chk_fail").hide();
							 
							 $("#newpass").focus();
							 
							 	
						 }else{
							 
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
					 alert("사용가능.")
				  }else {  
					  alert("한글이나 영문으로 사용해주세요.")		
				  }	  
		  });
		 
		  $("#website").focusout(function(){
			  	var nameVal = $("#website").val();			
				var nameExp =   /^(file|gopher|news|nntp|telnet|https?|ftps?|sftp):\/\/([a-z0-9-]+\.)+[a-z0-9]{1,30}.*$/;

				if (nameVal.match(nameExp) != null) {	
					 alert("사용가능.")
				  }else {  
					  alert("웹사이트형식으로해주세요.http://www.dd.com")		
				  }	  
		  });
		  $("#phone").focusout(function(){
			  	var nameVal = $("#phone").val();			
				var nameExp =  /(\d{3}).*(\d{4}).*(\d{4})/;

				if (nameVal.match(nameExp) != null) {	
					 alert("사용가능.")
				  }else {  
					  alert("000-0000-0000형식으로 해주세요.")		
				  }	  
		  });
		  		
});
</script>

<body>
	<jsp:include page="../header.jsp" />
	<div>
		<div>
			<section id="mypage_profile_header">
				<div id="mypage_profile_header_container">
					<h2>프로필 설정</h2>
					<div id="mypage_nav">
						<a href="http://211.63.89.217:9090/tumblbugs/mypage/profile"><span>프로필 설정</span></a>
						<a href="http://211.63.89.217:9090/tumblbugs/mypage/payment"><span>지불정보 설정</span></a>
					</div>
				</div>
			</section>
		</div>	
		<div id="mypage_profile_main_container">
			<div id="profile_editor">
				<form action="/tumblbugs/profile_proc" method="post">
					<div>
						<label class="profile_editor_label">프로필 사진</label>
						<div id="profilel_editor_img" >
							<span  style="background-image: url(http://localhost:9090/tumblbugs/upload/${sessionScope.svo.profile_img})"></span>
							<div>
							
								<input type="file" id="profile_img" name="profile_img">
								<span>사이즈는 가로 200px, 세로 250px에 최적화 되어 있으며<br>jpg, gif, png파일을 지원합니다.</span>
							</div>
						</div>
					</div>
					<div>
						<label class="profile_editor_label">이메일</label>
						<input type="text" value="${sessionScope.svo.email }" readonly>
						<span class="profile_input_guide">이메일는 변경이 불가능합니다.</span>
					</div>
					<div>
						<label class="profile_editor_label">비밀번호 설정</label>
						<input type="password" class="form-control" placeholder="현재 비밀번호" name="nowpass" id="nowpass">
						<input type="password" class="form-control" placeholder="변경할 비밀번호" name="pass" id="newpass" maxlength="40">
						<br>
						<span id="pw_chk_ok">원래 비밀번호와 일치합니다.변경할 비밀번호를 입력해주세요.</span>
						<span id="pw_chk_fail">비밀번호가 일치하지않습니다.</span>
					</div>
					<div>
						<label class="profile_editor_label">이름</label>
						<input type="text" class="form-control" value="${sessionScope.svo.name }" name="name" id="name">
					</div>
					<div>
						<label class="profile_editor_label">소개</label>
						<textarea class="form-control" name ="intro" maxlength="300"></textarea>
						<span class="profile_input_guide">300자 이내의 자기소개를 입력해주세요.</span>
					</div>
					<div>
						<label class="profile_editor_label">웹사이트</label>
						<input type="text" class="form-control" value="웹사이트" name="website" id="website">
						<span class="profile_input_guide">웹사이트가 있다면 주소를 입력해주세요.</span>
					</div>
					<div id="profile_editor_phone">
						<label class="profile_editor_label">전화번호</label>
						<input type="text" class="form-control" value="010" name="phone">
						<span class="profile_input_guide">전화번호를 입력해 주세요. 밀어주기 및 후원 선물 배송 시 연락을 위해 사용됩니다.</span>
					</div>
					<div>
						<button id="profile_editor_submit" type="submit">수정하기</button>
					</div>
				</form>
			</div>
			<div id="profile_pre">
				<div id="profile_pre_header_space"></div>
				<div id="profile_pre_header">
					<div>프로필 카드 미리보기</div>
					<div id="profile_pre_header_card">
						<span id="profile_pre_header_card_icon" style="background-image: url(http://localhost:9090/tumblbugs/upload/${sessionScope.svo.profile_img})"></span>
						<span id="profile_pre_header_card_name">${sessionScope.svo.name }</span>
					</div>
				</div>
				<div id="profile_pre_middle"><a href="#"><i class="fas fa-check-circle"></i><span>2개의 프로젝트</span></a>의 창작자</div>
				<a href="#"><div id="profile_pre_footer"><span>후훤 현황 자세히보기</span></div></a>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>