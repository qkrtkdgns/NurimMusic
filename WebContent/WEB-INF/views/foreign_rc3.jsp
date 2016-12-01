<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html lang="ko">
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
               <!-- //체크한 음반 끝 -->

               <!-- 원하는 카테고리순 정렬 -->
               <div class="search_list">
                  <a href="#">발매일</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">높은가격</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">낮은가격</a>
               </div>
               <!-- //원하는 카테고리순 정렬 끝 -->
            </div>
            <!-- //list-topbar 끝 -->

            <!-- 해외음반 리스트 시작 -->
            <div class="list_lineup">
               <ul>
                  <li class="goods_li">
                  <input type="checkbox" id="check">
                  <span class="thumb"><a href="${pageContext.request.contextPath }/item.do">
                     <img src="${pageContext.request.contextPath }/img/jazz1.png"></a>
                   </span>
                     <span class="text">
                     <span class="title"><a href="${pageContext.request.contextPath }/item.do">NORAH JONES - DAY BREAKS (노라 존스 - 데이 브레익스)</a>
                     </span>
                     <span class="desc">UNIVERSAL | 2016.10.07 | CD</span>
                     </span>
                        
                    <div class="prices">
                    <span class="price">17,200원</span>
                    <span class="price_dc">
                     14,700원</span>
                     </div>


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
                  </li>
        
                 <li class="goods_li">
                  <input type="checkbox" id="check">
                  <span class="thumb"><a href="${pageContext.request.contextPath }/item.do">
                     <img src="${pageContext.request.contextPath }/img/jazz2.png"></a>
                   </span>
                     <span class="text">
                     <span class="title"><a href="${pageContext.request.contextPath }/item.do">DIANA KRALL - WALLFLOWER (THE COMPLETE SESSIONS)</a>
                     </span>
                     <span class="desc">UNIVERSAL | 2016.01.22 | CD</span>
                     </span>
                        
                    <div class="prices">
                    <span class="price">17,200원</span>
                    <span class="price_dc">
                     14,700원</span>
                     </div>


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
                  </li>
  
                 <li class="goods_li">
                  <input type="checkbox" id="check">
                  <span class="thumb"><a href="${pageContext.request.contextPath }/item.do">
                     <img src="${pageContext.request.contextPath }/img/jazz3.png"></a>
                   </span>
                     <span class="text">
                     <span class="title"><a href="${pageContext.request.contextPath }/item.do">I LOVE COFFEE - JAZZ [3CD]</a>
                     </span>
                     <span class="desc">(주)굿인터내셔널 | 2016.03.23 | CD</span>
                     </span>
                        
                    <div class="prices">
                    <span class="price">38,400원</span>
                    <span class="price_dc">
                     24,500원</span>
                     </div>


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
                  </li>
      
                 <li class="goods_li">
                  <input type="checkbox" id="check">
                  <span class="thumb"><a href="${pageContext.request.contextPath }/item.do">
                     <img src="${pageContext.request.contextPath }/img/jazz4.png"></a>
                   </span>
                     <span class="text">
                     <span class="title"><a href="${pageContext.request.contextPath }/item.do">SKANDACE SPRINGS - SOUL EYES</a>
                     </span>
                     <span class="desc">UNIVERSAL | 2016.07.04 | CD</span>
                     </span>
                        
                    <div class="prices">
                    <span class="price">17,200원</span>
                    <span class="price_dc">
                     14,700원</span>
                     </div>


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
                  </li>
                 
                 <li class="goods_li">
                  <input type="checkbox" id="check">
                  <span class="thumb"><a href="${pageContext.request.contextPath }/item.do">
                     <img src="${pageContext.request.contextPath }/img/jazz5.png"></a>
                   </span>
                     <span class="text">
                     <span class="title"><a href="${pageContext.request.contextPath }/item.do">ELLA FITZGERALD & LOUIS ARMSTRONG - ELLA & LOUIS (VERVE 60, DOWNLOAD CARD)</a>
                     </span>
                     <span class="desc">UNIVERSAL | 2016.02.26 | LP</span>
                     </span>
                        
                    <div class="prices">
                    <span class="price">32,800원</span>
                    <span class="price_dc">
                     26,200원</span>
                     </div>


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
                  </li>

                   <li class="goods_li">
                  <input type="checkbox" id="check">
                  <span class="thumb"><a href="${pageContext.request.contextPath }/item.do">
                     <img src="${pageContext.request.contextPath }/img/jazz6.png"></a>
                   </span>
                     <span class="text">
                     <span class="title"><a href="${pageContext.request.contextPath }/item.do">DAVE BRUBECK, LOUIS ARMSTRONG, QUINCY JONES, MILES DAVIS, STAN GETZ - JAZZMEN 2015 (5CD)</a>
                     </span>
                     <span class="desc">(주)씨앤엘뮤직 | 2015.12.04 | CD</span>
                     </span>
                        
                    <div class="prices">
                    <span class="price">42,300원</span>
                    <span class="price_dc">
                     33,800원</span>
                     </div>


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
                  </li>
            
                  <li class="goods_li">
                  <input type="checkbox" id="check">
                  <span class="thumb"><a href="${pageContext.request.contextPath }/item.do">
                     <img src="${pageContext.request.contextPath }/img/jazz7.png"></a>
                   </span>
                     <span class="text">
                     <span class="title"><a href="${pageContext.request.contextPath }/item.do">PAT METHENY - THE UNITY SESSIONS (2CD)</a>
                     </span>
                     <span class="desc">WARNER MUSIC | 2016.05.20 | CD</span>
                     </span>
                        
                    <div class="prices">
                    <span class="price">20,700원</span>
                    <span class="price_dc">
                     17,800원</span>
                     </div>


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
                  </li>

                  <li class="goods_li">
                  <input type="checkbox" id="check">
                  <span class="thumb"><a href="${pageContext.request.contextPath }/item.do">
                     <img src="${pageContext.request.contextPath }/img/jazz8.png"></a>
                   </span>
                     <span class="text">
                     <span class="title"><a href="${pageContext.request.contextPath }/item.do">JOSHUA REDMAN & BRAD MEHLDAU - NEARNESS</a>
                     </span>
                     <span class="desc">WARNER MUSIC | 2016.02.01 | CD</span>
                     </span>
                        
                    <div class="prices">
                    <span class="price">17,300원</span>
                    <span class="price_dc">
                     14,900원</span>
                     </div>


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
                  </li>

                  <li class="goods_li">
                  <input type="checkbox" id="check">
                  <span class="thumb"><a href="${pageContext.request.contextPath }/item.do">
                     <img src="${pageContext.request.contextPath }/img/jazz9.png"></a>
                   </span>
                     <span class="text">
                     <span class="title"><a href="${pageContext.request.contextPath }/item.do">SWR BIG BAND, FOLA DADA - KING OF SWING OP.2</a>
                     </span>
                     <span class="desc">SWR MUSIC | 2016.03.04 | CD</span>
                     </span>
                        
                    <div class="prices">
                    <span class="price">21,200원</span>
                    <span class="price_dc">
                     16,900원</span>
                     </div>


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
                  </li>
        
                  <li class="goods_li">
                  <input type="checkbox" id="check">
                  <span class="thumb"><a href="${pageContext.request.contextPath }/item.do">
                     <img src="${pageContext.request.contextPath }/img/jazz10.png"></a>
                   </span>
                     <span class="text">
                     <span class="title"><a href="${pageContext.request.contextPath }/item.do">HAMILTON DE HOLLANDA - BANDOLIM</a>
                     </span>
                     <span class="desc">MPS RECORDS | 2015.11.19 | CD</span>
                     </span>
                        
                    <div class="prices">
                    <span class="price">19,800원</span>
                    <span class="price_dc">
                     15,800원</span>
                     </div>


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
                  </li>
                </ul>

            <!-- 페이지 번호 영역 -->
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
            <!-- //페이지 번호 끝 -->
       </div>
       <!-- foreign_rc 끝 -->
       </div>
       <!-- foreign_rc 끝 -->
      </div>
      
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
