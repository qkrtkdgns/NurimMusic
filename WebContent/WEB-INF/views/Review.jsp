<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<%@include file="inc/head.jsp" %>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/Review.css" />
		
	</head>
	<body>
 
<%@include file="inc/top_nav.jsp" %>
<div class="ddd"></div>
<!-- 본문내용 작성 start -->
					<!-- 회원리뷰 전체 영역 -->
		<div id="content">
		
		           <h2>커뮤니티</h2><hr>
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
		
		<!-- 회원리뷰 상단 -->
		<div class="box1">
			<a href="#">
				최신 글순&nbsp;&nbsp;&nbsp;</a>
				<a href="#">
				댓글 많은순&nbsp;</a>
				<select name="category" id="category">
					<option>카레고리별 보기</option>
					<option>국내음반</option>
					<option>해외음반</option>
					<option>클래식</option>
				</select>
		</div>
		<!-- //회원리뷰 상단 끝 -->
				
			<!-- 회원리뷰 내용 영역 -->
			<div class="review_content">
			<ul>
				<li class="thumb-list">
						<a href="Review_write_result.do">
						<span class="thumb">
							<img  src="${pageContext.request.contextPath }/img/rv1.png" alt="리뷰1" />
						</span>
						</a>
						<span class="text">
							<a href="Review_write_result.do">
							<span class="title">sf9</span></a>
							<span class="text_1">
							ggzzzzzz&nbsp;&nbsp;|&nbsp;&nbsp;2016.10.25&nbsp;&nbsp;|&nbsp;&nbsp;CD
							</span>
							<span class="desc">포카 최애가 안나와서 슬프지만 엽서보다 큰 사이즈의 포토엽서 사진은 정말 기똥찹니다ㅠㅠ 사세요 두 번 사세요 또 사세요 무조건 사세요 ㅎㅎ</span>
						</span>
				</li>
					
				<li class="thumb-list">
						<a  href="#">
						<span class="thumb">
							<img  src="${pageContext.request.contextPath }/img/rv2.png" alt="리뷰1" />
						</span>
						</a>
						<span class="text">
							<a href="#">
							<span class="title">쇼케이스 응모합니다!!!</span></a>
							<span class="text_1">
							k0916kjy&nbsp;&nbsp;|&nbsp;&nbsp;2016.10.28&nbsp;&nbsp;|&nbsp;&nbsp;CD
							</span>
							<span class="desc">쇼케이스 응모해요 진짜 꼭 가고 싶습니다ㅠㅠㅠㅠㅠㅠ빅스 이번 크라토스 활동도 너무 기대되고 잘할 것 같아요!!! 음원 나오는 날 바로 무대 보면서 응원하면 정말 행복할 것 같아요!! 이번 해에 빅스 보러 다니지도 많이 못해서 이번 쇼케이스에서 꼭 보고 싶네요ㅠ.ㅠ 쇼케이스 가서 빅스 열심히 응원하고 싶어요ㅠㅠㅠㅠ 가서 진짜 열심히 소리지르며 응원할 자신 있습니다!! 빅스 언제나 사랑하고 응원해요 이번 크라토스 활동도 역대급일 것 같고 멋지게 잘 마무리하길 바래요!!!! 꼭 꼭 당첨되길 바래요ㅠㅠㅜㅠㅠㅠㅠ 빅스 나라세!!!!</span>
						</span>
				</li>
					
				<li class="thumb-list">
						<a  href="#">
						<span class="thumb">
							<img  src="${pageContext.request.contextPath }/img/rv_22.png" alt="리뷰1" />
						</span>
						</a>
						<span class="text">
							<a href="#">
							<span class="title">믿고 들어보는 대장나무 노래</span></a>
							<span class="text_1">
							diva77&nbsp;&nbsp;|&nbsp;&nbsp;2016.10.13&nbsp;&nbsp;|&nbsp;&nbsp;CD
							</span>
							<span class="desc">금방 주문했고요.....미리 공개된 숨...은 들어봤습니다.
							들을수록 빨려드는 잔잔하게들리는 음색이 여전히 매력적인 효신님 노래...
							앨범 도착하면 평 다시 올릴께요....
							해줄수 없는일로 대뷔 이후 쭈욱 사랑해온 가수인데요
							중간에 창법도 조금 바뀌고 좀더 성숙한 이미지로 돌아온 대장나무님...
							앞으로 쭈욱 멋진 노래 기대하면서..........
							이번 앨범도 많이 사랑해주세요~^^ 15일 콘서트도 기대됩니다 @.@
							개인적으로 음반보다 라이브가 강한 갓효신~!!!!!!!  기대해도 좋습니다~ 
							</span>
					</span>
				</li>
					
				<li class="thumb-list">
						<a  href="#">
						<span class="thumb">
							<img  src="${pageContext.request.contextPath }/img/rv3.png" alt="리뷰1" />
						</span>
						</a>
						<span class="text">
							<a href="#">
							<span class="title">진심이 잘 전달되는 산들 솔로 앨범 좋아요</span></a>
							<span class="text_1">
							adg3407&nbsp;&nbsp;|&nbsp;&nbsp;2016.10.08&nbsp;&nbsp;|&nbsp;&nbsp;CD
							</span>
							<span class="desc">기대 이상으로 노래도 좋았고 앨범 표지며 속지며 다 기대 이상입니다 정말 앞으로가 기대되는 가수에요^!!
							저는 그렇게 있어줘도 좀 신박해서 매우 맘에 들었고 박원님이 작곡작사하셨다 들었는데 역시네요 너무 좋아요 그리고 수록곡도 하나하나 다 좋은데 역시 가족관련된 노래가 더 와닿았어요 집이랸 곡 들으면서 정말 부모님께 죄송하단  생각 들었고 나의어린적이야기 들으면서 진짜 울컥했어요 할아버지 생각하면서  작사했다고 들었는데 그 맘이 정말 잘 전달되더군요 산들씨 할아버지께도 그 마음 잘 전달됐으니라고 믿어요ㅎㅎ 그리고 나의 어릴적이야기 가사중에  저기요 아저씨? 그분이 혹시 할아버지인가요?  할아버지라고 생각하니까 더 울컥하더라구요^  산들 솔로 잘됐으면 좋겠고 미래가 밝았으면 좋겠습니다^^!!!!!!!!!!!!!!!
							</span>
						</span>
				</li>
					
				<li class="thumb-list">
						<a  href="#">
						<span class="thumb">
							<img  src="${pageContext.request.contextPath }/img/rv5.png" alt="리뷰1" />
						</span>
						</a>
						<span class="text">
							<a href="#">
							<span class="title">또한번트와이스!</span></a>
							<span class="text_1">
							wookkk&nbsp;&nbsp;|&nbsp;&nbsp;
							2016.10.05&nbsp;&nbsp;|&nbsp;&nbsp;CD
							</span>
							<span class="desc">저의 군생활 끝자락을 식스틴이라는 프로그램으로 함께 해줬던 종합 비타민같은 우리 트와이스 멤버들!
							우아하게가 역주행으로 대박이나고 뮤비 일억뷰도 이제 정말 얼마남지않았네요
							치얼업으로 넘사벽의 기록을 보여준 트와이스!
							이번에도 좋은 노래와 좋은 춤과 좋은 기운으로 우리의 기대를 넘는! 그런 트와이스의 모습을 보여주세요~!
							국민걸그룹으로 쐐기를 박아버립시다!
							또다시 우리에게
							눈으로 한번 귀로한번 감동을 받게 해주세요
							매일매일 디데이를 기대하고 있겠습니다
							트와이스 트와이스 잘하자!ㅋ
							</span>
						</span>
				</li>
					
				<li class="thumb-list">
						<a  href="#">
						<span class="thumb">
							<img  src="${pageContext.request.contextPath }/img/rv6.png" alt="리뷰1" />
						</span>
						</a>
						<span class="text">
							<a href="#">
							<span class="title">샤이니 화이팅</span></a>
							<span class="text_1">
							yjy0528&nbsp;&nbsp;|&nbsp;&nbsp;
							2016.10.05&nbsp;&nbsp;|&nbsp;&nbsp;CD
							</span>
							<span class="desc">팬질하면서 앨범사고 하나도 돈 안아까운 명반을 만들어줘서 넘넘 감사합니당♥♥
							아직 앨범 실물은 못 받았지만 분명 예쁠거에용 
							내 인생에 아이돌은 샤이니가 유일합니다 ㅠㅠㅠㅠ
							앞으로도 흥해서 젝키들처럼 나중에 아이 낳고도 팬질 할 수 있도록 해주세요!
							이번 앨범 경쟁자 많고 치열하지만 샤월들 다 힘 합쳐서 꼭 일등가수 만들어주고 싶어요 
							오랫동안 팬질 쉬고 있었는데 진기오빠 발목부상투혼에 맴찢하면서
							빛돌이들이 저렇게 열심히 준비했는데 놀 수가 없어서 
							다시 팬질 시작합니다 진짜 싸랑해여
							</span>
						</span>
				</li>
				<li class="thumb-list">
						<a  href="#">
						<span class="thumb">
							<img  src="${pageContext.request.contextPath }/img/rv7.png" alt="리뷰1" />
						</span>
						</a>
						<span class="text">
							<a href="#">
							<span class="title">레드벨벳 앨범!!</span></a>
							<span class="text_1">
							jaewo01&nbsp;&nbsp;|&nbsp;&nbsp;2016.09.13&nbsp;&nbsp;|&nbsp;&nbsp;CD
							</span>
							<span class="desc">ㅜㅜㅜㅜㅜㅜㅜㅜ앨범 2장 사려다 1장 샀는데도 최애 조이인데 조이가 한바ㅇ에!!!!!!ㅜㅜㅜㅜㅜㅜㅜ너무 감사드립니다ㅜㅜㅜㅜ신나라 만세!!! ㅜㅜㅜㅜㅜ!!!! 애들 앨범 안에 있는  사진들도 ㅇ너무 예쁘고 포스터랑 스티커도 넘나엄나 예뻐용,,,,역시 예판 사길 잘했어,,,,조이 말고 다른 애들도 포카 넘넘 예쁘던데ㅜㅜㅜㅜ사고싶지만 한발ㅇ에 나올지 안나올지도 모르궁ㅜㅜㅜㅜ교환도 귀찮아서ㅎㅎㅎㅎ 아무튼 이번 애ㄹ범 꼿 사세요 여러분ㅜㅜㅜㅜㅜ ㅐ애들 미모 체고십니당ㅜㅜㅜㅜㅜㅜㅜㅜ후회 절대 안해요ㅜㅜㅜㅜ러룰 흥하자ㅜㅜㅜ!ㅡ1</span>
						</span>
				</li>
					
				<li class="thumb-list">
						<a  href="#">
						<span class="thumb">
							<img  src="${pageContext.request.contextPath }/img/rv8.png" alt="리뷰1" />
						</span>
						</a>
						<span class="text">
							<a href="#">
							<span class="title">인피니트 사랑해</span></a>
							<span class="text_1">
							jdy1484&nbsp;&nbsp;|&nbsp;&nbsp;
							2016.09.13&nbsp;&nbsp;|&nbsp;&nbsp;CD
							</span>
							<span class="desc">
							ㅈ희 인피니트 앨범 배송 조심히 해주세요ㅜㅜㅜㅜ 절대로 함부로하시거나 막하시면 안되요ㅜㅜㅜㅜ소중하게 다뤄주세요ㅜㅜ 소중한 아이들이예요ㅜㅜㅜㅜ @취급주의@부탁드려요!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 

							추석뒤에 음반이 배송하니까 조금은 늦겠지??............................................................................

							그래도 괜찮아ㅜㅜㅜㅜㅜ 기다릴수있어ㅜ 기다릴께ㅜ 인피니트 앨범 기다릴께><  

							김성규@장동우@남우현@이호원@이성열@김명수@이성종 사랑하고 고마워!!!!!!!

							인피니트 고마워 

							#INFINITE_ONLY 
							</span>
						</span>
				</li>
					
				<li class="thumb-list">
						<a  href="#">
						<span class="thumb">
							<img  src="${pageContext.request.contextPath }/img/rv9.png" alt="리뷰1" />
						</span>
						</a>
						<span class="text">
							<a href="#">
							<span class="title">라붐 노래 좋아요</span></a>
							<span class="text_1">
							gmlekw&nbsp;&nbsp;|&nbsp;&nbsp;
							2016.09.06&nbsp;&nbsp;|&nbsp;&nbsp;CD
							
							</span>
							<span class="desc">상큼톡톡 튀는 매력 넘치는 라붐이들 ~^^  항상 응원합니다
							이번 타이틀곡과 수록곡들도 모두모두 좋네요              
							핸드폰으로도 씨디로도 매일매일 듣고 있어요
							포스터도 잘 받았답니다 멤버들 얼굴 크게크게 나와서 좋네요ㅎㅎ
							첫 미니앨범인데 더더 잘 되었음 좋겠네요
							라붐만의 색깔과 매력 잃지 않고 계속 좋은 음악 많이 내주었음 좋겠어요
							</span>
						</span>
				</li>
					
					<li class="thumb-list">
						<a href="#">
						<span class="thumb">
							<img  src="${pageContext.request.contextPath }/img/rv10.png" alt="리뷰1" />
						</span>
						</a>
						<span class="text">
							<a href="#">
							<span class="title">좋아요~</span></a>
							<span class="text_1">
							jasapa&nbsp;&nbsp;|&nbsp;&nbsp;
							2016.08.06&nbsp;&nbsp;|&nbsp;&nbsp;CD
							</span>
							<span class="desc">포프로듀스 101 첫회부터 최종 데뷔멤버 확정까지 쭉 지켜봐온 사람으로서 11명의 소녀들의 우여곡절과 데뷔과정이 정말 와닿습니다.
							이제 곧 나올 첫 번째 데뷔앨범 정말 기대하고 있습니다.
							좋은 곡들과 좋은 컨셉으로 멋진 활약 기대하겠습니다.
							처음에는 과연 잘 될까 싶기도 했지만.. 차근차근 알아갈수록 정말 매력이 넘치는 아이들인 것을 알게 되었고
							누구보다 잘 되기를 희망하고 또 바랍니다.
							비록 11인 안에 들지는 못한 친구들도 맘속 깊이 응원하고 있습니다.
							정말 기대되네요. 
							좋아요~!
							(예쁜 유정아 만긍이 응원한다!)
							</span>
						</span>
				</li>
				</ul>

				<div id="rev_foot">
				<!-- 리뷰 쓰기 버튼 -->
					<div class="review_box">
					<a href="review_write.do">
						<button type="button" class="btn btn-default btn-md" >리뷰쓰기</a>
						</button>
					</div>
				<!-- //리뷰 쓰기 버튼 끝 -->

				<!-- 페이지 번호 영역 -->
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
					<div class="review_foot">
					<div class="result_search">
						<select class="input_form" id="keyword_type" name="keyword_type">
						<option value="subject">제목</option>
							<option value="contents">내용</option>
							<option value="insert_id">등록자ID</option>
					</select>
						<input type="text" class="input_txt" id="keyword" name="keyword" />
							<button type="button" class="btn btn-default">검색</button>
					</div>
				<!-- //검색 영역 끝 -->
				</div>
				<!--//rev_foot 끝 -->
				</div>
			<!-- //회원리뷰 내용 영역 끝  -->
			</div>
	<!-- //회원리뷰 전체 영역 끝 -->
			</div>
<!--본문내용 작성 end -->

<%@include file="inc/footer.jsp" %>

	</body>
</html>