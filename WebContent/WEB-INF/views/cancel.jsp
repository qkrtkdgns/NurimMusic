<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html lang="ko">
	<head>
		 <%@include file="inc/head.jsp" %>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/delivery.css">
		
		<style type="text/css">
		
		</style>

		<%@include file='inc/picker.jsp' %>
		<script type="text/javascript">
		$(function(){
			$("#date_prev").pickadate();
			$("#date_next").pickadate();
		});
		</script>
	</head>
	<body>
<%@include file="inc/top_nav.jsp" %>

<!-- 본문내용 작성 start -->
			<div id="content">
				<h2>마이페이지 |</h2><h3 style="color:gray; padding-left:10px;">주문취소/교환/반품조회</h3>
				<hr/>

				<!--달력 / 기간 설정 구간 -->
				<div class="day">
					<form>
						<div class="select_day">
						<h4>기간 선택</h4>
						<button>오늘</button>
						<button>1주일</button>
						<button>1개월</button>
						<button>3개월</button>
						<button>6개월</button>
						<input type="text" id="date_prev" class="form-control" /> ~
						<input type="text" id="date_next" class="form-control" />
						<button>검색</button><br/>
						<h4>주문 상품</h4>
						<input type="text" id="search_item" />
						<select>
  					<option value="전체">전체</option>
  					<option value="주문취소">주문취소</option>
  					<option value="교환">교환</option>
  					<option value="반품">반품</option>
						</select>
					</div>
					</form>
				</div>
				<!-- 달력 / 기간 설정 구간 end -->

				<!-- 주문 상황 -->
				<div class="situation">
					<ul>
					<li>주문취소 : 1건</li>
					<li>교환 : 0건</li>
					<li>반품 : 0건</li>
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
								<td>요청일시<br/>/취소주문번호</td>
								<td>취소결제<br/>(예상)금액</td>
								<td>상품명</td>
								<td>상품 가격</td>
								<td>상품 수량</td>
								<td>처리 상태</td>
							</tr>
						</thead>
						<tbody>
							
							<tr>
								<td>20161011</td>
								<td>34,000원</td>
								<td>가을[배송비 무료]젓가락 행진곡 특가</td>
								<td>34,000원</td>
								<td>1</td>
								<td>입금대기</td>
								<tr>
						</tbody>
					</table>
					<!--게시판 이동 버튼 start -->
					<div class="text-center">
					<ul class="pagination pagination-mf">
					<li class="disabled"><a href="#">&laquo;</a></li>
					<li class="active"><span>1<span class="sr-only">(current)</span></span></li>
					<li><a href="#">2</a></li>
					<li><a href="#">&raquo;</a></li>
					</ul>
					</div>
					<!--게시판 이동 버튼 end -->
				</div>
				<!--주문 내역 테이블 end -->
			</div>
<!--본문내용 작성 end -->

<%@include file="inc/footer.jsp" %>




	</body>
</html>
