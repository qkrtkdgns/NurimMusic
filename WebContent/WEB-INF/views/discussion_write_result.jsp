<!-- 수정본 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<%@include file="inc/head.jsp" %>
		<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/css/grid.css" />
		<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/css/discussion_write_result.css" />

	<!-- handlebars -->
	<script src="${pageContext.request.contextPath}/assets/plugins/handlebars/handlebars-v4.0.5.js"></script>

	<!-- ajax -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.js"></script>

	<!-- ajaxForm -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/plugins/ajax-form/jquery.form.min.js"></script>
	</head>

<body>
 <%@include file="inc/top_nav.jsp" %>

			<div id="content">
				<h2>커뮤니티 |&nbsp;</h2><h3>토론광장</h3>
				<!-- 회원리뷰 테이블 시작 -->
				
				<div class="dis_board">
				<hr>
					<table class="table table-bordered">
						<colgroup>
							<col width="81" />
							<col width="410" />
							<col width="81" />
							<col width="178" />
						</colgroup>
							<tbody>
								<tr>
								<th class="active">제목</th>
									<td colspan="4">
										<p class="dboard_sub" name="subject">${readDocument.subject }</p>
									
									</td>
									
								</tr>
								
								<tr>
									<th class="active">작성자</th>
									<td>${readDocument.memberId }</td>
									<th class="active">작성일</th>
									<td>${readDocument.regDate }</td>
								</tr>
								
								<tr>
									<th class="active">토론기간</th>
									<td>2016.08.07 ~ 2016.08.14</td>
									<th class="active">조회수</th>
									<td>${readDocument.hit }</td>
									
								</tr>
															
							</tbody>
						</table>
						<!-- //회원 리뷰 테이블 끝 -->
					</div>
					
					<div class="dis_cont">
						${readDocument.content }
					</div>
					

					<!--토론 참여 -->
					<div class="dis_parti">
					<span class="thumb1">
					<a href="#">
						<img src="${pageContext.request.contextPath }/img/dis_btn1.png">
					</a>
					</span>

					<span class="thumb2">
					<a href="#">
						<img src="${pageContext.request.contextPath }/img/dis_btn2.png">
					</a>
					</span>
					</div>
					<hr>

					<!-- 목록 버튼 -->
					<div class="dis_btn">
					<div class="list">
						<a href="${pageContext.request.contextPath }/discussion.do?category=${category}">
						<button type="button" class="btn btn-primary btn-md">목록</button></a>
					<!-- 수정 버튼 -->
					<div class="modify">	
						<a href="${pageContext.request.contextPath }/discussion_edit.do?category=${category}&document_id=${readDocument.id }">
						<button type="button" class="btn btn-primary btn-md">수정</button></a>
					</div>
					</div>
					</div>
					<hr>
					
					<!-- 댓글이 표시되는 영역 -->
					<div class="comment">
						<div class="comment_c">
							<font size="3">댓글</font>
							<hr>
						<div class="comment_rc">
							<font size="2">댓글이 없습니다.</font>
						</div>
							<hr>
						</div>
					</div>
					<!-- //댓글이 표시되는 영역 끝 -->
					
					<!-- 댓글 리스트 -->
					<ul class="media-list" id="comment_list">
					
					</ul>
					
					<!-- 페이지 이동 -->
						<div class="page_num">
						<center>
							<ul class="pagination">
								<li class="disabled"><a href="#">&laquo;</a></li>
								<li class="active"><span>1<span class="sr-only">(current)</span></span></li>
								<li><a href="#">&raquo;</a></li>
							</ul>
						</center>
						</div>
		
					<!-- 댓글 영역 -->
					<form id="comment_form" method="post" action="${pageContext.request.contextPath }/bbs/comment_insert.do">
					<!-- 글 번호 상태 유지 -->
					<input type='hidden' name='document_id' value='${readDocument.id }' />
					<div id="comment_box">
						<div class="comment_box1">
						<div class="comment_id">
							${document.userId }
						</div>
						<textarea class="comment_txt" name='content'>
						</textarea>
					
						<div class="res_btn">
							<button type="submit" class="btn btn-default btn-md">등록</button>
						</div>
						</div>
					</div>
					</form>
					<!-- //댓글 영역 끝 -->
					
					<!-- 이전글, 다음글 -->
					<table class="move_page">
					<colgroup>
						<col width="90">
						<col width="1080">
					</colgroup>
						<tbody>
							<tr>
								<th class="active">이전글</th>
								<td>
								<c:choose>
						<c:when test="${prevDocument != null }">
							<c:url var="prevUrl" value="/discussion_write_result.do">
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
							</tr>

							<tr>
								<th class="active">다음글</th>
								<td>
								<c:choose>
						<c:when test="${nextDocument != null }">
							<c:url var="nextUrl" value="/discussion_write_result.do">
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
							</tr>
						</tbody>
					</table>
					<!--//이전글, 다음글 끝  -->
			</div>
<%@include file="inc/footer.jsp" %>

<script type="text/javascript">
	$(function() {
		/** 덧글 작성 폼의 submit 이벤트 Ajax 구현 */
		//<form>요소의 method, action 속성과 <input>태그를
		//Ajax 요청으로 자동 구성한다.
		$("#comment_form").ajaxForm(function(json) {
			//json은 API에서 표시하는 전체 데이터
			if (json.rt != "OK") {
				alert(json.rt);
				return false;
			}
			
			alert("댓글이 등록되었습니다.");
		});
	});
</script>
	</body>
</html>
