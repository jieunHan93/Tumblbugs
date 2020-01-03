$(document).ready(function() {
	$("input[numberOnly]").keyup(function() {
		$(this).val($(this).val().replace(/[^0-9]/g,""));
	});
	
	//numberOnly
	$("#extra_funding input").number(true);
	$("#extra_funding input").keyup(function() {
		totalPrice();
	});
	
	//선물 변경 > 선물 선택
	$(".gift_select label:not(.disabled)").click(function() {
		$(this).find("input[type='checkbox']").prop("checked", true).val("y");
		$(this).css("background-color", "#f9f9f9");
		$(this).find(".gift_quantity_and_option").slideDown();
		$(this).find(".select_cancel").show();
		totalPrice();
	});
	
	//선물 선택 취소
	$(".select_cancel").click(function() {
		$(this).closest("label").find("input[type='checkbox']").prop("checked", false).val("n");
		$(this).closest("label").css("background-color", "white");
		$(this).siblings(".gift_quantity_and_option").slideUp();
		$(this).siblings(".gift_quantity_and_option").find("#quantity").val("1");
		$(this).siblings(".gift_quantity_and_option").find(".option_box:not(:first)").remove();
		$(this).hide();
		
		totalPrice();
		
		return false;
	});
	
	//선물 수량 -1
	$(".quantity_box #quantity_minus").click(function() {
		var quantity = $(this).siblings("#quantity");
		if(quantity.val() > 1) {
			quantity.val(quantity.val() - 1);
			$(this).closest(".gift_quantity_and_option").find(".option_box:last-child").remove();
		}
		totalPrice();
	});
	
	//선물 수량 +1
	$(".quantity_box #quantity_plus").click(function() {
		var quantity = $(this).siblings("#quantity");
		quantity.val(parseInt(quantity.val()) + 1);
		
		var clone = $(this).closest(".gift_quantity_and_option").find(".option_box").first().clone();
		$(this).closest(".gift_quantity_and_option").find(".option_box:last-child").after(clone);
		
		totalPrice();
	});
	
	//총 펀딩금액 계산
	function totalPrice() {
		var totalprice = 0;
		$("input[type='checkbox']:checked").each(function() {
			var gift_price = $(this).siblings(".gift_price").find("#gift_price").text().replace(",","");
			var quantity = $(this).siblings(".gift_detail").find("#quantity").val();
			totalprice += gift_price * quantity;
		});
		
		var extra_funding = parseInt($("input#extra_funding_price").val());
		if(isNaN(extra_funding) == false) {
			totalprice += extra_funding;
		}
			
		$("span#total_price").text(totalprice).number(true);
		$("input[name='total_funding_price']").val(totalprice);
	}
	
	$("#btn_gift_select_finish").click(function() {
		//옵션 하나로 합쳐서 배열에 넣기
		var idx = 0;
		$("label").each(function() {
			var option = "";
			
			$(this).find(".select_option").each(function() {
				option += $(this).val() + ",";
			});
			$(this).find(".write_option").each(function() {
				option += $(this).val() + ",";
			});
			
			$(this).find("input#gift_option").val(option.substr(0, option.length-1));
		});
		
		//validation check
		var giftSelect = false;
		var optionSelect = true;
		$("input.gift_select_yn").each(function() {
			if($(this).val() == "y") {
				giftSelect = true;
				
				$(this).siblings(".gift_detail").find("#option").each(function() {
					if($(this).val() == "") {
						alert("선물 옵션을 선택해주세요.");
						$(this).focus();
						optionSelect = false;
						return false;
					}
				});
			}
		});
		
		if(!giftSelect) {
			alert("선물을 선택해주세요.");
		} else if(optionSelect) {
			gift_select_form.submit();
		}
		
	});
	
	//우편번호 검색
	$("#btnAddrSearch").click(function() {
		new daum.Postcode({
			oncomplete: function(data) {
                var zipcode = data.zonecode;
                var roadAddr = data.roadAddress;
				var extraRoadAddr = "";
                
				if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
                }
                if(data.buildingName !== '' && data.apartment === 'Y') {
                	extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                
				$("label#new_address").text("[" + zipcode + "] " + roadAddr + extraRoadAddr);
			}
		}).open();
	});
	
	//결제수단 탭
	$("#payment_input>div").hide();
	$("#payment_wrap nav li:first-child").css("background-color", "#73baff").css("color", "white");
	$("#payment_input>div:first-child").show();
	
	$("#payment_wrap nav li").click(function() {
		var id = $(this).attr("id");
		
		/*
			input[name="payment_method"]
			기존 결제 수단을 선택: 공백으로 설정
			신규 카드를 선택: 01로 설정
			신규 은행계좌 선택: 02로 설정
			> 신규 결제 수단을 선택한 경우, tum_payment 테이블에 먼저 입력한 결제수단 정보를 insert한 뒤 해당 결제 수단 id를 가져와서 tum_funding에 insert
		*/
		if(id == "my_payment") {
			$("input[name='payment_method']").val("");
		} else if(id == "new_credit_card") {
			$("input[name='payment_method']").val("01");
			$("input[name='payment_id']").val("");
		} else if(id == "new_bank_account") {
			$("input[name='payment_method']").val("02");
			$("input[name='payment_id']").val("");
		}
		
		$("#payment_wrap nav li").css("background-color", "white").css("color", "#4a4a4a");
		$("#payment_input>div").hide();
		
		$(this).css("background-color", "#73baff").css("color", "white");
		$("#payment_input>div#" + id).show();
	});
	
	//내 결제수단 선택
	$("#my_payment div").click(function() {
		$("input[name='payment_id']").val($(this).attr("id"));
		
		$("#my_payment div").css("background-color", "#f7f7f7").css("box-shadow", "1px 1px #dcdcdc");
		$(this).css("background-color", "#dfefff").css("box-shadow", "1px 1px #73baff");
	});
	
	//신용카드 4자리 입력 후 다음 input focus
	$("#card_number input").keyup(function() {
		var maxLength = $(this).attr("maxlength");
		if(this.value.length >= maxLength) {
			$(this).next("#card_number input").focus();
			return false;
		}
	});
	
	//약관동의
	$("#agreement_wrap .round_checkbox").click(function() {
		var status = $(this).attr("id");
		
		if(status == 0) {
			$(this).find("i").show();
			$(this).attr("id", "1");
		} else {
			$(this).find("i").hide();
			$(this).attr("id", "0");
		}
	});
	
	//결제 예약하기 버튼 클릭
	$("#btn_payment_reservation_finish").click(function() {
		//recipient_addr value set
		if($("label#new_address").text() != "") {
			var recipient_addr = $("label#new_address").text() + " " + $("#new_address_detail").val();
			$("input[name='recipient_addr']").val(recipient_addr);
		}
		
		//card_number value set
		var cardNumber = $("#card_number1").val() + $("#card_number2").val() + $("#card_number3").val() + $("#card_number4").val();
		$("input[name='card_number']").val(cardNumber);
		
		//validation check
		if($("input#delivery_addr_select").val() == "") {
			alert("배송 정보를 입력해주세요.");
			$("html").animate({scrollTop : $("#delivery_wrap").offset().top}, 300);
		} else if($("input[name='recipient_name']").val() == "") {
			alert("선물 받는 분의 이름을 입력해주세요.");
			$("input[name='recipient_name']").focus();
		} else if($("input[name='recipient_phone']").val() == "") {
			alert("선물 받는 분의 휴대폰 번호를 입력해주세요.");
			$("input[name='recipient_phone']").focus();
		} else if($("input[name='recipient_addr']").val() == "") {
			alert("선물을 받을 주소를 입력해주세요.");
		} else if($("input[name='payment_method']").val() == "" && $("input[name='payment_id']").val() == "") {
			alert("결제 수단을 선택해주세요.");
			$("html").animate({scrollTop : $("#payment_wrap").offset().top}, 200);
		} else if($("input[name='payment_method']").val() == "01" && $("input#card_number1").val().length < 4) {
			alert("카드번호 16자리를 모두 입력해주세요.");
			$("input#card_number1").focus();
		} else if($("input[name='payment_method']").val() == "01" && $("input#card_number2").val().length < 4) {
			alert("카드번호 16자리를 모두 입력해주세요.");
			$("input#card_number2").focus();
		} else if($("input[name='payment_method']").val() == "01" && $("input#card_number3").val().length < 4) {
			alert("카드번호 16자리를 모두 입력해주세요.");
			$("input#card_number3").focus();
		} else if($("input[name='payment_method']").val() == "01" && $("input#card_number4").val().length < 4) {
			alert("카드번호 16자리를 모두 입력해주세요.");
			$("input#card_number4").focus();
		} else if($("input[name='payment_method']").val() == "01" && $("input[name='card_valid_date']").val().length < 4) {
			alert("카드 유효기간을 입력해주세요.");
			$("input[name='card_valid_date']").focus();
		} else if($("input[name='payment_method']").val() == "01" && $("input[name='card_pass']").val().length < 2) {
			alert("카드 비밀번호를 입력해주세요.");
			$("input[name='card_pass']").focus();
		} else if($("input[name='payment_method']").val() == "01" && $("input[name='card_birth']").val().length < 6) {
			alert("생년월일을 입력해주세요.");
			$("input[name='card_birth']").focus();
		} else if($("input[name='payment_method']").val() == "02" && $("input[name='account_number']").val() == "") {
			alert("계좌번호를 입력해주세요.");
			$("input[name='account_number']").focus();
		} else if($("input[name='payment_method']").val() == "02" && $("input[name='account_name']").val() == "") {
			alert("예금주명을 입력해주세요.");
			$("input[name='account_name']").focus();
		} else if($("input[name='payment_method']").val() == "02" && $("input[name='account_birth']").val().length < 6) {
			alert("생년월일을 입력해주세요.");
			$("input[name='account_birth']").focus();
		} else if($("#agreement_wrap .round_checkbox").attr("id") == "0") {
			alert("약관 동의에 체크해주세요.");
		} else {
			fundingForm.submit();
		}
	});
});