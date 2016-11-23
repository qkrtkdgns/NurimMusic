<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<%@include file="inc/head.jsp" %>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/mypage_alert.css" />
		<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/css/mypage.css" />
		
	</head>
	<body>
 <%@include file="inc/top_nav.jsp" %>

<!-- 본문내용 작성 start -->
			<div id="content">
				<h2>마이페이지 | </h2><h3 style="color:gray; padding-left:10px;">알림 신청내역</h3>
				<hr/>

				<form name="barket">
				<div class="barket">
					<div class="board">
					<table class="table table-striped table-hover">
						<colgroup>
							<col width="5%"/>
							<col width="65%"/>
							<col width="10%"/>
							<col width="5%"/>
							<col width="5%"/>
							<col width="5%"/>
							<col width="5%"/>
						</colgroup>
					<thead>
					<tr>
					<th class="text-center"><input type="checkbox" id="all_check" value="Y" /></th>
					<th class="text-center">상품명</th>
					<th class="text-center">현상태</th>
					<th class="text-center">신청일</th>
					<th class="text-center">상태</th>
					<th class="text-center">구분</th>
					<th class="text-center">목록삭제</th>
					</tr>
					</thead>
					<tbody>
						<tr>
							<th colspan="7" id="tab">알림 신청 상품</th>
						</tr>
					<tr class="item_tr">
					<td><input type="checkbox" class="item_checked"/></td>
					<td><a href="#"><img src="${pageContext.request.contextPath }/img/1.jpg" alt="상품">이런 상품입니다.</a></td>
					<td>판매일시중지</td>
					<td>2016.10.11</td>
					<td>미전송</td>
					<td>신청중</td>
					<td>
						<input type="button" class="btn btn-xs ruby" value="바로구매" /><br/>
					</td>
					</tr>
					</tbody>
					</table>
					</div>
				</div>
				<div>
					<input type="button" value="삭제" onclick="history.back(); return false;" class="btn purple">
					<div class="text-center">
					<ul class="pagination pagination-md">
					<li class="disabled"><a href="#">&laquo;</a></li>
					<li class="active"><span>1<span class="sr-only">(current)</span></span></li>
					<li><a href="#">2</a></li>
					<li><a href="#">&raquo;</a></li>
					</ul>
					</div>
					</div>
			</form>

</div>
<!--본문내용 작성 end -->

<%@include file="inc/footer.jsp" %>

	</body>
</html>
