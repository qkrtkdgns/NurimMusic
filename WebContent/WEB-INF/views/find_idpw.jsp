<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<%@include file="inc/head.jsp" %>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/info.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/find_idpw.css">
		
	</head>
	<body>
<%@include file="inc/top_nav.jsp" %>
<div class="ddd"></div>
<!-- 본문내용 작성 start -->
				<div id="content">
				<h2>아이디 찾기</h2><hr>

				<div class="find_id">
						<div class="form-group">
								<label for="user_name">이름</label>
								<input type="text" class="form-control"  id="user_name" placeholder="이름을 입력하세요.">
						</div>
						<div class="form-group">
								<label for="email">이메일</label>
								<input type="email" class="form-control"  id="email" placeholder="이메일을 입력하세요.">
									<div class="find_id_button">
								<input type="submit" class="btn btn-default" id="button" value="아이디 찾기">
							</div>
					</div>
					</div>
					<h2>비밀번호  찾기</h2><hr>
					<div class="find_pw">
						<div class="form-group">
								<label for="user_name">이름</label>
								<input type="text" class="form-control"  id="user_name" placeholder="이름을 입력하세요.">
						</div>

						<div class="form-group">
								<label for="user_id">아이디</label>
								<input type="user_id" class="form-control"  id="user_id" placeholder="아이디를 입력하세요.">
						</div>

						<div class="form-group">
								<label for="email">이메일</label>
								<input type="email" class="form-control"  id="email" placeholder="이메일을 입력하세요.">
						</div>
						<div class="find_pw_button">
								<input type="submit" class="btn btn-default" id="button" value="비밀번호 찾기">
										</div>
						</div>
			</div>

		</div>
<!--본문내용 작성 end -->

<%@include file="inc/footer.jsp" %>


	</body>
</html>
