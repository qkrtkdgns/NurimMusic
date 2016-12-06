<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<%@include file="inc/head.jsp" %>
		<link rel="stylesheet"  type="text/css" href="css/mypage.css" />
		<link rel="stylesheet"  type="text/css" href="css/mypage_qna_question.css" />
		
	</head>
	<body>
<%@include file="inc/top_nav.jsp" %>

<!-- 본문내용 작성 start -->
			<div id="content">
				<h2>마이페이지 | </h2><h3 style="color:gray; padding-left:10px;">나의 1:1 문의내역</h3>
				<hr/>
				<div class="review_board">
				<table class="table table-bordered">
					<colgroup>
						<col width="81"/>
						<col width="410"/>
						<col width="81"/>
						<col width="178"/>
					</colgroup>
						<tbody>
							<tr>
							<th class="active">제목 </th>
								<td colspan="3">
									<p class="review_sub">${readDocumentQna.subject }</p>
								</td>
							</tr>
							<tr>
								<th class="active">상담 유형</th>
								<td>${readDocumentQna.qnaType }</td>
								<th class="active">문의자 아이디</th>
								<td>${readDocumentQna.memberId }</td>
							</tr>
							<tr>
								<th class="active">이메일</th>
								<td colspan="3">${readDocumentQna.email }</td>
						  </tr>
						</tbody>
					</table>
					<!-- //회원 리뷰 테이블 끝 -->
				<div class="review_cont">
					<p>${readDocumentQna.content }</p>
				</div>
				<hr>
				<!-- 목록 버튼 -->
				<div class="list">
					<button type="button" class="btn purple btn-md"><a href="${pageContext.request.contextPath }/bbs/mypage_qna.do?category=${category}">목록</a></button>
				</div>
			</div>
			</div>
</div>
<!--본문내용 작성 end -->

<%@include file="inc/footer.jsp" %>

	</body>
</html>
