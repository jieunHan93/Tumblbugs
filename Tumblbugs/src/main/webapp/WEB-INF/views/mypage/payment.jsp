<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>텀블벅스 :: tumblbugs</title>
	<link rel="icon" href="http://localhost:9090/tumblbugs/images/tumblbugs_img_logo.ico" type="image/x-icon">
	<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/main.css">
	<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/mypage.css">
	<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/am-pagination.css">

	<script src="http://localhost:9090/tumblbugs/js/jquery-3.4.1.min.js"></script>
	<script src="http://localhost:9090/tumblbugs/js/am-pagination.js"></script>
	
	<script>
	$(document).ready(function(){

		$("div#payment_regist_editor").hide();
		//$("div#registed_payment_list").hide();
		$("button#payment_nav_list").click(function(){
			$("div#payment_regist_editor").hide();
			$("div#registed_payment_list").show();
		});
		
		$("button#payment_nav_regist").click(function(){
			$("div#registed_payment_list").hide();
			$("div#payment_regist_editor").show();
		});
		
		$("button.delete_payment").click(function(){
			$(this).parent().remove();				
		});
		
		$("div#payment_regist_account").hide();
		
		$("div.dropdown-item").click(function(){
			var text = $(this).text();
			$("div#payment_regist_select>button").text(text);
			if(text == '체크/신용카드') {
				$("div#payment_regist_account").hide();
				$("div#payment_regist_credit").show();
			} else {
				$("div#payment_regist_credit").hide();
				$("div#payment_regist_account").show();
				
			}
		});

			
		
		$("div.dropdown-item").click(function(){
			var menu = $(this).attr("id");

			if(menu == "pay_card"){
				 $('input[name=payment_method]').val("01");
				
			}else if(menu == "pay_account"){
				
				$('input[name=payment_method]').val("02");
			}
		});
		
		
		
		$("#payment_regist_submit").click(function(){
		
			if($('input[name=payment_method]').val() == "00"){
				alert("결제수단선택");
				return false;
			}else if($('input[name=payment_method]').val() == "01"){
				
				if ($("#cardno1").val() != "") {
					
					var cardval = $("#cardno1").val();
					var regExp = /^[0-9]+$/;
					
					if(cardval.match(regExp) != null){
						
					}else{
						alert("형식에 맞지않습니다 숫자만 입력해주세요.4자리");
					}
				}else if($("#cardno1").val()== ""){
					alert("카드 번호를 입력하세요.섹터1");
					return false;
				}
				
				if ($("#cardno2").val() != "") {
					
					var cardval = $("#cardno2").val();
					var regExp = /^[0-9]+$/;
					
					if(cardval.match(regExp) != null){
					
					}else{
						alert("형식에 맞지않습니다 숫자만 입력해주세요.4자리");
					}
				}else if($("#cardno2").val()== ""){
					alert("카드 번호를 입력하세요.섹터2");
					return false;
				}
				
				if ($("#cardno3").val() != "") {
					
					var cardval = $("#cardno3").val();
					var regExp = /^[0-9]+$/;
					
					if(cardval.match(regExp) != null){
						
					}else{
						alert("형식에 맞지않습니다 숫자만 입력해주세요.4자리");
					}
				}else if($("#cardno3").val()== ""){
					alert("카드 번호를 입력하세요.섹터3");
					return false;
				}
				
				if ($("#cardno4").val() != "") {
					
					var cardval = $("#cardno4").val();
					var regExp = /^[0-9]+$/;
					
					if(cardval.match(regExp) != null){
						
					}else{
						alert("형식에 맞지않습니다 숫자만 입력해주세요.4자리");
					}
				}else if($("#cardno4").val()== ""){
					alert("카드 번호를 입력하세요.섹터4");
					return false;
				}
				
				if ($("#card_valid_date").val() != "") {
					
					var cardval = $("#card_valid_date").val();
					var regExp = /^[0-9]+$/;
					
					if(cardval.match(regExp) != null){
						
					}else{
						alert("형식에 맞지않습니다 숫자만 입력해주세요.월2자리 년2자리 총 4자리");
					}
				}else if($("#card_valid_date").val()== ""){
					alert("유효기간 번호를 입력하세요.4자리 월/년도");
					return false;
				}
				
				if ($("#card_pass").val() != "") {
					
					var cardval = $("#card_pass").val();
					var regExp = /^[0-9]+$/;
					
					if(cardval.match(regExp) != null){
						
					}else{
						alert("형식에 맞지않습니다 숫자만 입력해주세요.카드뒷면 cvc번호 2자리");
					}
				}else if($("#card_pass").val()== ""){
					alert("cvc 번호를 입력하세요.");
					return false;
				}
				
				if ($("#card_birth").val() != "") {
					
					var cardval = $("#card_birth").val();
					var regExp = /^[0-9]+$/;
					
					if(cardval.match(regExp) != null){
						
					}else{
						alert("형식에 맞지않습니다 숫자만 입력해주세요.생년월일을 입력하세요.6자리");
					}
				}else if($("#card_birth").val()== ""){
					alert("생년월일을 입력하세요.6자리");
					return false;
				}	
			}else if($('input[name=payment_method]').val() == "02"){
				
				if ($("#account_number").val() != "") {
					
					var cardval = $("#account_number").val();
					var regExp = /^[0-9]+$/;
					
					if(cardval.match(regExp) != null){
						
					}else{
						alert("형식에 맞지않습니다 숫자만 입력해주세요.20자리");
					}
				}else if($("#account_number").val()== ""){
					alert("계좌번호를 입력하세요.20내외");
					
					return false;
				}
				
				if ($("#account_name").val() != "") {
					
					var cardval = $("#account_name").val();
					var regExp = /^[가-힣a-zA-Z]+$/;
					
					if(cardval.match(regExp) != null){
						
					}else{
						alert("형식에 맞지않습니다 예금주명을 입력해주세요.");
					}
				}else if($("#account_name").val()== ""){
					alert("형식에 맞지않습니다 예금주명을 입력해주세요.");
					return false;
				}
				
				if ($("#account_birth").val() != "") {
					
					var cardval = $("#account_birth").val();
					var regExp = /^[0-9]+$/;
					
					if(cardval.match(regExp) != null){
						
					}else{
						alert("형식에 맞지않습니다 숫자만 입력해주세요.생년월일6자리");
					}
				}else if($("#account_birth").val()== ""){
					alert("형식에 맞지않습니다 숫자만 입력해주세요.생년월일6자리");
					return false;
				}	
			}			
			card_number.val($("#cardno1")+$("#cardno2")+$("#cardno3")+$("#cardno4"));
			payment_regist_form.submit();
		});
		
	/* 	
		   //페이징 처리 
		var pager = jQuery('#ampaginationsm').pagination({
		
		    maxSize: 5,	    		// max page size
		    totals: '${dbcount}',	// total pages	
		    page: '${rpage}',		// initial page		
		    pageSize: '${pagesize}',	// max number items per page
		
		    // custom labels		
		    lastText: '&raquo;&raquo;', 		
		    firstText: '&laquo;&laquo;',		
		    prevText: '&laquo;',		
		    nextText: '&raquo;',
				     
		    btnSize:'sm'	// 'sm'  or 'lg'		
		});
		

		jQuery('#ampaginationsm').on('am.pagination.change',function(e){
			   jQuery('.showlabelsm').text('The selected page no: '+e.page);
	           $(location).attr('href', "http://localhost:9090/tumblbugs/mypage/payment?rpage="+e.page);         
	    });   */
		
	});
	</script>
</head>

<body>
<input type="hidden" name="card_number" id="card_number"> 
	<jsp:include page="../header.jsp" />
	
	<div>
		<div>
	
			<section id="mypage_profile_header">
				<div id="mypage_profile_header_container">
					<h2>지불정보 설정</h2>	
					<div id="mypage_nav">
						<a href="http://localhost:9090/tumblbugs/mypage/profile"><span>프로필 설정</span></a>
						<a href="http://localhost:9090/tumblbugs/mypage/payment"><span>지불정보 설정</span></a>
					</div>
				</div>
			</section>
			
		</div>	
		<div id="mypage_payment_main_container">
				
				
			<div id="payment_editor">
				<div id="payment_nav">
					<button type="button" id="payment_nav_list"><i class="fas fa-list"></i></button>
					<button type="button" id="payment_nav_regist"><i class="fas fa-plus-circle"></i></button>
				</div>

				<c:forEach var="vo" items="${payment_info}" >

				 <%-- <div>${vo.payment_method }</div> --%>
				 <c:choose> 
				  <c:when test="${vo.payment_method != ''}">
							 <c:if test="${vo.payment_method == '01'}"> 
			
							<div id="registed_payment_list">
							<div class="registed_payment_content" id="card_content">
								<i class="far fa-credit-card"></i>
								<span>카드 : ${vo.card_company}  ${vo.card_number} </span>		
								<button type="button" class="delete_payment"><i class="far fa-trash-alt"></i></button>
							</div>
										  
						   </c:if>  
						  			  
						  <c:if test="${vo.payment_method == '02'}">
							<div class="registed_payment_content" id="account_content">
								<i class="fas fa-money-check"></i>
								<span>계좌 : ${vo.bank} ${vo.account_number }</span>
								<button type="button" class="delete_payment"><i class="far fa-trash-alt"></i></button>
							</div>	
										  
						  </c:if>  
						 </c:when>
								<c:otherwise>
									<div id="registed_payment_not_founded">
									<i class="far fa-meh"></i>
									<div>등록된 결제 수단이 없습니다.</div>
								</div>	
										
								</c:otherwise>
								</c:choose>	
			
			
					
					
					
					</c:forEach> 
				
				</div>
				</div>
				
				
				<form name="payment_regist_form" action="/tumblbugs/payment_insert_proc" method="post">
				
				<div id="payment_regist_editor">
					<span>등록할 결제 수단을 선택해 주세요.</span>
					
					<div id="payment_regist_select"  >						
						<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" value="01" id="payment_select_btn" style="width:130px;height:40px;"  ></button>
					    <div class="dropdown-menu" >					    	
					    	 <div class="dropdown-item" id="pay_card" >체크/신용카드</div>
					     	 <div class="dropdown-item" id="pay_account">은행계좌</div>					  
					    </div>

					</div>
					
					<input type="hidden" id="payment_method" name="payment_method" value="00">
					<input type="hidden" name="payment_id" id="payment_id" value="${payment_id}">
					<input type="hidden" name="email" value="${sessionScope.semail}">
					
						<div id="payment_regist_credit">
							<div class="payment_regist_space"></div>
							<div class="payment_regist_input" >
								<label>카드사</label>
								<select name="card_company">
									<option value="신한카드">신한카드</option>
									<option value="삼성카드">삼성카드</option>
									<option value="현대카드">현대카드</option>
									<option value="BC카드">BC카드</option>
									<option value="국민카드">국민카드</option>
									<option value="하나카드">하나카드</option>
									<option value="롯데카드">롯데카드</option>
									<option value="농협카드">농협카드</option>
									<option value="씨티카드">씨티카드</option>
									<option value="카카오뱅크">카카오뱅크</option>
								</select>
							</div>
							
							<div class="payment_regist_input" id="card_input">
								<label>신용(체크)카드 번호</label>
								<input type="text" class="form-control" id="cardno1" name="cardno1" maxlength="4">
								<input type="text" class="form-control" id="cardno2" name="cardno2" maxlength="4">
								<input type="text" class="form-control" id="cardno3" name="cardno3" maxlength="4">
								<input type="text" class="form-control" id="cardno4" name="cardno4" maxlength="4">
								<!-- <span class="payment_regist_guide">공백이나 하이픈(-) 없이 숫자만 입력해주세요</span> -->

							</div>
							<div class="payment_regist_input">
								<label>카드 유효 기간</label>
								<input type="text" placeholder="MM/YY" class="form-control" id="card_valid_date" name="card_valid_date" maxlength="4">
							</div>
							<div class="payment_regist_input">
								<label>카드 비밀번호</label>
								<input type="text" placeholder="CVC 앞2자리" class="form-control" id="card_pass" name="card_pass" maxlength="2">
							</div>
							<div class="payment_regist_input">
								<label>생년월일</label>
								<input type="text" placeholder="주민등록번호 앞 6자리" class="form-control" id ="card_birth"name="card_birth" maxlength="6">
							</div>
						</div>
						
						<div id="payment_regist_account">
							<div class="payment_regist_space"></div>
							<div class="payment_regist_input">
								<label>결제 은행</label>
								<select name="bank">
									<option value="국민은행">국민은행</option>
									<option value="농협">농협</option>
									<option value="우리은행">우리은행</option>
									<option value="SC은행">SC은행</option>
									<option value="삼성은행">삼성은행</option>
									<option value="씨티은행">씨티은행</option>
									<option value="대구은행">대구은행</option>
									<option value="부산은행">부산은행</option>
									<option value="광주은행">광주은행</option>
									<option value="제주은행">제주은행</option>
									<option value="경남은행">경남은행</option>
									<option value="새마을금고">새마을금고</option>
									<option value="신협">신협</option>
									<option value="우체국">우체국</option>
									<option value="하나은행">하나은행</option>
									<option value="신한은행">신한은행</option>
									<option value="외환은행">외환은행</option>
									<option value="유안타증권">유안타증권</option>
									<option value="기업은행">기업은행</option>
									<option value="산업은행">산업은행</option>
								</select>
							</div>
							<div class="payment_regist_input">
								<label>계좌번호</label>
								<input type="text" class="form-control" name="account_number" id="account_number" minlength="12" maxlength="20" min>
								<span class="payment_regist_guide">*핸드폰 번호 등으로 만든 평생계좌번호 및 가상계좌,펀드/적금/정기예금 등의 계좌는 등록이 불가능합니다.</span>
							</div>
							<div class="payment_regist_input">
								<label>예금주명</label>
								<input type="text" class="form-control" name="account_name" id="account_name" maxlength="15">
							</div>
							<div class="payment_regist_input">
								<label>생년월일</label>
								<input type="text" placeholder="주민등록번호 앞 6자리" class="form-control" name="account_birth" id="account_birth" maxlength="6">
							</div>
						</div>
						
						<div id="payment_regist_button">
							<button id="payment_regist_submit" type="input">등록하기</button>
							<button id="payment_regist_reset" type="reset">취소하기</button>
						</div>
					</form>
				</div>
			</div>
			
			<div id="payment_faq">
				<div>자주 묻는 질문</div>
				<div class="payment_faq_article">
					<div>
						<div class="payment_faq_title"><i class="fas fa-chevron-right"></i><span>예약한 결제수단을 확인하고 싶어요.</span></div>
						<div class="payment_faq_content"><span>프로젝트별로 예약된 결제수단은 </span><br><a href="http://localhost:9090/tumblbugs/myfunding">내 후원 현황</a><span>에서 조회하실 수 있습니다.</span></div>
					</div>
					<div>
						<div class="payment_faq_title"><i class="fas fa-chevron-right"></i><span>예약한 결제수단은 어떻게 바꾸나요?</span></div>
						<div class="payment_faq_content"><a href="http://localhost:9090/tumblbugs/myfunding">내 후원 현황</a><span> > 프로젝트 후원 상세 페이지에서<br>변경하실 수 있습니다.</span></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>