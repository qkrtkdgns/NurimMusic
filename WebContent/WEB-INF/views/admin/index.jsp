<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="inc/head.jsp"%>
<!--[if lt IE 9]>
		<script src="js/html5shiv.js"></script>
		<![endif]-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/admin_assets/css/index.css" />
</head>
<body>
	<div id="background">
		<div id="login">
			<div id="login_box">
				<div class="login_box_top">
					<b>ADMIN LOGIN</b>
				</div>
				<div class="login_box_center">
					<form method="post" action="../admin/login_ok.do">
						<input type="text" name="admin_id" id="admin_id" /> <input
							type="password" name="admin_pw" id="admin_pw" />
						<button type="submit" name="login_bt" id="login_bt">Login</button>
					</form>
				</div>
				<div class="login_box_bottom"></div>
			</div>
		</div>
	</div>

	<!-- jquery start -->

	<script type="text/javascript">		
	</script>
	<!-- jquery end -->
</body>
</html>
