<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
   <head>
      <%@include file="inc/head.jsp" %>
      <link rel="stylesheet" type="text/css" href="css/item.css">
      <style type="text/css">

      </style>
   </head>
   <body>
 <%@include file="inc/top_nav.jsp" %>
<div class="ddd"></div>
<!-- 본문내용 작성 start -->
         <div id="content">
         <input type="hidden"  name="category" value="${product.proCategoryName}">
         <input type="hidden"  name="id" value="${readproduct.id}">
           <div class="item_header">
           <div class="item_thumnail" style="float:left;">
           <c:choose>
						<c:when test="${readproduct.proImg != null}">
								<c:url var="downloadUrl" value="/download.do">
									<c:param name="file" value="${readproduct.proImg}" />
								</c:url>
									<img src="${downloadUrl}" />
								</c:when>
							<c:otherwise>
									<img src="${pageContext.request.contextPath}/assets/img/no_image.jpg" />
							</c:otherwise>
		</c:choose>
           </div>
           <div class="item">
           <div class="item_title">
           <b>${readproduct.proName}</b>
           </div><!-- //item_title -->
           <div class="item_form">

           <table>
           <tbody>
           <tr>
           <th><b>판매가격<b></th>
           <td>:</td>
           <td>${readproduct.proPrice}원</td>
           </tr>
           <tr>
           <th><b>배송방법<b></th>
           <td>:</td>
           <td>택배</td>
           </tr>
           <tr>
           <th>수량</th>
           <td>:</td>
           <td><input type="text" name="amount" id="amount" value="1" disabled /><a id="up"><img src="${pageContext.request.contextPath }/img/count_up.gif" /></a><a id="down"><img src="${pageContext.request.contextPath }/img/count_down.gif" /></a></td>
           </tr>
           </tbody>
           </table>
           <div class="btn_box">
            
           <div class="buy">
           <form action="${pageContext.request.contextPath }/pay.do" method="post" >
            <button type="submit">
               <img src="${pageContext.request.contextPath }/img/btn_buy.gif" />
             </button>
              <input type="hidden"  name="order_id" id="order_id"  value="${readproduct.id}"/>
              <input type="hidden" name="order_amount" id="order_amount"  value="1" />
           </form>
           </div>
        
            
           		<div class="basket">
           		<form action="${pageContext.request.contextPath }/basket_go.do" method="post" >
           		<button type="submit">
               <img src="${pageContext.request.contextPath }/img/btn_cart.gif" />
              </button>
              
              <input type="hidden"  name="basket_id" id="basket_id"  value="${readproduct.id}"/>
               <input type="hidden" name="basket_amount" id="basket_amount"  value="1" />
               <input type="hidden"  name="basket_proname" id="basket_proname"  value="${readproduct.proName}"/>
               <input type="hidden"  name="basket_proimg" id="basket_proimg"  value="${readproduct.proImg}" />
               <input type="hidden"  name="basket_price" id="basket_price"  value="${readproduct.proPrice}"/>
                  </form>
             </div>
         
           </div><!-- btn_box -->

           </div><!-- //item form -->
           </div><!-- //item -->
           </div><!-- // item header -->
        
    
           <div class="contents" id="contents">
           <img src="${pageContext.request.contextPath}/img/택배2.png" />
          ${readproduct.content}
          </div>
           <!--이전, 다음 상품-->
           <div id="PrevNext">
            <div class="nextitem">
             <p>다음 상품</p>
             <div>
                <c:choose>
						<c:when test="${nextproduct.proImg != null}">
								<c:url var="downloadUrl" value="/download.do">
									<c:param name="file" value="${nextproduct.proImg}" />
								</c:url>
								<a href="${pageContext.request.contextPath }/item.do?id=${nextproduct.id}&category=${readproduct.proCategoryName}">
									<img src="${downloadUrl}" />
									<p>${nextproduct.proName}</p>
								</a>
								</c:when>
							<c:otherwise>
									<img src="${pageContext.request.contextPath}/img/noimage.png" />
									<p>다음 상품이 없습니다!</p>
							</c:otherwise>
		</c:choose>

             </div>
            </div>
            <div class="previtem">
                <p>이전 상품</p>
              <div>
                <c:choose>
						<c:when test="${prevproduct.proImg != null}">
								<c:url var="downloadUrl" value="/download.do">
									<c:param name="file" value="${prevproduct.proImg}" />
								</c:url>
								<a href="${pageContext.request.contextPath }/item.do?id=${prevproduct.id}&category=${readproduct.proCategoryName}">
									<img src="${downloadUrl}" />
									<p>${prevproduct.proName}</p>
								</a>
								</c:when>
							<c:otherwise>
									<img src="${pageContext.request.contextPath}/img/noimage.png" />
									<p>이전 상품이 없습니다!</p>
							</c:otherwise>
		</c:choose>
		
             </div>
            </div>
           </div>
<!--이전, 다음 상품 end-->
           <div class="review">
           <div>
           <img src="${pageContext.request.contextPath }/img/detail_tit04.gif" />
           <div>
           <a><img src="${pageContext.request.contextPath }/img/btn_write.gif" /></a>
           <a><img src="${pageContext.request.contextPath }/img/btn_list.gif" /></a>
           </div>
           </div>
           <form method="post" action="${pageContext.request.contextPath }/item.do" style="margin-top:50px; pargin-bottom:-40px;">
           <div class="comment">
           <input type="text" id="comment" style="width:950px;" /><button type="submit" style="float:right; margin-right:20px;">작성하기</button>
           </div>
           </form>
           <table>
           <colgroup>
             <col style="width:100px;">
             <col style="width:800px;">
             <col style="width:100px;">
             <col style="width:100px;">
           </colgroup>
           <thead>
           <tr>
           <th>번호</th>
           <th>내용</th>
           <th>작성자</th>
           <th>작성일</th>
           </tr>
           </thead>
           <tbody>
           <tr>
           <td>1</td>
           <td class="title">fdsfsdafsdfsdfafasdfsdfsad</td>
           <td>sdfsdfas</td>
           <td>2016.10.17</td>
           </tr>
           </tbody>
           </table>
         </div>
      </div>


<!--본문내용 작성 end -->

<%@include file="inc/footer.jsp" %>
          <script type="text/javascript">
     $(function(){
    	 var amount = 1;
    	$("#up").click(function(){
    		if(amount>99){}else{amount++;}
    		$("#amount").val(amount);
    		$("#basket_amount").val(amount);
    		$("#order_amount").val(amount);
    	}); 
    	$("#down").click(function(){
    		if(amount <= 1){}else{amount--;}
    		$("#amount").val(amount);
    		$("#basket_amount").val(amount);
    		$("#order_amount").val(amount);
    	}); 
    	//동적 margin 조절
    	 var PrevNext= document.getElementById("PrevNext");
    	 var objHeight= document.getElementById("contents").offsetHeight;
    	 PrevNext.style.marginTop= objHeight +'px';
     });
      </script>

   </body>
</html>