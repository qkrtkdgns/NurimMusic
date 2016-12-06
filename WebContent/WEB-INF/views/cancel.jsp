<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="inc/head.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/delivery.css">

<style type="text/css">
</style>

<%@include file='inc/picker.jsp'%>
<script type="text/javascript">
	$(function() {
		 var date = new Date();
		 var date2 = new Date();

		 //현재
		 $("#today").click(function(){
			$("#date_prev").val(pad(date.getFullYear())+'-'+pad((date.getMonth()+1))+'-'+pad(date.getDate()));
			$("#date_next").val(pad(date.getFullYear())+'-'+pad((date.getMonth()+1))+'-'+pad(date.getDate()));
			return false;
		 });
		 $("#week").click(function(){
			 date2.setDate(date.getDate()-7);
				$("#date_prev").val(pad(date2.getFullYear())+'-'+pad((date2.getMonth()+1))+'-'+pad(date2.getDate()));
				$("#date_next").val(pad(date.getFullYear())+'-'+pad((date.getMonth()+1))+'-'+pad(date.getDate()));
				date2=new Date();
				return false;
			 });
		 $("#month").click(function(){
			 date2.setMonth(date.getMonth()-1);
				$("#date_prev").val(pad(date2.getFullYear())+'-'+pad((date2.getMonth()+1))+'-'+pad(date2.getDate()));
				$("#date_next").val(pad(date.getFullYear())+'-'+pad((date.getMonth()+1))+'-'+pad(date.getDate()));
				date2=new Date();
				return false;
			 });
		 
		 function pad(numb) {
			    return (numb < 10 ? '0' : '') + numb;
			}
		 });
</script>
</head>
<body>
	<%@include file="inc/top_nav.jsp"%>

	<!-- 본문내용 작성 start -->
	<div id="content">
		<h2>마이페이지 |</h2>
		<h3 style="color: gray; padding-left: 10px;">주문취소/교환/반품조회</h3>
		<hr />

		<!--달력 / 기간 설정 구간 -->
		<div class="day">
			<form method="get"
				action="${pageContext.request.contextPath }/cancel.do">
				<div class="select_day">
					<h4>기간 선택</h4>
					<button id="today">오늘</button>
					<button id="week">1주일</button>
					<button id="month">1개월</button>
					<input type="text" name="date_prev" id="date_prev" value="${order.prevDate }" /> ~ 
					<input type="text" name="date_next" id="date_next" value="${order.nextDate }" />
					<button>검색</button>
					<br />
					<h4>주문 상품</h4>
					<input type="text" name="search_item" id="search_item" value="${order.proName }" /> 
					<select
						name="category">
						<option value="">전체</option>
						<c:choose>
						<c:when test="${order.recState =='주문취소' }">
						<option value="주문취소" selected>주문취소</option>
						</c:when>
						<c:otherwise>
						<option value="주문취소">주문취소</option>
						</c:otherwise>
						</c:choose>
						<c:choose>
						<c:when test="${order.recState =='교환' }">
						<option value="교환" selected>교환</option>
						</c:when>
						<c:otherwise>
						<option value="교환">교환</option>
						</c:otherwise>
						</c:choose>
						<c:choose>
						<c:when test="${order.recState =='반품' }">
						<option value="반품" selected>반품</option>
						</c:when>
						<c:otherwise>
						<option value="반품">반품</option>
						</c:otherwise>
						</c:choose>
					</select>
				</div>
			</form>
		</div>
		<!-- 달력 / 기간 설정 구간 end -->

		<!-- 주문 상황 -->
		<div class="situation">
			<ul>
				<li>주문취소 : ${cancel }건</li>
				<li>교환 : ${change }건</li>
				<li>반품 : ${reaper }건</li>
			</ul>
		</div>
		<!-- 주문 상황 end -->

		<!--주문 내역 테이블 -->
		<div class="table">
			<table>
				<colgroup>
					<col width="8%" />
					<col width="10%" />
					<col width="60%" />
					<col width="7%" />
					<col width="8%" />
					<col width="7%" />
				</colgroup>
				<thead>
					<tr>
						<td>요청일시<br />/취소주문번호
						</td>
						<td>취소결제<br />(예상)금액
						</td>
						<td>상품명</td>
						<td>상품 가격</td>
						<td>상품 수량</td>
						<td>처리 상태</td>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${fn:length(orderList) > 0}">
							<c:forEach var="order" items="${orderList }">
								<tr>
									<td>${order.id }</td>
									<td>${order.proPrice * order.oAmount }원</td>
									<td>${order.proName }</td>
									<td>${order.proPrice }원</td>
									<td>${order.oAmount }</td>
									<td>${order.recState }</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="10" class="text-center" style="line-height: 100px;">
									조회된 글이 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<!--게시판 이동 버튼 start -->
			<%@include file="inc/order_page2.jsp" %>
			<!--게시판 이동 버튼 end -->
		</div>
		<!--주문 내역 테이블 end -->
	</div>
	<!--본문내용 작성 end -->

	<%@include file="inc/footer.jsp"%>




</body>
</html>
