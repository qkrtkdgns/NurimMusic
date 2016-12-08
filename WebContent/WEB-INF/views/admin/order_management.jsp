<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="inc/head.jsp"%>
<%@ include file="inc/layout.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/admin_assets/css/member.css" />
<style type="text/css">
#dropdown, #search_item, #submit_bt {
	margin-top: 0;
	height: 30px;
	display: block;
	float: left;
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
					<form method="get"
						action="${pageContext.request.contextPath }/admin/order_management.do">
						<div id="date_box" style="margin-left: 200px;">
							<b>검색기간</b> <input type="date" name="date_prev" id="date_prev"
								value="${order.prevDate }" class="form-control" /> <b>~</b> <input
								type="date" name="date_next" id="date_next"
								value="${order.nextDate }" class="form-control" />
						</div>
						<div id="search_form">
							<select name="category" id="dropdown">

								<option value="">진행상태</option>
								<c:forEach var="state" items="${state }">
									<c:if test="${state eq order.recState }">
										<option value="${state }" selected>${state }</option>
									</c:if>
									<c:if test="${state ne order.recState }">
										<option value="${state }">${state }</option>
									</c:if>
								</c:forEach>
							</select> <input type="text" name="search_item" id="search_item"
								value="${order.proName }" placeholder="검색어를 입력하세요." />
							<button type="submit" id="submit_bt">검색</button>
						</div>
					</form>
				</div>
				<!--검색 end -->

				<!-- 테이블 start -->
				<form method="get"
					action="${pageContext.request.contextPath }/admin/order_management_delete.do">
					<div id="items">
						<table>
							<colgroup>
								<col style="width: 50px;">
								<col style="width: 100px;">
								<col style="width: 100px;">
								<col style="width: 80px;">
								<col style="width: 200px;">
								<col style="width: 50px;">
								<col style="width: 100px;">
								<col style="width: 200px;">
								<col style="width: 50px;">
								<col style="width: 70px;">
							</colgroup>
							<thead>
								<tr>
									<th><input type="checkbox" id="all_check" /></th>
									<th>주문번호</th>
									<th>수령자 이름</th>
									<th>이미지</th>
									<th>상품명(상품번호)</th>
									<th>수량</th>
									<th>주문금액</th>
									<th>배송지 주소</th>
									<th>연락처</th>
									<th>진행상태</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${fn:length(orderList) > 0}">
										<c:forEach var="order" items="${orderList }">
											<tr>
												<td><input type="checkbox" name="checkbox"
													class="item_checked" id="id" value="${order.id }" /></td>
												<td>${order.regDate}-${order.id }</td>
												<td>${order.recName}</td>
												<td>
												<c:choose>
														<c:when test="${order.proImg != null}">
															<c:url var="downloadUrl" value="/download.do">
																<c:param name="file" value="${order.proImg}" />
															</c:url>
															<img src="${downloadUrl}" />
														</c:when>
														<c:otherwise>
															<img
																src="${pageContext.request.contextPath}/assets/img/no_image.jpg"
																/>
														</c:otherwise>
													</c:choose>
												</td>
												<td>${order.proName}</td>
												<td>${order.oAmount}</td>
												<td>${order.proPrice}</td>
												<td>${order.recPostcode}<br /> ${order.recAddr1 }<br />
													${order.recAddr2 }
												</td>
												<td>${order.recTel }</td>
												<td>
												<select class="state">
												<c:forEach var="state" items="${state }">
														<c:if test="${state eq order.recState }">
															<option value="${state }" selected>${state }</option>
														</c:if>
														<c:if test="${state ne order.recState }">
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
						<%@include file="/WEB-INF/views/admin/inc/order_page.jsp"%>
					</div>
					<!-- 버튼 start -->
					<div id="bt_box">
						<input type="hidden" name="count" id="count" value="0" />
						<button id="delete" type="submit">삭제</button>
					</div>
					<!-- 버튼 end -->
					<!-- 테이블 end -->
				</form>
			</div>


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
				
				$.get("${pageContext.request.contextPath}/admin/order_management_update.do",{
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
