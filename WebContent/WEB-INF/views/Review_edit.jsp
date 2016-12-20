<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<%@include file="inc/head.jsp" %>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/Review_write_result.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/Review_write.css" />
		
		<!--CKEditor 참조 -->
		<script src="http://cdn.ckeditor.com/4.5.11/standard/ckeditor.js"></script>

	</head>

<body>
<%@include file="inc/top_nav.jsp" %>
			<!-- 회원 리뷰 전체 영역 시작 -->
			<div id="content">
				<h2>회원리뷰</h2>
				<hr>
				
				<form class="form-horizontal" method="post" enctype="multipart/form-data"
				action="${pageContext.request.contextPath }/Review_edit_ok.do">
				<!-- 게시판 카테고리에 대한 상태 유지 -->
				<input type="hidden" name="category" value="${category }" />
				<!-- 수정 대상에 대한 상태유지 -->
				<input type="hidden" name="document_id" value="${readDocument.id }" />
				
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
								
								<tr>
									<th class="active">리뷰상품</th>
									<td>
									<input type="file" name="file" multiple id="photo" />
									
									<!-- 첨부파일 리스트가 존재할 경우만 삭제할 항목 선택 가능 -->
									<c:if test="${fileList != null }">
										<c:forEach var="file" items="${fileList }">
											<!-- 이미지를 다운받기 위한 URL 구성 -->
											<c:url value="/download.do" var="downloadUrl">
												<c:param name="file" value="${file.fileDir }/${file.fileName }" />
											</c:url>
						
											<div class="checkbox">
												<label>
													<input type="checkbox" name="del_file" id="img_del" value="${file.id }" />
													${file.originName } 삭제하기
												</label>
											</div>
										</c:forEach>
									</c:if>
									</td>
								</tr>						
							</tbody>
					</table>

					<!--내용 작성 영역 -->
					<div class="textarea">
						<textarea name="content" id="cont" class="ckeditor">${readDocument.content }</textarea>
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
						<button type="button" class="btn btn-default btn-md">다시 작성</button>
					</div>
					</div>
				</center>
				</form>
			</div>
			<!-- //회원 리뷰 전체 영역 끝 -->
<%@include file="inc/footer.jsp" %>
		
	</body>
</html>
