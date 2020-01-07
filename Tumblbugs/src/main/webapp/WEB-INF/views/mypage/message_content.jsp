<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>텀블벅스 :: tumblbugs</title>
	<link rel="icon" href="http://localhost:9090/tumblbugs/images/tumblbugs_img_logo.ico" type="image/x-icon">
	<script src="http://localhost:9090/tumblbugs/js/jquery-3.4.1.min.js"></script>
	<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/main.css">
	<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/mypage.css">
	
	<script>
		$(document).ready(function(){
			function loadcontent() {
				$.ajax({
					url: "http://localhost:9090/tumblbugs/mypage/message/content_proc?chatroom_id=${chatroom_id}",
					success:function(result){
						var jsonObj = JSON.parse(result);
						var str="";
						for(i=0;i<jsonObj.result.length;i++){
							str+='<div class="message_cat_m">';
							str+='<div class="message_cat_m_img" style="background-image:url(http://localhost:9090/tumblbugs/upload/'+jsonObj.result[i].profile+')"></div>';
							str+='<div class="message_cat_m_text">';
							str+='<span class="message_cat_m_name" id="message_icon1">'+jsonObj.result[i].name+'</span>';
							str+='<div class="message_cat_m_date"><span>'+jsonObj.result[i].msg_date+'</span></div>';
							str+='<div class="message_cat_m_detail"><p>'+jsonObj.result[i].msg_content+'</p></div>';
							if(jsonObj.result[i].msg_check == "N"){
								str+='<span class="message_cat_m_status"><i class="far fa-times-circle"></i>안읽음</span>';
							} else if(jsonObj.result[i].msg_check == "Y"){
								str+='<span class="message_cat_m_status"><i class="fas fa-check-circle"></i>읽음</span>';
							}
							str+='</div>';
							str+='</div>';
							str+='<div class="message_cat_m_space"></div>';
						}
						$("div#message_cat_box_body>div").remove();
						$("div#message_cat_box_body").append(str);
						setTimeout(loadcontent,3000);
					}
				});
			};
			
			loadcontent();
			$("button#send_message").click(function(){
				
				if($("textarea#msg_content").val() == ""){
					alert("메시지를 입력하세요");
					$("textarea#msg_content").focus();
				} else {
					var msg_content =$("textarea#msg_content").val();
					$.ajax({
						url: "http://localhost:9090/tumblbugs/mypage/message/content_insert_proc?chatroom_id=${chatroom_id}&msg_content="+msg_content,
						success:function(result){
							location.reload();
						}
					});
				}
			
			});
		});
	</script>
</head>
<body>
	<jsp:include page="../header.jsp" />
	
	<div id="message_content_page">
		<section>
			<div id="message_cat_box">
				<div id="message_cat_box_header">
					<div id="message_cat_box_header_title">
						<a href="http://localhost:9090/tumblbugs/mypage/message"><span><i class="fas fa-chevron-left"></i>메시지함</span></a>
						<a href="http://localhost:9090/tumblbugs/project/${vo.pj_addr }"><span>${vo.pj_title}</span></a>
					</div>
					<div id="message_cat_box_header_info">
						<a href="http://localhost:9090/tumblbugs/projects/${vo.member_id }"><div id="message_cat_box_company_img" style="background-image: url(http://localhost:9090/tumblbugs/upload/${vo.profile_simg}"></div><div id="message_cat_box_company">${vo.name }</div></a>
					</div>
				</div>
				<div id="message_cat_box_body"> 
				</div>
				
				<div id="message_cat_box_footer">
					<!-- <form name="ResMessageForm" method="post"> -->
						<div>
							<textarea class="form-control" name="msg_content" id="msg_content"></textarea>
							<button type="button" id="send_message"><i class="fas fa-envelope"></i>보내기</button>
						</div>
					<!-- </form> -->
				</div>
			</div>
		</section>
	</div>
	
	<jsp:include page="../footer.jsp" />
</body>
</html>