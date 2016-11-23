<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

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
        <ul class="nav nav-tabs">
         <li><a href="${pageContext.request.contextPath }/info.do">공지사항</a></li>
         <li><a href="${pageContext.request.contextPath }/question_top10.do">자주하는 질문</a></li>
         <li class="active"><a href="${pageContext.request.contextPath }/question_send.do">문의하기</a></li>
         <li><a href="${pageContext.request.contextPath }/pay_check.do">입금확인</a></li>
         </ul>
        <!-- 내용 탭 end -->

	<form class="form-horizontal" role="question_send" id="question_send">
	<fieldset>
	<h3>1:1 문의</h3>
	<!-- 상담유형 선택 start -->
	<div class="form-group">
	<label for="qna_type" class="control-label">상담유형(QnA Type)</label>
	<div >
	<select name="qna_type" id="qna_type" form="question_send" class="form-control">
		<option value="상담 유형 선택">상담유형을 선택하세요.</option>
		<option value="교환">교환</option>
		<option value="반품">반품</option>
		<option value="A/S">A/S</option>
	</select>
	</div>
</div>
	<!-- 상담유형 선택 end -->

	<!-- 이름 작성 stary -->
	<div class="form-group">
	<label for="name" class="control-label">이름</label>
	<div >
	<input type="text" name="name" id="name" class="form-control"
	placeholder="이름을 입력하세요." />
	</div></div>
	<!-- 이름 작성 start -->

	<!-- 연락처 작성 start -->
	<div class="form-group">
	<label for="tel" class="control-label">연락처</label>
	<div >
	<input type="tel" name="tel" id="tel" class="form-control"
	placeholder="연락처를 입력하세요." />
	</div></div>
	<!-- 연락처 작성 end -->

	<!-- email 작성 start -->
	<div class="form-group">
	<label for="email" class="control-label">email</label>
	<div >
	<input type="email" name="email" id="email" class="form-control"
	placeholder="email을 적어주세요." />
	</div></div>
	<!-- email 작성 end -->

	<!-- 상담 제목 작성 start -->
	<div class="form-group">
	<label for="title" class="control-label">제목</label>
	<div >
	<input type="text" name="title" id="title" class="form-control"
	placeholder="제목을 적어주세요" />
	</div></div>
	<!-- 상담 제목 작성 end -->

	<!-- 문의 내용 작성 form start -->
	<div class="form-group">
	<label for="information" class="control-label">문의하기</label>
	<div>
	<input type="textarea" name="information" id="information" class="form-control"
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
