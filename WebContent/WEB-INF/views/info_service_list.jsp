<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
   <head>
     <%@include file="inc/head.jsp" %>
         <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/info.css">
     
   </head>
   <body>
 <%@include file="inc/top_nav.jsp" %>

<!-- 본문내용 작성 start -->
         <div id="content">
            <!--  내용 탭 start -->
        <ul class="nav nav-tabs" id="mytab">
         <li class="active"><a href="${pageContext.request.contextPath }/info_service_list.do?category=notice">공지사항</a></li>
         <li><a href="${pageContext.request.contextPath }/question_top10.do">자주하는 질문</a></li>
         <li><a href="${pageContext.request.contextPath }/bbs/qna_write.do?category=qna">문의하기</a></li>
         <li><a href="${pageContext.request.contextPath }/pay_check.do">입금확인</a></li>
         </ul>
        <!-- 내용 탭 end -->

   <div class="board">
   <input type="hidden" name="category" value="${category }" />
   <table class="table table-striped table-hover">
      <!-- 게시판 컬럼 주기 (분류) start -->
   <thead>
      <colgroup>
         <col style="width:5%;"></col>
         <col style="width:55%;"></col>
         <col style="width:10%;"></col>
         <col style="width:10%;"></col>
         <col style="width:10%;"></col>
      </colgroup>
   <tr>
   <th class="text-center">No.</th>
   <!-- <th class="text-center">분류</th> -->
   <th class="text-center">제목</th>
   <th class="text-center">조회수</th>
   <th class="text-center">등록일</th>
   <th class="text-center">수정일</th>
   </tr>
   </thead>
   <!-- 게시판 컬럼 주기 (분류) end -->

   <!-- 게시물 내용 start -->
   <tbody>
   <c:choose>
		<c:when test="${fn:length(documentList) > 0}">
			<c:forEach var="document" items="${documentList }">
				<tr>
					<td class="text-center">${document.id }
						<c:url var="readUrl" value="/info_contents.do">
							<c:param name="category" value="${document.category }" />
							<c:param name="document_id" value="${document.id }" />
						</c:url>
					</td>
					<td class="text-center"><a href="${readUrl }" style="color:black;">${document.subject }</a></td>
					<td class="text-center">${document.hit }</td>
					<td class="text-center">${document.regDate }</td>
					<td class="text-center">${document.editDate }</td>
				</tr>
				
			
			</c:forEach>
		</c:when>
		
		<c:otherwise>
			<tr>
				<td colspan="8" class="text-center" style="line-height:100px;">
				조회된 글이 없습니다
				</td>
			</tr>
		</c:otherwise>
	</c:choose>
   </table>

<nav class="text-center">
			<ul class="pagination">
				<!-- 이전 그룹으로 이동 -->
				<c:choose>
					<c:when test="${pageHelper.prevPage > 0 }">
					<!-- 이전 그룹에 대한 페이지 번호가 존재한다면? -->
					<!-- 이전 그룹으로 이동하기 위한 URL을 생성하여 "prevUrl"에 저장 -->
					<c:url var="prevUrl" value="/info_service_list.do">
						<c:param name="category" value="${category }"></c:param>
						<c:param name="keyword" value="${keyword }"></c:param>
						<c:param name="page" value="${pageHelper.prevPage }"></c:param>
					</c:url>
					
					<li><a href="${pageUrl }">&laquo;</a></li>
					</c:when>
				
				<c:otherwise>
					<!-- 이전 그룹에 대한 페이지 번호가 존재하지 않는다면? -->
					<li class='disabled'><a href="#">&laquo;</a></li>
				</c:otherwise>
				</c:choose>
				
				<!-- 페이지 번호 -->
				<!-- 현재 그룹의 시작페이지-끝페이지 사이를 1씩 증가하면서 반복 -->
				<c:forEach var="i" begin="${pageHelper.startPage}" end="${pageHelper.endPage }" step="1">
					
					<!-- 각 페이지 번호로 이동할 수 있는 URL을 생성하여 page_url에 저장 -->
					<c:url var="pageUrl" value="/info_service_list.do">
						<c:param name="category" value="${category }"></c:param>
						<c:param name="keyword" value="${keyword }"></c:param>
						<c:param name="page" value="${i }"></c:param>
					</c:url>
					
					<!-- 반복 중의 페이지 번호와 현재 페이지 번호가 같은 경우에 대한 분기 -->
					<c:choose>
						<c:when test="${pageHelper.page == i }">
							<li class='active'><a href="#">${i}</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${pageUrl }">${i }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<!-- 다음 그룹으로 이동 -->
				<c:choose>
					<c:when test="pageHelper.nextPage > 0">
						<!-- 다음 그룹에 대한 페이지 번호가 존재한다면? -->
						<!-- 다음 그룹으로 이동하기 위한 URL을 생성해서 "nextUrl"에 저장 -->
						<c:url var="nextUrl" value="/info_service_list.do">
							<c:param name="category" value="${category }"></c:param>
							<c:param name="keyword" value="${keyword }"></c:param>
							<c:param name="page" value="${pageHelper.nextPage }"></c:param>
						</c:url>
						
						<li><a href="${nextUrl }">&raquo;</a></li>
					</c:when>
					
					<c:otherwise>
						<!-- 이전 그룹에 대한 페이지 번호가 존재하지 않는다면? -->
						<li class='disabled'><a href="#">&raquo;</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</nav>
		<!-- 페이지 번호 끝 -->
   </div>
   <!--게시판 이동 버튼 end -->
   </div>
<!--본문내용 작성 end -->

<%@include file="inc/footer.jsp" %>

   </body>
</html>
