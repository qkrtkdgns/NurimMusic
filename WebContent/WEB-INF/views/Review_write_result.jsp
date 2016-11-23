<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<%@include file="inc/head.jsp" %>
		<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/css/grid.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/Review_write_result.css" />
		<script type="text/javascript">
		</script>
	</head>
<body>
<%@include file="inc/top_nav.jsp" %>

			<div id="content">
				<font size="6">회원리뷰</font>
<!-- 회원리뷰 테이블 시작 -->
				
				<div class="review_board">
				<hr>
					<table class="table table-bordered">
						<colgroup>
							<col width="81" />
							<col width="410" />
							<col width="81" />
							<col width="178" />
						</colgroup>
							<tbody>
								<tr>
								<th class="active">제목</th>
									<td colspan="3">
										<p class="review_sub">wings 대박나자!!!!!!!!!!! 팬싸ㅜㅜㅜㅜ</p>
									
									</td>
									
								</tr>
								
								<tr>
									<th class="active">작성자</th>
									<td>hji1414</td>
									<th class="active">작성일</th>
									<td>2016.10.06 22:31:21</td>
								</tr>
								
								<tr>
									<th class="active">조회수</th>
									<td colspan="3">7</td>
									
								</tr>
								
								<tr>
									<th class="active">타이틀</th>
									<td colspan="3">
										<a href="${pageContext.request.contextPath }/item.do">
										<span class="album">
											<img src="${pageContext.request.contextPath }/img/exo.jpg" width="80" height="80" alt="exo" />
										</span>
										<div class="album_intro">
										<p class="ab_intro">방탄소년단 - 2집 [WINGS] [W.I.N.G 4가지 버전으로 발송] [팬사인회 응모는 종료되었습니다.]</p>
										</a>
										<p class="ab_price"><font color="red">
											59,600원</font>
										</p>
										</div>
										
									</td>
										
								</tr>									
							</tbody>
						</table>
						<!-- //회원 리뷰 테이블 끝 -->
					</div>
					
					<div class="review_cont">
						<p>엄마아빠가 무슨 앨범이 6만원씩이나 하냐고 뭐라하는걸 이겨내고 한세트 주문 완료!!!!!!!</p><p>진짜 방탄이들 내가 스밍 열심히 돌리고 목터져라 응원할께요ㅜㅜㅜㅜ 비티에스 사랑해ㅜㅜ</p><p>연예인에 1도 관심없던 내가 어느순간 빠져버렸잖아ㅜ</p><p>내 손에 앨범 들어오기만 기다리면서 시험공부 중이에여</p><p><strike>(아니 왜 시험전날 밤에&nbsp;컴백라이브지)</strike></p><p>아 팬싸가서 석진센빠이랑 이름 똑같은 내 동생 얘기두 하고 싶고ㅜㅜ</p><p>우리막내 맨날 아니쥬부르고 다니는뎁</p><p>&nbsp;</p><p>딱 한번만 실물영접, 그것도 팬싸면 진짜 소원이 없겠습니다!!!!!!!!!!!! 제발........</p><p>존경하는 신나라님ㅜ&nbsp;</p>
					</div>
					<hr>
					
					<!-- 목록 버튼 -->
					<div class="list">
						<button type="button" onclick="location.href='${pageContext.request.contextPath }/Review.do'" class="btn btn-primary btn-md">목록</button>
						
					<!-- 수정 버튼 -->
					<div class="modify">	
						<button type="button" onclick="location.href='${pageContext.request.contextPath }/Review_write.do'" class="btn btn-primary btn-md">수정</button>
					</div>
					</div>
					
					<hr>
					
					<!-- 댓글 영역 -->
					<div class="comment">
						<div class="comment_c">
							<font size="3">댓글</font>
							<hr>
						<div class="comment_rc">
							<font size="2">댓글이 없습니다.</font>
						</div>
							<hr>
						</div>
					</div>
					<!-- //댓글 영역 끝 -->
					

					<!-- 페이지 이동 -->
						<div class="page_num">
						<center>
							<ul class="pagination">
								<li class="disabled"><a href="#">&laquo;</a></li>
								<li class="active"><span>1<span class="sr-only">(current)</span></span></li>
								<li><a href="#">&raquo;</a></li>
							</ul>
						</center>
						</div>
		
					<div id="comment">
						<div class="comment_box1">
							<div class="comment_id">
								ggzzzzzz
							</div>
							<textarea name="comment_txt" class="comment_txt">
							</textarea>

							<div class="res_btn">
								<button type="button" class="btn btn-default btn-md">등록</button>
						
							</div>
						</div>
					</div>
					
					<!-- 이전글, 다음글 -->
					<table class="move_page">
					<colgroup>
						<col width="90">
						<col width="1080">
					</colgroup>
						<tbody>
							<tr>
								<th class="active">이전글</th>
								<td>엘로 넘 좋아여</td>
							</tr>

							<tr>
								<th class="active">다음글</th>
								<td>역시 엑소</td>
							</tr>
						</tbody>
					</table>
					</div>
					<!--//이전글, 다음글 끝  -->
					


<%@include file="inc/footer.jsp" %>

	</body>
</html>