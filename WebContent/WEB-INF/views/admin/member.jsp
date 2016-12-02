<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<%@ include file="inc/head.jsp"%>
		<%@ include file="inc/layout.jsp"%>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin_assets/css/member.css" />
		<style type="text/css">
		</style>

	</head>
	<body>
	<div id="container">
	<%@ include file="inc/category.jsp"%>

	<!-- 컨텐츠 영역 start -->
	<div id="content">
	<div id="member">
	<!--검색 start -->
	<div id="search">
	<form method="get" action="${pageContext.request.contextPath }/admin/member.do">
	<select name="dropdown" id="dropdown">
	<option value="">검색조건</option>
	<c:choose>
	<c:when test="${dropdown =='1' }">
	<option value="1" selected>아이디</option>
	</c:when>
	<c:otherwise>
	<option value="1">아이디</option>
	</c:otherwise>
	</c:choose>
	<c:choose>
	<c:when test="${dropdown =='2' }">
	<option value="2" selected>이름</option>
	</c:when>
	<c:otherwise>
	<option value="2">이름</option>
	</c:otherwise>
	</c:choose>
	</select>
	<input type="text" name="search_item" id="search_item" placeholder="검색어를 입력하세요." value="${keyword }"/>
	<button type="submit" id="submit_bt">검색</button>
	</form>
	</div>
	<!--검색 end -->

	<!-- 테이블 start -->
	<form method="post" action="${pageContext.request.contextPath }/admin/member_delete.do">
	<div id="items">
	<table>
	<colgroup>
		<col style="width:30px;">
		<col style="width:30px;">
		<col style="width:50px;">
		<col style="width:50px;">
		<col style="width:50px;">
		<col style="width:260px;">
		<col style="width:100px;">
		<col style="width:100px;">
		<col style="width:70px;">
		<col style="width:70px;">
	</colgroup>
	<thead>
	<tr>
	<th>번호</th>
	<th><input type="checkbox" id="all_check" /></th>
	<th>아이디</th>
	<th>이름</th>
	<th>성별</th>
	<th>주소</th>
	<th>전화번호</th>
	<th>이메일</th>
	<th>가입일</th>
	<th>수정</th>
	</tr>
	</thead>
	<tbody>
	<c:choose>
		<c:when test="${fn:length(memberList) > 0}">
		<c:forEach var="member" items="${memberList }">
		<tr>
		<td>${member.id}</td>
		<td><input type="checkbox" name="checkbox" class="item_checked" id="${member.id }" value="${member.id }"/></td>
		<td>${member.userId}</td>
		<td>${member.userName}</td>
		<td>${member.gender}</td>
		<td>${member.postcode} <br/> ${member.addr1 }<br/> ${member.addr2 }</td>
		<td>${member.tel}</td>
		<td>${member.email}</td>
		<td>${member.regDate}</td>
		<td><a href="${pageContext.request.contextPath}/admin/member_update.do?id=${member.id }" data-toggle="modal" data-target="#update_box_modal" class="btn btn-danger btn-xs">수정</a></td>
		
		</tr>
		</c:forEach>
		</c:when>
		<c:otherwise>
		<tr>
		<td colspan="10" class="text-center" style="line-height:100px;">
		조회된 글이 없습니다.</td>
		</tr>		
		</c:otherwise>
		</c:choose>
	</tbody>
	</table>
	<%@ include file="inc/member_page.jsp" %>
	</div>
	<!-- 테이블 end -->

	<!-- 버튼 start -->
	<div id="bt_box">
	<button id="delete" type="submit">삭제</button>
	<a id="insert" class="btn" href='${pageContext.request.contextPath}/admin/member_add.do' data-toggle="modal" data-target="#insert_box_modal">등록</a>
	</div>
	<!-- 버튼 end -->
	</form>
	
	</div>
	<!-- 컨텐츠 영역 end -->
	</div>
	<!-- 업데이트 버튼 클릭시 start -->
	<div class="modal fade" id="update_box_modal">
<div class="modal-dialog modal-sm">
<div class="modal-content">
</div></div></div>
	<!-- 업데이트 버튼 클릭시 end -->
	<!-- 인설트 버튼 클릭시 start -->
	<div class="modal fade" id="insert_box_modal">
<div class="modal-dialog modal-sm">
<div class="modal-content">
</div></div></div>
	<!-- 인설트 버튼 클릭시 end -->
	</div>

		<!-- jquery start -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/admin_assets/js/member.js"></script>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script type="text/javascript">
		$(function(){
			$("#user_birthdate").pickadate({
				 formatSubmit: 'yyyy/mm/dd',
				  hiddenName: true,
				  selectMonths:true,
				  selectYears:200,
			});
			$(document).on("click","#sample6_execDaumPostcode",function(){
	      		 new daum.Postcode({
	           oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	               // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	               // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	               var fullAddr = ''; // 최종 주소 변수
	               var extraAddr = ''; // 조합형 주소 변수

	               // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	               if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                   fullAddr = data.roadAddress;

	               } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                   fullAddr = data.jibunAddress;
	               }

	               // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
	               if(data.userSelectedType === 'R'){
	                   //법정동명이 있을 경우 추가한다.
	                   if(data.bname !== ''){
	                       extraAddr += data.bname;
	                   }
	                   // 건물명이 있을 경우 추가한다.
	                   if(data.buildingName !== ''){
	                       extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                   }
	                   // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
	                   fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
	               }

	               // 우편번호와 주소 정보를 해당 필드에 넣는다.
	               document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
	               document.getElementById('sample6_address').value = fullAddr;

	               // 커서를 상세주소 필드로 이동한다.
	               document.getElementById('sample6_address2').focus();
	           }
	       }).open();
	   });			
			$(".modal").on("hidden.bs.modal",function(e){
				//모달창 내의 내용을 강제로 지움.
				$(this).removeData('bs.modal');
			});
			$(document).on("submit","#update_form",function(e) {
				e.preventDefault();

				//AjaxForm 플러그인의 강제 호출
				$(this).ajaxSubmit(function(json) {
							if (json.rt != "OK") {
								alert(json.rt);
								return false;
							}
							//덧글 수정 모달 강제로 닫기
							$("#update_box_modal").modal('hide');
						});
			});
			$(document).on("submit","#insert_form",function(e) {
				e.preventDefault();

				//AjaxForm 플러그인의 강제 호출
				$(this).ajaxSubmit(function(json) {
							if (json.rt != "OK") {
								alert(json.rt);
								return false;
							}
							//덧글 수정 모달 강제로 닫기
							$("#insert_box_modal").modal('hide');
						});
			});
	});
		</script>
		<!-- jquery end -->
	</body>
</html>
