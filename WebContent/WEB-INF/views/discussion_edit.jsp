<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<%@include file="inc/head.jsp" %>		
		<link rel="stylesheet"  type="text/css" href="css/Review_write_result.css" />
		<link rel="stylesheet"  type="text/css" href="css/discussion.write.css" />
		<!--CKEditor 참조 -->
		<script src="http://cdn.ckeditor.com/4.5.11/standard/ckeditor.js"></script>

	</head>
<body>
 <%@include file="inc/top_nav.jsp" %>
		
			<!-- 회원 리뷰 전체 영역 시작 -->
			<div id="content">
				<form class="form-horizontal" method="post" action="${pageContext.request.contextPath }/discussion_edit_ok.do">
				<!-- 게시판 카테고리에 대한 상태 유지 -->
				<input type="hidden" name="category" value="${category }" />
				<!-- 수정 대상에 대한 상태유지 -->
				<input type="hidden" name="document_id" value="${readDocument.id }" />
				
				<h2>커뮤니티 |</h2><h3>&nbsp;토론광장</h3>
				<hr>
				
				<!-- 회원리뷰 작성 영역 시작 -->
				<div class="review_board">
					<table class="table table-bordered">
						<colgroup>
							<col width="100" />
							<col width="410" />
						</colgroup>
							<tbody>
								<tr>
								<th class="active">제목</th>
									<td><input type="text" class="input_text" name="subject" value="${readDocument.subject }"></td>
								</tr>			
							</tbody>
					</table>

					<!--내용 작성 영역 -->
					<div class="textarea">
						<textarea id="cont" class="ckeditor" name="content">${readDocument.content }</textarea>
					</div>
					<!--//내용 작성 영역 끝 -->
				</div>
				<!-- //회원 리뷰 작성 영역 끝 -->
				
				<!-- 버튼들 -->
				<center>
					<div class="review_btn">
					<div class="review_com">
						<button type="submit" class="btn btn-default btn-md">작성완료</button>
					</div>

					<div class="review_reset">
						<button type="button" class="btn btn-default btn-md">다시 작성</button>
					</div>
				</center>
				<!-- //버튼들 끝 -->
				</form>
			</div>
		<!-- //회원 리뷰 전체 영역 끝 -->


			<%@include file="inc/footer.jsp" %>
	</body>
</html>
