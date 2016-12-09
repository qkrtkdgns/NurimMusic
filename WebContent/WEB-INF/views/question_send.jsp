<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<%@include file="inc/head.jsp" %>
		<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/css/questionSend.css" />
	</head>
	<body>
 <%@include file="inc/top_nav.jsp" %>

<!-- 본문내용 작성 start -->
	<div id="content">
		  <!--  내용 탭 start -->
         <%@include file="inc/info_nav.jsp" %>
        <!-- 내용 탭 end -->

	<form class="form-horizontal" method="post" action="${pageContext.request.contextPath }/bbs/qna_write_ok.do">
	<!-- 게시판 카테고리에 대한 상태유지 -->
	<input type="hidden" name="category" value="${category }" />
	
	<fieldset>
	<h3>1:1 문의</h3>
	<!-- 상담유형 선택 start -->
	<div class="form-group">
	<label for="qna_type" class="control-label">상담유형(QnA Type)</label>
	<div >
	<select name="qna_type" id="qna_type" class="form-control">
		<option value="상담 유형 선택">상담유형을 선택하세요.</option>
		<option value="교환">교환</option>
		<option value="반품">반품</option>
	</select>
	</div>
</div>
	<!-- 상담유형 선택 end -->

	<!-- 아이디 작성 stary -->
	<div class="form-group">
	<label for="member_id" class="control-label">아이디</label>
	<div >
	<input type="text" name="member_id" id="member_id" class="form-control"
	placeholder="아이디 입력하세요." />
	</div></div>
	<!-- 이름 작성 start -->

	<!-- 상담 제목 작성 start -->
	<div class="form-group">
	<label for="subject" class="control-label">제목</label>
	<div >
	<input type="text" name="subject" id="subject" class="form-control"
	placeholder="제목을 적어주세요" />
	</div></div>
	<!-- 상담 제목 작성 end -->

	<!-- 문의 내용 작성 form start -->
	<div class="form-group">
	<label for="qna_content" class="control-label">문의하기</label>
	<div>
	<input type="textarea" name="content" id="qna_content" class="form-control"
	placeholder="문의내용을 작성해 주세요." />
	</div></div>
	<!-- 문의 내용 작성 form end -->

	<!-- 전송버튼 start -->
	<input type="submit" class="btn btn-primary btn-block" id="button" value="상담신청하기">
	<!-- 전송버튼 end -->
	</fieldset>
	</form>
</div>
<!--본문내용 작성 end -->

<%@include file="inc/footer.jsp" %>
		<script src="js/question_send.js"></script>

	</body>
</html>
