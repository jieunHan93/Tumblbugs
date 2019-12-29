<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script src="http://localhost:9090/tumblbugs/js/jquery-3.4.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
	<script src="http://localhost:9090/tumblbugs/js/evol-colorpicker.min.js"></script>
	
	<link rel="stylesheet" href="http://localhost:9090/tumblbugs/css/admin_collection.css" />
	<link href="http://localhost:9090/tumblbugs/css/evol-colorpicker.min.css" rel="stylesheet" />

	<script>
	$(document).ready(function(){
		$('#cpFocus').colorpicker({showOn:'focus'});
		/*$('#cpFocus').on('change', function(){
			alert('Selected color = "' + $('#cpFocus').colorpicker("val") + '"');
		});*/
		var cofile = "";
		 $("#cofile").change(function(){
			//FileReader
			if(window.FileReader){
				// 파일이 여러개일때 이름 가져오기
				cofile = $(this)[0].files[0].name;
				/* $(pro_co_img).text("").text($(this)[0].files[0].name); */
			}
		});
		 
		$("#endDate").change(function(){
			if($("#startDate").val() != "" && $("#endDate").val() !=""){
				var startDate = $( "#startDate" ).val();
		        var startDateArr = startDate.split('-');
		        var endDate = $( "#endDate" ).val();
		        var endDateArr = endDate.split('-');
		                 
		        var startDateCompare = new Date(startDateArr[0], parseInt(startDateArr[1])-1, startDateArr[2]);
			        
			    var endDateCompare = new Date(endDateArr[0], parseInt(endDateArr[1])-1, endDateArr[2]);
			    if(startDateCompare.getTime() > endDateCompare.getTime()) {
			            alert("시작일과 마감일을 확인해 주세요.");
			            $("#endDate").val("");
			            $("#endDate").focus();
			    } 
			}
		});
		 
		$("button#collection_save").click(function(){
			if($("#collection_name").val() == ""){
				alert("기획전명을 입력하세요");
				$("#collection_name").focus();
				return false;
			} else if($("#collection_addr").val() == ""){
				alert("기획전 주소를 입력하세요.");
				$("#collection_addr").focus();
				return false;
			} else if($("#cpFocus").val() == ""){
				alert("기획전 배경색을 선택하세요");
				$("#cpFocus").focus();
				return false;
			} else if ($("#startDate").val() == ""){
				alert("기획전 시작일을 선택하세요");
				$("#startDate").focus();
				return false;
			} else if ($("#endDate").val() == ""){
				alert("기획전 마감일을 선택하세요");
				$("#endDate").focus();
				return false;
			} else if($("textarea").val() == ""){
				alert("기획전 설명을 선택하세요");
				$("textarea").focus();
				return false;
			} else if(cofile == ""){
				alert("기획전 이미지를 등록하세요");
				return false;
			} else {
				colWriteFrom.submit();
			}
		});
		
		//입력 수 제한
		$("#collection_name").on('keyup',function(){
			if($(this).val().length>100){
				$(this).val($(this).val().substring(0,100));
				alert("최대 100자 입력이 가능합니다");
			}
		});
		$("textarea").on('keyup',function(){
			if($(this).val().length>200){
				$(this).val($(this).val().substring(0,200));
				alert("최대 200자 입력이 가능합니다");
			}
		});
		
		$("#collection_addr").focusout(function(){
			if($("#collection_addr").val() != ""){
				console.log("val:"+$("#collection_addr").val());
				$.ajax({
					url: "http://localhost:9090/tumblbugs/admin/collection/write/check?col_addr="+$("#collection_addr").val(),
					success:function(result){
						if(result != 0){
							$("#col_addr_check").text("이미 있는 기획전 주소입니다. 다시 입력해주세요").css("color", "#FF6666");
							$("#collection_addr").val("");
							$("#collection_addr").focus();
						} else {
							$("#col_addr_check").text("사용 가능한 기획전 주소입니다.").css("color", "#999999");
						}
					}
				}); // ajax
			}
		});
	});
	</script>

</head>
<body>
	<jsp:include page="admin_sidebar.jsp"></jsp:include>
	<div id="admin_collection_write_body">
		<section>
			<div id="admin_header">
				<p>기획전 등록</p>
			</div>
		</section>
		
		<section id="collection_body_size">
			<form action="http://localhost:9090/tumblbugs/admin/collection/write_proc" method="post" name="colWriteFrom" enctype="multipart/form-data">
				<table id="admin_collection_write_table">
					<tr>
						<th>기획전명</th>
						<td colspan="3"><input type="text" id="collection_name" name="col_name"></td>
					</tr>
					<tr>
						<th>기획전 주소</th>
						<td colspan="3">
							<input type="text" id="collection_addr" name="col_addr" maxlength="20">
							<span id="col_addr_check"></span>
						</td>
					</tr>
					<tr>
						<th>기획전 배경색</th>
						<td>
							<div class="demoPanel ui-widget ui-widget-content ui-corner-all" style="width:130px">
								<input id="cpFocus" placeholder="배너색을 선택하세요" name="col_bcolor" autocomplete="off">
							</div>
						</td>
						<th>달력 표시색</th>
						<td>
							<select class="inputModal" name="col_ccolor" id="edit-color">
                                 <option value="#D25565" style="color:#D25565;">빨간색</option>
                                 <option value="#9775fa" style="color:#9775fa;">보라색</option>
                                 <option value="#ffa94d" style="color:#ffa94d;">주황색</option>
                                 <option value="#74c0fc" style="color:#74c0fc;">파란색</option>
                                 <option value="#f06595" style="color:#f06595;">핑크색</option>
                                 <option value="#63e6be" style="color:#63e6be;">연두색</option>
                                 <option value="#a9e34b" style="color:#a9e34b;">초록색</option>
                                 <option value="#4d638c" style="color:#4d638c;">남색</option>
                                 <option value="#495057" style="color:#495057;">검정색</option>
                             </select>
						</td>
					</tr>
					<tr>
						<th>기획전 기간</th>
						<td colspan="3"><input type="date" id="startDate" name="col_startdate">~<input type="date" id="endDate" name="col_enddate"></td>
					</tr>
					<tr>
						<th>기획전 설명</th>
						<td colspan="3"><textarea id="col_content" name="col_content"></textarea></td>
					</tr>
					<tr>
						<th>기획전 이미지</th>
						<td colspan="3"><input type="file" id="cofile" name="cofile"></td>
					</tr>
				</table>
				<div id="collection_write_btn">
					<button type="button" id="collection_save"><i class="fas fa-save"></i>저장</button>
					<a href="http://localhost:9090/tumblbugs/admin/collection"><button type="button"><i class="fas fa-caret-square-left"></i>목록으로</button></a>
				</div>
			</form>
		</section>
	</div>
</body>
</html>