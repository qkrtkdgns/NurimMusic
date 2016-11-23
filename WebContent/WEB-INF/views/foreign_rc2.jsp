<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html lang="ko">
   <head>
     <%@include file="inc/head.jsp" %>
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/foreign_rc1.css" />

   
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
         
      <!-- foreign_rc 시작  -->
      <div class="foreign_rc">
        <!-- list-topbar 시작 -->
        <div class="list-topbar">

           <!-- 체크한 음반 -->
           <div class="check_list">
             체크한 음반
             <button type="button" class="btn btn-default btn-sm" />장바구니 담기</button>
             <button type="button" class="btn btn-default btn-sm"/>관심상품</button>
           </div>
           <!--//체크한 음반 끝 -->

            <!-- 원하는 카테고리순 정렬 -->
            <div class="search_list">
                <a href="#">발매일</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">높은가격</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">낮은가격</a>
            </div>
            <!--//원하는 카테고리순 정렬 끝 -->
            </div>
            <!-- //list-topbar 끝 -->

            <!-- 해외음반 리스트 시작 -->
            <div class="list_lineup">
               <ul>
                  <li class="goods_li">
                  <input type="checkbox" id="check">
                  <span class="thumb"><a href="${pageContext.request.contextPath }/item.do">
                     <img src="${pageContext.request.contextPath }/img/COLDPLAY - A HEAD FULL OF DREAMS.png"></a>
                   </span>
                     <span class="text">
                     <span class="title"><a href="${pageContext.request.contextPath }/item.do">COLDPLAY - A HEAD FULL OF DREAMS</a>
                     </span>
                     <span class="desc">WARNER MUSIC | 2015.12.07 | CD</span>
                     </span>
                        
                    <div class="prices">
                    <span class="price">20,000원</span>
                    <span class="price_dc">
                     18,500원</span>
                     </div>


                     <!-- 버튼들 -->
                     <div class="button">
                     <div class="basket_btn">
                     <a href="${pageContext.request.contextPath }/basket.do" class="btn btn-default" id="A" name="list_01" />장바구니</a>
                     </div>
                     <div class="buy_btn">
                     <a href="${pageContext.request.contextPath }/pay.do" class="btn btn-default" id="B" name="list_01" />바로구매</a>
                     </div>
                     
                     <div class="so_btn">
                      <a href="#" class="btn btn-default" id="A1" name="list_01"/><font color="red">품&nbsp;&nbsp;절</font></a>
                      </div>
                      <div class="al_btn">
                      <a href="#" class="btn btn-default" id="B1" name="list_01" />입고알림</a>
                      </div>
                      </div>
                      <!--// 버튼들 끝 -->

                  </li>
        
                 <li class="goods_li">
                  <input type="checkbox" id="check">
                  <span class="thumb"><a href="${pageContext.request.contextPath }/item.do">
                     <img src="${pageContext.request.contextPath }/img/SIA - THIS IS ACTING .png"></a>
                   </span>
                     <span class="text">
                     <span class="title"><a href="${pageContext.request.contextPath }/item.do">SIA - THIS IS ACTING </a>
                     </span>
                     <span class="desc">SONY MUSIC | 2016.02.01 | CD</span>
                     </span>
                        
                    <div class="prices">
                    <span class="price">20,000원</span>
                    <span class="price_dc">
                     18,500원</span>
                     </div>


                    <!-- 버튼들 -->
                     <div class="button">
                     <div class="basket_btn">
                     <a href="${pageContext.request.contextPath }/basket.do" class="btn btn-default" id="A" name="list_01" />장바구니</a>
                     </div>
                     <div class="buy_btn">
                     <a href="${pageContext.request.contextPath }/pay.do" class="btn btn-default" id="B" name="list_01" />바로구매</a>
                     </div>
                     
                     <div class="so_btn">
                      <a href="#" class="btn btn-default" id="A1" name="list_01"/><font color="red">품&nbsp;&nbsp;절</font></a>
                      </div>
                      <div class="al_btn">
                      <a href="#" class="btn btn-default" id="B1" name="list_01" />입고알림</a>
                      </div>
                      </div>
                      <!--// 버튼들 끝 -->

                  </li>
  
                 <li class="goods_li">
                  <input type="checkbox" id="check">
                  <span class="thumb"><a href="${pageContext.request.contextPath }/item.do">
                     <img src="${pageContext.request.contextPath }/img/BEGGARS BANQUET  2016.06.29  CD.png"></a>
                   </span>
                     <span class="text">
                     <span class="title"><a href="${pageContext.request.contextPath }/item.do">RADIOHEAD - A MOON SHAPED POOL (12” WHITE)</a>
                     </span>
                     <span class="desc">BEGGARS BANQUET | 2016.06.29 | CD</span>
                     </span>
                        
                    <div class="prices">
                    <span class="price">20,000원</span>
                    <span class="price_dc">
                     18,500원</span>
                     </div>

 					<!-- 버튼들 -->
                     <div class="button">
                     <div class="basket_btn">
                     <a href="${pageContext.request.contextPath }/basket.do" class="btn btn-default" id="A" name="list_01" />장바구니</a>
                     </div>
                     <div class="buy_btn">
                     <a href="${pageContext.request.contextPath }/pay.do" class="btn btn-default" id="B" name="list_01" />바로구매</a>
                     </div>
                     
                     <div class="so_btn">
                      <a href="#" class="btn btn-default" id="A1" name="list_01"/><font color="red">품&nbsp;&nbsp;절</font></a>
                      </div>
                      <div class="al_btn">
                      <a href="#" class="btn btn-default" id="B1" name="list_01" />입고알림</a>
                      </div>
                      </div>
                      <!--// 버튼들 끝 -->

                  </li>
      
                 <li class="goods_li">
                  <input type="checkbox" id="check">
                  <span class="thumb"><a href="${pageContext.request.contextPath }/item.do">
                     <img src="${pageContext.request.contextPath }/img/HOZIER - HOZIER (SPECIAL EDITION) 2 FOR 1.png"></a>
                   </span>
                     <span class="text">
                     <span class="title"><a href="${pageContext.request.contextPath }/item.do">HOZIER - HOZIER (SPECIAL EDITION) 2 FOR 1</a>
                     </span>
                     <span class="desc">UNIVERSAL | 2015.11.09 | CD</span>
                     </span>
                        
                    <div class="prices">
                    <span class="price">20,000원</span>
                    <span class="price_dc">
                     18,500원</span>
                     </div>

 					<!-- 버튼들 -->
                     <div class="button">
                     <div class="basket_btn">
                     <a href="${pageContext.request.contextPath }/basket.do" class="btn btn-default" id="A" name="list_01" />장바구니</a>
                     </div>
                     <div class="buy_btn">
                     <a href="${pageContext.request.contextPath }/pay.do" class="btn btn-default" id="B" name="list_01" />바로구매</a>
                     </div>
                     
                     <div class="so_btn">
                      <a href="#" class="btn btn-default" id="A1" name="list_01"/><font color="red">품&nbsp;&nbsp;절</font></a>
                      </div>
                      <div class="al_btn">
                      <a href="#" class="btn btn-default" id="B1" name="list_01" />입고알림</a>
                      </div>
                      </div>
                      <!--// 버튼들 끝 -->

                  </li>
                 
                 <li class="goods_li">
                  <input type="checkbox" id="check">
                  <span class="thumb"><a href="${pageContext.request.contextPath }/item.do">
                     <img src="${pageContext.request.contextPath }/img/NOTHING.png"></a>
                   </span>
                     <span class="text">
                     <span class="title"><a href="${pageContext.request.contextPath }/item.do">NOTHING BUT THIEVES - NOTHING BUT THIEVES (LIMITED GUITAR PICKS EDITION)</a>
                     </span>
                     <span class="desc">SONY MUSIC | 2016.06.13 | CD</span>
                     </span>
                        
                    <div class="prices">
                    <span class="price">20,000원</span>
                    <span class="price_dc">
                     18,500원</span>
                     </div>

 					<!-- 버튼들 -->
                     <div class="button">
                     <div class="basket_btn">
                     <a href="${pageContext.request.contextPath }/basket.do" class="btn btn-default" id="A" name="list_01" />장바구니</a>
                     </div>
                     <div class="buy_btn">
                     <a href="${pageContext.request.contextPath }/pay.do" class="btn btn-default" id="B" name="list_01" />바로구매</a>
                     </div>
                     
                     <div class="so_btn">
                      <a href="#" class="btn btn-default" id="A1" name="list_01"/><font color="red">품&nbsp;&nbsp;절</font></a>
                      </div>
                      <div class="al_btn">
                      <a href="#" class="btn btn-default" id="B1" name="list_01" />입고알림</a>
                      </div>
                      </div>
                      <!--// 버튼들 끝 -->

                  </li>

                   <li class="goods_li">
                  <input type="checkbox" id="check">
                  <span class="thumb"><a href="${pageContext.request.contextPath }/item.do">
                     <img src="${pageContext.request.contextPath }/img/TWENTY ONE PILOTS - BLURRYFACE.png"></a>
                   </span>
                     <span class="text">
                     <span class="title"><a href="${pageContext.request.contextPath }/item.do">TWENTY ONE PILOTS - BLURRYFACE</a>
                     </span>
                     <span class="desc">WARNER MUSIC | 2016.04.28 | CD</span>
                     </span>
                        
                    <div class="prices">
                    <span class="price">20,000원</span>
                    <span class="price_dc">
                     18,500원</span>
                     </div>

 					<!-- 버튼들 -->
                     <div class="button">
                     <div class="basket_btn">
                     <a href="${pageContext.request.contextPath }/basket.do" class="btn btn-default" id="A" name="list_01" />장바구니</a>
                     </div>
                     <div class="buy_btn">
                     <a href="${pageContext.request.contextPath }/pay.do" class="btn btn-default" id="B" name="list_01" />바로구매</a>
                     </div>
                     
                     <div class="so_btn">
                      <a href="#" class="btn btn-default" id="A1" name="list_01"/><font color="red">품&nbsp;&nbsp;절</font></a>
                      </div>
                      <div class="al_btn">
                      <a href="#" class="btn btn-default" id="B1" name="list_01" />입고알림</a>
                      </div>
                      </div>
                      <!--// 버튼들 끝 -->

                  </li>
            
                  <li class="goods_li">
                  <input type="checkbox" id="check">
                  <span class="thumb"><a href="${pageContext.request.contextPath }/item.do">
                     <img src="${pageContext.request.contextPath }/img/PINK FLOYD - THE WALL (REMASTERED) 2 FOR 1.png"></a>
                   </span>
                     <span class="text">
                     <span class="title"><a href="${pageContext.request.contextPath }/item.do">PINK FLOYD - THE WALL (REMASTERED) 2 FOR 1</a>
                     </span>
                     <span class="desc">SONY MUSIC | 2016.02.01 | CD</span>
                     </span>
                        
                    <div class="prices">
                    <span class="price">20,000원</span>
                    <span class="price_dc">
                     18,500원</span>
                     </div>


                      <!-- 버튼들 -->
                     <div class="button">
                     <div class="basket_btn">
                     <a href="${pageContext.request.contextPath }/basket.do" class="btn btn-default" id="A" name="list_01" />장바구니</a>
                     </div>
                     <div class="buy_btn">
                     <a href="${pageContext.request.contextPath }/pay.do" class="btn btn-default" id="B" name="list_01" />바로구매</a>
                     </div>
                     
                     <div class="so_btn">
                      <a href="#" class="btn btn-default" id="A1" name="list_01"/><font color="red">품&nbsp;&nbsp;절</font></a>
                      </div>
                      <div class="al_btn">
                      <a href="#" class="btn btn-default" id="B1" name="list_01" />입고알림</a>
                      </div>
                      </div>
                      <!--// 버튼들 끝 -->

                  </li>

                  <li class="goods_li">
                  <input type="checkbox" id="check">
                  <span class="thumb"><a href="${pageContext.request.contextPath }/item.do">
                     <img src="${pageContext.request.contextPath }/img/LED ZEPPELIN - MOTHERSHIP (20142015 지미 페이지 리마스터 버전) 2 FOR 1.png"></a>
                   </span>
                     <span class="text">
                     <span class="title"><a href="${pageContext.request.contextPath }/item.do">LED ZEPPELIN - MOTHERSHIP (20142015 지미 페이지 리마스터 버전) 2 FOR 1</a>
                     </span>
                     <span class="desc">WARNER MUSIC | 2015.11.26 | CD</span>
                     </span>
                        
                    <div class="prices">
                    <span class="price">20,000원</span>
                    <span class="price_dc">
                     18,500원</span>
                     </div>


                      <!-- 버튼들 -->
                     <div class="button">
                     <div class="basket_btn">
                     <a href="${pageContext.request.contextPath }/basket.do" class="btn btn-default" id="A" name="list_01" />장바구니</a>
                     </div>
                     <div class="buy_btn">
                     <a href="${pageContext.request.contextPath }/pay.do" class="btn btn-default" id="B" name="list_01" />바로구매</a>
                     </div>
                     
                     <div class="so_btn">
                      <a href="#" class="btn btn-default" id="A1" name="list_01"/><font color="red">품&nbsp;&nbsp;절</font></a>
                      </div>
                      <div class="al_btn">
                      <a href="#" class="btn btn-default" id="B1" name="list_01" />입고알림</a>
                      </div>
                      </div>
                      <!--// 버튼들 끝 -->

                  </li>

                  <li class="goods_li">
                  <input type="checkbox" id="check">
                  <span class="thumb"><a href="${pageContext.request.contextPath }/item.do">
                     <img src="${pageContext.request.contextPath }/img/DREAM THEATER - THE ASTONISHING (2CD).png"></a>
                   </span>
                     <span class="text">
                     <span class="title"><a href="${pageContext.request.contextPath }/item.do">DREAM THEATER - THE ASTONISHING (2CD)</a>
                     </span>
                     <span class="desc">WARNER MUSIC | 2016.02.01 | CD</span>
                     </span>
                        
                    <div class="prices">
                    <span class="price">20,000원</span>
                    <span class="price_dc">
                     18,500원</span>
                     </div>


                      <!-- 버튼들 -->
                     <div class="button">
                     <div class="basket_btn">
                     <a href="${pageContext.request.contextPath }/basket.do" class="btn btn-default" id="A" name="list_01" />장바구니</a>
                     </div>
                     <div class="buy_btn">
                     <a href="${pageContext.request.contextPath }/pay.do" class="btn btn-default" id="B" name="list_01" />바로구매</a>
                     </div>
                     
                     <div class="so_btn">
                      <a href="#" class="btn btn-default" id="A1" name="list_01"/><font color="red">품&nbsp;&nbsp;절</font></a>
                      </div>
                      <div class="al_btn">
                      <a href="#" class="btn btn-default" id="B1" name="list_01" />입고알림</a>
                      </div>
                      </div>
                      <!--// 버튼들 끝 -->

                  </li>
        
                  <li class="goods_li">
                  <input type="checkbox" id="check">
                  <span class="thumb"><a href="${pageContext.request.contextPath }/item.do">
                     <img src="${pageContext.request.contextPath }/img/ALABAMA SHAKES - SOUND & COLOR (DIGIPACK).png"></a>
                   </span>
                     <span class="text">
                     <span class="title"><a href="${pageContext.request.contextPath }/item.do">ALABAMA SHAKES - SOUND & COLOR (DIGIPACK)</a>
                     </span>
                     <span class="desc">BEGGARS BANQUET | 2016.01.19 | CD</span>
                     </span>
                        
                    <div class="prices">
                    <span class="price">20,000원</span>
                    <span class="price_dc">
                     18,500원</span>
                     </div>


                      <!-- 버튼들 -->
                     <div class="button">
                     <div class="basket_btn">
                     <a href="${pageContext.request.contextPath }/basket.do" class="btn btn-default" id="A" name="list_01" />장바구니</a>
                     </div>
                     <div class="buy_btn">
                     <a href="${pageContext.request.contextPath }/pay.do" class="btn btn-default" id="B" name="list_01" />바로구매</a>
                     </div>
                     
                     <div class="so_btn">
                      <a href="#" class="btn btn-default" id="A1" name="list_01"/><font color="red">품&nbsp;&nbsp;절</font></a>
                      </div>
                      <div class="al_btn">
                      <a href="#" class="btn btn-default" id="B1" name="list_01" />입고알림</a>
                      </div>
                      </div>
                      <!--// 버튼들 끝 -->

                  </li>
                </ul>
            
            <!--페이지 번호 영역 -->
            <div class="page_num">
             <ul class="pagination pagination-md">
                <li class="disabled"><a href="#">&laquo;</a></li>
                <li class="active"><span>1<span class="sr-only">(current)</span></span></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">&raquo;</a></li>
             </ul>
            </div>
            <!--//페이지 번호 끝 -->
         </div>
         <!-- foreign_rc 끝 -->

         </div>
         <!-- //해외음반 리스트 끝 -->
         </div>
        <!--본문내용 작성 end -->

<%@include file="inc/footer.jsp" %>
       <script type="text/javascript">
          $(function(){
             var sell= false;

             if(sell==false){
             $("#A1.btn").hide();
             $("#B1.btn").hide();
             }else{            
             $("#A.btn").hide();
             $("#B.btn").hide();
             }

          });


       
      </script>

   </body>
</html>
