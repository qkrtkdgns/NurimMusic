<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<%@ include file="inc/head.jsp"%>
		<%@ include file="inc/layout.jsp"%>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin_assets/css/main.css"/>
		<style type="text/css">
		</style>
	</head>
	<body>
	<div id="container">
	<%@ include file="inc/category.jsp"%>

	<!-- 컨텐츠 영역 start -->
	<div id="content">
	<div class="content_title"><h1>Nurim Music Admin</h1>
	</div>
	<div class="stats">
	<div class="visit_today">
		<b>37명</b>
	</div>
	<div class="sal"><b>43개</b></div>
	<div class="profit"><b>51만</b></div>
	</div>
	</div>
	<!-- 컨텐츠 영역 end -->
	</div>


		<!-- jquery start -->
		<script type="text/javascript">
		</script>
		<!-- jquery end -->
	</body>
</html>
