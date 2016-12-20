<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="ko">
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
	<div class="container">
		<div class="page-header"></div>
	
	<form class="form-horizontal" method="post" enctype="multipart/form-data"
	action="${pageContext.request.contextPath }/admin/info_write_ok.do">
	
		<!-- 게시판 카테고리에 대한 상태유지 -->
		<input type="hidden" name="category"value="${category }" />
		<!-- 작성자, 비밀번호, 이메일은 로그인하지 않은 경우만 입력한다. -->
			<!-- 작성자 -->
			<div class="form-group">
				<label for="writer_name" class="col-sm-2 control-label">아이디</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="member_id" name="member_id">
				</div>
			</div>
		<!-- 제목 -->
		<div class="form-group">
			<label for="subject" class="col-sm-2 control-label">제목</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="subject" name="subject" />
			</div>
		</div>
		<!-- 내용 -->
		<div class="form-group">
			<label for="content" class="col-sm-2 control-label">내용</label>
			<div class="col-sm-10">
				<textarea id="content" name="content" class="ckeditor"></textarea>
			</div>
		</div>
		<!-- 파일업로드 -->
		<div class="form-group">
			<label for="file" class="col-sm-2 control-label">파일첨부</label>
			<div class="col-sm-10">
				<input type="file" class="form-control" id="file" name="file" multiple />
			</div>
		</div>
		<!-- 버튼들 -->
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-primary">저장하기</button>
				<button type="button" class="btn btn-danger" onclick="history.back();">
				작성취소</button>
			</div>
		</div>
	</form>
	
	</div>
</div>
	</body>
</html>
