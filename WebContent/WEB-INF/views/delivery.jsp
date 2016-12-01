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
			 var year  = date.getFullYear();
		     var month = date.getMonth() + 1; // 0부터 시작하므로 1더함 더함
		     var day   = date.getDate();
		     if(month< 10){ 
		    	  month = "0" + month; 
		    	} 
		    	if(day< 10){ 
		    	  day = "0" + day; 
		    	} 
			$("#today").click(function(){
			$("#date_prev").val(year+'-'+month+'-'+day);
			$("#date_next").val(year+'-'+month+'-'+day);
			return false;
			});
			$("#week").click(function(){
				week_year=year;
				week_month = month;
				week_day = day;
				$("#date_next").val(year+'-'+month+'-'+day);
				if(day-7 < 1){
					if(month-1<1){
					week_year=year-1;
					week_month=month+11;
					}else{
					week_month= month-1;	
					}
					if(week_month/2==1){
					week_day=31-date.getDate()-7;
					}else if(week_month==1){
						week_day=28-date.getDate()-7;
					}else{
						week_day=30-date.getDate()-7;
					}
				}else{
					week_day=day-7;
				}
				$("#date_prev").val(week_year+'-'+week_month+'-'+week_day);
				return false;
				});
			$("#month").click(function(){
				$("#date_next").val(year+'-'+month+'-'+day);
				month_year=year;
				month_month = month;
				month_day = day;
				if(month-1<1){
					month_year=year-1;
					month_month=month+11;
					}else{
					month_month= month-1;	
					}
				$("#date_prev").val(month_year+'-'+month_month+'-'+month_day);
				return false;
				});
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
						<input type="text" id="date_prev" name="date_prev" value="${order.prevDate }"/> ~
						<input type="text" id="date_next" name="date_next" value="${order.nextDate }"/>
						<br/>
						<h4>주문 상품</h4>
						<input type="text" name="search_item" id="search_item" value="${order.proName }"/>
						<select name="category">
  					<option value="">전체</option>
  					<option value="입금대기">입금대기</option>
  					<option value="결제완료">결제완료</option>
  					<option value="배송준비중">배송준비중</option>
						<option value="배송완료">배송완료</option>
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
