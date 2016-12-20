<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<%@include file="inc/head.jsp" %>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/Review.css" />
		
	</head>
	<body>
 
<%@include file="inc/top_nav.jsp" %>
<div class="ddd"></div>
<!-- 본문내용 작성 start -->
					<!-- 회원리뷰 전체 영역 -->
		<div id="content">
		
		           <h2>커뮤니티</h2><hr>
         <div class="side_area">
            <a href="#">회원리뷰</a>
            <ul>
               <li><a href="${pageContext.request.contextPath }/Review.do">♪ 회원리뷰</a></li>
            </ul>
            <a href="#">토론광장</a>
            <ul>
               <li><a href="${pageContext.request.contextPath }/discussion.do">♪ 토론광장</a></li>
            </ul>
         </div>
		
		<!-- 회원리뷰 상단 -->
		<div class="box1">
			<a href="${pageContext.request.contextPath }/Review.do?category=review">
			최신 글순&nbsp;&nbsp;&nbsp;</a>
			<a href="${pageContext.request.contextPath }/Review.do?category=review&high">
			인기글순&nbsp;</a>
		</div>
		<!-- //회원리뷰 상단 끝 -->
				
			<!-- 회원리뷰 내용 영역 -->
			<div class="review_content">
			<ul>
			<c:choose>
				<c:when test="${fn: length(documentList) > 0 }">
				<c:forEach var="document" items="${documentList }">
				<li class="thumb-list">
						
						<a href="${pageContext.request.contextPath }/Review_write_result.do?category=${category}&document_id=${document.id}">
						<span class="thumb">
							
						<!-- 링크 + 썸네일 -->
						<c:choose>
							<c:when test="${document.imagePath != null }">
								<c:url var="downloadUrl" value="/download.do">
									<c:param name="file" value="${document.imagePath }" />
								</c:url>
								<img src="${downloadUrl }" />
							</c:when>
							<c:otherwise>
								<img src="${pageContext.request.contextPath }/img/noimage.png" />
							</c:otherwise>
						</c:choose>
							
						</span>
						</a>

						<span class="text">
							<c:url var="readUrl" value="/Review_write_result.do">
								<c:param name="category" value="${document.category }" />
								<c:param name="document_id" value="${document.id }" />
							</c:url>
							<a href="${readUrl }"><span class="title">${document.subject }</span></a>
							<span class="text_1">
							${document.memberId }&nbsp;&nbsp;|&nbsp;&nbsp;${document.regDate }
							</span>
							<span class="desc">${document.content }</span>
						</span>
					
					</li>
					</c:forEach>
				</c:when>
				<c:otherwise>
					조회된 글이 없습니다.
				</c:otherwise>
				</c:choose>
				</ul>

				<div id="rev_foot">
				<!-- 리뷰 쓰기 버튼 -->
					<div class="review_box">
					<a href="${pageContext.request.contextPath }/Review_write.do?category=review">
						<button type="button" class="btn btn-default btn-md" >리뷰쓰기</button>
					</a>
					</div>
				<!-- //리뷰 쓰기 버튼 끝 -->

			<nav class="page_num">
			<ul class="pagination">
				<!-- 이전 그룹으로 이동 -->
				<c:choose>
					<c:when test="${pageHelper.prevPage > 0 }">
					<!-- 이전 그룹에 대한 페이지 번호가 존재한다면? -->
					<!-- 이전 그룹으로 이동하기 위한 URL을 생성하여 "prevUrl"에 저장 -->
					<c:url var="prevUrl" value="/Review.do">
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
					<c:url var="pageUrl" value="/Review.do">
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
						<c:url var="nextUrl" value="/Review.do">
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

					<!-- 검색 영역 -->
					<div class="review_foot">
					<form method="get" action="${pageContext.request.contextPath }/Review.do">
						<input type="hidden" name="category" value="${category }" />
					<div class="result_search">
						<select class="input_form">
						<option value="subject">제목</option>
							<option value="content">내용</option>
							<option value="member_id">등록자ID</option>
					</select>
						<input type="text" class="input_txt" id="keyword" name="keyword" value="${keyword }" />
							<button type="submit" class="btn btn-default">검색</button>
					</div>
					</form>
					</div>
				<!-- //검색 영역 끝 -->
				</div>
				<!--//rev_foot 끝 -->
				</div>
			<!-- //회원리뷰 내용 영역 끝  -->
			</div>
	<!-- //회원리뷰 전체 영역 끝 -->
<!--본문내용 작성 end -->

<%@include file="inc/footer.jsp" %>

	</body>
</html>
