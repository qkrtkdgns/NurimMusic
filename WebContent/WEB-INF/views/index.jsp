<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html lang="ko">
   <head>
     <%@include file="inc/head.jsp" %>
      <link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/css/slide.css" />
      <link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/css/index.css" />

   </head>
   <body>


 <%@include file="inc/top_nav.jsp" %>
<div class="ddd"></div>
<!-- 본문내용 작성 start -->
         <div id="content">
            <div class=top_menu>
               <div class="slide">
                  <ul class="slide_ul">
                     <li><a><img src="${pageContext.request.contextPath }/img/메인1.jpg" width="700"
         height="360" alt="슬라이드">
                     </a></li>
                     <li><a><img src="${pageContext.request.contextPath }/img/slide-6aa.jpg" width="700"
         height="360"alt="슬라이드">
                     </a></li>
                     <li><a><img src="${pageContext.request.contextPath }/img/slide-gg.jpg" width="700"
         height="360"alt="슬라이드">
                     </a></li>
                     <li><a><img src="${pageContext.request.contextPath }/img/메인3.jpg" width="700"
         height="360"alt="슬라이드">
                     </a></li>
                     <li><a><img src="${pageContext.request.contextPath }/img/메인2.jpg" width="700"
         height="360"alt="슬라이드">
                     </a></li>

                  </ul>
               </div>
               <div class="side">
               <table>
                 <tr>
                  <td width="400" align="center"><a href="${pageContext.request.contextPath }/kor.do">
                <img src="${pageContext.request.contextPath }/img/text2.jpg" width="410" height="135" alt="사이드메뉴"/></a>
                </td>
                <tr><td height="4"></td></tr>
                  </tr>
                 <td width="400" align="center"><a href="${pageContext.request.contextPath }/foreign.do">
                <img src="${pageContext.request.contextPath }/img/text.png" width="410" height="135" alt="사이드메뉴"/></a></td>
                  <tr><td height="4"></td></tr>
                  <td width="400" align="center"><a href="${pageContext.request.contextPath }/shopping_main.do">
                <img src="${pageContext.request.contextPath }/img/123.png" width="410" height="135" alt="사이드메뉴"/></a></td>




               </table>

               </div>
            </div>
            <div class="best_item">
                  <img src="${pageContext.request.contextPath }/img/Best_Item1.jpg"><h1>best item</h1>
             <div id="carousel">
                  <a href="${pageContext.request.contextPath }/item.do"><img src="${pageContext.request.contextPath }/images/국내음반1.jpg" id="item-1" /></a>
               <a href="${pageContext.request.contextPath }/item.do"><img src="${pageContext.request.contextPath }/images/레드벨벳.jpg" id="item-2" /></a>
               <a href="${pageContext.request.contextPath }/item.do"><img src="${pageContext.request.contextPath }/images/박효신.jpg" id="item-3" /></a>
               <a href="${pageContext.request.contextPath }/item.do"><img src="${pageContext.request.contextPath }/images/볼빨간 사춘기.jpg" id="item-4" /></a>
               <a href="${pageContext.request.contextPath }/item.do"><img src="${pageContext.request.contextPath }/images/소유,유승우.jpg" id="item-5" /></a>
               <a href="${pageContext.request.contextPath }/item.do"><img src="${pageContext.request.contextPath }/images/어반자카파.jpg" id="item-6" /></a>
               <a href="${pageContext.request.contextPath }/item.do"><img src="${pageContext.request.contextPath }/images/엑소.jpg" id="item-7" /></a>
               <a href="${pageContext.request.contextPath }/item.do"><img src="${pageContext.request.contextPath }/images/여자친구.jpg" id="item-8" /></a>
               <a href="${pageContext.request.contextPath }/item.do"><img src="${pageContext.request.contextPath }/images/임창정.jpg" id="item-9" /></a>
               <a href="${pageContext.request.contextPath }/item.do"><img src="${pageContext.request.contextPath }/images/트와이스.jpg" id="item-10" /></a>
               <a href="${pageContext.request.contextPath }/item.do"><img src="${pageContext.request.contextPath }/images/한동근.jpg" id="item-11" /></a>
               <a href="${pageContext.request.contextPath }/item.do"><img src="${pageContext.request.contextPath }/images/해외음반.jpg" id="item-12" /></a>
             </div>

            </div>

      <div id="new_item">
               <div class="new_img">
               <img src="img/New_Item1.jpg">
               </div>
               <ul class="new_item_ul1">

               <li>
               <a href="${pageContext.request.contextPath }/item.do">
               <span class="thumb"><img src="${pageContext.request.contextPath }/img/강이채 - 1집 [RADICAL PARADISE].png"></span>
               <span class="ab_name">강이채 - 1집 [RADICAL PARADISE]</span></a>
               <span class="price">13,500원</span>
               </li>

               <li>
               <a href="${pageContext.request.contextPath }/item.do">
               <span class="thumb"><img src="${pageContext.request.contextPath }/img/김나영 - 1집 [FROM THE HEART].png"></span>
               <span class="ab_name">김나영 - 1집 [FROM THE HEART]</span></a>
               <span class="price">1,7000원</span>
               </li>

               <li>
               <a href="${pageContext.request.contextPath }/item.do">
               <span class="thumb"><img src="${pageContext.request.contextPath }/img/김효은 - MY AMBITION EP (1ST EP).png"></span>
               <span class="ab_name">김효은 - MY AMBITION EP (1ST EP)</span></a>
               <span class="price">15,800원</span>
               </li>

               <li>
               <a href="${pageContext.request.contextPath }/item.do">
               <span class="thumb"><img src="${pageContext.request.contextPath }/img/다비치 - 50 X HALF (미니앨범).png"></span>
               <span class="ab_name">다비치 - 50 X HALF (미니앨범)</span></a>
               <span class="price">18,400원</span>
               </li>

               <li>
               <a href="${pageContext.request.contextPath }/item.do">
               <span class="thumb"><img src="${pageContext.request.contextPath }/img/레이디스 코드 - STRANG3R.png"></span>
               <span class="ab_name">레이디스 코드 - STRANG3R</span></a>
               <span class="price">13,400원</span>
               </li>

               <li>
               <a href="${pageContext.request.contextPath }/item.do">
               <span class="thumb"><img src="${pageContext.request.contextPath }/img/백퍼센트.png"></span>
               <span class="ab_name">백퍼센트 (100%) - TIME LEAP (3RD 미니앨범)</span></a>
               <span class="price">21,900원</span>
               </li>

               <li>
               <a href="${pageContext.request.contextPath }/item.do">
               <span class="thumb"><img src="${pageContext.request.contextPath }/img/박재범 (JAY PARK) - EVERYTHING YOU WANTED (정규앨범).png"></span>
               <span class="ab_name">박재범 (JAY PARK) - EVERYTHING YOU WANTED (정규앨범)</span></a>
               <span class="price">23,800원</span>
               </li>

               <li>
               <a href="${pageContext.request.contextPath }/item.do">
               <span class="thumb"><img src="${pageContext.request.contextPath }/img/수퍼스트링 (SUPERSTRING) - 1집 [THE GRAND DESIGN] .png"></span>
               <span class="ab_name">수퍼스트링 (SUPERSTRING) - 1집 [THE GRAND DESIGN]</span></a>
               <span class="price">15,500원</span>
               </li>

               <li>
               <a href="${pageContext.request.contextPath }/item.do">
               <span class="thumb"><img src="${pageContext.request.contextPath }/img/스웨덴 세탁소 - 2집 [마음].png"></span>
               <span class="ab_name">스웨덴 세탁소 - 2집[마음]</span></a>
               <span class="price">12,800원</span>
               </li>

               <li>
               <a href="${pageContext.request.contextPath }/item.do">
               <span class="thumb"><img src="${pageContext.request.contextPath }/img/신용재 - EMPATHY (2ND 미니앨범).png"></span>
               <span class="ab_name">신용재 - EMPATHY (2ND 미니앨범).png</span></a>
               <span class="price">13,000원</span>
               </li>

               <li>
               <a href="${pageContext.request.contextPath }/item.do">
               <span class="thumb"><img src="${pageContext.request.contextPath }/img/아이오아이 (I.O.I) - 미니 2집.png"></span>
               <span class="ab_name">아이오아이 (I.O.I) - 미니 2집</span></a>
               <span class="price">20,000원</span>
               </li>

               <li>
               <a href="${pageContext.request.contextPath }/item.do">
               <span class="thumb"><img src="${pageContext.request.contextPath }/img/알클스 (ALCLS) - 꽃 (1ST 싱글앨범).png"></span>
               <span class="ab_name">알클스 (ALCLS) - 꽃 (1ST 싱글앨범)</span></a>
               <span class="price">17,700원</span>
               </li>

               <li>
               <a href="${pageContext.request.contextPath }/item.do">
               <span class="thumb"><img src="${pageContext.request.contextPath }/img/위아더나잇 (WE ARE THE NIGHT) - 녹색광선 (미니앨범).png"></span>
               <span class="ab_name">위아더나잇 (WE ARE THE NIGHT) - 녹색광선 (미니앨범)</span></a>
               <span class="price">15,000원</span>
               </li>

               <li>
               <a href="${pageContext.request.contextPath }/item.do">
               <span class="thumb"><img src="${pageContext.request.contextPath }/img/크러쉬 (CRUSH) - WONDERLUST (2ND 미니앨범).png"></span>
               <span class="ab_name">크러쉬 (CRUSH) - WONDERLUST (2ND 미니앨범)</span></a>
               <span class="price">22,900원</span>
               </li>


               <li>
               <a href="${pageContext.request.contextPath }/item.do">
               <span class="thumb"><img src="${pageContext.request.contextPath }/img/펜타곤 (PENTAGON) - PENTAGON (1ST 미니앨범).png"></span>
               <span class="ab_name">펜타곤 (PENTAGON) - PENTAGON (1ST 미니앨범)</span></a>
               <span class="price">19,600원</span>
               </li>
            </ul>
            </div>

            <!-- 누림 MD 추천음반 영역 시작 -->
            <div class="main_rev">
               <img src="${pageContext.request.contextPath }/img/main_md2.png">
               <ul>

               <li class="rv_list">
               <a href="${pageContext.request.contextPath }/item.do">
                  <span class="thumb">
                     <img src="${pageContext.request.contextPath }/img/언해피서킷 - 2집 [WILL BE HAPPY].png">
                  </span>
                  <div class="text">
                     <span class="title">언해피서킷 - 2집 [WILL BE HAPPY]</span>
                     <span class="md_price">
                     12,900원
                     </span>
                     <span class="text_1">
                     첫 번째 앨범을 가득 채웠던 Glitch한 사운드와는 달리, 이번 앨범은 음악을 듣는 이가 자신의 내면에 조금 더 집중할 수 있게끔 여백과 빈 공간을 남겨 둔 트랙들로 구성되어 있다. 핵심만 남겨둔 채 모두 비워냄으로써 Ambient, Minimalism의 성향에 가까워지는 그의 음악적 변화를 통해 조금씩 마음의 평온을 찾아가는 한 소년의 내면세계를 들여다 볼 수 있다.
                     </span>
                  </div>
               </a>
               </li>

               <li class="rv_list">
               <a href="${pageContext.request.contextPath }/item.do">
                  <span class="thumb">
                     <img src="${pageContext.request.contextPath }/img/콴 (KUAN) - 2집 [SENIOR].png">
                  </span>
                  <div class="text">
                     <span class="title">콴 (KUAN) - 2집 [SENIOR]</span>
                     <span class="md_price">
                     15,600원
                     </span>
                     <span class="text_1">
                     'Senior'는 국내앨범에서는 잘 볼 수 없었던 Trap, PBR&B, Hip-Hop으로 구성이 되어, 콴이 가지고 있던 다양한 음악적 스펙트럼을 전부 보여주는 앨범이다. 
                     </span>
                  </div>
               </a>
               </li>

               <li class="rv_list">
               <a href="${pageContext.request.contextPath }/item.do">
                  <span class="thumb">
                     <img src="${pageContext.request.contextPath }/img/BEATLES - THE BEATLES 1 (DIGITAL REMASTERED).png">
                  </span>
                  <div class="text">
                     <span class="title">BEATLES - THE BEATLES 1 (DIGITAL REMASTERED)</span>
                     <span class="md_price">
                     21,900원
                     </span>
                     <span class="text_1">
                     2000년 밀레니엄에 맞추어 처음으로 발매되었던 비틀즈 No. 1 싱글 베스트 앨범 “1”의 2011년판 디지털 리마스터 앨범! 
                     디지팩 디럭스 에디션 / 전량 유럽 수입반 발매!! 
                     </span>
                  </div>
               </a>
               </li>

               <li class="rv_list">
               <a href="${pageContext.request.contextPath }/item.do">
                  <span class="thumb">
                     <img src="${pageContext.request.contextPath }/img/BEGIN AGAIN - O.S.T..png">
                  </span>
                  <div class="text">
                     <span class="title">BEGIN AGAIN - O.S.T.</span>
                     <span class="md_price">
                     17,300원
                     </span>
                     <span class="text_1">
                     [원스]의 감독의 로맨틱 멜로~디! 
                     영화 [비긴 어게인] 사운드 트랙 [Begin Again ? Music From And Inspired By The Original Motion Picture] 
                     </span>
                  </div>
               </a>
               </li>

               </ul>
            </div>
            <!-- 누림 MD 추천음반 영역 끝 -->
         </div>


<!--본문내용 작성 end -->

<%@include file="inc/footer.jsp" %>
      <script src="${pageContext.request.contextPath }/assets/js/mainslide.js"></script>
      <script src="${pageContext.request.contextPath }/assets/js/bootstrap.min.js"></script>
       <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.waterwheelCarousel.js"></script>
          <script type="text/javascript">
       $(document).ready(function () {
        var carousel = $("#carousel").waterwheelCarousel({
          flankingItems: 3,
          movingToCenter: function ($item) {
            $('#callback-output').prepend('movingToCenter: ' + $item.attr('id') + '<br/>');
          },
          movedToCenter: function ($item) {
            $('#callback-output').prepend('movedToCenter: ' + $item.attr('id') + '<br/>');
          },
          movingFromCenter: function ($item) {
            $('#callback-output').prepend('movingFromCenter: ' + $item.attr('id') + '<br/>');
          },
          movedFromCenter: function ($item) {
            $('#callback-output').prepend('movedFromCenter: ' + $item.attr('id') + '<br/>');
          },
          clickedCenter: function ($item) {
            $('#callback-output').prepend('clickedCenter: ' + $item.attr('id') + '<br/>');
          }
        });

        $('#prev').bind('click', function () {
          carousel.prev();
          return false
        });

        $('#next').bind('click', function () {
          carousel.next();
          return false;
        });

        $('#reload').bind('click', function () {
          newOptions = eval("(" + $('#newoptions').val() + ")");
          carousel.reload(newOptions);
          return false;
        });

      });
      </script>

   </body>
</html>