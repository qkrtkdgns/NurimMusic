<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
   <head>
     <%@include file="inc/head.jsp" %>
         <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/info_contents.css">
     
   </head>
   <body>
 <%@include file="inc/top_nav.jsp" %>

<!-- 본문내용 작성 start -->
         <div id="content">
            <%@include file="inc/info_nav.jsp" %>
            <div class="board">
   <table class="table table-striped table-hover">
      <!-- 게시판 컬럼 주기 (분류) start -->
   <thead>
   <tr>
      <th class="text-center">${readDocument.id }</th>
      <th class="text-center">${readDocument.category }</th>
      <th class="text-right">${readDocument.regDate }</th>
   </tr>
   </thead>
</table>
   <!-- 게시판 컬럼 주기 (분류) end -->
   <!-- 게시글 제목 start -->
   <div class="title text-center" style="border-bottom:2px dotted gray; padding-top:10px; height:80px;">
      <h4>${readDocument.subject }</h4>
   </div>
   <!-- 게시글 제목 end -->

   <!-- 게시글 본문 내용 start -->
   <div class="contents">
   		<!-- 이미지만 별도로 출력 -->
		<c:forEach var="file" items="${fileList }">
			<c:if test="${fn:substringBefore(file.contentType, '/') == 'image' }">
				<c:url var="downloadUrl" value="/download.do">
					<c:param name="file" value="${file.fileDir}/${file.fileName }" />
				</c:url>
			<p>
				<img src="${downloadUrl }" style="width: 600px; height: 600px;"/>
			</p>
			</c:if>				
			</c:forEach> 
   </div>
   ${readDocument.content }
   <!-- 게시글 본문 내용 end -->

   <!-- 목록 버튼 및 이전, 다음페이지 이동 start -->
   <a href="${pageContext.request.contextPath }/info_service_list.do?category=${category}" id="list" class="btn btn-default btn-md">목록</a>
   <!-- <input type="button" id="list" class="btn btn-default btn-md" onclick="location.href='${pageContext.request.contextPath }/info_service_list.do?category=${category}' value="목록" />
	-->
   <table class="move_list">
      <tbody>
         <tr>
         <td>이전글</td>
         <td>
         <c:choose>
			<c:when test="${prevDocument != null }">
				<c:url var="prevUrl" value="/info_contents.do">
					<c:param name="category" value="${category }" />
					<c:param name="document_id" value="${prevDocument.id }" />
				</c:url>
				<a href="${prevUrl }">${prevDocument.subject }</a>
			</c:when>
			<c:otherwise>
				이전글이 없습니다.
			</c:otherwise>
		</c:choose>
         </td>
         <td></td>
         <td class="text-center">${readDocument.regDate }</td>
      </tr>
      <tr>
      <td>다음글</td>
      <td>
      <c:choose>
			<c:when test="${nextDocument != null }">
				<c:url var="nextUrl" value="/info_contents.do">
					<c:param name="category" value="${category }" />
					<c:param name="document_id" value="${nextDocument.id }" />
				</c:url>
				<a href="${nextUrl }">${nextDocument.subject }</a>
			</c:when>
			<c:otherwise>
				다음글이 없습니다.
			</c:otherwise>
		</c:choose>
      </td>
      <td></td>
      <td class="text-center">${readDocument.regDate }</td>
   </tr>
      </tbody>
   </table>
</div>
   <!-- 목록 버튼 및 이전, 다음페이지 이동 end -->
   </div>
<!--본문내용 작성 end -->

<%@include file="inc/footer.jsp" %>

   </body>
</html>