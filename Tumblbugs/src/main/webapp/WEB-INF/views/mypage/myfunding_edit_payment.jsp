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
<script src="http://localhost:9090/tumblbugs/js/jquery.number.min.js"></script>
<script src="http://localhost:9090/tumblbugs/js/funding.js"></script>
<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/main.css">
<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/mypage.css">
<link rel="icon" href="http://localhost:9090/tumblbugs/images/tumblbugs_img_logo.ico" type="image/x-icon">
<script>
	$(document).ready(function(){
		$(".content_wrap>div." + '${edit_menu}').show();
		$(".edit_menu a#" + '${edit_menu}').css("color", "#1d85ea");
		
		//결제수단 변경
		$(".payment_option").click(function() {
			var payment = $(this).attr("id");
			if(confirm("[" + payment + "]로 변경하시겠습니까?")) {
				//변경 후 후원현황으로 돌아가기
				alert("변경이 완료되었습니다.");
			}
		});
	});
</script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div id="funding_edit">
		<section class="background_wrap" style="background-image : url('http://localhost:9090/tumblbugs/upload/${pvo.pj_simg}')">
			<div>
				<div>
					<div class="page_title">변경하기</div>
					<div class="project_title">${pvo.pj_title }</div>
					<nav class="edit_menu">
						<a id="edit_gift" href="http://localhost:9090/tumblbugs/myfunding/${funding_id }/edit_gift">선물/금액 변경</a>
						<a id="edit_payment" href="http://localhost:9090/tumblbugs/myfunding/${funding_id }/edit_payment">결제수단 변경</a>
						<a id="cancel_funding" href="http://localhost:9090/tumblbugs/myfunding/${funding_id }/cancel_funding">취소하기</a>
					</nav>
				</div>
			</div>
		</section>
		<section class="content_wrap">
			<div class="payment_edit">
				<div>변경할 예약 결제 수단을 선택해주세요.</div>
				<div id="my_payment">
					<div class="payment_option" id="신한카드 1234"><i class="far fa-credit-card"></i> 신한카드 1234</div>
					<div class="payment_option" id="신한은행 5678"><i class="fas fa-money-check"></i> 신한은행 5678</div>
					<a href="http://localhost:9090/tumblbugs/mypage/payment"><div><i class="fas fa-plus"></i> 신규 결제 수단 등록</div></a>
				</div>
			</div>
		</section>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>