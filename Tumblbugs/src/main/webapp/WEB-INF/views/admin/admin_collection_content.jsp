<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script src="http://localhost:9090/tumblbugs/js/jquery-3.4.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
	<script type="text/javascript" charset="utf8" src="http://localhost:9090/tumblbugs/js/datatables.min.js"></script>
	<script src="http://localhost:9090/tumblbugs/js/evol-colorpicker.min.js"></script>
	<link rel="stylesheet" href="http://localhost:9090/tumblbugs/css/admin_collection.css" />
	<link href="http://localhost:9090/tumblbugs/css/evol-colorpicker.min.css" rel="stylesheet" />
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.css">
	<script>
	$.fn.dataTable.ext.order['dom-checkbox'] = function  ( settings, col )
	{
	  return this.api().column( col, {order:'index'} ).nodes().map( function ( td, i ) {
	    return $('input', td)[1].checked ? '1' : '0';
	  } );
	}
	/** 이미지 미리보기 **/
  	function readInputFile(input) {
       if(input.files && input.files[0]) {
           var reader = new FileReader();
           reader.onload = function (e) {
               $('.collection_update_img').attr("src", e.target.result);
           }
           reader.readAsDataURL(input.files[0]);
       }
   	}
	$(document).ready(function(){
		$("div#collection_project_select").hide();
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
				readInputFile($(this)[0]);
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
			} else {
				colUpdateFrom.submit();
			}
			
		});
		/** 컬렉션 주소 중복 체크 **/
		$("#collection_addr").focusout(function(){
			if($("#collection_addr").val() != ""){
				console.log("val:"+$("#collection_addr").val() + '${vo.col_addr}');
				$.ajax({
					url: "http://localhost:9090/tumblbugs/admin/collection/write/check?col_addr="+$("#collection_addr").val()+"&col_id=${vo.col_id}",
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
		
		//파일 이름 가져오기
		 $("#cofile").change(function(){
			//FileReader
			if(window.FileReader){
				// 파일이 여러개일때 이름 가져오기
				//alert($(this)[0].files[0].name);
				$("span#cofile_name").text("").text($(this)[0].files[0].name);
			}
		});
		//입력 수 제한
		/* $("#pro_title").on('keyup',function(){
			if($(this).val().length>300){
				$(this).val($(this).val().substring(0,300));
				alert("최대 300자 입력이 가능합니다");
			}
		}); */
		/** 추가된 프로젝트 확인 **/
		 var table = $('#collection_project_table').DataTable({
				bPaginate: true, //페이징처리
		        bLengthChange: true, // n개씩보기
		        lengthMenu : [ [10, 20, -1], [10, 20,"전체"] ], // 10/25/50/All 개씩보기
		        bAutoWidth: false, //자동너비
		        ordering: true, //칼럼별 정렬
		       	searching: true, //검색기능
		       	ajax: {
		            'url':'http://localhost:9090/tumblbugs/admin/collection/collection_project_list?col_id=${vo.col_id}', 
		            //'type': 'POST',
		            'dataSrc':'data',
		         },
		         
		        columns: [
		            {"data": "rno"},
		            {"data": "pj_id"},
		            {"data": "pj_category"}, 
		            {"data": function (data, type, dataToSet) {
		            	return '<a href="http://localhost:9090/tumblbugs/project_content?pj_id=+'+data.pj_id +'" target="_blank">'+data.pj_title+'</a>';
		            	}
		            }, 
		            {"data": "name"},
		            {"data": function (data, type, dataToSet) {
		                return data.pj_start_date + "~ " + data.pj_end_date;
		                }
		            },
		            {"data" :function (data, type, dataToSet) {
		            	return '<button type="button" id="'+data.pj_id+'" class="content_deleteBtn">삭제</button>';
	                	} 
		            }
		        ],
		       	
		        "language": {
		            "emptyTable": "데이터가 없어요.",
		            "lengthMenu": "_MENU_ 줄보기",
		            //"info": "현재 _START_ - _END_ / _TOTAL_건",
		            "infoEmpty": "",
		            //"infoFiltered": "( _MAX_건의 데이터에서 필터링됨 )",
		            "search": "",
		            "zeroRecords": "일치하는 데이터가 없어요.",
		            "loadingRecords": "로딩중...",
		            "processing":     "잠시만 기다려 주세요...",
		            "paginate": {
		                "next": ">",
		                "previous": "<"
		            },
		            "sSearchPlaceholder" : "검색어를 입력하세요"
		        },
		        'columnDefs' : [ // see https://datatables.net/reference/option/columns.searchable
	                { 'searchable'    : false, 'targets'       : [0] },
	                { 'searchable'    : false, 'targets'       : [6] },
	                { 'orderable'	  : false, 'targets'	   : [6] },
	                { "orderDataType": "dom-text-numeric" , "targets": [0,1,5] },
	            ],
			});
		/** 프로젝트 추가를 위한 리스트 **/
		var table2 = $('#collection_project_search_table').DataTable({
			bPaginate: true, //페이징처리
	        bLengthChange: false, // n개씩보기
	        //lengthMenu : [ [10, 20, -1], [10, 20,"전체"] ], // 10/25/50/All 개씩보기
	        bAutoWidth: false, //자동너비
	        ordering: true, //칼럼별 정렬
	       	searching: true, //검색기능
	        ajax: {
	            'url':'http://localhost:9090/tumblbugs/admin/collection/project_list', 
	            //'type': 'POST',
	            'dataSrc':'data',
	         },
	         
	        columns: [
	            {"data": "rno"},
	            {"data": function (data, type, dataToSet) {
	                return data.pj_id + "<input type='hidden' id='project_select_id' value='"+data.pj_id+"'>";
                	}
	            },
	            {"data": "pj_category"}, 
	            {"data": "pj_title"}, 
	            {"data": "name"},
	            {"data": function (data, type, dataToSet) {
	                return data.pj_start_date + "~ " + data.pj_end_date;
	                }
	            }
	        ],
	        "language": {
	            "emptyTable": "데이터가 없어요.",
	            "lengthMenu": "_MENU_ 줄보기",
	            //"info": "현재 _START_ - _END_ / _TOTAL_건",
	            "infoEmpty": "",
	            //"infoFiltered": "( _MAX_건의 데이터에서 필터링됨 )",
	            "search": "",
	            "zeroRecords": "일치하는 데이터가 없어요.",
	            "loadingRecords": "로딩중...",
	            "processing":     "잠시만 기다려 주세요...",
	            "paginate": {
	                "next": ">",
	                "previous": "<"
	            },
	            "sSearchPlaceholder" : "검색어를 입력하세요"
	        },
		});
		/** 프로젝트 전체 목록 **/
		$("#collection_project_selectBtn").click(function(){
			$("div#collection_project_select").fadeToggle( 'slow' );
		});
		/** 프로젝트 추가 선택 **/
		$("#collection_project_search_table tbody").on('click', 'tr', function(){
			var pj_id = $(this).find("#project_select_id").val();
			if(pj_id != null){
				var col_id ='${vo.col_id}';
				$.ajax({
					url: "http://localhost:9090/tumblbugs/admin/collection/add_project?col_id="+col_id+"&pj_id="+pj_id,
					success:function(result){
						if(result != 0){
							alert("프로젝트를 추가했습니다");
							table.ajax.reload(null,false);
						} else {
							alert("해당 기획전에 이미 추가되있는 프로젝트입니다.");
						}
					}
				}); // ajax
				//$("#collection_project_table").DataTable.ajax.reload();
			}
		});
		/** 프로젝트 해당 컬렉션에서 삭제 **/
		$("#collection_project_table tbody").on('click','.content_deleteBtn',function(){
			if(confirm('해당 프로젝트를 기획전에서 제외하시겠습니까?')){
				var pj_id = $(this).attr("id");
				var col_id ='${vo.col_id}';
				$.ajax({
					url: "http://localhost:9090/tumblbugs/admin/collection/remove_project?col_id="+col_id+"&pj_id="+pj_id,
					success:function(result){
						alert("프로젝트를 제외했습니다");
						table.ajax.reload(null,false);
					}
				});
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
				<p>기획전 상세</p>
			</div>
		</section>
		
		<section id="collection_body_size">
			<form action="http://localhost:9090/tumblbugs/admin/collection/update_proc" name="colUpdateFrom" method="post" enctype="multipart/form-data">
				<table id="admin_collection_write_table">
					<tr>
						<th>기획전명</th>
						<td colspan="3"><input type="text" id="collection_name" name="col_name" value="${vo.col_name}"></td>
					</tr>
					<tr>
						<th>기획전 주소</th>
						<td colspan="3">
							<input type="text" id="collection_addr" name="col_addr" value="${vo.col_addr}" maxlength="20">
							<span id="col_addr_check"></span>
						</td>
					</tr>
					<tr>
						<th>기획전 배경색</th>
						<td>
							<div class="demoPanel ui-widget ui-widget-content ui-corner-all" style="width:130px">
								<input id="cpFocus" placeholder="배너색을 선택하세요" name="col_bcolor" value="${vo.col_bcolor }">
							</div>
						</td>
						<th>달력 표시색</th>
						<td>
							<select class="inputModal" name="col_ccolor" id="edit-color">
                                 <option value="#D25565" style="color:#D25565;" <c:if test="${vo.col_ccolor eq '#D25565'}">selected</c:if>>빨간색</option>
                                 <option value="#9775fa" style="color:#9775fa;" <c:if test="${vo.col_ccolor eq '#9775fa'}">selected</c:if>>보라색</option>
                                 <option value="#ffa94d" style="color:#ffa94d;" <c:if test="${vo.col_ccolor eq '#ffa94d'}">selected</c:if>>주황색</option>
                                 <option value="#74c0fc" style="color:#74c0fc;" <c:if test="${vo.col_ccolor eq '#74c0fc'}">selected</c:if>>파란색</option>
                                 <option value="#f06595" style="color:#f06595;" <c:if test="${vo.col_ccolor eq '#f06595'}">selected</c:if>>핑크색</option>
                                 <option value="#63e6be" style="color:#63e6be;" <c:if test="${vo.col_ccolor eq '#63e6be'}">selected</c:if>>연두색</option>
                                 <option value="#a9e34b" style="color:#a9e34b;" <c:if test="${vo.col_ccolor eq '#a9e34b'}">selected</c:if>>초록색</option>
                                 <option value="#4d638c" style="color:#4d638c;" <c:if test="${vo.col_ccolor eq '#4d638c'}">selected</c:if>>남색</option>
                                 <option value="#495057" style="color:#495057;" <c:if test="${vo.col_ccolor eq '#495057'}">selected</c:if>>검정색</option>
                             </select>
						</td>
					</tr>
					<tr>
						<th>기획전 기간</th>
						<td colspan="3"><input type="date" id="startDate" name="col_startdate" value="${vo.col_startdate }">~<input type="date" id="endDate" name="col_enddate" value="${vo.col_enddate }"></td>
					</tr>
					<tr>
						<th>기획전 설명</th>
						<td colspan="3">
						<textarea class="collection_update" name="col_content">${vo.col_content }</textarea>
						<img class="collection_update_img" src="http://localhost:9090/tumblbugs/upload/${vo.col_simg }">
						</td>
					</tr>
					<tr>
						<th>기획전 이미지</th>
						<td colspan="3"><input type="file" id="cofile" name="cofile">
						<span id="cofile_name">${vo.col_img }</span>
						</td>
					</tr>
				</table>
				<input type="hidden" name="col_id" value="${vo.col_id }">
				<input type="hidden" name="del_img" value="${vo.col_simg }">
				<input type="hidden" name="col_controll" value="${vo.col_controll }">
				<div id="collection_update_btn">
					<button type="button" id="collection_project_selectBtn"><i class="fas fa-plus"></i>프로젝트 추가</button>
					<a href="http://localhost:9090/tumblbugs/collections/${vo.col_addr }" target="_blank"><button type="button"><i class="far fa-eye"></i>미리보기</button></a>
				</div>
				<div id="collection_write_btn">
					<button type="button" id="collection_save"><i class="fas fa-save"></i>수정</button>
					<a href="http://localhost:9090/tumblbugs/admin/collection/delete_porc?col_id=${vo.col_id}" onclick="return confirm('해당 기획전을 삭제하시겠습니까?')"><button type="button" id="collection_delete"><i class="fas fa-trash-alt"></i>삭제</button></a>
					<a href="http://localhost:9090/tumblbugs/admin/collection"><button type="button"><i class="fas fa-caret-square-left"></i>목록으로</button></a>
				</div>
			</form>
		</section>
		<section id="collection_project_box" class="collection_project_list">
			<div>
				<table id="collection_project_table">
					<thead>
						<tr>
							<th>번호</th>
							<th>프로젝트 ID</th>
							<th>카테고리</th>
							<th>제목</th>
							<th>창작자</th>
							<th>기간</th>
							<th>삭제</th>
						</tr>
					</thead>
					<%-- <tbody>
					<c:forEach var="vo" items="${cplist }">
						<tr>
							<td>${vo.rno }</td>
							<td>${vo.pj_id }</td>
							<td>${vo.pj_category }</td>
							<td><a href="http://localhost:9090/tumblbugs/project_content?pj_id=${vo.pj_id }" target="_blank">${vo.pj_title }</a></td>
							<td>${vo.name }</td>
							<td>${vo.pj_start_date } ~ ${vo.pj_end_date }</td>
							<td id="delete_td"><button type="button" id="${vo.pj_id }" class="content_deleteBtn">삭제</button></td>
						</tr>
					</c:forEach>
					</tbody> --%>
				</table>
			</div>
			
			<div id="collection_project_select">
				<table id="collection_project_search_table">
					<thead>
						<tr>
							<th>no</th>
							<th>id</th>
							<th>cat</th>
							<th>title</th>
							<th>owner</th>
							<th>duration</th>
						</tr>
					</thead>
					<%-- <tbody>
					<c:forEach var="vo" items="${plist }">
						<tr>
							<td>${vo.rno }</td>
							<td id="project_select_id">${vo.pj_id }</td>
							<td>${vo.pj_category }</td>
							<td>${vo.pj_title }</td>
							<td>${vo.name }</td>
							<td>${vo.pj_start_date }~ ${vo.pj_end_date }</td>
						</tr>
					</c:forEach>
					</tbody> --%>
				</table>
			</div>
		</section>
		
		
	</div>
</body>
</html>