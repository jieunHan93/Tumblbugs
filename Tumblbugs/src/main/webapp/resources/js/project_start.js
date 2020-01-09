$(document).ready(function(){
	/** start **/
	$(document).ready(function(){
		$(".go_agree_btn").click(function(){
			location.href="http://localhost:9090/tumblbugs/project_start_agreement";
		});
	});
	
	/** agreement **/
	$(document).ready(function(){
		$(".agree_check_lb").click(function(){
			var check_status =$(this).attr("id"); 
			
			if(check_status == "no_check"){
				$(this).css('background-image','url(http://localhost:9090/tumblbugs/images/project_start/check.png)')
				.css('background-size','cover').css('border-color','gray');
				$(this).attr("id","yes_check");
			}else{
				$(this).css('background','none').css('border-color','#ccc');
				$(this).attr("id","no_check");
				
			}
		});
		
		$("#con_btn").click(function(){
			var check_len = $("input:checkbox").length;
			var sel_check = $("input:checkbox:checked").length;
			
		 	if(check_len == sel_check){
		 		$.ajax({url: "new_project_proc",
					success: function(data){
						location.href="http://localhost:9090/tumblbugs/project_start_upload?pj_id="+data;
		        }});
				
			}else{
				alert("계속하려면 모든 항목을 선택하세요.");
			} 
		});
	});
});	
		