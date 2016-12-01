<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<%@ include file="inc/head.jsp"%>
		<%@ include file="inc/layout.jsp"%>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin_assets/css/member.css" />
		<style type="text/css">
		img{
			width:50px !important;
			height:35px !important;
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
	<option value="제목">제목</option>
	<option value="내용">내용</option>
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
	<th>종료여부</th>
	</tr>
	</thead>
	<tbody>
	<tr>
	<td><input type="checkbox" class="item_checked"/></td>
	<td>4</td>
	<td>qkrtkdqkrtkd</td>
	<td>오예</td>
	<td>ㅇㄹㄴㅇㄹㄴ</td>
	<td>2016.10.19</td>
	<td><img src="img/process.png" /></td>
	</tr>
	<tr>
	<td><input type="checkbox" class="item_checked"/></td>
	<td>3</td>
	<td>qkrtkdqkrtkd</td>
	<td>팬덤친목</td>
	<td>제곧내</td>
	<td>2016.10.19</td>
	<td><img src="img/process.png" /></td>
	</tr>
	<tr>
	<td><input type="checkbox" class="item_checked"/></td>
	<td>2</td>
	<td>qkrtkdqkrtkd</td>
	<td>잇힝잇힝</td>
	<td>우훗</td>
	<td>2016.10.19</td>
	<td><img src="img/process.png" /></td>
	</tr>
	<tr>
	<td><input type="checkbox" class="item_checked"/></td>
	<td>1</td>
	<td>qkrtkdqkrtkd</td>
	<td>샤이니짱</td>
	<td>을 가장한 엑소 겨울앨범 짱짱</td>
	<td>2016.10.19</td>
	<td><img src="img/end.png" /></td>
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
		</script>
		<!-- jquery end -->
	</body>
</html>
