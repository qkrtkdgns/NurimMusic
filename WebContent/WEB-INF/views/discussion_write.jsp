<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<%@include file="inc/head.jsp" %>		
		<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/css/Review_write_result.css" />
		<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/css/discussion.write.css" />
		<!--CKEditor 참조 -->
		<script src="http://cdn.ckeditor.com/4.5.11/standard/ckeditor.js"></script>

		<style type="text/css">
		
		</style>
	</head>
	

<body>
 <%@include file="inc/top_nav.jsp" %>


			<!-- 회원 리뷰 전체 영역 싲각 -->
			<div id="content">
				<h2>커뮤니티 |</h2><h3>&nbsp;토론광장</h3>
				<hr>
				
				<!-- 회원리뷰 작성 영역 시작 -->
				<form method="post" action="${pageContext.request.contextPath }/discussion_write_result.do">
				<div class="review_board">
					<table class="table table-bordered">
						<colgroup>
							<col width="100" />
							<col width="410" />
						</colgroup>
							<tbody>
								<tr>
								<th class="active">제목</th>
									<td><input type="text" class="input_text"></td>
									
								</tr>
													
							</tbody>
					</table>

					<!--내용 작성 영역 -->
					<div class="textarea">
						<textarea name="cont" id="cont" class="ckeditor"></textarea>
					</div>
					<!--//내용 작성 영역 끝 -->
				</div>
				<!-- //회원 리뷰 작성 영역 끝 -->

				<center>
					<div class="review_btn">
					<div class="review_com">
						<button type="submit" class="btn btn-default btn-md">작성완료</button>
					</div>

					<div class="review_reset">
						<button type="reset" class="btn btn-default btn-md">다시 작성</button>
					</div>
					</div>
					</center>
					</form>
			</div>
			<!-- //회원 리뷰 전체 영역 끝 -->


			<%@include file="inc/footer.jsp" %>
	</body>
</html>
