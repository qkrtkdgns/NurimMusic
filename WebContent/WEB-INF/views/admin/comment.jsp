<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<%@ include file="inc/head.jsp"%>
		<%@ include file="inc/layout.jsp"%>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin_assets/css/member.css" />
		<style type="text/css">
		img{
			width:50px;
			height:auto;
		}
		.pagination{
		margin :auto;
		margin-top:40px;
		margin-right:15%;
		}
		#items{
		margin-top: 100px;
		}
		</style>

	</head>
	<body>
	<div id="container">
	<div id="top">
	<a href="main.html">Admin</a>
	</div>
	<%@ include file="inc/category.jsp"%>

	<!-- 컨텐츠 영역 start -->
	<div id="content">
	<form method="get" action="${pageContext.request.contextPath}/admin/comment.do">
	<div id="member">

	<!-- 테이블 start -->
	<div id="items">
	<table>
	<colgroup>
		<col style="width:50px;">
		<col style="width:50px;">
		<col style="width:50px;">
		<col style="width:80px;">
		<col style="width:200px;">
		<col style="width:150px;">
		<col style="width:150px;">
		<col style="width:100px;">
	</colgroup>
	<thead>
	<tr>
	<th><input type="checkbox" id="all_check" /></th>
	<th>글번호</th>
	<th>카테고리</th>
	<th>아이디</th>
	<th>내용</th>
	<th>작성일</th>
	<th>수정일</th>
	<th>삭제버튼</th>
	</tr>
	</thead>
	<tbody>
	
<c:choose>
	<c:when test="${fn:length(commentList) > 0}">
		<c:forEach var="comment" items="${commentList }">
	<tr>
	<td><input type="checkbox" class="item_checked"/></td>
	<td>${comment.id}</td>
	<td>${comment.category}</td>
	<td>${comment.userId}</td>
	<td>${comment.content}</td>
	<td>${comment.regDate}</td>
	<td>${comment.editDate}</td>
	<td><a href='${pageContext.request.contextPath}/admin/comment_delete.do?comment_id=${comment.id}' data-toggle="modal" data-target="#comment_delete_modal" class='btn-danger btn-xs'>
     삭제하기</a>
     <input type="hidden" name="comment_id" value="${comment.id}" />
     </td>
     
	</tr>
		</c:forEach>
	</c:when>
<c:otherwise>
	<tr>
		<td colspan="9" class="text-center"
					style="line-height: 100px;">조회된 글이 없습니다.</td>
		</tr>
</c:otherwise>
</c:choose>

	</tbody>
	</table>
	</div>
	<!-- 테이블 end -->
	
	</div>

	<!-- 컨텐츠 영역 end -->
	</form>
	</div>
	<%@ include file="inc/commnet_page.jsp" %>
	</div>
	
<!--Delete  Modal -->
<div class="modal fade" id="comment_delete_modal">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
		
	</div>
</div>
</div>
		<!-- jquery start -->
		<script type="text/javascript">
	$(function() {
	
		//모달이 창이 닫히는 경우의 이벤트
		//.modal 로 지정하는 경우 모든 모달 창에 적용됨
		//#아이디 로 지정하는 경우 특정 모달 창에 적용
		$(".modal").on("hidden.bs.modal",function(e){
			//내용 삭제
			$(this).removeData('bs.modal');
		});
		
		//ajax에 의해서 로드 되는 폼에 대한 submit 이벤트
		//ajax에 의해서 동적으로 로드 되는 요소는 on 함수를 통한
		//이벤트 정의가 요구된다.
	$(document).on('submit', '#comment_delete_form', function(e){
	e.preventDefault();
	$(this).ajaxSubmit(function(json) {
		if (json.rt != "OK") {
			alert(json.rt);
			return false;
		}
	
			alert("삭제되었습니다.");
			
			//모달창 종료
			$("#comment_delete_modal").modal('hide');
			location.reload();
		});
	});	
});

	
</script>
		<!-- jquery end -->
	</body>
</html>

