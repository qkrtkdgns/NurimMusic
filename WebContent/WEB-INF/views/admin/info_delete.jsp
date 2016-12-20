<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	<%@ include file="inc/head.jsp"%>
		<%@ include file="inc/layout.jsp"%>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin_assets/css/member.css" />
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
	<div class="page-header">${bbsName}</div>
		<h1>${bbsName }</h1>
		
		<form name="myform" method="post" action="${pageContext.request.contextPath }/admin/info_delete_ok.do">
		<!-- 카테고리와 게시글 번호 상태유지 -->
		<input type="hidden" name="category" value="${category }" />
		<input type="hidden" name="document_id" value="${documentId }" />
		
		<div style='width: 300px; margin: 50px auto;'>
				<!-- 자신의 글에 대한 삭제 -->
				<p>정말 이 게시물을 삭제하시겠습니까? </p>
			<div class="form-group">
				<button type="submit" class="btn btn-danger btn-block">삭제하기</button>
				<button type="submit" class="btn btn-primary btn-block" onclick="history.back()">삭제취소</button> 
			</div>
		</div>
	</form>

	</div>
	</div>
</body>
</html>