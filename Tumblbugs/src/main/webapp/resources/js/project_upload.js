$(document).ready(function(){
	$(document).ready(function(){
		$(".go_agree_btn").click(function(){
			location.href="http://localhost:9090/tumblbugs/project_start_agreement";
		});
	});
	
		var item_value = 0;
		var product_number = 1;
		
		/***ck 에디터***/
		var editorConfig = {
		   filebrowserUploadUrl : "http://localhost:9090/tumblbugs/fileupload.do", //이미지 업로드
		};
		ck = CKEDITOR.replace("m3_c1_i1", editorConfig);
		
		CKEDITOR.on('dialogDefinition', function( ev ){
		   var dialogName = ev.data.name;
		   var dialogDefinition = ev.data.definition;
		
		   switch (dialogName) {
		       case 'image': 
		       dialogDefinition.removeContents('Link');
		       dialogDefinition.removeContents('advanced');
		        break;
		    }
		});
		
		$("#menu_label1").css('background-color','rgb(247,247,247)').css('border-color','#ccc');
		$("#content_up_menu1").css('display','inline-block');	
		
		
		
		$(".upload_detail_slide").click(function(){
			var slide_id = "#"+$(this).attr("id");
			var slide_d_id="#"+$(slide_id).next().attr("id");
			var save_btn = "#"+$(slide_id).next().attr("id")+" .up_save";
			var input_file = "#"+$(slide_id).next().attr("id")+" input[type=file]";
			
			$(".present_detail_slide").css('display','inline-block');
			$(".upload_detail_slide").css('display','inline-block');
			$("upload_present_slide").css('display','block');
			$(".upload_detail").css('display','none');
			
			/*$("input:radio[id ='personal_radio']").prop("checked", true);*/
			
			$(this).css('display','none');
			$(save_btn).attr('disabled', true).css('background','rgb(135,200,255)').css('cursor','default');
			$("#m3_c1_save").removeAttr('disabled').css('background','#1e90ff').css('cursor','pointer');
			
			$(this).next().css('display','block').css({
					 "-moz-animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)",
					  "-webkit-animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)",
					  "animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)",
					  "-moz-animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)",
					  "-webkit-animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)",
					  "animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)"
	        });
			
			/** 페이지 오픈 위치 **/
			$(slide_id).on('click', function() {
			    var thisTarget = $(slide_d_id);
				$(window).scrollTop($(thisTarget).offset().top);
			});
			
			/** 글자수 체크 & 버튼 활성화**/
			$(slide_d_id+" input[type=text]").on("change keyup paste", function(){
				var my_id = $(this).attr("id");
				var input_val_len = $(this).val().length;
				
				if(slide_id == "#content_m4_c3"){
					var m4_txt_check = 0;
					$(slide_d_id+" .m4_check").each(function(i, e){
					   if($(this).val() != null && $(this).val() != ""){
						   m4_txt_check++;
					   }
					   if(m4_txt_check == 4){
						   $(save_btn).removeAttr('disabled').css('background','#1e90ff').css('cursor','pointer');
					   }else{
						   $(save_btn).attr('disabled', true).css('background','rgb(135,200,255)').css('cursor','default');
					   }
					});
					
				}else if(my_id=="m1_c1_i1"){
					if(input_val_len != 0 && input_val_len <= 32){
						$("#m1_c1_i1_check").text(32-input_val_len+"자 남았습니다.").css("color","#444444");
						$(this).css('border-color',"rgb(232,237,247)");	
						
						if($(m1_c1_i2).val().length != 0 && $(m1_c1_i2).val().length <=7  ){
							$(save_btn).removeAttr('disabled').css('background','#1e90ff').css('cursor','pointer');
						}
					}else if(input_val_len > 32){
						$("#m1_c1_i1_check").text(input_val_len-32+"자 초과했습니다.").css("color","rgb(241,75,88)");
						$(this).css('border-color',"rgb(241,75,88)");
						$(save_btn).attr('disabled', true).css('background','rgb(135,200,255)').css('cursor','default');
					}else if(input_val_len == 0){
						$(save_btn).attr('disabled', true).css('background','rgb(135,200,255)').css('cursor','default');
						$("#m1_c1_i1_check").text(32-input_val_len+"자 남았습니다.").css("color","#444444");
					}
				}else if(my_id=="m1_c1_i2"){
					if(input_val_len != 0 && input_val_len <= 7){
						$("#m1_c1_i2_check").text(7-input_val_len+"자 남았습니다.").css("color","#444444");
						$(this).css('border-color',"rgb(232,237,247)"); 
						if($(m1_c1_i1).val().length != 0 && $(m1_c1_i1).val().length <= 32){
							$(save_btn).removeAttr('disabled').css('background','#1e90ff').css('cursor','pointer');
						}
					}else if(input_val_len > 7){
						$("#m1_c1_i2_check").text(input_val_len-7+"자 초과했습니다.").css("color","rgb(241,75,88)");
						$(this).css('border-color',"rgb(241,75,88)");
						$(save_btn).attr('disabled', true).css('background','rgb(135,200,255)').css('cursor','default');
					}else if(input_val_len == 0){
						$(save_btn).attr('disabled', true).css('background','rgb(135,200,255)').css('cursor','default');
						$("#m1_c1_i2_check").text(32-input_val_len+"자 남았습니다.").css("color","#444444");
					}
				}else if(my_id=="m1_c6_i1"){
					if(input_val_len != 0 && input_val_len <= 20){
						$("#m1_c6_len").text(20-input_val_len+"자 남았습니다.").css("color","#444444");
						$(this).css('border-color',"rgb(232,237,247)"); 
						$(save_btn).removeAttr('disabled').css('background','#1e90ff').css('cursor','pointer');
					}else if(input_val_len > 20){
						$("#m1_c6_len").text(input_val_len-20+"자 초과했습니다.").css("color","rgb(241,75,88)");
						$(this).css('border-color',"rgb(241,75,88)");
						$(save_btn).attr('disabled', true).css('background','rgb(135,200,255)').css('cursor','default');
					}else if(input_val_len == 0){
						$(save_btn).attr('disabled', true).css('background','rgb(135,200,255)').css('cursor','default');
						$("#m1_c6_len").text(20-input_val_len+"자 남았습니다.").css("color","#444444");
					}
				}else if(my_id=="m2_c1_i1"){
					if($(this).val != 0 && $(this).val() >= 5000){
						
						$("#m2_c1_t1").text((Math.round($(this).val() * 0.033)).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"원");
						$("#m2_c1_t2").text(Math.round($(this).val() * 0.055).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"원");
						$("#m2_c1_t3").text(Math.round($(this).val() * 0.088).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"원²");
						$(this).css('border-color',"rgb(232,237,247)");
						$(save_btn).removeAttr('disabled').css('background','#1e90ff').css('cursor','pointer');
					}else if($(this).val() < 5000){
						$("#m2_c1_t1").text(Math.round($(this).val() * 0.033).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"원");
						$("#m2_c1_t2").text(Math.round($(this).val() * 0.055).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"원");
						$("#m2_c1_t3").text(Math.round($(this).val() * 0.088).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"원²");
						$(this).css('border-color',"rgb(241,75,88)");
						$(".up_save").attr('disabled', true).css('background','rgb(135,200,255)').css('cursor','default');
					}else if($(this).val == 0){
						$(save_btn).attr('disabled', true).css('background','rgb(135,200,255)').css('cursor','default');
						$("#m1_c6_len").text(20-input_val_len+"자 남았습니다.").css("color","#444444");
					}
				}else if(my_id=="m4_c1_i1"){
					if($(this).val() != ""){
						$(save_btn).removeAttr('disabled').css('background','#1e90ff').css('cursor','pointer');
					}else{
						$(save_btn).attr('disabled', true).css('background','rgb(135,200,255)').css('cursor','default');
					}
				}else if(my_id=="m4_c2_i1"){
					if($(this).val() != ""){
						var num = $(this).val();
				    	var result = auto_hypen(num);
				    	$("#m4_c2_i1").val(result);
						$(save_btn).removeAttr('disabled').css('background','#1e90ff').css('cursor','pointer');
					}else{
						$(save_btn).attr('disabled', true).css('background','rgb(135,200,255)').css('cursor','default');
					}
				}else if(my_id=="m2_c4_i2" || my_id=="m2_c4_i4" || my_id=="m2_c4_i6" || my_id=="pj_account_number" || my_id=="pj_account_number2"){
					if($(this).val() != ""){
						$(save_btn).removeAttr('disabled').css('background','#1e90ff').css('cursor','pointer');
					}else{
						$(save_btn).attr('disabled', true).css('background','rgb(135,200,255)').css('cursor','default');
					}
				}else{
					if(input_val_len != 0 && input_val_len <= 50){
						$(this).next().text(50-input_val_len+"자 남았습니다.").css("color","#444444");
						$(this).css('border-color',"rgb(232,237,247)"); 
						$(save_btn).removeAttr('disabled').css('background','#1e90ff').css('cursor','pointer');
					}else if(input_val_len > 50){
						$(this).next().text(input_val_len-50+"자 초과했습니다.").css("color","rgb(241,75,88)");
						$(this).css('border-color',"rgb(241,75,88)");
						$(save_btn).attr('disabled', true).css('background','rgb(135,200,255)').css('cursor','default');
					}else if(input_val_len == 0){
						$(save_btn).attr('disabled', true).css('background','rgb(135,200,255)').css('cursor','default');
						$(this).next().text(50-input_val_len+"자 남았습니다.").css("color","#444444");
					}
				}
				
			});
			
			$("textarea").on("change keyup paste", function(){
				var my_id = $(this).attr("id");
				var input_val_len = $(this).val().length;
				 if(my_id=="m1_c3_i1"){
					if(input_val_len != 0 && input_val_len <= 50){
						$("#m1_c3_len").text(50-input_val_len+"자 남았습니다.").css("color","#444444");
						$(this).css('border-color',"rgb(232,237,247)"); 
						$(save_btn).removeAttr('disabled').css('background','#1e90ff').css('cursor','pointer');
					}else if(input_val_len > 50){
						$("#m1_c3_len").text(input_val_len-50+"자 초과했습니다.").css("color","rgb(241,75,88)");
						$(this).css('border-color',"rgb(241,75,88)");
						$(save_btn).attr('disabled', true).css('background','rgb(135,200,255)').css('cursor','default');
					}else if(input_val_len == 0){
						$(save_btn).attr('disabled', true).css('background','rgb(135,200,255)').css('cursor','default');
						$("#m1_c3_len").text(50-input_val_len+"자 남았습니다.").css("color","#444444");
					}
					
				}else if(my_id=="m1_c7_i1"){
					if(input_val_len != 0 && input_val_len <= 300){
						$("#m1_c7_len").text(300-input_val_len+"자 남았습니다.").css("color","#444444");
						$(this).css('border-color',"rgb(232,237,247)"); 
						$(save_btn).removeAttr('disabled').css('background','#1e90ff').css('cursor','pointer');
					}else if(input_val_len > 300){
						$("#m1_c7_len").text(input_val_len-300+"자 초과했습니다.").css("color","rgb(241,75,88)");
						$(this).css('border-color',"rgb(241,75,88)");
						$(save_btn).attr('disabled', true).css('background','rgb(135,200,255)').css('cursor','default');
					}else if(input_val_len == 0){
						$(save_btn).attr('disabled', true).css('background','rgb(135,200,255)').css('cursor','default');
						$("#m1_c7_len").text(300-input_val_len+"자 남았습니다.").css("color","#444444");
					}
				}else if(my_id=="m2_c5_i1"){
					if(input_val_len > 0){
						$(save_btn).removeAttr('disabled').css('background','#1e90ff').css('cursor','pointer');
					}else{
						$(save_btn).attr('disabled', true).css('background','rgb(135,200,255)').css('cursor','default');
					}
				}/* else{
					if(input_val_len > 0){
						$(save_btn).removeAttr('disabled').css('background','#1e90ff').css('cursor','pointer');
					}else{
						$(save_btn).attr('disabled', true).css('background','rgb(135,200,255)').css('cursor','default');
					}
				} */
			});
			
			$("select").change(function(){
				if(slide_id == "#content_m4_c3"){
					var m4_txt_check = 0;
					$(slide_d_id+" .m4_check").each(function(i, e){
					   if($(this).val() != null && $(this).val() != ""){
						   m4_txt_check++;
					   }
					   if(m4_txt_check == 4){
						   $(save_btn).removeAttr('disabled').css('background','#1e90ff').css('cursor','pointer');
					   }else{
						   $(save_btn).attr('disabled', true).css('background','rgb(135,200,255)').css('cursor','default');
					   }
					});
				}else{
					$(save_btn).removeAttr('disabled').css('background','#1e90ff').css('cursor','pointer');
				}
			});
			$("input[type=date]").change(function(){
				$(save_btn).removeAttr('disabled').css('background','#1e90ff').css('cursor','pointer');
			});
			$("input[type=file]").change(function(){
				if($(this).val() != null && $(this).val() != ""){
					$(save_btn).removeAttr('disabled').css('background','#1e90ff').css('cursor','pointer');
				}
			});
			/** 취소 버튼 **/
			$(slide_d_id+" .up_reset").click(function(){
			 	/*$(slide_d_id+" input").val("");*/
				$(slide_id).next().css('display','none');
				$(slide_id).css('display','inline-block').css({
					 "-moz-animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)",
					  "-webkit-animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)",
					  "animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)",
					  "-moz-animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)",
					  "-webkit-animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)",
					  "animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)"
	        	});
			});
			/** 예상 정산일 취소버튼 -> 상품 테이블 오류나서 뺌 **/
			$(slide_d_id+" .up_reset1").click(function(){
				$(slide_id).next().css('display','none');
				$(slide_id).css('display','inline-block').css({
					 "-moz-animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)",
					  "-webkit-animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)",
					  "animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)",
					  "-moz-animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)",
					  "-webkit-animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)",
					  "animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)"
	        	});
			});
			
			
			var check_input = slide_id+">div.sub_info";
			var m2c5_origin_val = $("#m2_c5_i1").val();
			
			 /**저장 버튼 **/
			$(slide_d_id+" .up_save").click(function(){
				var input_val = $(slide_d_id+" input[type=text]").val();
				var textarea_val = $(slide_d_id+" textarea").val();
				var select_val = $(slide_d_id+" select").val();
				var file_val = $(slide_d_id+" input[type=file]").val();
				var date_val = $(slide_d_id+" input[type=date]").val();
				
				/** 계좌 정보 ajax **/
				if($(this).attr("id") == "m4_c3_save"){
				    var data = {};
					if($(".account_type:checked").val() == "개인"){
						data={
							pj_account_type : $(".account_type:checked").val(),
							pj_account_id : $("#pj_account_id").val(),
							pj_account_name : $("#pj_account_name").val(),
							pj_bank : $("#personal_bank").val(),
							pj_account_number : $("#pj_account_number").val()	
						}
					}else{
						data={
								pj_account_type : $(".account_type:checked").val(),
								pj_account_id : $("#pj_account_id2").val(),
								pj_account_name : $("#pj_account_name2").val(),
								pj_bank : $("#business_bank").val(),
								pj_account_number : $("#pj_account_number2").val()	
							}
					}
				
					
					$.ajax({type: "POST",
				        	url: 'project_edit_account_proc',
				        	dataType: 'json',
				        	data: JSON.stringify(data),
				        	contentType:'application/json; charset=utf-8',
				        	async: false,
	                        success : function(result) {
                 	}});
					
					$(slide_d_id).css('display','none');
					$(slide_id).css('display','inline-block');
               }//끝
				
				var update_param = "";
				if(input_val != null && input_val !=""){
					$(slide_d_id).css('display','none');
					$(slide_id).css('display','inline-block');
					
					if($("#m1_c1_i1").attr("id") == $(slide_d_id+" input").attr("id")){
						$("#upload_my_title").text(input_val).css('color','black');
						$(slide_d_id).css('display','none');
						$(slide_id).css('display','inline-block');
						$(slide_id+">#title_write").html("<i class='far fa-edit'></i>"+" 수정하기");
						$(check_input).html(input_val+"<span id='stitle_info'>"+$("#m1_c1_i2").val()+"</span>")
						.css('font-size','11pt').css('color','black').css('font-weight','550'); 
						
						if($("#m1_c1_i2").val() != null && $("#m1_c1_i2").val() !="" ){
							
							$("#upload_my_stitle").css('display','inline-block');
							$("#upload_my_stitle").text($("#m1_c1_i2").val());
							
							$.ajax({url: "project_edit_title_proc?pj_title="+$("#m1_c1_i1").val()+"&pj_stitle="+$("#m1_c1_i2").val(),
									success: function(data){
					        },  error:function(request,status,error){
			                    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			                    
			                }});
							
						}else{
							$("#upload_my_stitle").css('display','none');
						}
					}else if($("#m2_c2_i2").attr("id") == $(slide_d_id+" input").attr("id") && $("#m2_c2_i2").val() != null && $("#m2_c2_i2").val() !=''){
						$(check_input).text($("#m2_c2_i2").val()).css('font-size','11pt').css('color','black').css('font-weight','550');
						$(slide_id+">#title_write").html("<i class='far fa-edit'></i>"+" 수정하기");
						
					}else if($("#m2_c1_i1").attr("id")==$(slide_d_id+" input").attr("id")){
						$(check_input).text(input_val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+'원').css('font-size','11pt').css('color','black').css('font-weight','550');
						$(slide_id+">#title_write").html("<i class='far fa-edit'></i>"+" 수정하기");
						
						var pj_colname="pj_price";
						
						$.ajax({url: "project_edit_proc?pj_colname="+pj_colname+"&pj_val="+input_val,
							success: function(data){
						},  error:function(request,status,error){
		                    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		                    
		                }});
						
					}else if($("#m1_c4_i1").attr("id") == $(slide_d_id+" input").attr("id")){
						$(check_input).text("http://localhost:9090/tumblbugs/"+input_val).css('font-size','11pt').css('color','black').css('font-weight','550'); 
						$(slide_id+">#title_write").html("<i class='far fa-edit'></i>"+" 수정하기");
						
						/** 저장 ajax **/
						var pj_colname="pj_addr";
						
						$.ajax({url: "project_edit_proc?pj_colname="+pj_colname+"&pj_val="+input_val,
							success: function(data){
						},  error:function(request,status,error){
		                    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		                    
		                }});
						
					}else if($("#pj_account_number2").val() != ""){
						account_num = $("#pj_account_number2").val();
						$(check_input).text(account_num).css('font-size','11pt').css('color','black').css('font-weight','550'); 
						$(slide_id+">#title_write").html("<i class='far fa-edit'></i>"+" 수정하기");
						
					}else if($("#pj_account_number").val() != ""){
						account_num = $("#pj_account_number").val();
						$(check_input).text(account_num).css('font-size','11pt').css('color','black').css('font-weight','550'); 
						$(slide_id+">#title_write").html("<i class='far fa-edit'></i>"+" 수정하기");
						
					}else{
						$(check_input).text(input_val).css('font-size','11pt').css('color','black').css('font-weight','550'); 
						$(slide_id+">#title_write").html("<i class='far fa-edit'></i>"+" 수정하기");
						
						/** 저장 ajax **/
						var pj_colname="";
						if($(slide_d_id+" input[type=text]").attr("id") == "m1_c5_i1"){
							pj_colname="pj_tag";
							
							$.ajax({url: "project_edit_proc?pj_colname="+pj_colname+"&pj_val="+input_val,
								success: function(data){
									
							},  error:function(request,status,error){
			                    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			                    
			                }});
						}else if($(slide_d_id+" input[type=text]").attr("id") == "m1_c6_i1"){
							pj_colname="name";
							
							$.ajax({url: "project_member_proc?pj_colname="+pj_colname+"&pj_val="+input_val,
								success: function(data){
									
							},  error:function(request,status,error){
			                    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			                    
			                }});
						}else if($(slide_d_id+" input[type=text]").attr("id") == "m4_c1_i1"){
							pj_colname="pj_email";
							
							$.ajax({url: "project_edit_proc?pj_colname="+pj_colname+"&pj_val="+input_val,
								success: function(data){
									
							},  error:function(request,status,error){
			                    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			                    
			                }});
						}else if($(slide_d_id+" input[type=text]").attr("id") == "m4_c2_i1"){
							pj_colname="pj_phone";
							
							$.ajax({url: "project_edit_proc?pj_colname="+pj_colname+"&pj_val="+input_val,
								success: function(data){
									
							},  error:function(request,status,error){
			                    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			                    
			                }});
						}
						
					}
					
				}else if(textarea_val != null && input_val !=""){
					$(slide_d_id).css('display','none');
					$(slide_id).css('display','inline-block');
					var pj_colname="";
					
					if($("#m2_c5_i1").attr("id")==$(slide_d_id+" textarea").attr("id") /* && $("#m2_c5_i1").val()!= m2c5_origin_val */){
						$(check_input).text("작성 완료").css('font-size','11pt').css('color','black').css('font-weight','550');
						$(slide_id+">#title_write").html("<i class='far fa-edit'></i>"+" 수정하기");
						pj_colname="pj_refund";
						
						//**** 문자열 인식 x ***/
						textarea_val = encodeURIComponent(textarea_val);
						
						$.ajax({url: "project_edit_proc?pj_colname="+pj_colname+"&pj_val="+textarea_val,
							success: function(data){
						},  error:function(request,status,error){
		                    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		                    
		                }});
						
					}else if($("#m1_c3_i1").attr("id")==$(slide_d_id+" textarea").attr("id")){
						$(check_input).text($("#m1_c3_i1").val()).css('font-size','11pt').css('color','black').css('font-weight','550');
						$(slide_id+">#title_write").html("<i class='far fa-edit'></i>"+" 수정하기");
						pj_colname="pj_summary";
						
						$.ajax({url: "project_edit_proc?pj_colname="+pj_colname+"&pj_val="+textarea_val,
							success: function(data){
						},  error:function(request,status,error){
		                    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		                    
		                }});
						
					}else if($("#m3_c1_i1").attr("id")==$(slide_d_id+" textarea").attr("id")){
						$(check_input).text("작성 완료").css('font-size','11pt').css('color','black').css('font-weight','550');
						$(slide_id+">#title_write").html("<i class='far fa-edit'></i>"+" 수정하기");
						
						pj_colname="pj_story";
						
						var ck_val = encodeURIComponent(CKEDITOR.instances.m3_c1_i1.getData());
						var pj_story = CKEDITOR.instances.m3_c1_i1.getData();
						
						$.ajax({ type: "POST", 
							enctype: 'multipart/form-data',
							url: 'project_editor_proc', 
							data: pj_story, 
							processData: false,  
							contentType: false,  
							cache: false, 
							success: function (result) {}, 
							error: function (e) { } });
						
						
					}else if($("#m1_c7_i1").attr("id")==$(slide_d_id+" textarea").attr("id")){
						$(check_input).text(textarea_val).css('font-size','11pt').css('color','black').css('font-weight','550');
						$(slide_id+">#title_write").html("<i class='far fa-edit'></i>"+" 수정하기");
						pj_colname = "intro";
						$.ajax({url: "project_member_proc?pj_colname="+pj_colname+"&pj_val="+textarea_val,
							success: function(data){
						},  error:function(request,status,error){
		                    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		                    
		                },  error:function(request,status,error){
		                    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		                    
		                }});
					}/*else{
						$(check_input).text(textarea_val).css('font-size','11pt').css('color','black').css('font-weight','550');
						$(slide_id+">#title_write").html("<i class='far fa-edit'></i>"+" 수정하기");
						
						$.ajax({url: "project_edit_proc?pj_id="+pj_id+"&pj_colname="+pj_colname+"&pj_val="+textarea_val,
							success: function(data){
								pj_id = data;
						}});
					}*/
					
				}else if(select_val != null && select_val !=""){
						$(slide_d_id).css('display','none');
						$(slide_id).css('display','inline-block');
						$(check_input).text(select_val).css('font-size','11pt').css('color','black').css('font-weight','550'); 
						$(slide_id+">#title_write").html("<i class='far fa-edit'></i>"+" 수정하기");
						
						var pj_colname="";
						if($(slide_d_id+" select").attr("id") == "m1_select"){
							pj_colname="pj_category";
							
							/*select_val = $(slide_d_id+" select option:selected").attr("id"); 카테고리 영어 */
						}else if($(slide_d_id+" select").attr("id") == "m2_select"){
							pj_colname="pj_class";
						}
						
						$.ajax({url: "project_edit_proc?pj_colname="+pj_colname+"&pj_val="+select_val,
							success: function(data){
						},  error:function(request,status,error){
		                    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		                    
		                }});
					
				}else if(file_val != null && file_val !=""){
					$(slide_d_id).css('display','none');
					$(slide_id).css('display','inline-block');
					
					if($(slide_d_id+" input[type=file]").attr("id") == "pro_img"){
						$(check_input).text("선택완료").css('font-size','11pt').css('color','black').css('font-weight','550');
						$(slide_id+">#title_write").html("<i class='far fa-edit'></i>"+" 수정하기");
						$(check_input).text(file_val).css('font-size','11pt').css('color','black').css('font-weight','550');
						$(slide_id+">#title_write").html("<i class='far fa-edit'></i>"+" 수정하기");
						
			            var options = {
			                success : function(data) {
			                },
			                type : "POST",
			                url: 'project_edit_file_proc'
			            };
			            
				        $("#upload_form").ajaxSubmit(options);

				          
					}else if($(slide_d_id+" input[type=file]").attr("id") == "my_pro_img"){
						
							$(check_input).text("선택완료").css('font-size','11pt').css('color','black').css('font-weight','550');
							$(slide_id+">#title_write").html("<i class='far fa-edit'></i>"+" 수정하기");
							$(check_input).text(file_val).css('font-size','11pt').css('color','black').css('font-weight','550');
							$(slide_id+">#title_write").html("<i class='far fa-edit'></i>"+" 수정하기");
							
				            var options = {
				                success : function(data) {
				                },
				                type : "POST",
				                url: 'project_edit_memberFile_proc'
				            };
				            
					        $("#upload_form").ajaxSubmit(options);
					}
					
				}else if(date_val != null && date_val !=""){
					var pj_colname="pj_end_date";
					$(slide_d_id).css('display','none');
					$(slide_id).css('display','inline-block');
					$(check_input).text(date_val).css('font-size','11pt').css('color','black').css('font-weight','550'); 
					$(slide_id+">#title_write").html("<i class='far fa-edit'></i>"+" 수정하기");
				
					$.ajax({url: "project_date_proc?pj_colname="+pj_colname+"&pj_val="+date_val,
						success: function(data){
					}});
					
				}
			
				/** menu 전체 작성 check **/
				 var m1_count = 0;
				$(".m1_check").each(function(i, e){
				   if($(this).val() != null && $(this).val() != ""){
					   m1_count++;
				   }
				   if(m1_count == 1){//10
					$("#menu_label1").html("<i class='fas fa-check-circle' style='color:#1e90ff'></i> 프로젝트 개요");
					$("#menu1_check").val("1");
				   }
				});
				
				 var m2_count = 0;
				$(".m2_check").each(function(i, e){
				   if($(this).val() != null && $(this).val() != ""){
					   if(m2c5_origin_val != $("#m2_c5_i1").val()){
						   m2_count++;
					   }
				   }
				   if(m2_count == 1){
					$("#menu_label2").html("<i class='fas fa-check-circle' style='color:#1e90ff'></i> 펀딩 및 선물 구성");
					$("#menu2_check").val("1");
				   }
				});
				
				 var m3_count = 0;
				$(".m3_check").each(function(i, e){
				   if($(this).val() != null && $(this).val() != ""){
					   m3_count++;
				   }
				   if(m3_count == 1){
					$("#menu_label3").html("<i class='fas fa-check-circle' style='color:#1e90ff'></i> 스토리텔링");
					 $("#menu3_check").val("1");
				   }
				});
					
				 var m4_count = 0;
				$(".m4_check").each(function(i, e){
				   if($(this).val() != null && $(this).val() != ""){
					   m4_count++;
				   }
				   if(m4_count == 1){
					$("#menu_label4").html("<i class='fas fa-check-circle' style='color:#1e90ff'></i> 계좌 설정");
					 $("#menu4_check").val("1");
				   }
				});
				
				var all = 0;
				$(".all_check").each(function(i, e){
					   if($(this).val() == 1){
						   all++;
					   }
					   if(all == 4){
						   $("#submit_btn").css('background','#1e90ff').css('color','white').css('cursor','pointer');
						   $("#all_pro_info").html("<i class='fas fa-bullhorn'></i> 모든 섹션을 완성하셨습니다. <span style='color:#1e90ff; font-weight:bold;'>검토 요청하기</span> 버튼을 눌러 검토를 요청하세요.");
					   }else if(all == 1){
						   $("#all_pro_info").html("<i class='fas fa-bullhorn'></i> 총 4개 섹션 중 1개를 완성하셨습니다. 모든 섹션을 완성하시면 프로젝트 검토를 요청하실 수 있습니다.");
					   }else if(all == 2){
						   $("#all_pro_info").html("<i class='fas fa-bullhorn'></i> 총 4개 섹션 중 2개를 완성하셨습니다. 모든 섹션을 완성하시면 프로젝트 검토를 요청하실 수 있습니다.");
					   }else if(all == 3){
						   $("#all_pro_info").html("<i class='fas fa-bullhorn'></i> 총 4개 섹션 중 3개를 완성하셨습니다. 모든 섹션을 완성하시면 프로젝트 검토를 요청하실 수 있습니다.");
					   }
				});
				
			});
		});
	
		var slide_id ="";
		var slide_d_id="";
		var save_btn="";
		$(document).off('click').on('click','.present_detail_slide',function(){
			slide_id = "#"+$(this).attr("id");
			slide_d_id="#"+$(slide_id).next().attr("id");
			save_btn = "#"+$(slide_id).next().attr("id")+" .up_save";
			
			/** 페이지 오픈 위치 **/
			$(document).on('click',slide_id,function(){
			    var thisTarget = $(slide_d_id);
				$(window).scrollTop($(thisTarget).offset().top);
			});
			
			$(".add_present_btn").attr('disabled', true).css('background','rgb(135,200,255)').css('cursor','default');
			if($(slide_d_id+" #add_items_table tr").length <= 1){
				$("#add_items_table").css('display','none');
			}
			
			$(".upload_detail_slide").css('display','inline-block');
			$(".present_detail_slide").css('display','none');
			$(".upload_detail").css('display','none');
			$(this).css('display','none');
			$(save_btn).attr('disabled', true).css('background','rgb(135,200,255)').css('cursor','default');
			
			$(this).next().css('display','block').css({
					 "-moz-animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)",
					  "-webkit-animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)",
					  "animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)",
					  "-moz-animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)",
					  "-webkit-animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)",
					  "animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)"
	        });
			
		});
	
		/** 취소 버튼 **/
		$(document).on("click",slide_d_id+" .up_reset",function(){
		 	/*$(slide_d_id+" input").val("");*/
			$(slide_id).next().css('display','none');
			$(slide_id).css('display','inline-block').css({
				 "-moz-animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)",
				  "-webkit-animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)",
				  "animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)",
				  "-moz-animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)",
				  "-webkit-animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)",
				  "animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)"
        	});
		});
		
		$(document).on("click",".add_present_btn",function(){
			var d_yn = "N";
			var g_max_count = 0;
			
			/** gift json + ajax **/
			
			if($(slide_d_id+" #delivery_check").is(":checked")){
				d_yn = "Y";
			}
			
			if($(slide_d_id+" #gift_max_count").is(":checked")){
				g_max_count = $(slide_d_id+" #m2_c4_i6").val();
			}
			var data = {
					gift_title : $(slide_d_id+" #m2_c4_i2").val(),
					gift_price : $(slide_d_id+" #present_title").val(),
					gift_sort_num : $(slide_d_id+" #m2_c4_i4").val(),
					gift_delivery_date: $(slide_d_id+" #present_date").val(),
					gift_max_count : g_max_count,
					gift_delivery_yn : d_yn
				}
			var gift_id = "";
			
			
			$.ajax({type: "POST",
	        	url: 'project_edit_gift_proc',
	        	dataType: 'text',
	        	data: JSON.stringify(data),
	        	contentType:'application/json; charset=utf-8',
	        	async: false,
                success : function(result) {
                	gift_id = result;
                	$(slide_d_id+" .gift_id").val(result);
                	
                	
                },  error:function(request,status,error){
                    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                    
                }});
			
			/** item json + ajax (item id 구분없이 insert) **/
			if($(slide_d_id+" #add_items_table tr").length > 1){
				for(var i=2; i <= $(slide_d_id+" #add_items_table tr").length ; i++){
					var i_check = 'N';
					
					if($(slide_d_id+" #add_items_table tr:nth-child("+i+") input:checkbox[name='item_check']").is(":checked")){ 
						i_check = 'Y';
					}
					
					item ={ 
							gift_id : gift_id,
							item_title : $(slide_d_id+" #add_items_table tr:nth-child("+i+") #item_name_td").text(),
							item_option_type : $(slide_d_id+" #add_items_table tr:nth-child("+i+") #item_option_type").val(),
							item_option : $(slide_d_id+" #add_items_table tr:nth-child("+i+") #item_option").text(),
							item_count : $(slide_d_id+" #add_items_table tr:nth-child("+i+") .pro_items_count").val(),
							item_check : i_check
					};
					
					$.ajax({type: "POST",
			        	url: 'project_edit_item_proc',
			        	dataType: 'text',
			        	data: JSON.stringify(item),
			        	contentType:'application/json; charset=utf-8',
			        	async: false,
		                success : function(result) {
		                	var t_id = $(slide_d_id+" #add_items_table tr:nth-child("+i+")").attr("id");
		                	$(slide_d_id+" #add_items_table tr:nth-child("+i+") #item_id").val(result);
		                	$(slide_d_id+" #add_items_table tr:nth-child("+i+")").val(result);
		                	$("#item_table tr #"+t_id).val(result);
		                	
		                },  error:function(request,status,error){
		                    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	                }});
				}
			}
			
			
			product_number++;
			
			if($(this).attr("id") == "add_present_btn"){ 
				var slide_present_id = "#"+$(slide_id).prev().attr("id");
				
				$(slide_d_id).css('display','none');
				$(slide_present_id).css('display','block');
				$(slide_d_id+" .up_reset").attr("class","up_delete2").html("<i class='fas fa-trash-alt'></i> 삭제하기");
				
				if($(slide_d_id+" input:checkbox[id='delivery_check']").is(":checked")){
					$(slide_present_id+" .delivery_check_tag").text("배송 필요").css("border","1px solid gray").css("width","70px")
						.css("padding","3px").css("border-radius","4px").css("display","inline-block").css("position","relative")
						.css("bottom","10px").css("left","992px").css("color","gray").css('text-align','center').css('font-size','8pt').css('letter-spacing','0px');
				}else{
					$(slide_present_id+" .delivery_check_tag").text("배송 불필요").css("border","1px solid gray").css("width","70px")
					.css("padding","3px").css("border-radius","4px").css("display","inline-block").css("position","relative")
					.css("bottom","10px").css("left","992px").css("color","gray").css('text-align','center').css('font-size','8pt').css('letter-spacing','0px');
				}
				
				if($(slide_d_id+" #add_items_table tr").length > 1){
					for(var i=$(slide_d_id+" #add_items_table tr").length; i >= 2 ; i--){
					 	 if($(slide_d_id+" #add_items_table tr:nth-child("+i+") input:checkbox[name='item_check']").is(":checked")){ 
							var item_name = $(slide_d_id+" #add_items_table tr:nth-child("+i+") #item_name_td").text();
							var item_option = $(slide_d_id+" #add_items_table tr:nth-child("+i+") #item_option").text();
							var item_count = $(slide_d_id+" #add_items_table tr:nth-child("+i+") .pro_items_count").val();
							var item_content = "<div><span class='option'> - "+item_name+"</span>(X <span class='count'>"+item_count+"</span>)</div>";
		
							$(slide_present_id+" #item_option_div").append(item_content);
					 	 } 
					}
				}
				
				$(slide_present_id+" .price").text($(slide_d_id+" input[id='m2_c4_i2']").val().toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
				$(slide_present_id+" .title").text($(slide_d_id+" input[id='present_title']").val());
				$(slide_present_id+" .date").text($(slide_d_id+" input[id='present_date']").val());
				
				var new_present = "<div id='pro_present1' class='pro_present'>"+
				"<div  class='upload_present_slide' style='display:none' id='upload_present_slide"+$('#present_number').val()+"'>"+
				"<label><span class='price'>5,000</span>원 이상 밀어주시는 분께</label>"+
				"<div id='present_btn'>"+
					"<button type='button' class='present_update'><i class='far fa-edit'></i> 수정하기</button>"+
					"<button type='button' class='up_delete'><i class='fas fa-trash-alt'></i> 삭제하기</button>"+
				"</div>"+
				"<div><span class='title'>선물제목</span></div>"+
				"<div id='item_option_div'></div>"+
				"<div>예상전달일 : <span class='date'>2019-01-01</span></div>"+
				"<div class='delivery_check_tag'>배송 불필요</div>"+
			"</div>"+
			"<div id='content_m2_c4"+$('#present_number').val()+"' class='present_detail_slide' >"+
				"<label>선물 구성</label>"+
				"<div id='deadline_info' class='sub_info'><i class='far fa-hand-point-right'></i> 선물을 추가해주세요.</div>"+
				"<div id='title_write'><i class='far fa-edit'></i> 입력하기</div>"+
			"</div>"+
			"<div id='content_m2_c4_d"+$('#present_number').val()+"' class='upload_detail'>"+
				"<div class='d_title'>선물 추가하기</div>"+
				"<div><p>후원자 분들에게 드릴 선물 내용을 입력해주세요. <span style='color:rgb(241,75,88)'>선물 설정을 제외한 모든 항목을 입력해야 합니다.</span></div>	"+
				"<div>"+
					"<div>최소 후원금액</div>"+
					"<div>인기 금액대인 1만원대 선물부터 특별한 의미를 담은 10만원 이상 선물까지, 다양한 금액대로 구성하면 성공률이 더욱 높아집니다."+
						 " 배송이 필요한 선물의 경우,<span class='bold_txt'>배송비 포함</span>된 금액으로 작성해주세요.</div>"+
					"<input type='text' placeholder='5,000' style='resize:none' class='m2_check' id='m2_c4_i2'/>"+
					"<label class='bold_txt' >원 이상 밀어주시는 분께 드리는 선물입니다.</label>"+
				"</div>"+
				"<div>"+
					"<div class='bold_txt'>선물에 포함된 아이템</div>"+
					"<div>아이템은 <span class='bold_txt'>선물에 포함되는 구성 품목</span>을 말합니다. "+
					  "이 금액대의 선물을 선택한 후원자에게 어떤 아이템들을 얼마나 전달하실건가요?</div>"+
					"<div id='m2_c4_add_items'>"+
						"<input type='hidden' value='1' id='items_count'>"+
						"<table id='add_items_table'>"+
						"<input type='hidden' id='product_table' value='"+product_number+"'>"+
							"<tr>"+
								"<th>포함</th>"+
								"<th>아이템이름</th>"+
								"<th>옵션</th>"+
								"<th>수량설정</th>"+
							"</tr>"+
						"</table>"+
					"</div>"+
					"<div>"+
						"<button type='button' id='pro_modal_btn' data-toggle='modal' data-target='#add_items'><i class='fas fa-list'></i> 아이템 관리하기</button>"+
					"</div>"+
				"</div>"+
				"<div>"+
					"<div>선물 제목</div>"+
					"<div><p>구성된 선물에 대해 추가적으로 알리고 싶은 내용을 적어주세요.</div>"+
					"<input type='text' placeholder='예)배송비 포함,얼리버드,(선물세트 A) 등' style='resize:none' class='m2_check' id='present_title'/>"+
					"<label>50자 남았습니다</label>"+
				"</div>"+
				"<div>"+
					"<div>선물 카드 정렬 순서</div>"+
					"<div><p>선물 카드의 순서를 정해 주세요. 혜택이 많은 선물 카드부터 나오도록 등록하시는 것이 좋습니다.</div>"+
					"<input type='text' placeholder='1' style='resize:none' class='m2_check'  id='m2_c4_i4'/>"+
					"<label class='bold_txt'>번째로 보일 선물 카드입니다.</label>"+
				"</div>"+
				"<div>"+
					"<div>예상 전달일</div>"+
					"<div><p>이 선물을 선택한 후원자들에게 선물을 배송 또는 공개하기로 약속하는 날입니다. <span class='bold_txt'>결제 종료일 이후의 날짜</span>인지 확인해서 정해주세요.</div>"+
					"<input type='date' style='resize:none' class='m2_check' id='present_date'/>"+
					"<label class='bold_txt'> 에 선물을 전달하겠습니다.</label>"+
				"</div>"+
				"<div>"+
					"<div>선물 설정</div>"+
					"<div><p>한정판 선물을 선택할 수 있는 인원을 제한해주세요. 배송이 필요한 선물인 경우 후원자에게 주소지를 요청합니다.</div>"+
					"<div>"+
						"<input type='checkbox' id='gift_max_count'>"+
						"<label class='bold_txt'>선물을</label>"+
						"<input type='text' placeholder='1' style='resize:none' class='m2_check' id='m2_c4_i6'/>"+
										"<label class='bold_txt'>개로 제한합니다.</label>"+
					"</div><div>"+
						"<input type='checkbox' id='delivery_check'>"+
						"<label class='bold_txt'>배송이 필요한 선물입니다.</label>"+
					"</div></div>"+
					"<div class='content_btn'>"+
						"<input type='hidden' class='gift_id' value=''>"+
						"<button type='button' class='up_reset'><i class='fas fa-times'></i> 취소하기</button>"+
						"<button type='button' class='add_present_btn' id='add_present_btn'><i class='fas fa-check'></i> 저장하기</button>"+
					"</div></div></div>";
				
				$(".add_present_btn").attr("class","update_present_btn").html("<i class='fas fa-check'></i> 수정하기");	
				$('#present_number').val(parseInt($('#present_number').val()+1));
				$("#com_present").after(new_present).css('display','block');
				
				
			} 
		});
	
		/** 상품 validation **/
		$(document).on("change keyup paste",slide_d_id+" .m2_check", function(){
			var pro_btn_check = 0;
			var item_check = 0;
			
			$(slide_d_id+" .item_check").each(function(i, e){
				if($(this).is(":checked"))	item_check++;
				
			});
			
			$(slide_d_id+" .m2_check").each(function(i, e){
			   if($(this).val() != null && $(this).val() != "" ){
				   pro_btn_check++;
		    }
		    if(pro_btn_check == 4 && item_check > 0 ){
					$(slide_d_id+" .add_present_btn").removeAttr('disabled').css('background','#1e90ff').css('cursor','pointer');
		   	}
		    if(item_check > 0 && pro_btn_check == 4 ){
					$(slide_d_id+" .add_present_btn").removeAttr('disabled').css('background','#1e90ff').css('cursor','pointer');
			   }
			});	
		});	
		
		/** 상품 수정 (저장)버튼 **/
		$(document).on('click','.update_present_btn',function(){
			alert("클릭");
			var slide_present_id = "#"+$(this).parent().parent().prev().prev().attr("id");
			var slide_d_id = "#"+$(this).parent().parent().attr("id");
			$(slide_present_id+" #item_option_div>div").remove();
			
			if($(slide_d_id+" input:checkbox[id='delivery_check']").is(":checked")){
				$(slide_present_id+" .delivery_check_tag").text("배송 필요");
			}else{
				$(slide_present_id+" .delivery_check_tag").text("배송 불필요");
			}
			
			if($(slide_d_id+" #add_items_table tr").length > 1){
				for(var i=2; i <= $(slide_d_id+" #add_items_table tr").length ; i++){
				 	 if($(slide_d_id+" #add_items_table tr:nth-child("+i+") input:checkbox[name='item_check']").is(":checked")){ 
						var item_name = $(slide_d_id+" #add_items_table tr:nth-child("+i+") #item_name_td").text();
						var item_option = $(slide_d_id+" #add_items_table tr:nth-child("+i+") #item_option").text();
						var item_count = $(slide_d_id+" #add_items_table tr:nth-child("+i+") .pro_items_count").val();
						var item_content = "<div id='item_option_content'><span class='option'> - "+item_name+"</span>(X <span class='count'>"+item_count+"</span>)</div>";
	
						$(slide_present_id+" #item_option_div").append(item_content);
				 	 } 
				}
			}
			$(slide_present_id+" .price").text($(slide_d_id+" input[id='m2_c4_i2']").val().toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));
			$(slide_present_id+" .title").text($(slide_d_id+" input[id='present_title']").val());
			$(slide_present_id+" .date").text($(slide_d_id+" input[id='present_date']").val());
			
			$(this).parent().parent().css('display','none');
			$(this).parent().parent().prev().prev().css('display','block');
			
			/** gift json + ajax **/
			var d_yn="N", g_max_count=0;
			if($(slide_d_id+" #delivery_check").is(":checked")){
				d_yn = "Y";
			}
			
			if($(slide_d_id+" #gift_max_count").is(":checked")){
				g_max_count = $(slide_d_id+" #m2_c4_i6").val();
			}
			var data = {
					gift_id : $(slide_d_id+" .gift_id").val(),
					gift_title : $(slide_d_id+" #m2_c4_i2").val(),
					gift_price : $(slide_d_id+" #present_title").val(),
					gift_sort_num : $(slide_d_id+" #m2_c4_i4").val(),
					gift_delivery_date: $(slide_d_id+" #present_date").val(),
					gift_max_count : g_max_count,
					gift_delivery_yn : d_yn
				};
			
			$.ajax({type: "POST",
	        	url: 'project_update_gift_proc',
	        	dataType: 'text',
	        	data: JSON.stringify(data),
	        	contentType:'application/json; charset=utf-8',
	        	async: false,
                success : function() {},  error:function(request,status,error){
        			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                }
            });
			
			/** 상품 수정 -> item 수정 **/
			if($(slide_d_id+" #add_items_table tr").length > 1){
				for(var i=2; i <= $(slide_d_id+" #add_items_table tr").length ; i++){
					var i_check = 'N';
					alert($(slide_d_id+" #add_items_table tr:nth-child("+i+") #item_id").val());
					
					if($(slide_d_id+" #add_items_table tr:nth-child("+i+") input:checkbox[name='item_check']").is(":checked")){ 
						i_check = 'Y';
					}
					
					item ={ 
							item_id : $(slide_d_id+" #add_items_table tr:nth-child("+i+") #item_id").val(),
							item_check : i_check,
							item_title : $(slide_d_id+" #add_items_table tr:nth-child("+i+") #item_name_td").text(),
							item_option_type : $(slide_d_id+" #add_items_table tr:nth-child("+i+") #item_option_type").val(),
							item_option : $(slide_d_id+" #add_items_table tr:nth-child("+i+") #item_option").text(),
							item_count : $(slide_d_id+" #add_items_table tr:nth-child("+i+") .pro_items_count").val()
						  };
					
					if($(slide_d_id+" #add_items_table tr:nth-child("+i+") #item_id").val() == '' && item.item_id == null){
						$.ajax({type: "POST",
				        	url: 'project_edit_item_proc',
				        	dataType: 'text',
				        	data: JSON.stringify(item),
				        	contentType:'application/json; charset=utf-8',
				        	async: false,
			                success : function(result) {
			                	var t_id = $(slide_d_id+" #add_items_table tr:nth-child("+i+")").attr("id");
			                	$(slide_d_id+" #add_items_table tr:nth-child("+i+") #item_id").val(result);
			                	$(slide_d_id+" #add_items_table tr:nth-child("+i+")").val(result);
			                	$("#item_table tr #"+t_id).val(result);
			                	
			                }});
					}else{
						$.ajax({type: "POST",
				        	url: 'project_update_item_check_proc',
				        	dataType: 'text',
				        	data: JSON.stringify(item),
				        	contentType:'application/json; charset=utf-8',
				        	async: false,
			                success : function(result) {
		                }});
					}
				
				}
			}
		});
		
		/** 상품 수정 **/
	
		$(document).on('click','.present_update',function(){
			alert("클릭11");
			$(".add_present_btn").attr('disabled', true).css('background','rgb(135,200,255)').css('cursor','default');
			slide_d_id="#"+$(this).parent().parent().next().next().attr("id");
			
			$(this).parent().parent().css('display','none');
			$(this).parent().parent().next().next().css('display','inline-block');
			
			$(slide_d_id+" .d_title").text("선물 수정하기");
			
			/** 페이지 오픈 위치 **/
			$(document).on('click',slide_id,function(){
			    var thisTarget = $(slide_d_id);
				$(window).scrollTop($(thisTarget).offset().top);
			});
		});
		
		/** 상품 삭제 **/
		
		$(document).on('click','.up_delete',function(){
			$(this).parent().parent().parent().css('display','none');
			slide_del_id ="#"+$(this).parent().parent().next().next().attr("id"); 
			
			$.ajax({url: 'project_delete_gift_proc?gift_id='+$(slide_del_id+" .gift_id").val(),
                success : function(result) {
                	alert(result);
            }});
		
		});
		
		$(document).on('click','.up_delete2',function(){
			$(this).parent().parent().parent().css('display','none');
			$.ajax({url: 'project_delete_gift_proc?gift_id='+$(this).prev().val(),
                success : function(result) {
                	alert(result);
            }});
		
			
		});
		
		/* 메뉴 카테고리 이벤트 */
		$(".upload_menu_btn").click(function(){
			var menu_sel = $(this).attr("id");
			$(".upload_detail_slide").css('display','inline-block');
			$(".upload_detail").css('display','none');
			$(".up_menu_lb").css('background-color','white').css('border-color','white');
			$("#"+menu_sel).next().css('background-color','rgb(247,247,247)').css('border-color','#ccc');
			
			$(".content_up").css('display','none');
			$("#content_"+menu_sel).css('display','inline-block').css({
				 "-moz-animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)",
				  "-webkit-animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)",
				  "animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)",
				  "-moz-animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)",
				  "-webkit-animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)",
				  "animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)"
      			 });
			});
	
		/** 상품 모달 창**/
		$("#item_add_panel").css('display','none');
		$("#item_list").css('display','none');
		$("#modal_add_save").attr('disabled', true).css('background','rgb(135,200,255)').css('cursor','default');
		$("#modal_update_data").css('display','none');
		
		
		$(document).on("click","#pro_modal_btn",function(){
			if($(slide_d_id+" #add_items_table tr").length <= 1){
				$(".item_table_class").css('display','none');
				$("#add_items_table").css('display','none');
			}
			
            $("#add_items").modal("show");
          
            
           	for(var i=2; i <= $("#item_table tr").length; i++){
           		if($("#item_table tr:nth-child("+i+") #product_number").val() != slide_d_id ){
            		$("#item_table tr:nth-child("+i+")").css('display','none');
            	}else{
            		$("#item_table tr:nth-child("+i+")").css('display','');
            	}
           	}
		});
		
		
		$("#modal_hide").click(function(){
			$("#item_add_panel").css('display','none');
			$("#item_add_btn").css('display','block').css({
				 "-moz-animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)",
				  "-webkit-animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)",
				  "animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)",
				  "-moz-animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)",
				  "-webkit-animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)",
				  "animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)"
      		 });
			$('.modal').modal("hide");
		});
		
		$("#item_name").on("change keyup paste", function(){
			if($(this).val().length <= 50 && $(this).val().length > 0){
				$("#item_name_len").text(50-$(this).val().length+"자 남았습니다.").css("color","#444444");
				$(this).css('border-color',"rgb(232,237,247)");
				$("#modal_add_save").removeAttr('disabled').css('background','#1e90ff').css('cursor','pointer');
			}else if($(this).val().length > 50){
				$("#item_name_len").text($(this).val().length-50+"자 초과했습니다.").css("color","rgb(241,75,88)");
				$(this).css('border-color',"rgb(241,75,88)");
				$("#modal_add_save").attr('disabled', true).css('background','rgb(135,200,255)').css('cursor','default');
			}else if($(this).val().length == 0){
				$("#modal_add_save").attr('disabled', true).css('background','rgb(135,200,255)').css('cursor','default');
				$("#item_name_len").text(50-$(this).val().length+"자 남았습니다.").css("color","#444444");
			}
		});
		
		$("#item_add_btn").click(function(){
			$("#modal_add_save").attr('disabled', true).css('background','rgb(135,200,255)').css('cursor','default');
			$(this).css('display','none').css({
				 "-moz-animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)",
				  "-webkit-animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)",
				  "animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)",
				  "-moz-animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)",
				  "-webkit-animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)",
				  "animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)"
     		});	
			$("select#option_select option").remove();
			$("select#option_select option").attr("selected", true);
			$("#item_name").val("");
			$("#option_name").val("");
			$("#option_name2").val("");
			$("#option_select").append("<option value='' selected disabled hidden>옵션 미리보기</option>");
			$("#item_list").css('display','none');
			$("#option_div").css('display','none');
			$("#option_div2").css('display','none');
			$("#item_add_panel").css('display','block').css({
				 "-moz-animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)",
				  "-webkit-animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)",
				  "animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)",
				  "-moz-animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)",
				  "-webkit-animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)",
				  "animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)"
       });
			$("input[type=radio]").prop("checked", false);
			$("input:radio[id ='item_option1']").prop("checked", true);
		});
		
		$("#modal_add_back").click(function(){
			$("#item_add_panel").css('display','none');
			$("#item_add_btn").css('display','block').css({
				 "-moz-animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)",
				  "-webkit-animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)",
				  "animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)",
				  "-moz-animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)",
				  "-webkit-animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)",
				  "animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)"
   		   });
			if($("#item_table tr").length > 1){
				$("#item_list").css('display','block').css({
					 "-moz-animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)",
					  "-webkit-animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)",
					  "animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)",
					  "-moz-animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)",
					  "-webkit-animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)",
					  "animation": "slideIn 1s cubic-bezier(0.37, 0.82, 0.2, 1)"
	   		   });
			}
			
		});
		
		$(document).on("click","#modal_add_save",function(){
			item_value++;
			var option_value ="";
			var radio_num = 1;
			$(".item_table_class").css('display','block');
			$("#add_items_table").css('display','block');
			$("#row_number").val(parseInt($("#row_number").val())+1);				
			$("#items_count").val(parseInt(item_value)+1);	
			
			if($(".item_option:checked").attr("id") == "item_option2" && $("#option_name").val() != ""){
				option_value= $("#option_name").val().replace(/(\n|\r\n)/g, ',');
				radio_num = 2;
				
			}else if($(".item_option:checked").attr("id") == "item_option3" && $("#option_name2").val() != ""){
				option_value = $("#option_name2").val();
				radio_num = 3;
				
			}else{
				option_value = "옵션 없음";
			}
			var list_val ="<tr id='list_item_number"+item_value+"'>"+
							"<td>"+$("#item_name").val()+"</td>"+
							"<td>"+ option_value +"</td>"+
							"<td><button type='button' class='list_update'>수정하기</button>"+
								 "<button type='button' class='list_remove'>삭제하기</button>"+
								 "<input type='hidden' id='item_option"+radio_num+"' value='item_number"+item_value+"'>"+
								 "<input type='hidden' id='product_number' value='"+slide_d_id+"'>"+
								 "<input type='hidden' class='modal_item_id' id='item_number"+item_value+"' value=''>"+
							"</td></tr>";
							
			var pro_itmes ="<tr id='item_number"+item_value+"' value=''>"+
							"<td id='item_icon_td"+item_value+"'><label class='item_check_icon' for='item"+item_value+"'><i class='fas fa-check-circle' id='pro_icon"+item_value+"'></i></label>"+
								"<input type='checkbox' class='item_check' id='item"+item_value+"' name='item_check' style='display:none'></td>"+
							"<td id='item_name_td'>"+$("#item_name").val()+"</td>"+
							"<td id='item_option'>"+ option_value +"</td>"+
							"<td id='item_count_td"+item_value+"'>"+
								"<i class='fas fa-minus-circle' id='itmes_count_minus'></i>"+
								"<span><input type='text' id='pro_items_count"+item_value+"' value='0' class='pro_items_count' readonly></span>"+
								"<i class='fas fa-plus-circle' id='itmes_count_plus'></i></td>"+
								"<input type='hidden' id='item_option_type' value='"+radio_num+"'>"+
								"<input type='hidden' id='item_id' value=''>"+
							"</tr>";		
		
			$(".pro_items_count").css('border','none');			
			$("#item_name").val("");
			$("#item_add_panel").css('display','none');
			$("#item_add_btn").css('display','block');
			$("#item_table").append(list_val);
			$(slide_d_id+" #add_items_table").append(pro_itmes);
			$("#item_list").css('display','block');
			$("#m2_c4_add_items").css('display','block');
			
			/**수정삭제 hover**/
			$(".list_update").hover(function(){
				$(this).css("color","#1d85ea");
			}, function(){
				$(this).css("color","#666666");
			});
			
			$(".list_remove").hover(function(){
				$(this).css("color","#1d85ea");
			}, function(){
				$(this).css("color","#666666");
			});
		});
		
		$(".item_option").click(function(){
			if($(this).attr("id")=="item_option2"){
				$("#option_div2").css('display','none');
				$("#option_div").css('display','block');
			}else if($(this).attr("id")=="item_option3"){
				$("#option_div").css('display','none');
				$("#option_div2").css('display','block');
			}else{
				$("#option_div").css('display','none');
				$("#option_div2").css('display','none');
			}
		});
		
		$("#add_option").click(function(){
			$("select#option_select option").remove();
			var option_val = $("#option_name").val().replace(/(\n|\r\n)/g, '</option><option>');
			$("#option_select").append("<option>"+option_val+"</option>");
		});
		
		
		/** 메뉴2 상품 추가 테이블  **/
		$(document).on("click",".item_check_icon",function(){
			var box_id = $(this).next().attr("id");
			 if($("input:checkbox[id="+box_id+"]").is(":checked")){
				 var tr_addr ="#"+$(this).parent().parent().attr("id");
		        	var td_addr ="#"+$(this).parent().next().next().next().attr("id");
		        	
		        	$("input:checkbox[id="+box_id+"]").removeAttr("checked");
		            $(this).css('color','#666666');
		            $(tr_addr+">td").css('background','white');
		          	$(td_addr+" input[type=text]").css('background','white');
		            $(td_addr+" input[type=text]").val("0");
		            
		        }else{
		        	$("input:checkbox[id="+box_id+"]").attr("checked");
		            $(this).css('color','#1e90ff');
		          
		          	/* 개수 증가  */
		          	var td_addr ="#"+$(this).parent().next().next().next().attr("id");
		          	var tr_addr ="#"+$(this).parent().parent().attr("id");
		          	$(tr_addr+">td").css('background','rgb(242,233,245)');
		          	$(td_addr+" input[type=text]").css('background','rgb(242,233,245)');
		          	
		          	if($(td_addr+">span>input[type=text]").val() == 0){
		          		$(td_addr+">span>input[type=text]").val("1");
		          	}
		        }
			
   		 });
		
		/** 아이템 삭제 */
		$(document).on("click",".list_remove",function(){
			$(this).parent().parent().remove();
			var this_next = $(this).next().val();
			var modal_item_id = $(this).next().next().next().val();
			$("#"+this_next).remove();
			
			$.ajax({url: 'project_delete_item_proc?item_id='+modal_item_id,
                success : function() {
                	alert("success!");
            }});
			
			if($(slide_d_id+" #add_items_table tr").length <= 1){
				$(".item_table_class").css('display','none');
				$("#add_items_table").css('display','none');
			}
			
		});
		
		/** 아이템 수정 */
		$(document).on("click",".list_update",function(){
			var update_btn_class = "."+$(this).attr("class");
			var radio_num = $(this).next().next().attr("id")
			var pro_item_tr = "#"+$(this).next().next().val();
			var list_item_tr = "#list_"+$(this).next().next().val();
			
			$("#item_add_btn").css('display','none');
			$("select#option_select option").remove();
			$("select#option_select option").attr("selected", true);
			$("#item_name").val($(this).parent().prev().prev().text());
			$("#option_select").append("<option value='' selected disabled hidden>옵션 미리보기</option>");
			$("#item_list").css('display','none');
			$("#option_name").val("");
			$("#option_name2").val("");
			$("#item_add_panel").css('display','block');
			$("input[type=radio]").prop("checked", false);
			$("input:radio[id ='"+radio_num+"']").prop("checked", true);
			
			$("#modal_add_save").css('display','none');
			$("#modal_update_data").css('display','inline-block');
			
			if(radio_num == "item_option2"){
				var origin_text = $(this).parent().prev().text().replace(/,/gi,'\r\n');
				$("#option_name").val(origin_text);
				$("#option_div").css('display','block');
				$("#option_div2").css('display','none');
				
			}else if(radio_num == "item_option3"){
				$("#option_name2").val($(this).parent().prev().text());
				$("#option_div2").css('display','block');
				$("#option_div").css('display','none');
			}else{
				$("#option_div").css('display','none');
				$("#option_div2").css('display','none');
			}
			
			$("#modal_update_data").off().on('click',function(){
				var option_value="";
				var radio_num = 1;
				
				if($(".item_option:checked").attr("id") == "item_option2"){
					option_value= $("#option_name").val().replace(/(\n|\r\n)/g, ',');
					radio_num=2;
				}else if($(".item_option:checked").attr("id") == "item_option3"){
					option_value = $("#option_name2").val();
					radio_num=3;
				}else{
					option_value = "옵션 없음";
				}
				$(pro_item_tr+" #item_option_type").val(radio_num);
				$(list_item_tr).next().next().attr("id","item_option"+radio_num);
				$(list_item_tr).children().eq(1).text(option_value);
				$(list_item_tr).children().eq(0).text($("#item_name").val());
				$(pro_item_tr).children().eq(1).text($("#item_name").val());
				$(pro_item_tr).children().eq(2).text(option_value);
				
				$("#modal_add_save").css('display','inline-block');
				$("#modal_update_data").css('display','none');
				$("#item_add_panel").css('display','none');
				$("#item_add_btn").css('display','block');
				$("#item_list").css('display','block');
			});
		});
		
		/** 상품 개수 증가 / 감소 **/
		$(document).on("click","#itmes_count_minus",function(){
			if(parseInt($(this).next().children().val()) > 0){
				$(this).next().children().val(parseInt($(this).next().children().val())-1);
			}
		
		});
		
		$(document).on("click","#itmes_count_plus",function(){
			if(parseInt($(this).prev().children().val()) < 99){
				$(this).prev().children().val(parseInt($(this).prev().children().val())+1);
			}
		
		});
		
		/** 계좌 정보 개인 / 사업자**/
		$(".account_type").click(function(){
			$("#m4_c3_save").attr('disabled', true).css('background','rgb(135,200,255)').css('cursor','default');
			if($(this).attr("id") == "personal_radio"){
				$("#business_account input").val("");
				$('#business_bank option:eq(0)').prop('selected', true);
				$("#business_account").css('display','none');
				$("#personal_account").css('display','block');
			
			}else if($(this).attr("id") == "business_radio"){
				$("#personal_account input").val("");
				$('#personal_bank option:eq(0)').prop('selected', true);
				$("#personal_account").css('display','none');
				$("#business_account").css('display','block');
			}
		});
		
		
		/** 프로필 사진 미리보기 업로드 **/
		$("#my_pro_img").on('change', function(){
		    readInputFile(this);
		});
		
		
		/** 파일 drag & drop **/
		/* var $drop = $("#img_uploadzone");
		$drop.on("dragenter", function(e) {  //드래그 요소가 들어왔을떄
			$(this).addClass('drag-over');
			
		}).on("dragleave", function(e) {  //드래그 요소가 나갔을때
		  $(this).removeClass('drag-over');
		
		}).on("dragover", function(e) {
		  e.stopPropagation();
		  e.preventDefault();
		  
		}).on('drop', function(e) {  //드래그한 항목을 떨어뜨렸을때
		  e.preventDefault();
		  $(this).removeClass('drag-over');
		  
		}); */
		
});
	
	function auto_hypen(num) {
		num = num.replace(/[^0-9]/g, '');
		var tmp = "";

		if (num.length > 3 && num.length <= 7) {
			tmp += num.substr(0, 3);
			tmp += '-';
			tmp += num.substr(3);
			num = tmp;
		} else if (num.length > 7) {
			tmp += num.substr(0, 3);
			tmp += '-';
			tmp += num.substr(3, 4);
			tmp += '-';
			tmp += num.substr(7);
			num = tmp;
		}
		
		return num;
	}
	
	/** 프로필 사진 미리보기 **/
	function readInputFile(input) {
	    if(input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
	            $('#my_d_img').css('background-image','url('+e.target.result+')');
	        }
	        reader.readAsDataURL(input.files[0]);
	    }
	}