<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html lang="ko">
   <head>
    <%@include file="inc/head.jsp" %>
   <link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/css/basket.css" />  
       
      <style type="text/css">
      </style>
      <script type="text/javascript">
      </script>
   </head>
   <body>
 <%@include file='inc/top_nav.jsp' %>

<!-- 본문내용 작성 start -->
         <div id="content">
            <h2>장바구니</h2>
            <hr/>
            <div class="text-center">
            <img src="${pageContext.request.contextPath }/img/barket.gif" alt="장바구니" />
         </div>
            <form name="barket">
            <div class="barket">
               <div class="board">
               <table class="table table-striped table-hover">
                  <colgroup>
                     <col width="10%"/>
                     <col width="55%"/>
                     <col width="10%"/>
                     <col width="5%"/>
                     <col width="10%"/>
                     <col width="10%"/>
                  </colgroup>
               <thead>
               <tr>
               <th class="text-center"><input type="checkbox" id="all_check" value="Y" /></th>
               <th class="text-center">상품</th>
               <th class="text-center">상품금액</th>
               <th class="text-center">수량</th>
               <th class="text-center">주문금액</th>
               <th class="text-center">주문/삭제</th>
               </tr>
               </thead>
               <tbody>
                  <tr>
                     <th colspan="6" id="tab">배송상품</th>
                  </tr>
               <tr>
               <td class="text-center" id="item"><input type="checkbox" class="item_checked"/></td>
               <td id="item"><a href="${pageContext.request.contextPath }/item.do"><img src="${pageContext.request.contextPath }/img/1.jpg" alt="상품">이런 상품입니다.</a></td>
               <td class="text-center" id="item">3000</td>
               <td class="text-center" id="item">2</td>
               <td class="text-center" id="item">6000</td>
               <td class="text-center">
                  <input type="button" class="btn btn-xs btn-warning ruby" onclick="location.href='${pageContext.request.contextPath }/pay.do'" value="바로구매" /><br/>
                  <input type="button" class="btn btn-xs btn-default update" value="수정하기" /><br/>
                  <input type="button" class="btn btn-xs btn-default delete" value="삭제하기" />
               </td>
               </tr>
               </tbody>
               </table>
               </div>
            </div>
            <div class="buy text-center">
               <input type="button" value="계속쇼핑" onclick="history.back(); return false;" class="btn btn-default">
               <input type="button" value="선택주문" onclick="location.href='${pageContext.request.contextPath }/pay.do'" class="btn btn-primary purple">
               <input type="button" value="전체주문" onclick="location.href='${pageContext.request.contextPath }/pay.do'" class="btn btn-primary purple">
            </div>
         </form>
         </div>
<!--본문내용 작성 end -->

<%@include file="inc/footer.jsp" %>

      <script src="${pageContext.request.contextPath }/js/basket.js"></script>

   </body>
</html>