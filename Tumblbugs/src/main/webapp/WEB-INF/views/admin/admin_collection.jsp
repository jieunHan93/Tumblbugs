<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script src="http://localhost:9090/tumblbugs/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" charset="utf8" src="http://localhost:9090/tumblbugs/js/datatables.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="http://localhost:9090/tumblbugs/css/admin_collection.css" />
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.css">
	<link rel="stylesheet" href="http://localhost:9090/tumblbugs/calendar/css/fullcalendar.min.css" />
    <!-- <link rel="stylesheet" href="http://localhost:9090/tumblbugs/calendar/css/bootstrap.min.css"> -->
    <link rel="stylesheet" href='http://localhost:9090/tumblbugs/calendar/css/select2.min.css' />
    <link rel="stylesheet" href='http://localhost:9090/tumblbugs/calendar/css/bootstrap-datetimepicker.min.css' />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="http://localhost:9090/tumblbugs/calendar/css/core-main.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<script>
	$.fn.dataTable.ext.order['dom-checkbox'] = function  ( settings, col )
	{
		return this.api().column( col, {order:'index'} ).nodes().map( function ( td, i ) {
			return $('input', td).prop('checked') ? '1' : '0';
		} );
	}; 
	$(document).ready(function(){
		$.ajax({
			url: "http://localhost:9090/tumblbugs/admin/collection_checkbox_system",
			success:function(result){
				//...
			}
		}); // ajax
		
		var table = $('#admin_collection_table').DataTable({
			bPaginate: true, //페이징처리
			pageLength :10,
	        bLengthChange: false, // n개씩보기
	        //lengthMenu : [ [10, 20], [10, 20] ], // 10/25/50/All 개씩보기
	        bAutoWidth: false, //자동너비
	        ordering: true, //칼럼별 정렬
	       	searching: true, //검색기능
	       	ajax: {
	            'url':'http://localhost:9090/tumblbugs/admin/collection_list', 
	            //'type': 'POST',
	            'dataSrc':'data',
	         },
	         
	        columns: [
	            {"data": "rno"},
	            {"data":  function (data, type, dataToSet) {
	            	return data.col_id + '<input type="hidden" id="col_id" value="'+data.col_id+'">';
            		}
	            },
	            {"data": function (data, type, dataToSet) {
	            	return  '<a href="http://localhost:9090/tumblbugs/admin/collection/content?col_id='+data.col_id+'">'+data.col_name+'</a>';
            		}
	            }, 
	            {"data": function (data, type, dataToSet) {
	            	return data.col_startdate+"~ "+ data.col_enddate +
					'<input type="hidden" class="col_startdate" value="'+data.col_startdate+'">'+
					'<input type="hidden" class="col_enddate" value="'+data.col_enddate+'">';
	            	}
	            }, 
	            {"data": function (data, type, dataToSet) {
	            	var str = "";
		            	if(data.col_controll == '1'){
		            		str='<input type="checkbox" id="switch_'+data.col_id+'" switch="none" checked /><label class="switchBtn checked" for="switch_'+data.col_id+'" data-on-label="On" data-off-label="Off"></label>';
		            	} else if(data.col_controll == '0' && data.col_status == '종료'){
		            		str='<input type="checkbox" id="switch_'+data.col_id+'" switch="none" disabled/><label class="switchBtn disabled" for="switch_'+data.col_id+'" data-on-label="On" data-off-label="Off"></label>';
		            	} else {
		            		str='<input type="checkbox" id="switch_'+data.col_id+'" switch="none" /><label class="switchBtn " for="switch_'+data.col_id+'" data-on-label="On" data-off-label="Off"></label>';
		            	}
		            	return str;
	                }
	            },
	            {"data" : function (data, type, dataToSet) {
	            	return data.col_status + "<input type='hidden' id='col_status'>";
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
                { 'searchable'    : false, 'targets'       : [4] },
                { "orderDataType": "dom-checkbox", "targets": [4] },
            ],
		});
		$("#admin_collection_table tbody").on('click', 'label.switchBtn', function(){
			if($(this).hasClass("disabled") === false) {
				var col_id = $(this).closest("tr").find("input#col_id").val();
				var checkbox = $(this).parent().find("input:checkbox");
				var startdate = $(this).closest("tr").find("input.col_startdate").val();
				var enddate = $(this).closest("tr").find("input.col_enddate").val();
				var col_controll = "";
				//alert("col_id:" + col_id + "checkbox:"+checkbox +"startdate:" + startdate +"enddate:" +enddate);
				
		        if($(checkbox).is(":checked")){
		        	//alert("체크박스 체크 해제!");
		            col_controll="0";
		        }else{
		            //alert("체크박스 체크했음!");
		            col_controll="1";
		        }
		       	 $.ajax({
						url: "http://localhost:9090/tumblbugs/admin/collection_checkbox?col_id="+col_id+"&col_controll="+col_controll+"&col_startdate="+startdate+"&col_enddate="+enddate,
						success:function(result){
							if(result != "fail"){
								$(this).toggleClass("checked");
								var td_select = $(this).closest("tr").find("input.col_status").parent();
								$(td_select).text(result);
								/** 기획전 카운트 **/
								$.ajax({
									url: "http://localhost:9090/tumblbugs/admin/collection/count",
									success:function(result){
										var jsonObj = JSON.parse(result);
										$("div#collection_count1").text(jsonObj.list[0].count1);
										$("div#collection_count2").text(jsonObj.list[0].count2);
										$("div#collection_count3").text(jsonObj.list[0].count3);
									}
								}); // ajax
								table.ajax.reload(null, false);
							} else {
								alert("해당 기획전에 등록된 프로젝트가 없습니다.먼저 등록을 진행해주세요.");
							}
							
						},
						fail:function(result){
							alert("시스템 관리자에게 문의하세요.");
						}
				}); // ajax
			} else {
				alert("기획전 기간이 지나 종료되었습니다.");
			}
		});
		
		if('${delete_result}' == "true"){
			alert("기획전이 삭제되었습니다.");
		}
		/** 기획전 카운트 **/
		$.ajax({
			url: "http://localhost:9090/tumblbugs/admin/collection/count",
			success:function(result){
				var jsonObj = JSON.parse(result);
				$("div#collection_count1").text(jsonObj.list[0].count1);
				$("div#collection_count2").text(jsonObj.list[0].count2);
				$("div#collection_count3").text(jsonObj.list[0].count3);
			}
		}); // ajax
	});
	</script>
	
	<style>
	div#admin_sidebar>div#admin_sidebar_p1{margin-bottom: 50px;}
	div#admin_sidebar>div#admin_sidebar_p1>img {
		display:block;
		width:140px !important;
		height:140px !important;
	}
	</style>
</head>
<body>
	<jsp:include page="admin_sidebar.jsp"></jsp:include>
	<div id="admin_collection_body">
		<section>
			<div id="admin_header">
				<p>기획전</p>
			</div>
			<div id="admin_collection_header">
				<div class="header_box">
					<div class="header_box_left first">
						<i class="far fa-bookmark"></i>
					</div>
					<div class="header_box_right">
						<div id="collection_count1"></div>
						<div>대기중인 기획전</div>
					</div>
				</div>
				<div class="header_box">
					<div class="header_box_left second">
						<i class="far fa-handshake"></i>
					</div>
					<div class="header_box_right">
						<div id="collection_count2"></div>
					<div>진행중인 기획전</div>
					</div>
				</div>
				<div class="header_box">
					<div class="header_box_left third">
						<i class="fas fa-flag-checkered"></i>
					</div>
					<div class="header_box_right">
						<div id="collection_count3"></div>
						<div>완료된 기획전</div>
					</div>
				</div>
			</div>
		</section>
		
		<section id="collection_calendar">
			   <div class="container" id="collection_calendar_container">
			       <!-- 일자 클릭시 메뉴오픈 -->
			       <!-- <div id="contextMenu" class="dropdown clearfix">
			           <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
			               style="display:block;position:static;margin-bottom:5px;">
			               <li><a tabindex="-1" href="#">카테고리1</a></li>
			               <li><a tabindex="-1" href="#">카테고리2</a></li>
			               <li><a tabindex="-1" href="#">카테고리3</a></li>
			               <li><a tabindex="-1" href="#">카테고리4</a></li>
			               <li class="divider"></li>
			               <li><a tabindex="-1" href="#" data-role="close">Close</a></li>
			           </ul>
			       </div> -->
			
			       <div id="wrapper">
			           <div id="loading"></div>
			           <div id="calendar"></div>
			       </div>
			
			       <!-- 일정 추가 MODAL -->
			       <div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
			           <div class="modal-dialog" role="document">
			               <div class="modal-content">
			                   <div class="modal-header">
			                       <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
			                               aria-hidden="true">&times;</span></button>
			                       <h4 class="modal-title"></h4>
			                   </div>
			                   <div class="modal-body">
			                       <!-- <div class="row">
			                           <div class="col-xs-12">
			                               <label class="col-xs-4" for="edit-allDay">하루종일</label>
			                               <input class='allDayNewEvent' id="edit-allDay" type="checkbox"></label>
			                           </div>
			                       </div> -->
			
			                       <div class="row">
			                           <div class="col-xs-12">
			                               <label class="col-xs-4" for="edit-title">기획전명</label>
			                               <input class="inputModal" type="text" name="edit-title" id="edit-title"
			                                   required="required" />
			                           </div>
			                       </div>
			                       
			                       <div class="row">
			                           <div class="col-xs-12">
			                               <label class="col-xs-4" for="edit-start">시작</label>
			                               <input class="inputModal" type="text" name="edit-start" id="edit-start" />
			                           </div>
			                       </div>
			                       
			                       <div class="row">
			                           <div class="col-xs-12">
			                               <label class="col-xs-4" for="edit-end">끝</label>
			                               <input class="inputModal" type="text" name="edit-end" id="edit-end" />
			                           </div>
			                       </div>
			                       
			                       <!-- <div class="row">
			                           <div class="col-xs-12">
			                               <label class="col-xs-4" for="edit-type">구분</label>
			                               <select class="inputModal" type="text" name="edit-type" id="edit-type">
			                                   <option value="카테고리1">카테고리1</option>
			                                   <option value="카테고리2">카테고리2</option>
			                                   <option value="카테고리3">카테고리3</option>
			                                   <option value="카테고리4">카테고리4</option>
			                               </select>
			                           </div>
			                       </div> -->
			                       
			                       <div class="row">
			                           <div class="col-xs-12">
			                               <label class="col-xs-4" for="edit-color">색상</label>
			                               <select class="inputModal" name="color" id="edit-color">
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
			                           </div>
			                       </div>
			                       
			                       <div class="row">
			                           <div class="col-xs-12">
			                               <label class="col-xs-4" for="edit-desc">설명</label>
			                               <textarea rows="4" cols="50" class="inputModal" name="edit-desc"
			                                   id="edit-desc"></textarea>
			                           </div>
			                       </div>
			                   </div>
			                   
			                   <div class="modal-footer modalBtnContainer-addEvent">
			                       <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			                       <button type="button" class="btn btn-primary" id="save-event">저장</button>
			                   </div>
			                   
			                   <div class="modal-footer modalBtnContainer-modifyEvent">
			                       <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			                       <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
			                       <button type="button" class="btn btn-primary" id="updateEvent">저장</button>
			                   </div>
			               </div><!-- /.modal-content -->
			           </div><!-- /.modal-dialog -->
			       </div><!-- /.modal -->
			   </div><!-- /.container -->
		</section>
		<section id="collection_list">
			<div id="collection_list_box">
				<table id="admin_collection_table">
					<thead>
						<tr>
							<th>번호</th>
							<th>기획전 ID</th>
							<th>기획전명</th>
							<th>기획전 기간</th>
							<th>운영 설정</th>
							<th>상태</th>
						</tr>
					</thead>
				</table>
			</div>
			<div id="admin_collection_write">
				<div>
					<a href="http://localhost:9090/tumblbugs/admin/collection/write"><button type="button"><i class="fas fa-edit"></i>기획전 추가</button></a>
				</div>
			</div>
		</section>
	</div>
	
	
	<script src="http://localhost:9090/tumblbugs/calendar/js/bootstrap.min.js"></script>
	<script src="http://localhost:9090/tumblbugs/calendar/js/moment.min.js"></script>
	<script src="http://localhost:9090/tumblbugs/calendar/js/fullcalendar.min.js"></script>
	<script src="http://localhost:9090/tumblbugs/calendar/js/ko.js"></script>
	<script src="http://localhost:9090/tumblbugs/calendar/js/select2.min.js"></script>
	<script src="http://localhost:9090/tumblbugs/calendar/js/bootstrap-datetimepicker.min.js"></script>
	<script src="http://localhost:9090/tumblbugs/calendar/js/core-main.js"></script>
	<script src="http://localhost:9090/tumblbugs/calendar/js/addEvent.js"></script>
	<script src="http://localhost:9090/tumblbugs/calendar/js/editEvent.js"></script>
	<script src="http://localhost:9090/tumblbugs/calendar/js/etcSetting.js"></script>
</body>
</html>