<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="inc/head.jsp"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/discussion.css" />

<script type="text/javascript">
	
</script>
</head>
<body>
	<%@include file="inc/top_nav.jsp"%>
	<div class="ddd"></div>
	<!-- 본문내용 작성 start -->
	<!-- 회원리뷰 전체 영역 -->
	<div id="content">

		<!-- 회원리뷰 상단 -->
		<h2>커뮤니티</h2>
		<hr>
		<div class="side_area">
			<a href="#">회원리뷰</a>
			<ul>
				<li><a href="${pageContext.request.contextPath }/Review.do">♪ 회원리뷰</a></li>
			</ul>
			<a href="#">토론광장</a>
			<ul>
				<li><a href="${pageContext.request.contextPath }/discussion.do">♪ 토론광장</a></li>
			</ul>
		</div>
		<div class="discussion">
			<div class="dis_sub">
				<div class="dis_sub2">
					<h4>베스트토론&nbsp;&nbsp;&nbsp;ㅇㅇㅇ</h4>
				</div>

				<ul class="dis_info">
					<li>작성자명 :</li>
					<li>MA TIANYAN</li>
					<li class="barlink">|</li>
					<li>기간 :</li>
					<li>2016.09.28 ~ 2016.10.28</li>
					<li class="barline">|</li>
					<li>총 참여 :</li>
					<li>0</li>
				</ul>
				<hr>

				<!--참여하기 버튼 -->
				<div class="dis_img">
					<img class="agree_img" src="${pageContext.request.contextPath }/img/dis_1.png"> <img
						class="bar_img" src="${pageContext.request.contextPath }/img/dis_3.png"> <img
						class="disargee_img" src="${pageContext.request.contextPath }/img/dis_2.png"> <a href="#"> <img
						class="parti_img" src="${pageContext.request.contextPath }/img/dis_4.png"></a>
				</div>
			</div>



			<div class="dis_content">
				<table class="dis_table">
					<colgroup>
						<col width="500" />
						<col width="100" />
						<col width="100" />
						<col width="80" />
						<col width="80" />
						<col width="80" />
					</colgroup>

					<thead>

						<tr>
							<th scope="col" class="text-center">제목</th>
							<th scope="col" class="text-center">작성일</th>
							<th scope="col" class="text-center">토론 종료일</th>
							<th scope="col" class="text-center">조회수</th>
							<th scope="col" class="text-center">찬성</th>
							<th scope="col" class="text-center">반대</th>
						</tr>

					</thead>

					<tbody>
						<tr>
							<td class="cont_sub"><a href="${pageContext.request.contextPath }/discussion_write_result.do">비투비짱</a></td>
							<td class="cont_date">2016.10.10</td>
							<td class="cont_datec">2016.10.17</td>
							<td class="cont_view">0</td>
							<td class="cont_ag">0</td>
							<td class="cont_disag">0</td>
						</tr>

						<tr>
							<td class="cont_sub"><a href="${pageContext.request.contextPath }/discussion_write_result.do">샤이니짱</a></td>
							<td class="cont_date">2016.10.03</td>
							<td class="cont_datec">2016.10.10</td>
							<td class="cont_view">0</td>
							<td class="cont_ag">0</td>
							<td class="cont_disag">0</td>
						</tr>

						<tr>
							<td class="cont_sub"><a href="${pageContext.request.contextPath }/discussion_write_result.do">ㅂㅂㅂ</a></td>
							<td class="cont_date">2016.09.28</td>
							<td class="cont_datec">2016.10.05</td>
							<td class="cont_view">4</td>
							<td class="cont_ag">0</td>
							<td class="cont_disag">0</td>
						</tr>

						<tr>
							<td class="cont_sub"><a href="${pageContext.request.contextPath }/discussion_write_result.do">ㅇㅇㅇ</a></td>
							<td class="cont_date">2016.09.28</td>
							<td class="cont_datec">2016.10.05</td>
							<td class="cont_view">10</td>
							<td class="cont_ag">0</td>
							<td class="cont_disag">0</td>
						</tr>

						<tr>
							<td class="cont_sub"><a href="${pageContext.request.contextPath }/discussion_write_result.do">sdf</a></td>
							<td class="cont_date">2016.09.20</td>
							<td class="cont_datec">2016.09.27</td>
							<td class="cont_view">3</td>
							<td class="cont_ag">0</td>
							<td class="cont_disag">0</td>
						</tr>

						<tr>
							<td class="cont_sub"><a href="${pageContext.request.contextPath }/discussion_write_result.do">음반 발매 기념 팬싸인회 중복응모에 대해</a>
							</td>
							<td class="cont_date">2016.09.15</td>
							<td class="cont_datec">2016.09.22</td>
							<td class="cont_view">91</td>
							<td class="cont_ag">15</td>
							<td class="cont_disag">24</td>
						</tr>

						<tr>
							<td class="cont_sub"><a href="${pageContext.request.contextPath }/discussion_write_result.do">순위제 가요프로그램 찬성하는가 반대하는가</a>
							</td>
							<td class="cont_date">2016.09.12</td>
							<td class="cont_datec">2016.09.19</td>
							<td class="cont_view">71</td>
							<td class="cont_ag">10</td>
							<td class="cont_disag">10</td>
						</tr>

						<tr>
							<td class="cont_sub"><a href="${pageContext.request.contextPath }/discussion_write_result.do">건강한 팬문화 그 선은 어디까지인가</a></td>
							<td class="cont_date">2016.09.08</td>
							<td class="cont_datec">2016.09.15</td>
							<td class="cont_view">21</td>
							<td class="cont_ag">0</td>
							<td class="cont_disag">5</td>
						</tr>

						<tr>
							<td class="cont_sub"><a href="${pageContext.request.contextPath }/discussion_write_result.do">아이돌의 잘못은 소속사의 잘못이다?</a></td>
							<td class="cont_date">2016.09.07</td>
							<td class="cont_datec">2016.09.14</td>
							<td class="cont_view">28</td>
							<td class="cont_ag">5</td>
							<td class="cont_disag">0</td>
						</tr>

						<tr>
							<td class="cont_sub"><a href="${pageContext.request.contextPath }/discussion_write_result.do">판매량과 명반은 별개죠</a></td>
							<td class="cont_date">2016.09.05</td>
							<td class="cont_datec">2016.09.12</td>
							<td class="cont_view">17</td>
							<td class="cont_ag">0</td>
							<td class="cont_disag">0</td>
						</tr>
					</tbody>
				</table>

				<!-- 하단 부분 -->
				<div id="dis_foot">

					<!-- 토론 글쓰기 버튼 -->
					<div class="dis_btn">
						<a href="${pageContext.request.contextPath }/discussion_write.do">
							<button type="button" class="btn btn-default btn-md">토론글쓰기</button>
						</a>
					</div>
					<!-- //토론 글쓰기 버튼 끝 -->

					<!-- 페이지 번호 -->
					<div class="page_num">
						<ul class="pagination pagination-md">
							<li><a href="#">&laquo;</a></li>
							<li class="active"><span>1<span class="sr-only">(current)</span></span></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#">&raquo;</a></li>
						</ul>
					</div>
					<!-- //페이지 번호 끝 -->

					<!-- 검색 영역 -->
					<div class="result_search">
						<select class="input_form" id="keyword_type" name="keyword_type">
							<option value="subject">제목</option>
							<option value="contents">내용</option>
							<option value="insert_id">등록자ID</option>
						</select> <input type="text" class="input_txt" id="keyword" name="keyword" />
						<button type="button" class="btn btn-default">검색</button>
					</div>
					<!-- //검색 영역 끝 -->
				</div>
			</div>
		</div>
	</div>

	<!-- //회원리뷰 상단 끝 -->

	<!--본문내용 작성 end -->

	<%@include file="inc/footer.jsp"%>

</body>
</html>
