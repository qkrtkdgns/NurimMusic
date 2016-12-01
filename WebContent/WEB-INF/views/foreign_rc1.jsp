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
               
               	<!-- 항목(1) --> 
                  <li class="goods_li">
                  <input type="checkbox" id="check">
                  <span class="thumb"><a href="${pageContext.request.contextPath }/item.do">
                     <img src="${pageContext.request.contextPath }/img/jazz1.png"></a>
                   </span>
                     <span class="text">
                     <span class="title"><a href="${pageContext.request.contextPath }/item.do">ADELE - 25 (아델 - 25)</a>
                     </span>
                     <span class="desc">BEGGARS BANQUET | 2015.11.26 | CD</span>
                     </span>
                        
                    <!-- 가격 -->
                    <div class="prices">
                    <span class="price">20,000원</span>
                    <span class="price_dc">
                     18,500원</span>
                     </div>
                     <!-- //가격 끝 -->

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
                  <!-- //항목(1) 끝 -->
        
        		<!-- 항목(2) -->
                 <li class="goods_li">
                  <input type="checkbox" id="check">
                  <span class="thumb"><a href="${pageContext.request.contextPath }/item.do">
                     <img src="${pageContext.request.contextPath }/img/TROYE SIVAN - BLUE NEIGHBOURHOOD (DELUXE).png"></a>
                   </span>
                     <span class="text">
                     <span class="title"><a href="${pageContext.request.contextPath }/item.do">TROYE SIVAN - BLUE NEIGHBOURHOOD (DELUXE)</a>
                     </span>
                     <span class="desc">UNIVERSAL | 2016.01.22 | CD</span>
                     </span>
                        
                    <div class="prices">
                    <span class="price">20,000원</span>
                    <span class="price_dc">
                     18,500원</span>
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
  
  				<!-- 항목(3) -->
                 <li class="goods_li">
                  <input type="checkbox" id="check">
                  <span class="thumb"><a href="${pageContext.request.contextPath }/item.do">
                     <img src="${pageContext.request.contextPath }/img/CHARLIE PUTH - NINE TRACK MIND.png"></a>
                   </span>
                     <span class="text">
                     <span class="title"><a href="${pageContext.request.contextPath }/item.do">CHARLIE PUTH - NINE TRACK MIND</a>
                     </span>
                     <span class="desc">WARNER MUSIC | 2016.02.01 | CD</span>
                     </span>
                        
                    <div class="prices">
                    <span class="price">20,000원</span>
                    <span class="price_dc">
                     18,500원</span>
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
                  <!-- //항목(3) 끝 -->
                  
      			<!-- 항목(4) -->
                 <li class="goods_li">
                  <input type="checkbox" id="check">
                  <span class="thumb"><a href="${pageContext.request.contextPath }/item.do">
                     <img src="${pageContext.request.contextPath }/img/SAM SMITH - IN THE LONELY HOUR (DROWNING SHADOWS EDITION).png"></a>
                   </span>
                     <span class="text">
                     <span class="title"><a href="${pageContext.request.contextPath }/item.do">SAM SMITH - IN THE LONELY HOUR (DROWNING SHADOWS EDITION)</a>
                     </span>
                     <span class="desc">UNIVERSAL | 2015.11.09 | CD</span>
                     </span>
                        
                    <div class="prices">
                    <span class="price">20,000원</span>
                    <span class="price_dc">
                     18,500원</span>
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
                  <!-- //항목(4) 끝 -->
                 
                 <!-- 항목(5) -->
                 <li class="goods_li">
                  <input type="checkbox" id="check">
                  <span class="thumb"><a href="${pageContext.request.contextPath }/item.do">
                     <img src="${pageContext.request.contextPath }/img/JUSTIN BIEBER - PURPOSE (DELUXE).png"></a>
                   </span>
                     <span class="text">
                     <span class="title"><a href="${pageContext.request.contextPath }/item.do">JUSTIN BIEBER - PURPOSE (DELUXE)</a>
                     </span>
                     <span class="desc">BUNIVERSAL | 2015.11.16 | CD</span>
                     </span>
                        
                    <div class="prices">
                    <span class="price">20,000원</span>
                    <span class="price_dc">
                     18,500원</span>
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
				<!-- //항목(5) 끝 -->

				<!-- 항목(6) -->
                   <li class="goods_li">
                  <input type="checkbox" id="check">
                  <span class="thumb"><a href="${pageContext.request.contextPath }/item.do">
                     <img src="${pageContext.request.contextPath }/img/BEATLES - THE BEATLES 1.png"></a>
                   </span>
                     <span class="text">
                     <span class="title"><a href="${pageContext.request.contextPath }/item.do">BEATLES - THE BEATLES 1</a>
                     </span>
                     <span class="desc">UNIVERSAL | 2015.11.16 | CD</span>
                     </span>
                        
                    <div class="prices">
                    <span class="price">20,000원</span>
                    <span class="price_dc">
                     18,500원</span>
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
                  <!-- //항목(6) 끝 -->
            
            	<!-- 항목(7) -->
                  <li class="goods_li">
                  <input type="checkbox" id="check">
                  <span class="thumb"><a href="${pageContext.request.contextPath }/item.do">
                     <img src="${pageContext.request.contextPath }/img/ONE DIRECTION - MADE IN THE A.M. (ULTIMATE FAN EDITION).png"></a>
                   </span>
                     <span class="text">
                     <span class="title"><a href="${pageContext.request.contextPath }/item.do">ONE DIRECTION - MADE IN THE A.M. (ULTIMATE FAN EDITION)</a>
                     </span>
                     <span class="desc">SONY MUSIC | 2015.11.16 | CD</span>
                     </span>
                        
                    <div class="prices">
                    <span class="price">20,000원</span>
                    <span class="price_dc">
                     18,500원</span>
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
                  <!-- //항목(7) 끝 -->

				<!-- 항목 (8) -->
                  <li class="goods_li">
                  <input type="checkbox" id="check">
                  <span class="thumb"><a href="${pageContext.request.contextPath }/item.do">
                     <img src="${pageContext.request.contextPath }/img/ANDRA DAY - CHEERS TO THE FALL.png"></a>
                   </span>
                     <span class="text">
                     <span class="title"><a href="${pageContext.request.contextPath }/item.do">ANDRA DAY - CHEERS TO THE FALL</a>
                     </span>
                     <span class="desc">WARNER MUSIC | 2016.02.01 | CD</span>
                     </span>
                        
                    <div class="prices">
                    <span class="price">20,000원</span>
                    <span class="price_dc">
                     18,500원</span>
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
				<!-- //항목(8) 끝 -->

				<!-- 항목 (9) -->
                  <li class="goods_li">
                  <input type="checkbox" id="check">
                  <span class="thumb"><a href="${pageContext.request.contextPath }/item.do">
                     <img src="${pageContext.request.contextPath }/img/ARIANA GRANDE - DANGEROUS WOMAN (DELUXE).png"></a>
                   </span>
                     <span class="text">
                     <span class="title"><a href="${pageContext.request.contextPath }/item.do">ARIANA GRANDE - DANGEROUS WOMAN (DELUXE)</a>
                     </span>
                     <span class="desc">UNIVERSAL | 2016.05.20 | CD</span>
                     </span>
                        
                    <div class="prices">
                    <span class="price">20,000원</span>
                    <span class="price_dc">
                     18,500원</span>
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
                  <!-- //항목(9) -->
        
        		<!-- 항목 (10) -->
                  <li class="goods_li">
                  <input type="checkbox" id="check">
                  <span class="thumb"><a href="${pageContext.request.contextPath }/item.do">
                     <img src="${pageContext.request.contextPath }/img/BIRDY - BEAUTIFUL LIES (DELUXE EDITION).png"></a>
                   </span>
                     <span class="text">
                     <span class="title"><a href="${pageContext.request.contextPath }/item.do">BIRDY - BEAUTIFUL LIES (DELUXE EDITION)</a>
                     </span>
                     <span class="desc">WARNER MUSIC | 2016.03.28 | CD</span>
                     </span>
                        
                    <div class="prices">
                    <span class="price">20,000원</span>
                    <span class="price_dc">
                     18,500원</span>
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
                    
                  </li>
                  <!-- //항목 (10) -->
                </ul>
                
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
