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
	<style>
	span#new_circle{
		display: inline-block;
		width:15px;
		height:15px;
		background-image: url("http://localhost:9090/tumblbugs/images/new_icon.png");
		background-position: 50% 50%;
		background-size: cover;
		border-radius: 50%;
		margin-left:5px;
		margin-bottom:-3px;
	}
	span#new_circle.in_h5{
		margin-bottom:-1px;
	}
	</style>
	<script>
		$(document).ready(function(){
			$("div#mypage_nomessage").hide();
			$("span#new_circle.in_h5").hide();
			var header_label = sessionStorage.getItem("header_label");
			var body_nav = sessionStorage.getItem("body_nav");
			if(header_label == null) header_label="buyer";
			if(body_nav == null) body_nav="all";
			
			//console.log(header_label+" ," + body_nav);
			function new_message_b(){
				$.ajax({
					url:"http://localhost:9090/tumblbugs/mypage/message/new_message_buyer",
					success:function(result){
						console.log("구매기준:"+result);
						if(result != 0){
							$("div#mypage_message_header_label").find("span.buyer").show();
						} 
						setTimeout(new_message_b,3000);
					}
				});
			};
			function new_message_c(){
				$.ajax({
					url:"http://localhost:9090/tumblbugs/mypage/message/new_message_creator",
					success:function(result){
						console.log("판매기준:"+result);
						if(result != 0){
							$("div#mypage_message_header_label").find("span.creator").show();
						} 
						setTimeout(new_message_c,3000);
					}
				});
			};
			new_message_b();
			new_message_c();
			function content(){
				$.ajax({
					url: "http://localhost:9090/tumblbugs/mypage/message_proc?user="+header_label+"&sort="+body_nav,
					success:function(result){
						var jsonObj = JSON.parse(result);
						var str = "";
						$("div#mypage_message_body_content>a").remove();
						$("div#mypage_nomessage").hide();
						if(jsonObj.result.length != 0){
							for(i=0;i<jsonObj.result.length;i++){
								str += '<a href="http://localhost:9090/tumblbugs/mypage/message/content?chatroom_id='+ jsonObj.result[i].chatroom_id +'">';
								str += '<div id="mypage_message_card">';
								str += '<div id="mypage_message_card_img">';
								str += '<img src="http://localhost:9090/tumblbugs/upload/'+jsonObj.result[i].pj_simg+'">';
								str += '</div>';
								str += '<div id="mypage_message_card_content">';
								str += '<div id="mypage_message_card_title"><b>'+jsonObj.result[i].pj_title+'</b></div>';
								str += '<div id="mypage_message_card_company"><b>'+jsonObj.result[i].name+'</b></div>';
								str += '<div id="mypage_message_card_preview"><span>'+jsonObj.result[i].msg_content+'</span>';
								/* str+= '<i class="fas fa-comment"></i>'; */
								if(jsonObj.result[i].new_message == 'Y') str+= '<span id="new_circle"></span>';
								str+= '</div>';
								str += '</div>';
								str += '<div id="mypage_message_card_date">';
								str += '<div>'+jsonObj.result[i].msg_date+'</div>';
								str += '</div>';
								str += '</div>';
								str += '</a>';
							}
						$("div#mypage_message_body_content").append(str);
						} else {
							$("div#mypage_nomessage").show();
						}
						setTimeout(content,3000);
					}
				}); // ajax
			};
			content();
			
			$("div#mypage_message_header_label>div").click(function(){
				$("div#mypage_nomessage").hide();
				$(this).parent().children().css({
					"border-top": "1px solid transparent",
					"border-left": "1px solid transparent",
					"border-right": "1px solid transparent",
					"background-color": "transparent"
				});
				$(this).css({
					"border-top": "1px solid rgba(10,10,10,0.1)",
					"border-left": "1px solid rgba(10,10,10,0.1)",
					"border-right": "1px solid rgba(10,10,10,0.1)",
					"background-color": "white"
				});
				$("div#mypage_message_body_nav>span").parent().children().css({
					"background-color": "transparent",
					"color":"#777"		
				});
				$("div#mypage_message_body_nav>span:first-child").css({
					"background-color": "rgba(0,0,0,0.08)",
					"color":"#1e90ff"
				});
				
				header_label = $(this).find("input").val();
				
				sessionStorage.clear();
				sessionStorage.setItem("header_label",header_label);
				sessionStorage.setItem("body_nav","all");
				header_label = sessionStorage.getItem("header_label");
				body_nav = sessionStorage.getItem("body_nav");
				console.log(header_label+" ," + body_nav);
				
				content();
			});
			$("div#mypage_message_body_nav>span").click(function(){
				$("div#mypage_nomessage").hide();
				$(this).parent().children().css({
					"background-color": "transparent",
					"color":"#777"		
				});
				$(this).css({
					"background-color": "rgba(0,0,0,0.08)",
					"color":"#1e90ff"
				});
				
				body_nav = $(this).children().val();
				
				sessionStorage.setItem("header_label",header_label);
				sessionStorage.setItem("body_nav",body_nav);
				header_label = sessionStorage.getItem("header_label");
				body_nav = sessionStorage.getItem("body_nav");
				console.log(header_label+" ," + body_nav);
				
				content();
			});
			
			
			
			var checked_header = "input[value='"+header_label+"']";
			var checked_header_div = $(checked_header).parent();
			$(checked_header_div).parent().children().css({
				"border-top": "1px solid transparent",
				"border-left": "1px solid transparent",
				"border-right": "1px solid transparent",
				"background-color": "transparent"
			});
			$(checked_header_div).css({
				"border-top": "1px solid rgba(10,10,10,0.1)",
				"border-left": "1px solid rgba(10,10,10,0.1)",
				"border-right": "1px solid rgba(10,10,10,0.1)",
				"background-color": "white"
			});
			
			var checked_nav = "input[value='"+body_nav+"']";
			var checked_span = $(checked_nav).parent();
			$(checked_span).parent().children().css({
				"background-color": "transparent",
				"color":"#777"		
			});
			$(checked_span).css({
				"background-color": "rgba(0,0,0,0.08)",
				"color":"#1e90ff"
			});
		});
	</script>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div>
		<div id="mypage_message_header">
			<div>
				<div id="mypage_message_header_title">
					<i class="fas fa-envelope"></i>
					<span>메시지</span>
				</div>
				<div id="mypage_message_header_label">
					<div>
						<h5>문의/후원한 프로젝트<span id="new_circle" class="in_h5 buyer"></span></h5> 
						<input type="hidden" value="buyer">
					</div>
					<div>
						<h5>만든 프로젝트<span id="new_circle" class="in_h5 creator"></span></h5>
						<input type="hidden" value="creator">
					</div>
				</div>
			</div>
		</div>
		
		<div id="mypage_message_body">
			<div>
				<div id="mypage_message_body_nav">
					<span>모든 메시지<input type="hidden" value="all"></span>
					<span>보낸 메시지<input type="hidden" value="send"></span>
					<span>안 읽은 메시지<input type="hidden" value="notread"></span>
				</div>
				
				<div id="mypage_message_body_content"></div>

				
				<div id="mypage_nomessage">
					<i class="fas fa-envelope"></i>
					<div>새로운 메시지가 없습니다.</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>