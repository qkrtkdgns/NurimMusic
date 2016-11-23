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
         <h2>해외음반</h2><hr>
         <!--사이드 메뉴-->
         <%@include file="inc/category.jsp" %>
         <!-- end 사이드 메뉴-->
         <div class="top_list">
            <div class="img_slide"><span>최신음반</span>
                        <ul>
                           <li><a href="${pageContext.request.contextPath }/item.do"><img src="${pageContext.request.contextPath }/images/for_slide01.jpg" /></a><span>SUICIDE SQUAD: THE ALBUM - O.S.T.</span><br/><span>14,900원</span></li>

                           <li><a href="${pageContext.request.contextPath }/item.do"><img src="${pageContext.request.contextPath }/images/for_slide02.jpg" /></a><span>아라시 - 아라시 라이브 투어 2015 (자포니즘)</span><br/><span class="price">31,100원</span></li>

                           <li><a href="${pageContext.request.contextPath }/item.do"><img src="${pageContext.request.contextPath }/images/for_slide03.jpg" /></a ><span>GREEN DAY - REVOLUTION RADIO</span><br/><span class="price">14,900원</span></li>

                           <li><a href="${pageContext.request.contextPath }/item.do"><img src="${pageContext.request.contextPath }/images/for_slide04.jpg" /></a><span>NORAH JONES - DAY BREAKS</span><br/><span class="price">14,700원</span></li>

                           <li><a href="${pageContext.request.contextPath }/item.do"><img src="${pageContext.request.contextPath }/images/for_slide05.jpg" /></a><span>LADY GAGA - JOANNE (DELUXE)</span><br/><span class="price">18,700원</span></li>

                           <li><a href="${pageContext.request.contextPath }/item.do"><img src="${pageContext.request.contextPath }/images/for_slide06.jpg" /></a><span>STAR TREK BEYOND - O.S.T.</span><br/><span class="price">14,700원</span></li>

                           <li><a href="${pageContext.request.contextPath }/item.do"><img src="${pageContext.request.contextPath }/images/for_slide07.jpg" /></a><span>CELINE DION - ENCORE UN SOIR</span><br/><span class="price">17,800원</span></li>

                           <li><a href="${pageContext.request.contextPath }/item.do"><img src="${pageContext.request.contextPath }/images/for_slide08.jpg" /></a><span>AI SHINOZAKI (篠崎 愛) - KUCHI NO WARUI ONNA</span><br/><span class="price">17,800원</span></li>

                           <li><a href="${pageContext.request.contextPath }/item.do"><img src="${pageContext.request.contextPath }/images/for_slide09.jpg" /></a><span>HONNE - WARM ON A COLD NIGHT (DELUXE)</span><br/><span class="price">16,800원</span></li>
                        </ul>
                  </div>
            <div class="goods">
               <ul class="new_item_ul1">
               <li>
               <a href="${pageContext.request.contextPath }/item.do">
               <span class="thumb"><img src="${pageContext.request.contextPath }/img/for_list_image01.jpg"></a></span>
               <span class="ab_name">BRUNO MARS - 24K MAGIC</span>
               <span class="price">16,800원</span>
               </li>

               <li>
               <a href="${pageContext.request.contextPath }/item.do">
               <span class="thumb"><img src="${pageContext.request.contextPath }/img/for_list_image02.jpg"></span>
               </a><span class="ab_name">BON JOVI - THIS HOUSE IS NOT FOR SALE</span>
               <span class="price">18,700원</span>
               </li>

               <li>
               <a href="${pageContext.request.contextPath }/item.do">
               <span class="thumb"><img src="${pageContext.request.contextPath }/img/for_list_image03.jpg"></span>
               </a><span class="ab_name">MICHEL CAMILO & TOMATITO - SPAIN FOREVER</span>
               <span class="price">14,700원</span>
               </li>

               <li>
               <a href="${pageContext.request.contextPath }/item.do">
               <span class="thumb"><img src="${pageContext.request.contextPath }/img/for_list_image04.jpg"></span>
               </a><span class="ab_name">ONEREPUBLIC - OH MY MY (DELUXE)</span>
               <span class="price">18,700원</span>
               </li>

               <li >
               <a href="${pageContext.request.contextPath }/item.do">
               <span class="thumb"><img src="${pageContext.request.contextPath }/img/for_list_image05.jpg"></span>
               </a><span class="ab_name">JIMI HENDRIX - MACHINE GUN</span>
               <span class="price">17,100원</span>
               </li>

               <li style="clear: both;">
               <a href="${pageContext.request.contextPath }/item.do">
               <span class="thumb"><img src="${pageContext.request.contextPath }/img/for_list_image06.jpg"></span>
               </a><span class="ab_name">BILLIE MARTEN - WRITING OF BLUES AND YELLOWS</span>
               <span class="price">16,400원</span>
               </li>

               <li>
               <a href="${pageContext.request.contextPath }/item.do">
               <span class="thumb"><img src="${pageContext.request.contextPath }/img/for_list_image07.jpg"></span>
               </a><span class="ab_name">SHAWN MENDES - ILLUMINATE (DELUXE)</span>
               <span class="price">17,400원</span>
               </li>

               <li>
               <a href="${pageContext.request.contextPath }/item.do">
               <span class="thumb"><img src="${pageContext.request.contextPath }/img/for_list_image08.jpg"></span>
               </a><span class="ab_name">USHER - HARD II LOVE (어셔 - 하드 투 러브)</span>
               <span class="price">15,600원</span>
               </li>

               <li>
               <a href="${pageContext.request.contextPath }/item.do">
               <span class="thumb"><img src="${pageContext.request.contextPath }/img/for_list_image09.jpg"></span>
               </a><span class="ab_name">THE MAGNIFICENT SEVEN - O.S.T.</span>
               <span class="price">15,600원</span>
               </li>

               <li >
               <a href="${pageContext.request.contextPath }/item.do">
               <span class="thumb"><img src="${pageContext.request.contextPath }/img/for_list_image10.jpg"></span>
               </a><span class="ab_name">JAMES BLAKE - THE COLOUR IN ANYTHING</span>
               <span class="price">33,800원</span>
               </li>

               <li style="clear: both;">
               <a href="${pageContext.request.contextPath }/item.do">
               <span class="thumb"><img src="${pageContext.request.contextPath }/img/for_list_image11.jpg"></span>
               </a><span class="ab_name">BRENT COBB - SHINE ON RAINY DAY</span>
               <span class="price">18,600원</span>
               </li>

               <li>
               <a href="${pageContext.request.contextPath }/item.do">
               <span class="thumb"><img src="${pageContext.request.contextPath }/img/for_list_image12.jpg"></span>
               </a><span class="ab_name">AIMER - DAYDREAM (에메 - 데이드림)</span>
               <span class="price">20,800원</span>
               </li>

               <li>
               <a href="${pageContext.request.contextPath }/item.do">
               <span class="thumb"><img src="${pageContext.request.contextPath }/img/for_list_image13.jpg"></span>
               </a><span class="ab_name">RYUICHI SAKAMOTO - CODA [SHM-CD]</span>
               <span class="price">45,000원</span>
               </li>

               <li>
               <a href="${pageContext.request.contextPath }/item.do">
               <span class="thumb"><img src="${pageContext.request.contextPath }/img/for_list_image14.jpg"></span>
               </a><span class="ab_name">RYUICHI SAKAMOTO - THE ARANGEMENT [SHM-CD]</span>
               <span class="price">28,200원</span>
               </li>


               <li >
               <a href="${pageContext.request.contextPath }/item.do">
               <span class="thumb"><img src="${pageContext.request.contextPath }/img/for_list_image15.jpg"></span>
               </a><span class="ab_name">ARASHI - POWER OF THE PARADISE</span>
               <span class="price">10,400원</span>
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