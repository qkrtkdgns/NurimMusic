<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<%@ include file="inc/head.jsp"%>
		<%@ include file="inc/layout.jsp"%>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin_assets/css/one_one.css" />
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
	<div id="member">
	
	<!--검색 start -->
	<div id="search">
	<form method="get" action="${pageContext.request.contextPath }/admin/one_one.do">
	<input type="hidden" name="category" value="${category }" />
	<select id="dropdown">
	<option value="검색조건">검색조건</option>
	<option value="제목">제목</option>
	<option value="내용">내용</option>	</select>
	<input type="text" name="keyword" id="search_item" placeholder="검색어를 입력하세요." value="${keyword }" />
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
		<col style="width:70px;">
		<col style="width:100px;">
		<col style="width:300px;">
		<col style="width:80px;">
		<col style="width:80px;">
		<col style="width:80px;">
	</colgroup>
	<thead>
	<tr>
	<th>문의번호</th>
	<th>아이디</th>
	<th>문의 유형</th>
	<th>제목</th>
	<th>문의 내용</th>
	<th>답변 내용</th>
	<th>문의 날짜</th>
	<th>답변 상태</th>
	</tr>
	</thead>
	<tbody>
	<c:choose>
		<c:when test="${fn: length(documentQnaList) > 0 }">
			<c:forEach var="document" items="${documentQnaList }">
	<tr>
	<td>${document.id }
	<td>${document.memberId }</td>
	<td>${document.qnaType }</td>
	<td>${document.subject }</td>
	<td>${document.content }</td>
	<td>답변합니다.</td>
	<td>${document.regDate }</td>
	<td><button class="answer_end">답변완료</button></td>
	</tr>
			</c:forEach>
			</c:when>
		<c:otherwise>
			<tr>
				<td colspan="8" class="text-center" style="line-height:100px;">
					조회된 글이 없습니다. </td>
			</tr>
		</c:otherwise>
	</c:choose>
	</tbody>
	</table>
	</div>
	<!-- 테이블 end -->
	</div>
	<!-- 컨텐츠 영역 end -->
	</div>

	<!--답변박스 start -->
	<div id="answer_box">
	<div class="control_box">
		<form>
			<div class="input_box">
			<label>제목</label>
			<input type="text" name="answer_title" id="answer_title" />
			</div>
			<div class="input_box">
			<label>내용</label>
			<textarea name="answer_ans" id="answer_ans"></textarea>
			</div>
		<button id="commit">답변등록</button>
		<button class="cancel">취소</button>
		</form>
	</div>
	<div class="no_touch"></div>
	</div>

	<!-- 답변박스 end -->

	<!-- 게시글 박스 start -->

	<div id="content_box">
	<div class="control_box">
		<form>
			<div class="input_box">
			<label>제목</label>
			<input type="text" name="answer_title" id="answer_title" value="결제문의" disabled/>
			</div>
			<div class="input_box">
			<label>내용</label>
			<textarea name="answer_ans" id="answer_ans" disabled>결제 Plug-in 설치가 자동으로 안돼요. 어떻게 해야 하나요 ?</textarea>
			</div>
		<button class="cancel">닫기</button>
		</form>
	</div>
	<div class="no_touch"></div>
	</div>

	<!-- 게시글 박스 end -->
	</div>
	
	<!-- 페이지 번호 시작 -->
		<nav class="text-center">
			<ul class="pagination">
				<!-- 이전 그룹으로 이동 -->
				<c:choose>
					<c:when test="${pageHelper.prevPage > 0 }">
					<!-- 이전 그룹에 대한 페이지 번호가 존재한다면? -->
					<!-- 이전 그룹으로 이동하기 위한 URL을 생성하여 "prevUrl"에 저장 -->
					<c:url var="prevUrl" value="/admin/one_one.do">
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
					<c:url var="pageUrl" value="/admin/one_one.do">
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
						<c:url var="nextUrl" value="/admin/one_one.do">
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

		<!-- jquery start -->
		<script type="text/javascript">
		$(function(){
			$(".answer").click(function(){
				$("#answer_box").css("visibility","visible")

				$("#commit").click(function(){

				});
				$(".cancel").click(function(){
					$("#answer_box").css("visibility","hidden")
					return false;
				});
				return;false;
			});
			$(".content").click(function(){
				$("#content_box").css("visibility","visible")

				$("#commit").click(function(){

				});
				$(".cancel").click(function(){
					$("#content_box").css("visibility","hidden")
					return false;
				});
				return;false;
			});
			$(".answer_end").parents("tr").css("background","rgba(200,200,200,0.3)");

		});
		</script>
		<!-- jquery end -->
	</body>
</html>
