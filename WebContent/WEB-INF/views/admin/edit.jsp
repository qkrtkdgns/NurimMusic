<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<%@ include file="inc/head.jsp"%>
		<%@ include file="inc/layout.jsp"%>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin_assets/css/edit.css"/>
		<style type="text/css">
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
	<form method="post" action="../admin/edit_ok.do">
	<table>
	<tbody>
	<tr>
		<th colspan="2">상품명</th>
		<td><input type="text" name="title" id="title" /></td>
	</tr>
	<tr>
		<th colspan="2">상품 가격</th>
		<td><input type="text" name="price" id="price" /></td>
	</tr>
	<tr>
		<th colspan="2">재고설정</th>
		<td><input type="radio" name="sal_no" id="sal_yes" checked/>수량&nbsp;<input type="text" name="no" id="no" value="1" class="text-right"/>개&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="sal_no" id="sal_no"/>품절</td>
	</tr>
	<tr>
		<th colspan="2">출고 예상일</th>
		<td><input type="text" id="date" name="date" class="form-control"/></td>
	</tr>
	<tr>
		<th colspan="2">이미지 추가</th>
		<td><input type="file" name="file" id="file"/></td>
	</tr>
	<tr>
		<th colspan="2">카테고리</th>
		<td><select name="category" id="category2">
			<option value="kpop">k-pop</option>
			<option value="대중가요">대중가요</option>
			<option value="OST">OST</option>
			<option value="POP">POP</option>
			<option value="Rock">Rock</option>
			<option value="Jazz">Jazz</option>
			<option value="이어폰">이어폰</option>
			<option value="헤드폰">헤드폰</option>
		</select></td>
	</tr>
	<tr>
		<th colspan="2">공급업체</th>
		<td><input type="text" name="provide" id="provide" class="form-control"/></td>
	</tr>
	<tr>
		<th colspan="2" style="vertical-align:top">상품 상세내용</th>
		<td>
			<div class="textarea">
				<textarea name="cont" id="cont" class="ckeditor"></textarea>
			</div>
		</td>
	</tr>
	</tbody>
	</table>
	<div id="bt">
	<button type="submit">수정 완료</button>
	<button type="reset">다시작성</button>
	</div>
	</form>
	</div>
	<!-- 컨텐츠 영역 end -->
	</div>


		<!-- jquery start -->
		<script type="text/javascript">
		$(function(){
			$("#date").pickadate();
		});
		</script>
		<!-- jquery end -->
	</body>
</html>
