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

	</head>
	<body>
	<div id="container">
	<div id="top">
	<a href="main.html">Admin</a>
	</div>
	<%@ include file="inc/category.jsp"%>

	<!-- 컨텐츠 영역 start -->
	<div id="content">
		<div class="page-header"></div>
			
			<!-- 제목, 작성자, 작성일시, 조회수 -->
	<div class="alert alert-info">
		<h3 style="margin:0">
			${readDocument.subject }<br />
			<small>
				${readDocument.memberId }
					/ 조회수 : ${readDocument.hit } / 작성일시 : ${readDocument.regDate }
			</small>
		</h3>
	</div>
	
	<!-- 첨부파일 목록 표시하기 -->
	<c:if test="${fileList != null }">
		<!-- 첨부파일 목록 -->
		<table class="table table-bordered">
			<tbody>
				<tr>
					<th class="warning" style="width:100px">첨부파일</th>
					<td>
						<c:forEach var="file" items="${fileList }">
						<!-- 다운로드를 위한 URL 만들기 -->
						<c:url var="downloadUrl" value="/download.do">
							<c:param name="file" value="${file.fileDir}/${file.fileName }" />
							<c:param name="orgin" value="${file.orginName }" /> 
						</c:url>
						<!-- 다운로드 링크 -->
						<a href="${downloadUrl }" class="btn btn-Link btn-xs">${file.orginName }</a>
						</c:forEach>
					</td>
				</tr>
			</tbody>
		</table>
		<!-- 이미지만 별도로 화면에 출력하기 -->
		<c:forEach var="file" items="${fileList }">
			<c:if test="${fn:substringBefore(file.contentType, '/') == 'image' }">
				<c:url var="downloadUrl" value="/download.do">
					<c:param name="file" value="${file.fileDir}/${file.fileName }" />
				</c:url>
				<p>
					<img src="${downloadUrl }" class="img-responsive" style="margin:auto" />
				</p>
			</c:if>
		</c:forEach>
	</c:if>
	<!-- 내용 -->
	<section style="padding:0 10px 20px 10px">
		${readDocument.content }
	</section>
	
	<!-- 버튼들 : category 값에 대한 상태유지 필요함 -->
	<div class="clearfix">
		<div class="pull-right">
			<a href="${pageContext.request.contextPath }/admin/info_list.do?category=${category}"
			class="btn btn-info">목록보기</a>
			<a href="${pageContext.request.contextPath }/admin/info_write.do?category=${category}"
			class="btn btn-primary">글쓰기</a>
			<!-- 수정, 삭제 대상을 지정하기 위해서 글 번호가 전달되어야 한다. -->
			<a href="${pageContext.request.contextPath }/admin/info_edit.do?category=${category}&
			document_id=${readDocument.id }" class="btn btn-warning">수정하기</a>
			<a href="${pageContext.request.contextPath }/admin/info_delete.do?category=${category}&
			document_id=${readDocument.id }" class="btn btn-danger">삭제하기</a>
		</div>
	</div>
	</div>
	</div>
	</div>
	</body>
</html>
