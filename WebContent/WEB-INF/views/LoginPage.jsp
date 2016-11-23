<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<%@include file="inc/head.jsp" %>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/info.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/LoginPage.css"/>
		
	</head>
	<body>
<%@include file="inc/top_nav.jsp" %>
<div class="ddd"></div>
<!-- 본문내용 작성 start -->
				<div id="content">

			<div class="login">
			
				<div class="welcome">
				<img src="${pageContext.request.contextPath }/img/login.jpg">
				<span class="title">누림뮤직에 오신것을 환영합니다!</span>
				<span class="text">누림뮤직의 회원이 되시면 보다 풍성한 혜택과 음반 정보를 받아보실 수 있습니다!</span>
				</div>
				<br>
				<div class="login_enter">
					<div class="enter">
						<form>
						<fieldset>
								<div class="form-group">
								<label for="user_id">아이디</label>
								<input type="text" class="form-control"  id="user_id" placeholder="아이디를 입력하세요.">
								</div>
								<div class="form-group">
								<label for="password">비밀번호</label>

								<input type="password"  class="form-control"  id="password" placeholder="비밀번호을 입력하세요.">
								</div>
								<div class="help">
								<a href="${pageContext.request.contextPath }/join.do"><button type="button" class="btn btn-default">회원가입</button></a>
								</div>
								<div class="help2">
								<a href="${pageContext.request.contextPath }/find_idpw.do"><button type="button" class="btn btn-default">아이디/비밀번호 찾기</button></a>
								</div>
								
					</div>
					<div class="login_button">
					<a href="${pageContext.request.contextPath }/index.do"><button type="button" class="btn btn-primary">로그인</button></a>
					
					</div>
						</fieldset>
					</form>
				</div>
			</div>
			
		</div>
<!--본문내용 작성 end -->

<%@include file="inc/footer.jsp" %>

	</body>
</html>

