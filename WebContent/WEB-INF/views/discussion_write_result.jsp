<!-- 수정본 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>


<!DOCTYPE html>
<html lang="ko">
	<head>
		<%@include file="inc/head.jsp" %>
		<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/css/grid.css" />
		<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/css/discussion_write_result.css" />

		
		<style type="text/css">
		h3 {
			color: gray;
		}
		</style>
	</head>
	

<body>
 <%@include file="inc/top_nav.jsp" %>

			<div id="content">
				<h2>커뮤니티 |&nbsp;</h2><h3>토론광장</h3>
				<!-- 회원리뷰 테이블 시작 -->
				
				<div class="dis_board">
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
									<td colspan="4">
										<p class="dboard_sub">음반 발매 기념 팬싸인회 중복응모에 대해</p>
									
									</td>
									
								</tr>
								
								<tr>
									<th class="active">작성자</th>
									<td>송하준</td>
									<th class="active">작성일</th>
									<td>2016.08.07 22:31:21</td>
								</tr>
								
								<tr>
									<th class="active">토론기간</th>
									<td>2016.08.07 ~ 2016.08.14</td>
									<th class="active">조회수</th>
									<td>94</td>
									
								</tr>
															
							</tbody>
						</table>
						<!-- //회원 리뷰 테이블 끝 -->
					</div>
					
					<div class="dis_cont">
						<p>가수들이 앨범이 발매되면 팬싸인회를 하는데 이때 앨범을 구매하는것으로 응모가 이루어집니다.</p>

						<p>이때 중복응모가 가능하여 많이 살수록 당첨확률이 높아져서 대량으로 구매하는일이 많이 벌어지는데</p>

						<p>중복응모가 가능한것에 대해 찬성vs반대 투표해주세요!</p>

					</div>
					

					<!--토론 참여 -->
					<div class="dis_parti">
					<span class="thumb1">
					<a href="#">
						<img src="${pageContext.request.contextPath }/img/dis_btn1.png">
					</a>
					</span>

					<span class="thumb2">
					<a href="#">
						<img src="${pageContext.request.contextPath }/img/dis_btn2.png">
					</a>
					</span>
					</div>
					<hr>

					<!-- 목록 버튼 -->
					<div class="dis_btn">
					<div class="list">
						<button type="button" onclick="location.href='${pageContext.request.contextPath }/discussion.do'" class="btn btn-primary btn-md">목록</button>
					<!-- 수정 버튼 -->
					<div class="modify">	
						<button type="button" onclick="location.href='${pageContext.request.contextPath }/discussion_write.do'" class="btn btn-primary btn-md">수정</button>
					</div>
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
		
					<div id="comment_box">
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
					<!--//이전글, 다음글 끝  -->
					
			</div>


<%@include file="inc/footer.jsp" %>


	</body>
</html>
