<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<%@ include file="inc/head.jsp"%>
		<%@ include file="inc/layout.jsp"%>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin_assets/css/one_one.css" />
<script src="//cdn.tinymce.com/4/tinymce.min.js"></script>
  <script>tinymce.init({ selector:'textarea' });</script>
	</head>
	<body>
	<div id="container">
	<div id="top">
	<a href="main.html">Admin</a>
	</div>
	<%@ include file="inc/category.jsp"%>

	<!-- 컨텐츠 영역 start -->
	<div id="content">
	<div id="member">
	
	<!--검색 start -->
	<div id="search">
	<form method="get" action="${pageContext.request.contextPath }/admin/one_one.do">
	<select name="dropdown" id="dropdown">
	<option value="">검색조건</option>
	<c:choose>
	<c:when test="${dropdown =='제목' }">
	<option value="제목" selected>제목</option>
	</c:when>
	<c:otherwise>
	<option value="제목">제목</option>
	</c:otherwise>
	</c:choose>
	<c:choose>
	<c:when test="${dropdown =='내용' }">
	<option value="내용" selected>내용</option>
	</c:when>
	<c:otherwise>
	<option value="내용">내용</option>
	</c:otherwise>
	</c:choose>
	</select>
	
	<input type="text" name="keyword" id="search_item" placeholder="검색어를 입력하세요." value="${keyword }" />
	<button type="submit" id="submit_bt">검색</button>
	</form>
	</div>
	<!--검색 end -->

	<!-- 테이블 start -->
	<div id="items">
	<table>
	<colgroup>
		<col style="width:50px;">
		<col style="width:50px;">
		<col style="width:100px;">
		<col style="width:100px;">
		<col style="width:300px;">
		<col style="width:80px;">
		<col style="width:100px;">
	</colgroup>
	<thead>
	<tr>
	<th>문의번호</th>
	<th>아이디</th>
	<th>문의 유형</th>
	<th>제목</th>
	<th>문의/답변 내용</th>
	<th>문의/답변 날짜</th>
	<th>답변 상태</th>
	</tr>
	</thead>
	<tbody>
	<c:choose>
		<c:when test="${fn: length(documentList) > 0 }">
			<c:forEach var="document" items="${documentList }" varStatus="i">
	<tr>
	<td>${(pageHelper.totalCount-(pageHelper.page-1)*pageHelper.listCount)-i.index }</td>
	<c:choose>
	<c:when test="${document.qnaType ne '답변'}">
	<td>${document.memberId }</td>
	</c:when>
	<c:otherwise>
	<td>Admin</td>
	</c:otherwise>
	</c:choose>
	<td>${document.qnaType }</td>
	<td><i style="display:inline-block; width:100px; line-height:40px; height:40px; white-space:nowrap; overflow:hidden; text-overflow:ellipsis;">${document.subject }</i></td>
	<td>
	<i style="display:inline-block; width:300px; line-height:40px; height:40px; white-space:nowrap; overflow:hidden; text-overflow:ellipsis;">${document.content }
	</i></td>
	<c:choose>
	<c:when test="${document.qnaType ne '답변'}">
	<td>${document.regDate}</td>
	</c:when>
	<c:otherwise>
	<td>${document.editDate }</td>
	</c:otherwise>
	</c:choose>
	<td>
	<c:choose>
	<c:when test="${document.qnaType eq '답변' }">
	<a id="answer" class="btn" href='${pageContext.request.contextPath}/admin/one_one_answer.do?id=${document.id}' data-toggle="modal" data-target="#answer_box_modal">
	<button class="answer" type="button" style="width:64px; height:24px; color:black; font-size:12px;">답변작성</button></a>
	</c:when>
	<c:otherwise>
	<i class="answer_end"></i>
	</c:otherwise>
	</c:choose>
	</td>
	</tr>
			</c:forEach>
			</c:when>
		<c:otherwise>
			<tr>
				<td colspan="8" class="text-center" style="line-height:100px;">
					조회된 글이 없습니다. </td>
			</tr>
		</c:otherwise>
	</c:choose>
	</tbody>
	</table>
		<!-- 페이지 번호 시작 -->
		<nav class="text-center">
			<ul class="pagination">
				<!-- 이전 그룹으로 이동 -->
				<c:choose>
					<c:when test="${pageHelper.prevPage > 0 }">
					<!-- 이전 그룹에 대한 페이지 번호가 존재한다면? -->
					<!-- 이전 그룹으로 이동하기 위한 URL을 생성하여 "prevUrl"에 저장 -->
					<c:url var="prevUrl" value="/admin/one_one.do">
						<c:param name="category" value="${category }"></c:param>
						<c:param name="keyword" value="${keyword }"></c:param>
						<c:param name="page" value="${pageHelper.prevPage }"></c:param>
					</c:url>
					
					<li><a href="${pageUrl }">&laquo;</a></li>
					</c:when>
				
				<c:otherwise>
					<!-- 이전 그룹에 대한 페이지 번호가 존재하지 않는다면? -->
					<li class='disabled'><a href="#">&laquo;</a></li>
				</c:otherwise>
				</c:choose>
				
				<!-- 페이지 번호 -->
				<!-- 현재 그룹의 시작페이지-끝페이지 사이를 1씩 증가하면서 반복 -->
				<c:forEach var="i" begin="${pageHelper.startPage}" end="${pageHelper.endPage }" step="1">
					
					<!-- 각 페이지 번호로 이동할 수 있는 URL을 생성하여 page_url에 저장 -->
					<c:url var="pageUrl" value="/admin/one_one.do">
						<c:param name="category" value="${category }"></c:param>
						<c:param name="keyword" value="${keyword }"></c:param>
						<c:param name="page" value="${i }"></c:param>
					</c:url>
					
					<!-- 반복 중의 페이지 번호와 현재 페이지 번호가 같은 경우에 대한 분기 -->
					<c:choose>
						<c:when test="${pageHelper.page == i }">
							<li class='active'><a href="#">${i}</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${pageUrl }">${i }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<!-- 다음 그룹으로 이동 -->
				<c:choose>
					<c:when test="pageHelper.nextPage > 0">
						<!-- 다음 그룹에 대한 페이지 번호가 존재한다면? -->
						<!-- 다음 그룹으로 이동하기 위한 URL을 생성해서 "nextUrl"에 저장 -->
						<c:url var="nextUrl" value="/admin/one_one.do">
							<c:param name="category" value="${category }"></c:param>
							<c:param name="keyword" value="${keyword }"></c:param>
							<c:param name="page" value="${pageHelper.nextPage }"></c:param>
						</c:url>
						
						<li><a href="${nextUrl }">&raquo;</a></li>
					</c:when>
					
					<c:otherwise>
						<!-- 이전 그룹에 대한 페이지 번호가 존재하지 않는다면? -->
						<li class='disabled'><a href="#">&raquo;</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</nav>
		<!-- 페이지 번호 끝 -->
	
	</div>
	<!-- 테이블 end -->
	</div>
	<!-- 컨텐츠 영역 end -->
	</div>

	</div>
	<!-- 답변 버튼 클릭시 start -->
	<div class="modal fade" id="answer_box_modal">
<div class="modal-dialog modal-md">
<div class="modal-content">
</div></div></div>
	<!-- 답변 버튼 클릭시 end -->
	

		<!-- jquery start -->
		<script type="text/javascript">
		$(function(){
			$(".modal").on("hidden.bs.modal",function(e){
				//모달창 내의 내용을 강제로 지움.
				$(this).removeData('bs.modal');
				
			});
			$(document).on("submit","#answer_form",function(e) {
				e.preventDefault();

				//AjaxForm 플러그인의 강제 호출
				$(this).ajaxSubmit(function(json) {
							if (json.rt != "OK") {
								alert(json.rt);
								return false;
							}
							//덧글 수정 모달 강제로 닫기
							$("#answer_box_modal").modal('hide');
							location.reload(); 
						});
			});
			
			$(".answer_end").parents("tr").css("background","rgba(200,200,200,0.3)");

		});
		</script>
		<!-- jquery end -->
	</body>
</html>
