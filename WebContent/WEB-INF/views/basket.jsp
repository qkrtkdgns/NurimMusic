<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
            <form method="post" action="${pageContext.request.contextPath }/pay.do">
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
                  <c:choose>
						<c:when test="${fn:length(basket) > 0}">
							<c:forEach var="b" items="${basket }">
								<tr>
								<td class="text-center" id="item"><input type="checkbox" name="checkbox" class="item_checked id" value="${b.id }"/></td>
									<td id="item"><a href="${pageContext.request.contextPath }/item.do?productId=${b.productId}">
									<c:choose>
														<c:when test="${b.proImg != null}">
															<c:url var="downloadUrl" value="/download.do">
																<c:param name="file" value="${b.proImg}" />
															</c:url>
															<img src="${downloadUrl}" />
														</c:when>
														<c:otherwise>
															<img
																src="${pageContext.request.contextPath}/assets/img/no_image.jpg"
																/>
														</c:otherwise>
													</c:choose>
									<!--<img src="${b.proImg }" />  --> ${b.proName }</a></td>
									<td class="text-center" id="item">${b.proPrice }원</td>
									<td class="text-center" id="item"><input type="text" class="amount" value="${b.amount }" style="width:20px; float:left; display:inline-block;"/> 개</td>
									<td class="text-center" id="item">${b.proPrice * b.amount }원</td>
									<td class="text-center" id="item">
								 <input type="button" class="btn btn-xs btn-warning ruby" onclick="location.href='${pageContext.request.contextPath }/pay.do?id=${b.id }'" value="바로구매" /><br/>
               					 <input type="button" class="btn btn-xs btn-default update" value="수정하기" /><br/>
                 				 <input type="button" class="btn btn-xs btn-default delete" onclick="location.href='${pageContext.request.contextPath }/basket_delete.do?id=${b.id }'" value="삭제하기" />
                 				 </td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="10" class="text-center" style="line-height: 100px;">
									조회된 글이 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
               </tbody>
               </table>
               </div>
            </div>
            <div class="buy text-center">
            <input type="hidden" value="0" name="count" id="count" />
               <input type="button" value="계속쇼핑" onclick="history.back(); return false;" class="btn btn-default">
               <button type="submit" class="btn btn-primary purple">선택주문</button>
               <input type="button" value="전체주문" onclick="location.href='${pageContext.request.contextPath }/pay.do'" class="btn btn-primary purple">
            </div>
         </form>
         </div>
<!--본문내용 작성 end -->

<%@include file="inc/footer.jsp" %>

      <script src="${pageContext.request.contextPath }/js/basket.js"></script>
      <script>
      $(function(){
    	  $(".update").click(function(){
    		  window.location.href = "${pageContext.request.contextPath}/basket_update.do?id="+$(this).parents('tr').find('.id').val()+"&amount="+$(this).parents('tr').find('.amount').val();
    	  }); 
    	  
    	  $("input[name=checkbox]:checkbox").click(function(){
  			var cnt = $("input[name=checkbox]:checkbox:checked").length;
  			$("#count").val(cnt);
  		});
    	  $("form").submit(function(){
    		  if($("input[name=checkbox]:checkbox:checked").length ==0){
    			  alert("주문할 상품을 선택해 주세요.");
    			  return false;
    		  }
    	  });
      });
      </script>

   </body>
</html>