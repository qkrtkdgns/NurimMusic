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
		table > tbody > tr > td{
			max-width: 150px !important;
			white-space: nowrap !important;
			overflow: hidden !important;
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
	<form method="get" action="${pageContext.request.contextPath }/admin/user_review.do">
	<div id="member">
	<!--검색 start -->
	<div id="search">
	<select id="dropdown">
	<option value="검색조건">검색조건</option>
	<option value="아이디">아이디</option>
	<option value="제목">제목</option>
	<option value="내용">내용</option>
	</select>
	<input type="text" name="keyword" id="search_item" placeholder="검색어를 입력하세요." value="${keyword }" />
	<button type="submit" id="submit_bt">검색</button>
	</div>
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
		<col style="width:350px;">
		<col style="width:100px;">
		<col style="width:100px;">
	</colgroup>
	<thead>
	<tr>
	<th><input type="checkbox" id="all_check" /></th>
	<th>글번호</th>
	<th>아이디</th>
	<th>제목</th>
	<th>내용</th>
	<th>작성일</th>
	<th>조회수</th>
	</tr>
	</thead>
	<tbody>
	<c:choose>
		<c:when test="${fn:length(documentList) > 0}">
		<c:forEach var="document" items="${documentList }">
		<tr>
		<td><input type="checkbox" class="item_checked" name="check" value="${document.id }" /></td>
		<td>${document.id}</td>		
		<td>${document.memberId}</td>
		<td>
			<c:url var="readUrl" value="/Review_write_result.do">
				<c:param name="category" value="${document.category }" />
				<c:param name="document_id" value="${document.id }" />
			</c:url>
			<a href="${readUrl }" style="color:black;">${document.subject }</a>
		</td>
		<td>${document.content}</td>
		<td>${document.regDate}</td>
		<td>${document.hit}</td>
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
	</div>
	<!-- 테이블 end -->
	<!-- 버튼 start -->
	<div id="bt_box">
	<button type="submit" id="delete">삭제</button>
	</div>
	</form>
	</div>
	<!-- 버튼 end -->
	<!-- 컨텐츠 영역 end -->
	
	<!-- 페이지 번호 시작 -->
		<nav class="text-center">
			<ul class="pagination">
				<!-- 이전 그룹으로 이동 -->
				<c:choose>
					<c:when test="${pageHelper.prevPage > 0 }">
					<!-- 이전 그룹에 대한 페이지 번호가 존재한다면? -->
					<!-- 이전 그룹으로 이동하기 위한 URL을 생성하여 "prevUrl"에 저장 -->
					<c:url var="prevUrl" value="/admin/info_list.do">
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
					<c:url var="pageUrl" value="/admin/info_list.do">
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
						<c:url var="nextUrl" value="/admin/info_list.do">
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

		<!-- jquery start -->
		<script type="text/javascript">
		$(function(){
			$("#update").click(function(){
				$("#update_box").css("visibility","visible")
			});
			$("#insert").click(function(){
				$("#insert_box").css("visibility","visible")
			});
			$(".cancel").click(function(){
				$("#update_box").css("visibility","hidden")
				$("#insert_box").css("visibility","hidden")
				return false;
			})
			/**ì²´í¬ë°ì¤ íì¤í¸ ì¤
			$("input[type='checkbox']").click(function(){
			var check = $(this).is(":checked");
			if(check==true){
				$(this).parents("tr").css("background","gray");
			}else{
				$(this).parents("tr").css("background","white");
			}
			var no = $(this).parents("tr").find("td:nth-child(2)").text();
			alert(no);
			});
			**/
		});
		</script>
		<!-- jquery end -->
	</body>
</html>
