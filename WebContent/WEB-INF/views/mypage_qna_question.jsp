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
									<p class="review_sub">결제가 되질 않습니다. 도와주세요.</p>
								</td>
							</tr>
							<tr>
								<th class="active">상담 유형</th>
								<td>쇼핑/결제</td>
								<th class="active">문의자 이름</th>
								<td>김민철</td>
							</tr>
							<tr>
								<th class="active">연락처</th>
								<td colspan="3">010-1234-1234</td>
						  </tr>
							<tr>
								<th class="active">이메일</th>
								<td colspan="3">dlapdlf@gmail.com</td>
						  </tr>
						</tbody>
					</table>
					<!-- //회원 리뷰 테이블 끝 -->
				<div class="review_cont">
					<p>엄마아빠가 무슨 앨범이 6만원씩이나 하냐고 뭐라하는걸 이겨내고 한세트 주문 완료!!!!!!!</p><p>진짜 방탄이들 내가 스밍 열심히 돌리고 목터져라 응원할께요ㅜㅜㅜㅜ 비티에스 사랑해ㅜㅜ</p><p>연예인에 1도 관심없던 내가 어느순간 빠져버렸잖아ㅜ</p><p>내 손에 앨범 들어오기만 기다리면서 시험공부 중이에여</p><p><strike>(아니 왜 시험전날 밤에&nbsp;컴백라이브지)</strike></p><p>아 팬싸가서 석진센빠이랑 이름 똑같은 내 동생 얘기두 하고 싶고ㅜㅜ</p><p>우리막내 맨날 아니쥬부르고 다니는뎁</p><p>&nbsp;</p><p>딱 한번만 실물영접, 그것도 팬싸면 진짜 소원이 없겠습니다!!!!!!!!!!!! 제발........</p><p>존경하는 신나라님ㅜ&nbsp;</p>
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
