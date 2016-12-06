<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<%@include file="inc/head.jsp" %>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/delivery.css">
		
		<style type="text/css">

		</style>
		<%@include file="inc/picker.jsp" %>
		<script type="text/javascript">
		$(function(){
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
<%@include file="inc/top_nav.jsp" %>

<!-- 본문내용 작성 start -->
			<div id="content">
				<h2>마이페이지 |</h2><h3 style="color:gray; padding-left:10px;">주문/배송조회</h3>
				<hr/>

				<!--달력 / 기간 설정 구간 -->
				<div class="day">
					<form method="get" action="${pageContext.request.contextPath }/delivery.do">
						<div class="select_day">
						<h4>기간 선택</h4>
						<button type="button" id="today">오늘</button>
						<button type="button" id="week">1주일</button>
						<button type="button" id="month">1개월</button>
						<input type="date" id="date_prev" name="date_prev" value="${order.prevDate }"/> ~
						<input type="date" id="date_next" name="date_next" value="${order.nextDate }"/>
						<br/>
						<h4>주문 상품</h4>
						<input type="text" name="search_item" id="search_item" value="${order.proName }"/>
						<select name="category">
  					<option value="">전체</option>
  					<c:choose>
						<c:when test="${order.recState =='입금대기' }">
						<option value="입금대기" selected>입금대기</option>
						</c:when>
						<c:otherwise>
						<option value="입금대기">입금대기</option>
						</c:otherwise>
						</c:choose>
						<c:choose>
						<c:when test="${order.recState =='결제완료' }">
						<option value="결제완료" selected>결제완료</option>
						</c:when>
						<c:otherwise>
						<option value="결제완료">결제완료</option>
						</c:otherwise>
						</c:choose>
						<c:choose>
						<c:when test="${order.recState =='배송준비중' }">
						<option value="배송준비중" selected>배송준비중</option>
						</c:when>
						<c:otherwise>
						<option value="배송준비중">배송준비중</option>
						</c:otherwise>
						</c:choose>
						<c:choose>
						<c:when test="${order.recState =='배송완료' }">
						<option value="배송완료" selected>배송완료</option>
						</c:when>
						<c:otherwise>
						<option value="배송완료">배송완료</option>
						</c:otherwise>
						</c:choose>
						</select>
						<button type="submit">검색</button><br/>
						
					</div>
					</form>
				</div>
				<!-- 달력 / 기간 설정 구간 end -->

				<!-- 주문 상황 -->
				<div class="situation">
					<ul>
					<li>입금대기 : ${prevPay }건</li>
					<li>결제완료 : ${nextPay }건</li>
					<li>배송준비중 : ${prevDelivery }건</li>
					<li>배송완료 : ${nextDelivery }건</li>
					</ul>
				</div>
				<!-- 주문 상황 end -->

				<!--주문 내역 테이블 -->
				<div class="table">
					<table>
						<colgroup>
							<col width="8%"/>
							<col width="10%"/>
							<col width="60%"/>
							<col width="7%"/>
							<col width="8%"/>
							<col width="7%"/>
						</colgroup>
						<thead>
							<tr>
								<td>주문번호<br/>(주문일자)</td>
								<td>총 결제 금액<br/>(배송비 포함)</td>
								<td>상품명</td>
								<td>상품 가격</td>
								<td>상품 수량</td>
								<td>주문 상태</td>
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
		<td colspan="10" class="text-center" style="line-height:100px;">
		조회된 글이 없습니다.</td>
		</tr>		
		</c:otherwise>
		</c:choose>
						</tbody>
					</table>
					<!--게시판 이동 버튼 start -->
					<!-- 페이지 번호 시작 -->
<%@include file="inc/order_page.jsp" %>
<!-- //페이지 번호 끝 -->
					<!--게시판 이동 버튼 end -->
				</div>
				<!--주문 내역 테이블 end -->
			</div>
<!--본문내용 작성 end -->

<%@include file="inc/footer.jsp" %>
	</body>
</html>
