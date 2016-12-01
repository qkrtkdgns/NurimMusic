<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html lang="ko">
   <head>
     <%@include file="inc/head.jsp" %>
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/shopping_main.css" />

   </head>
   <body>

<%@include file="inc/top_nav.jsp" %>
<div class="ddd"></div><!--빈 박스-->
<!-- 본문내용 작성 start -->
         <div id="content">
         <h2>쇼핑</h2><hr>
         <!--사이드 메뉴-->
         <%@include file="inc/category.jsp" %>
         <!-- end 사이드 메뉴-->


        <div class="shop_content">
         <!--캐러셀 영역 구성 -->
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
      <!-- 현재 위치 표시 -->
      <ol class="carousel-indicators">
        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
      </ol>

      <!-- 내용 영역 -->
      <div class="carousel-inner">
        <!-- 항목 (1) -->
        <div class="item active">
          <img src="${pageContext.request.contextPath }/img/Shop1.jpg" alt="슬라이더(1)">
          <div class="carousel_cont">
            
          </div>
        </div>

        <!-- 항목 (2) -->
        <div class="item">
          <img src="${pageContext.request.contextPath }/img/Shop2.jpg" alt="슬라이더(2)">
          <div class="carousel_cont">
            
          </div>
        </div>

        <!-- 항목 (3) -->
        <div class="item">
          <img src="${pageContext.request.contextPath }/img/Shop3.png" alt="슬라이더(3)">
          <div class="carousel_cont">
            
          </div>
        </div>
      </div>
      <!-- // 내용영역 구성 -->

      <!-- 이동 버튼 -->
      <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev"> <span class="icon-prev"></span> </a>
      <a class="right carousel-control" href="#carousel-example-generic" data-slide="next"> <span class="icon-next"></span> </a>
    </div>
      <!-- //캐러셀 영역 구성 끝 -->

      <div class="shop_items">
        <div class="shop_im">
          <img src="${pageContext.request.contextPath }/img/md1.png">
        </div>
          <div class="items">

            <ul class="new_item_ul1">

          <li class="shop_li1">
          <a href="${pageContext.request.contextPath }/item.do">
          <span class="thumb"><img src="${pageContext.request.contextPath }/img/item6.png"></span>
          <span class="ab_name">스웨덴명품헤드폰 클라우드 KNOCK-[PURP]</span></a>
          <span class="price">48,000원</span>
          </li>

          <li class="shop_li2">
          <a href="${pageContext.request.contextPath }/item.do">
          <span class="thumb"><img src="${pageContext.request.contextPath }/img/item7.png"></span>
          <span class="ab_name">스웨덴명품헤드폰 클라우드 KNOCK-[OR]</span></a>
          <span class="price">48,000원</span>
          </li>

          <li class="shop_li3">
          <a href="${pageContext.request.contextPath }/item.do">
          <span class="thumb"><img src="${pageContext.request.contextPath }/img/item8.png"></span>
          <span class="ab_name">미니로 MO-1000 (토끼) (칼국수) (미니어쳐 핸드메이드)</span></a>
          <span class="price">19,700원</span>
          </li>

          <li class="shop_li4">
          <a href="${pageContext.request.contextPath }/item.do">
          <span class="thumb"><img src="${pageContext.request.contextPath }/img/item9.png"></span>
          <span class="ab_name">HP0240WH 피아트 크레신 헤드폰 (화이트)</span></a>
          <span class="price">18,400원</span>
          </li>

          <li class="shop_li5">
          <a href="${pageContext.request.contextPath }/item.do">
          <span class="thumb"><img src="${pageContext.request.contextPath }/img/item10.png"></span>
          <span class="ab_name">크레신 C450S 피처 이어폰 (블랙)</span></a>
          <span class="price">28,000원</span>
          </li>

            </ul>

          </div>
            <div class="items2">
             <div class="shop_im">
              <img src="${pageContext.request.contextPath }/img/md2.png">
            </div>
          
          <div class="items">

            <ul class="new_item_ul1">

          <li class="shop_li1">
          <a href="${pageContext.request.contextPath }/item.do">
          <span class="thumb"><img src="${pageContext.request.contextPath }/img/item1.jpg"></span>
          <span class="ab_name">강이채 - 1집 [RADICAL PARADISE]</span></a>
          <span class="price">13,500원</span>
          </li>

          <li class="shop_li2">
          <a href="${pageContext.request.contextPath }/item.do">
          <span class="thumb"><img src="${pageContext.request.contextPath }/img/item2.jpg"></span>
          <span class="ab_name">김나영 - 1집 [FROM THE HEART]</span></a>
          <span class="price">1,7000원</span>
          </li>

          <li class="shop_li3">
          <a href="${pageContext.request.contextPath }/item.do">
          <span class="thumb"><img src="${pageContext.request.contextPath }/img/item3.jpg"></span>
          <span class="ab_name">김효은 - MY AMBITION EP (1ST EP)</span></a>
          <span class="price">15,800원</span>
          </li>

          <li class="shop_li4">
          <a href="${pageContext.request.contextPath }/item.do">
          <span class="thumb"><img src="${pageContext.request.contextPath }/img/item4.jpg"></span>
          <span class="ab_name">다비치 - 50 X HALF (미니앨범)</span></a>
          <span class="price">18,400원</span>
          </li>

          <li class="shop_li5">
          <a href="${pageContext.request.contextPath }/item.do">
          <span class="thumb"><img src="${pageContext.request.contextPath }/img/item5.jpg"></span>
          <span class="ab_name">레이디스 코드 - STRANG3R</span></a>
          <span class="price">13,400원</span>
          </li>

            </ul>

          </div>
      </div>
      </div>
      </div>
      </div>
      
<!--본문내용 작성 end -->

<%@include file="inc/footer.jsp" %>

   </body>
</html>
