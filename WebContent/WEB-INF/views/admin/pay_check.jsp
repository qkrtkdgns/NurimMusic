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
	<div id="member">
	<!--검색 start -->
	<div id="search">
	<form>
	<select id="dropdown">
	<option value="검색조건">검색조건</option>
	<option value="아이디">아이디</option>
	<option value="제목">내용</option>
	<option value="내용">카테고리</option>
	</select>
	<input type="text" name="search_item" id="search_item" placeholder="검색어를 입력하세요." />
	<button type="submit" id="submit_bt">검색</button>
	</form>
	</div>
	<!--검색 end -->

	<!-- 테이블 start -->
	<div id="items">
	<table>
	<colgroup>
		<col style="width:100px;">
		<col style="width:100px;">
		<col style="width:400px;">
		<col style="width:200px;">
	</colgroup>
	<thead>
	<tr>
	<th>글번호</th>
	<th>아이디</th>
	<th>내용</th>
	<th>입금확인</th>
	</tr>
	</thead>
	<tbody>
	<c:choose>
	<c:when test="${fn:length(commentList) > 0}">
										<c:forEach var="c" items="${commentList}" varStatus="i">
											<tr>
											<td><input type="hidden" id="id" value="${c.id }"/>${i.index + (fn:length(commentList)*pageHelper.page-2)}</td>
											<td>${c.userId }</td>
											<td>${c.content }</td>
											<td>
												<select class="state">
												<c:forEach var="state" items="${state }">
														<c:if test="${state eq c.payCheck }">
															<option value="${state }" selected>${state }</option>
														</c:if>
														<c:if test="${state ne c.payCheck }">
															<option value="${state }">${state }</option>
														</c:if>
													</c:forEach>
													</select>
													</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="10" class="text-center"
												style="line-height: 100px;">조회된 글이 없습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>
	</tbody>
	</table>
	<%@include file="/WEB-INF/views/admin/inc/pay_check_page.jsp"%>
	</div>
	<!-- 테이블 end -->
	</div>
	<!-- 버튼 start -->
	
	<!-- 버튼 end -->
	<!-- 컨텐츠 영역 end -->
	</div>
	</div>

		<!-- jquery start -->
		<script type="text/javascript">
		$(function() {
			$("input[name=checkbox]:checkbox").click(function() {
				var cnt = $("input[name=checkbox]:checkbox:checked").length;
				$("#count").val(cnt);
			});
			
			$(".state").change(function(){
				var change = $(this).val();
				var id = $(this).parents("tr").find("#id").val();
				
				$.get("${pageContext.request.contextPath}/admin/pay_check_update.do",{
					change:change,
					id:id
				},function(){
					alert("수정완료");
					location.reload(); 
					},"text");
			});
		});
	</script>
		<!-- jquery end -->
	</body>
</html>
