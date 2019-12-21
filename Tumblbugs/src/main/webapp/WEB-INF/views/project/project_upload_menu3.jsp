<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<input type="hidden" id="menu3_check" value="0" class="all_check">
<div class="content_menu_title">프로젝트 스토리</div>
	<div id="pro_story">
		<div id="content_m3_c2" class="upload_detail_slide" >
			<label>프로젝트 스토리</label>
			<div id="story_info" class="sub_info">
			<c:if test="${vo.pj_story != null}">
				<span style="color:black; font-size:11pt; font-weight:550;">작성 완료</span>
			</c:if>
			<c:if test="${vo.pj_story == null}">
				<i class="far fa-hand-point-right"></i> 프로젝트 스토리를 입력해주세요.
			</c:if>
			</div>
			<div id="title_write"><i class="far fa-edit"></i>
				<c:if test="${vo.pj_story == null}"> 입력하기</c:if>
				<c:if test="${vo.pj_story != null}"> 수정하기</c:if>
			</div>
		</div>
		<div id="content_m3_c2_d" class="upload_detail">
			<div class="d_title">프로젝트 스토리</div>
			<div><p><a href="#">[프로젝트 스토리는 어떻게 작성해야 하나요?]</a>를 읽어보시고 스토리텔링에 필요한 요소들을 확인하여 작성해주세요.</div>	
			<div>
				<ul>
					<li>문단과 문단 사이 간격이 넉넉하게 설정되어 있습니다. 간격 없이 줄바꿈하시려면 shift(⇧) + enter(↵) 를 사용해주세요.</li>
					<li>MS word 등에서 서식이 있는 텍스트를 복사하여 붙여넣기 하는 경우, 서식이 맞지 않을 수 있으니 확인해서 작성해주세요.</li>
				</ul>
				<div>
				<form enctype="multipart/form-data">
					<textarea class="m3_check" id="m3_c1_i1">
						<c:if test="${vo.pj_story != null}">
							${vo.pj_story}
						</c:if>
					</textarea>
					</form>
					</div>
			</div>
			<div class="content_btn">
				<button type="button" class="up_reset"><i class="fas fa-times"></i> 취소하기</button>
				<button type="button" class="up_save" id="m3_c1_save"><i class="fas fa-check"></i> 저장하기</button>
			</div>
		</div>	
	</div>	

</body>
</html>