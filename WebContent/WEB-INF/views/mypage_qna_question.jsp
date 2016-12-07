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
									<p class="review_sub">${document.subject }</p>
								</td>
							</tr>
							<tr>
								<th class="active">상담 유형</th>
								<td>${document.qnaType }</td>
								<th class="active">문의자 이름</th>
								<td>${loginInfo.userName }</td>
							</tr>
							<tr>
								<th class="active">연락처</th>
								<td colspan="3">${loginInfo.tel }</td>
						  </tr>
							<tr>
								<th class="active">이메일</th>
								<td colspan="3">${loginInfo.email }</td>
						  </tr>
						</tbody>
					</table>
					<!-- //회원 리뷰 테이블 끝 -->
				<div class="review_cont">
					<p>${document.content }</p>
				</div>
				<hr>
				<!-- 목록 버튼 -->
				<div class="list">
					<button type="button" onclick="location.href='${pageContext.request.contextPath}/mypage_qna.do'" class="btn purple btn-sm">목록</button>
				</div>
			</div>
</div>
<!--본문내용 작성 end -->

<%@include file="inc/footer.jsp" %>

	</body>
</html>
