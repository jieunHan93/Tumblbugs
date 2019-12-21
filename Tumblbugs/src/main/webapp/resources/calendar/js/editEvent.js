/* ****************
 *  일정 편집
 * ************** */
var editEvent = function (event, element, view) {

    $('.popover.fade.top').remove();
    $(element).popover("hide");

    if (event.allDay === true) {
        editAllDay.prop('checked', true);
    } else {
        editAllDay.prop('checked', false);
    }

    if (event.end === null) {
        event.end = event.start;
    }

    if (event.allDay === true && event.end !== event.start) {
        editEnd.val(moment(event.end).subtract(1, 'days').format('YYYY-MM-DD HH:mm'))
    } else {
        editEnd.val(event.end.format('YYYY-MM-DD HH:mm'));
    }

    modalTitle.html('일정 수정');
    editTitle.val(event.title);
    editStart.val(event.start.format('YYYY-MM-DD HH:mm'));
    editType.val(event.type);
    editDesc.val(event.description);
    editColor.val(event.backgroundColor).css('color', event.backgroundColor);

    addBtnContainer.hide();
    modifyBtnContainer.show();
    eventModal.modal('show');

    //업데이트 버튼 클릭시
    $('#updateEvent').unbind();
    $('#updateEvent').on('click', function () {

        if (editStart.val() > editEnd.val()) {
            alert('끝나는 날짜가 앞설 수 없습니다.');
            return false;
        }

        if (editTitle.val() === '') {
            alert('일정명은 필수입니다.')
            return false;
        }

        var statusAllDay;
        var startDate;
        var endDate;
        var displayDate;

        /*if (editAllDay.is(':checked')) {
            statusAllDay = true;*/
            startDate = moment(editStart.val()).format('YYYY-MM-DD');
            endDate = moment(editEnd.val()).format('YYYY-MM-DD');
            displayDate = moment(editEnd.val()).add(1, 'days').format('YYYY-MM-DD');
      /*  } else {
            statusAllDay = false;
            startDate = editStart.val();
            endDate = editEnd.val();
            displayDate = endDate;
        }*/

        eventModal.modal('hide');
        
        event.allDay = statusAllDay;
        event.title = editTitle.val();
        event.start = startDate;
        event.end = displayDate;
        event.type = editType.val();
        event.backgroundColor = editColor.val();
        event.description = editDesc.val();
        var ccolor = editColor.val().substring(1);
        console.log("color="+event.backgroundColor);
        console.log("content="+event.description);
        $("#calendar").fullCalendar('updateEvent', event);

        //일정 업데이트
        $.ajax({
            type: "get",
            url: "http://localhost:9090/tumblbugs/admin/collection/calendar_updateBtn?col_id="+event._id+"&col_name="+event.title+"&col_startdate="+event.start+"&col_enddate="+endDate+"&col_content="+event.description+"&col_ccolor="+ccolor,
            data: {
                //...
            },
            success: function (response) {
            	//...
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
            	$('#admin_collection_table').DataTable().ajax.reload(null, false);
            }
        });
        

    });

    // 삭제버튼
    $('#deleteEvent').on('click', function () {
        $('#deleteEvent').unbind();
        $("#calendar").fullCalendar('removeEvents', [event._id]);
        eventModal.modal('hide');

        //삭제시
        $.ajax({
            type: "get",
            url: "http://localhost:9090/tumblbugs/admin/collection/calendar_deleteBtn?col_id="+event._id,
            data: {
                //...
            },
            success: function (response) {
                //...
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
            	 $('#admin_collection_table').DataTable().ajax.reload(null, false);
            }
        });
    });
};