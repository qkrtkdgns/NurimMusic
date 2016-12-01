<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<%@include file="inc/head.jsp" %>

	</head>
	<body>
 <%@include file="inc/top_nav.jsp" %>

<!-- 본문내용 작성 start -->
			<div id="content">
				<h2>마이페이지 | </h2><h3 style="color:gray; padding-left:10px;">나의 1:1 문의내역</h3>
				<hr/>
				<div class="pw_check" style="margin-top:30px; margin-bottom:150px;  height:36px; border-bottom:1px solid #ccc;">
					<div class="pw_title" style="width:10%; float:left;height:36px; border-right:2px solid #ccc; background:#ddd;">
					<label style="padding:6px;">비밀번호
					</label>
				</div>
				<form method="post" action="${pageContext.request.contextPath }/user_information.do">
				<div class="pw_input" style="float:left;height:36px; padding:5px; width:89%; margin-left:1%;">
					<input type="password" name="user_pw" id="user_pw" style="height:24px;"/>
					<label style="color:gray;">*회원정보를 보기 전 비밀번호를 체크합니다. 비밀번호를 입력해주세요.
					</label>
				</div>
				<div style="width:100px;height:175px; margin:30px auto;">
					<button id="btbt" type="submit" class="btn purple" style="width:100px;">확인</button>
				</div>
				</form>
				</div>
			</div>
<!--본문내용 작성 end -->

<%@include file="inc/footer.jsp" %>
	</body>
</html>
