<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<%@include file="inc/head.jsp" %>
		<link rel="stylesheet"  type="text/css" href="css/mypage.css" />
		<link rel="stylesheet"  type="text/css" href="css/mypage_qna.css" />
		
	</head>
	<body>
<%@include file="inc/top_nav.jsp" %>
<!-- 본문내용 작성 start -->
			<div id="content">
				<h2>마이페이지 | </h2><h3 style="color:gray;">나의 1:1 문의내역</h3>
				<hr/>
				<!--페이지 설명 -->
				<ul style="list-style:disc; margin-left:30px; color:gray;">
					<li>지금까지 1:1 문의하신 내역을 편리하게 확인하실 수 있도록 모든 문의와 내역을 모아놓았습니다.</li>
					<li>답변이 달리면 답변 여부에 '답변완료'로 상태가 변합니다.</li>
				</ul>
				<!--페이지 설명 end -->
<div>
	<table>
		<colgroup>
			<col width="6%" />
			<col width="6%" />
			<col width="6%" />
			<col width="60%" />
			<col width="5%" />
		</colgroup>
		<thead>
			<tr>
				<th>No</th>
				<th>일자</th>
				<th>상담 유형</th>
				<th>제목</th>
				<th>답변 여부</th>
			</tr>
		</thead>
		<tbody>
			<tr></tr>
			 <c:choose>
						<c:when test="${fn:length(documentList) > 0}">
							<c:forEach var="document" items="${documentList }" varStatus="a">
								<tr>
								
								<c:choose>
								<c:when test="${a.index%2 ==0 }">
								<td style="font-size:12px; font-weight:bold">${document.regDate } - ${document.id }</td>
								<td>${document.editDate }</td>
								<td>${document.qnaType }</td>
								<td><a href="${pageContext.request.contextPath }/mypage_qna_question.do?id=${document.id}">${document.subject }</a></td>
								<td></td>
								</c:when>
								<c:otherwise>
								<td style="font-size:12px; font-weight:bold">${document.regDate } - ${document.id }</td>
								<td>${document.editDate }</td>
								<td>${document.qnaType }</td>
								<td><a href="${pageContext.request.contextPath }/mypage_qna_answer.do?id=${document.id}">${document.subject }</a></td>
								<td>
								<c:if test="${document.subject == '답변대기' }">
								답변대기
								</c:if>
								<c:if test="${document.subject != '답변대기' }">
								답변완료
								</c:if> 
								</td>
								</c:otherwise>
								</c:choose>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="10" class="text-center" style="line-height: 100px;">
									조회된 글이 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
		</tbody>
	</table>
	<!--게시판 이동 버튼 start -->
	<%@include file="inc/qna_page.jsp" %>
	</div>
	<!--게시판 이동 버튼 end -->
</div>
</div>
<!--본문내용 작성 end -->

<%@include file="inc/footer.jsp" %>

	</body>
</html>
