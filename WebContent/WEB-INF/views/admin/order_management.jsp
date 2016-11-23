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
		#dropdown, #search_item, #submit_bt{
	margin-top: 0;
	height:30px;
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
	<form>
	<div id="filter_box"><b>처리상태&nbsp;</b>
	<select id="filter">
	<option value="거래완료">거래완료</option>
	<option value="결제대기">결제대기</option>
	<option value="결제취소">결제취소</option>
	<option value="결제완료">결제완료</option>
	<option value="배송중">배송중</option>
	</select>
	</div>
	<div id="date_box"><b>검색기간</b>
	<input type="text" id="date_prev" class="form-control" /> <b>~</b>
	<input type="text" id="date_next" class="form-control" />
	</div>
	<div id="search_form">
	<select id="dropdown">
	<option value="검색조건">검색조건</option>
	<option value="주문번호">주문번호</option>
	<option value="상품명">상품명</option>
	<option value="주문자명">주문자명</option>

	</select>
	<input type="text" name="search_item" id="search_item" placeholder="검색어를 입력하세요." />
	<button type="submit" id="submit_bt">검색</button>
	</div>
	</form>
	</div>
	<!--검색 end -->

	<!-- 테이블 start -->
	<div id="items">
	<table>
	<colgroup>
		<col style="width:50px;">
		<col style="width:100px;">
		<col style="width:100px;">
		<col style="width:80px;">
		<col style="width:200px;">
		<col style="width:50px;">
		<col style="width:100px;">
		<col style="width:200px;">
		<col style="width:50px;">
		<col style="width:70px;">
	</colgroup>
	<thead>
	<tr>
	<th><input type="checkbox" id="all_check" /></th>
	<th>주문번호</th>
	<th>주문자 아이디</th>
	<th>이미지</th>
	<th>상품명(상품번호)</th>
	<th>수량</th>
	<th>주문금액</th>
	<th>주소</th>
	<th>연락처</th>
	<th>진행상태</th>
	</tr>
	</thead>
	<tbody>
	<tr>
	<td><input type="checkbox" class="item_checked"/></td>
	<td>20161020-001</td>
	<td>qkrtkd12</td>
	<td><img src="${pageContext.request.contextPath}/admin_assets/img/마마무.jpg" /></td>
	<td>마마무 (MAMAMOO) - MEMORY (4TH 미니앨범)</td>
	<td>5개</td>
	<td>11,100원</td>
	<td>서울 강남구 학동로 426 강남구청</td>
	<td>010-1234-1234</td>
	<td>결제대기</td>
	</tr>
	<tr>
	<td><input type="checkbox" class="item_checked"/></td>
	<td>20161020-001</td>
	<td>qkrtkd12</td>
	<td><img src="${pageContext.request.contextPath}/admin_assets/img/탑독.jpg" /></td>
	<td>탑독 (TOPPDOGG) - 1집 [FIRST STREET]</td>
	<td>5개</td>
	<td>11,100원</td>
	<td>주소</td>
	<td>010-1234-1234</td>
	<td>결제대기</td>
	</tr>
	<tr>
	<td><input type="checkbox" class="item_checked"/></td>
	<td>20161020-001</td>
	<td>qkrtkd12</td>
	<td><img src="${pageContext.request.contextPath}/admin_assets/img/아스트로.jpg" /></td>
	<td>아스트로 (ASTRO) - AUTUMN STORY (3RD 미니앨범) (B 버전, 오렌지)</td>
	<td>5개</td>
	<td>11,100원</td>
	<td>서울특별시 강남구 선릉로131길 18 동인빌딩 1층</td>
	<td>010-1234-1234</td>
	<td>결제대기</td>
	</tr>
	<tr>
	<td><input type="checkbox" class="item_checked"/></td>
	<td>20161020-001</td>
	<td>qkrtkd12</td>
	<td><img src="${pageContext.request.contextPath}/admin_assets/img/강타.jpg" /></td>
	<td>강타 - ‘HOME’ CHAPTER 1 (미니앨범)</td>
	<td>5개</td>
	<td>11,100원</td>
	<td>주소</td>
	<td>010-1234-1234</td>
	<td>결제대기</td>
	</tr>
	</tbody>
	</table>
	</div>
	<!-- 테이블 end -->
	</div>
	<!-- 버튼 start -->
	<div id="bt_box">
	<button id="delete">삭제</button>
	</div>
	<!-- 버튼 end -->
	<!-- 컨텐츠 영역 end -->
	</div>
	</div>




		<!-- jquery start -->
		<script type="text/javascript">
		$(function(){
			$("#date_prev").pickadate();
			$("#date_next").pickadate();
		});
		</script>
		<!-- jquery end -->
	</body>
</html>
