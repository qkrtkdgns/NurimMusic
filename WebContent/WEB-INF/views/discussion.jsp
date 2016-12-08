<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="inc/head.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/discussion.css" />

<script type="text/javascript">
	
</script>
</head>
<body>
	<%@include file="inc/top_nav.jsp"%>
	<div class="ddd"></div>
	<!-- 본문내용 작성 start -->
	<!-- 회원리뷰 전체 영역 -->
	<div id="content">
	<input type="hidden" name="category" value="${category }" />

		<!-- 회원리뷰 상단 -->
		<h2>커뮤니티</h2>
		<hr>
		<div class="side_area">
			<a href="#">회원리뷰</a>
			<ul>
				<li><a href="${pageContext.request.contextPath }/Review.do">♪ 회원리뷰</a></li>
			</ul>
			<a href="#">토론광장</a>
			<ul>
				<li><a href="${pageContext.request.contextPath }/discussion.do?category=discussion">♪ 토론광장</a></li>
			</ul>
		</div>
		<div class="discussion">
			<div class="dis_sub">
				<div class="dis_sub2">
					<h4>베스트토론&nbsp;&nbsp;&nbsp;${document.subject}</h4>
				</div>

				<ul class="dis_info">
					<li>작성자명 :</li>
					<li>${document.memberId }</li>
					<li class="barlink">|</li>
					<li>기간 :</li>
					<li>2016.09.28 ~ 2016.10.28</li>
					<li class="barline">|</li>
					<li>총 참여 :</li>
					<li>0</li>
				</ul>
				<hr>

				<!--참여하기 버튼 -->
				<div class="dis_img">
					<img class="agree_img" src="${pageContext.request.contextPath }/img/dis_1.png"> 
					<img class="bar_img" src="${pageContext.request.contextPath }/img/dis_3.png"> 
					<img class="disargee_img" src="${pageContext.request.contextPath }/img/dis_2.png"> 
					<a href="${pageContext.request.contextPath }/discussion_write_result.do?category=discussion"> 
					<img class="parti_img" src="${pageContext.request.contextPath }/img/dis_4.png">
					</a>
				</div>
			</div>



			<div class="dis_content">
				<table class="dis_table">
					<colgroup>
						<col width="500" />
						<col width="100" />
						<col width="100" />
						<col width="80" />
						<col width="80" />
						<col width="80" />
					</colgroup>

					<thead>

						<tr>
							<th scope="col" class="text-center">제목</th>
							<th scope="col" class="text-center">작성일</th>
							<th scope="col" class="text-center">토론 종료일</th>
							<th scope="col" class="text-center">조회수</th>
							<th scope="col" class="text-center">찬성</th>
							<th scope="col" class="text-center">반대</th>
						</tr>

					</thead>

					<tbody>
					<c:choose>
						<c:when test="${fn:length(documentList) > 0}">
						<c:forEach var="document" items="${documentList }">
						<tr>
						<td class="cont_sub">
						<c:url var="readUrl" value="/discussion_write_result.do">
							<c:param name="category" value="${document.category }" />
							<c:param name="document_id" value="${document.id }" />
						</c:url>
						<a href="${readUrl }">${document.subject }</a>
						</td>
							<td class="cont_date">${document.regDate }</td>
							<td class="cont_datec">2016.10.17</td>
							<td class="cont_view">${document.hit }</td>
							<td class="cont_ag"></td>
							<td class="cont_disag"></td>
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
					</tbody>
				</table>

				<!-- 하단 부분 -->
				<div id="dis_foot">

					<!-- 토론 글쓰기 버튼 -->
					<div class="dis_btn">
						<a href="${pageContext.request.contextPath }/discussion_write.do?category=discussion">
							<button type="button" class="btn btn-default btn-md">토론글쓰기</button>
						</a>
					</div>
					<!-- //토론 글쓰기 버튼 끝 -->

					<!-- 페이지 번호 시작 -->
		<div class="text-center">
			<ul class="pagination">
				<!-- 이전 그룹으로 이동 -->
				<c:choose>
					<c:when test="${pageHelper.prevPage > 0 }">
					<!-- 이전 그룹에 대한 페이지 번호가 존재한다면? -->
					<!-- 이전 그룹으로 이동하기 위한 URL을 생성하여 "prevUrl"에 저장 -->
					<c:url var="prevUrl" value="/admin/info_list.do">
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
					<c:url var="pageUrl" value="/admin/info_list.do">
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
						<c:url var="nextUrl" value="/admin/info_list.do">
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
		</div>
		<!-- 페이지 번호 끝 -->

					<!-- 검색 영역 -->
					<div class="result_search">
					<form method="get" action="${pageContext.request.contextPath }/discussion.do">
						<input type="hidden" name="category" value="${category }" />
						<select class="input_form">
							<option value="subject">제목</option>
							<option value="content">내용</option>
							<option value="member_id">등록자ID</option>
						</select> 
						<input type="text" class="input_txt" id="keyword" name="keyword" value="${keyword }" />
						<button type="submit" class="btn btn-default">검색</button>
					</form>
					</div>
					<!-- //검색 영역 끝 -->
				</div>
			</div>
		</div>
	</div>

	<!-- //회원리뷰 상단 끝 -->

	<!--본문내용 작성 end -->

	<%@include file="inc/footer.jsp"%>
	
</body>
</html>
