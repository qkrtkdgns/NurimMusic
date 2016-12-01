<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html lang="ko">
   <head>
     <%@include file="inc/head.jsp" %>
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/kor.css" />

   </head>
   <body>

<%@include file="inc/top_nav.jsp" %>
<div class="ddd"></div><!--빈 박스-->
<!-- 본문내용 작성 start -->
         <div id="content">
         <h2>국내음반</h2><hr>
         <!--사이드 메뉴-->
         <%@include file="inc/category.jsp" %>
         <!-- end 사이드 메뉴-->
         <div class="top_list">
            <div class="img_slide"><span>최신음반</span>
                        <ul>
                           <li><a href="${pageContext.request.contextPath }/item.do"><img src="${pageContext.request.contextPath }/images/kor_slide01.jpg" /></a><span>WEEN - IDENTITY</span><br/><span class="price">14,900원</span></li>

                           <li><a href="${pageContext.request.contextPath }/item.do"><img src="${pageContext.request.contextPath }/images/kor_slide02.jpg" /></a><span>할리데이 (HOLIDAY) - INTO MY WORLD</span><br/><span class="price">10,400원</span></li>

                           <li><a href="${pageContext.request.contextPath }/item.do"><img src="${pageContext.request.contextPath }/images/kor_slide03.jpg" /></a ><span>언프리티 랩스타3(UNPRETTY RAPSTAR)</span><br/><span class="price">13,400원</span></li>

                           <li><a href="${pageContext.request.contextPath }/item.do"><img src="${pageContext.request.contextPath }/images/kor_slide04.jpg" /></a><span>파 이스트 무브먼트 (FAR EAST MOVEMENT)</span><br/><span class="price">17,800원</span></li>

                           <li><a href="${pageContext.request.contextPath }/item.do"><img src="${pageContext.request.contextPath }/images/kor_slide05.jpg" /></a><span>하이틴 (HIGHTEEN) - TEEN MAGIC</span><br/><span class="price">13,400원</span></li>

                           <li><a href="${pageContext.request.contextPath }/item.do"><img src="${pageContext.request.contextPath }/images/kor_slide06.jpg" /></a><span>윤상 - 베스트</span><br/><span class="price">10,400원</span></li>

                           <li><a href="${pageContext.request.contextPath }/item.do"><img src="${pageContext.request.contextPath }/images/kor_slide07.jpg" /></a><span>유영석 - FALLING IN LOVE (재발매)</span><br/><span class="price">10,400원</span></li>

                           <li><a href="${pageContext.request.contextPath }/item.do"><img src="${pageContext.request.contextPath }/images/kor_slide08.jpg" /></a><span>견우성 - GET ALL RIGHT (1ST EP)</span><br/><span class="price">9,700원</span></li>
                           
                           <li><a href="${pageContext.request.contextPath }/item.do"><img src="${pageContext.request.contextPath }/images/kor_slide09.jpg" /></a><span>엠씨 더 맥스 - 7집 [UNVEILING] (2CD)</span><br/><span class="price">14,900원</span></li>
                        </ul>
                  </div>
            <div class="goods">
               <ul class="new_item_ul1">
               <li>
               <a href="${pageContext.request.contextPath }/item.do">
               <span class="thumb"><img src="${pageContext.request.contextPath }/img/강이채 - 1집 [RADICAL PARADISE].png"></a></span>
               <span class="ab_name">강이채 - 1집 [RADICAL PARADISE]</span>
               <span class="price">13,500원</span>
               </li>

               <li>
               <a href="${pageContext.request.contextPath }/item.do">
               <span class="thumb"><img src="${pageContext.request.contextPath }/img/김나영 - 1집 [FROM THE HEART].png"></span>
               </a><span class="ab_name">김나영 - 1집 [FROM THE HEART]</span>
               <span class="price">1,7000원</span>
               </li>

               <li>
               <a href="${pageContext.request.contextPath }/item.do">
               <span class="thumb"><img src="${pageContext.request.contextPath }/img/김효은 - MY AMBITION EP (1ST EP).png"></span>
               </a><span class="ab_name">김효은 - MY AMBITION EP (1ST EP)</span>
               <span class="price">15,800원</span>
               </li>

               <li>
               <a href="${pageContext.request.contextPath }/item.do">
               <span class="thumb"><img src="${pageContext.request.contextPath }/img/다비치 - 50 X HALF (미니앨범).png"></span>
               </a><span class="ab_name">다비치 - 50 X HALF (미니앨범)</span>
               <span class="price">18,400원</span>
               </li>

               <li >
               <a href="${pageContext.request.contextPath }/item.do">
               <span class="thumb"><img src="${pageContext.request.contextPath }/img/레이디스 코드 - STRANG3R.png"></span>
               </a><span class="ab_name">레이디스 코드 - STRANG3R</span>
               <span class="price">13,400원</span>
               </li>

               <li style="clear: both;">
               <a href="${pageContext.request.contextPath }/item.do">
               <span class="thumb"><img src="${pageContext.request.contextPath }/img/백퍼센트 (100%) - TIME LEAP (3RD 미니앨범).png"></span>
               </a><span class="ab_name">백퍼센트 (100%) - TIME LEAP (3RD 미니앨범)</span>
               <span class="price">21,900원</span>
               </li>

               <li>
               <a href="${pageContext.request.contextPath }/item.do">
               <span class="thumb"><img src="${pageContext.request.contextPath }/img/박재범 (JAY PARK) - EVERYTHING YOU WANTED (정규앨범).png"></span>
               </a><span class="ab_name">박재범 - EVERYTHING YOU WANTED(정규앨범)</span>
               <span class="price">23,800원</span>
               </li>

               <li>
               <a href="${pageContext.request.contextPath }/item.do">
               <span class="thumb"><img src="${pageContext.request.contextPath }/img/수퍼스트링 (SUPERSTRING) - 1집 [THE GRAND DESIGN] .png"></span>
               </a><span class="ab_name">수퍼스트링 - 1집 [THE GRAND DESIGN]</span>
               <span class="price">15,500원</span>
               </li>

               <li>
               <a href="${pageContext.request.contextPath }/item.do">
               <span class="thumb"><img src="${pageContext.request.contextPath }/img/스웨덴 세탁소 - 2집 [마음].png"></span>
               </a><span class="ab_name">스웨덴 세탁소 - 2집[마음]</span>
               <span class="price">12,800원</span>
               </li>

               <li >
               <a href="${pageContext.request.contextPath }/item.do">
               <span class="thumb"><img src="${pageContext.request.contextPath }/img/신용재 - EMPATHY (2ND 미니앨범).png"></span>
               </a><span class="ab_name">신용재 - EMPATHY (2ND 미니앨범).png</span>
               <span class="price">13,000원</span>
               </li>

               <li style="clear: both;">
               <a href="${pageContext.request.contextPath }/item.do">
               <span class="thumb"><img src="${pageContext.request.contextPath }/img/아이오아이 (I.O.I) - 미니 2집.png"></span>
               </a><span class="ab_name">아이오아이 (I.O.I) - 미니 2집</span>
               <span class="price">20,000원</span>
               </li>

               <li>
               <a href="${pageContext.request.contextPath }/item.do">
               <span class="thumb"><img src="${pageContext.request.contextPath }/img/알클스 (ALCLS) - 꽃 (1ST 싱글앨범).png"></span>
               </a><span class="ab_name">알클스 (ALCLS) - 꽃 (1ST 싱글앨범)</span>
               <span class="price">17,700원</span>
               </li>

               <li>
               <a href="${pageContext.request.contextPath }/item.do">
               <span class="thumb"><img src="${pageContext.request.contextPath }/img/위아더나잇 (WE ARE THE NIGHT) - 녹색광선 (미니앨범).png"></span>
               </a><span class="ab_name">위아더나잇 (WE ARE THE NIGHT) - 녹색광선 (미니앨범)</span>
               <span class="price">15,000원</span>
               </li>

               <li>
               <a href="${pageContext.request.contextPath }/item.do">
               <span class="thumb"><img src="${pageContext.request.contextPath }/img/크러쉬 (CRUSH) - WONDERLUST (2ND 미니앨범).png"></span>
               </a><span class="ab_name">크러쉬 (CRUSH) - WONDERLUST (2ND 미니앨범)</span>
               <span class="price">22,900원</span>
               </li>


               <li >
               <a href="${pageContext.request.contextPath }/item.do">
               <span class="thumb"><img src="${pageContext.request.contextPath }/img/펜타곤 (PENTAGON) - PENTAGON (1ST 미니앨범).png"></span>
               </a><span class="ab_name">펜타곤 (PENTAGON) - PENTAGON (1ST 미니앨범)</span>
               <span class="price">19,600원</span>
               </li>
            </ul>
            </div>
         </div>
      </div>


<!--본문내용 작성 end -->

<%@include file="inc/footer.jsp" %>
       <script type="text/javascript">
          $(function(){
             //좌 -> 우 로 이동하는 슬라이드 변수
             var j=0;
             //정해진 시간마다 움직이는 변수
             var move = setInterval(function slide(){

                for(var i=0; i<=9; i++){
                   if((i+j)>8){
                   $("li:nth-child("+i+")").animate({left:((200*(j+i)-2100)+"px")});
                   $("li:nth-child("+i+")").css("z-index","-10");
                   }else{
                   $("li:nth-child("+i+")").animate({left:((200*(j+i)-300)+"px")});
                   $("li:nth-child("+i+")").css("z-index","10");
                    }
                }

                //슬라이드 횟수가 8회이면 초기화
                if(j==8){
                   j=-1;
                }
                //슬라이드 횟수 증가
                j++;
             },1500);
          });
      </script>

   </body>
</html>