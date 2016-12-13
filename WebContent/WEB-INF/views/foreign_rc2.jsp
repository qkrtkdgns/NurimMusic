<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
                  <button class="btn btn-default btn-sm"  id="basket_list">장바구니 담기</button>
               </div>
               <!-- //체크한 음반 끝 -->
               
               <!-- 원하는 카테고리순 정렬 -->
               <div class="search_list">
                  		<a href="${pageContext.request.contextPath}/foreign_rc2.do?CList=Reg&keyword1=${keyword1}&keyword2=${keyword2}">발매일
						</a>&nbsp;&nbsp;|&nbsp;&nbsp;
						<a href="${pageContext.request.contextPath}/foreign_rc2.do?CList=high&keyword1=${keyword1}&keyword2=${keyword2}">높은가격
						</a>&nbsp;&nbsp;|&nbsp;&nbsp;
						<a href="${pageContext.request.contextPath}/foreign_rc2.do?CList=row&keyword1=${keyword1}&keyword2=${keyword2}">낮은가격
						</a>
               </div>
               <!-- //원하는 카테고리순 정렬 끝 -->
            </div>
            <!-- //list-topbar 끝 -->

            <!-- 해외음반 리스트 시작 -->
            <div class="list_lineup">
               <ul>
           <c:choose>
			<c:when test="${fn:length(productList) > 0}">
				<c:forEach var="product" items="${productList }">      
               	<!-- 항목(1) --> 
                  <li class="goods_li">
                  <input type="checkbox"  name="basket"  id="check" value="${product.id}" >
                  <span class="thumb">
                  <a href="${pageContext.request.contextPath }/item.do?id=${product.id}&category=${product.proCategoryName}">
                     <c:choose>
									<c:when test="${product.proImg != null}">
											<c:url var="downloadUrl" value="/download.do">
												<c:param name="file" value="${product.proImg}" />
											</c:url>
												<img src="${downloadUrl}" />
											</c:when>
										<c:otherwise>
												<img src="${pageContext.request.contextPath}/img/noimage.jpg" />
										</c:otherwise>
								</c:choose>
                     </a>
                   </span>
                     <span class="text">
                     <a href="${pageContext.request.contextPath }/item.do?id=${product.id}&category=${product.proCategoryName}">
                     <span class="title" name="pro_name"  value="${product.proName}">${product.proName}</span></a>
                     <span class="desc">${product.provider}</span>
                     </span>
                        
                    <!-- 가격 -->
                    <div class="prices">
                    <span class="price" name="price" value="${product.proPrice}">${product.proPrice}원</span>
                    <span class="price_dc">
                     ${product.proPrice}원</span>
                     </div>
                     <!-- //가격 끝 -->

                     <!-- 버튼들 -->
                     <div class="button">
                     <c:choose>
						<c:when test="${product.amount != 0}">
						<!-- 장바구니 -->
                     <div class="basket_btn">
                     <form name="basketgo" method="post" action="${pageContext.request.contextPath }/basketgo.do">
                     <button type="submit" class="btn btn-default" id="A" name="list_01" >장바구니</button>
                     	<input type="hidden" name="b_basket"  value="${product.id}">
						<input type="hidden" name="blist" id="blist" >
						<input type="hidden" name="b_pro_name"  value="${product.proName}">
						<input type="hidden" name="b_price"  value="${product.proPrice}">
						<input type="hidden" name="b_file"  value="${product.proImg}">
                     </form>
                     </div>
                     <!-- 장바구니 end -->
                     <!-- 바로구매 -->
                     <div class="buy_btn">
                    <form method="post" action="${pageContext.request.contextPath }/pay.do">
                     <button type="submit" class="btn btn-default" id="B" name="list_01" >바로구매</button>
                     <input type="hidden" name="order_id"  value="${product.id}">
					<input type="hidden" name="order_amount"  value="1">
                     </form>
                     </div>
                     <!-- 바로구매 end -->
                     </c:when>
                     <c:otherwise>
                     <div class="so_btn">
                      <button class="btn btn-default" id="A1" name="list_01" disabled><font color="red">품&nbsp;&nbsp;절</font></button>
                      </div>
                      <div class="al_btn">
                   
                      </div>
                      </c:otherwise>
                      </c:choose>
                      </div>
                      <!--// 버튼들 끝 -->
                  </li>
                  <!-- //항목(1) 끝 -->
                  	</c:forEach>
				</c:when>		

				<c:otherwise>
							<p class="text-center"style="line-height: 100px;">조회된 글이 없습니다.</p>			
				</c:otherwise>
			</c:choose>	
                </ul>
                
              				<!-- 페이지 번호 -->
	<div class="page_num">
		<ul class="pagination pagination-mg">
			<c:choose>
			<c:when test="${pageHelper.prevPage > 0}">
				<!-- 이전 그룹에 대한 페이지 번호가 존재할 경우, 이전 그룹으로 이동하기 위한
				URL을 생성해서 prevUrl에 저장 -->
				<c:url var="prevUrl" value="/kor_rc1.do">
					<c:param name="category" value="${category}" />
					<c:param name="keyword" value="${keyword}" />
					<c:param name="page" value="${pageHelper.prevPage}" />
				</c:url>
				<li><a href="${prevUrl}">&laquo;</a></li>
			</c:when>
			
			<c:otherwise>
			<!-- 이전 그룹에 대한 페이지 번호가 없을 경우 -->
			<li class="disabled"><a href="#">&laquo;</a></li>
			</c:otherwise>
			</c:choose>
			
			<c:forEach var="i"  begin="${pageHelper.startPage}" end="${pageHelper.endPage}" step="1">
			<!-- 각 페이지 번호로 이동할 수 있는 URL을 생성하여 page_url에 저장 -->
			<c:url var="pageUrl" value="/foregin_rc2..do">
					<c:param name="category" value="${category}" />
					<c:param name="keyword" value="${keyword}" />
					<c:param name="page" value="${i}" />
				</c:url>
				
			<c:choose>
				<c:when test="${pageHelper.page==i}">
					<li class="active"><a href="#">${i}</a></li>
				</c:when>
				
				<c:otherwise>
					<li><a href="${pageUrl}">${i}</a></li>
				</c:otherwise>
			</c:choose>
			</c:forEach>
			
			<c:choose>
			<c:when test="${pageHelper.nextPage > 0}">
				<!-- 다음 그룹에 대한 페이지 번호가 존재할 경우, 다음 그룹으로 이동하기 위한
				URL을 생성해서 nextUrl에 저장 -->
				<c:url var="nextUrl" value="/foregin_rc2..do">
					<c:param name="category" value="${category}" />
					<c:param name="keyword" value="${keyword}" />
					<c:param name="page" value="${pageHelper.nextPage}" />
				</c:url>
				<li><a href="${nextUrl}">&raquo;</a></li>
			</c:when>
			
			<c:otherwise>
			<!-- 다음 그룹에 대한 페이지 번호가 없을 경우 -->
			<li class="disabled"><a href="#">&raquo;</a></li>
			</c:otherwise>
			
			</c:choose>
		</ul>	
	</div>
	
		<!-- 검색 영역 -->
		<form action="${pageContext.request.contextPath}/foregin_rc2.do" method="get">
					<div class="result_search">
						<select class="input_form" id="keyword_type" name="keyword_type">
							<option value="null"  selected>선택</option>
							<option value="pro_name">가수명</option>
							<option value="provider">공급업체</option>
						</select>
						<input type="text" class="input_txt" id="keyword1" name="keyword1"  value="${keyword1}"/>
						<input type="hidden" class="input_txt" id="keyword2" name="keyword2"  value="${keyword2}"/>
						<button type="submit" class="btn btn-default" id="keyword_btn">검색</button>
					</div>
				
		</form>
		<!-- //검색 영역 끝 -->
</div>
</div>

<!--본문내용 작성 end -->
</div>

<%@include file="inc/footer.jsp" %>
<script type="text/javascript">
    	
$(function(){
    		
//검색 관리
   $("#keyword_type").change(function(){
	   var keyword_type = this.value;
		$('#keyword1').empty();
		 $('#keyword2').empty();
		
			if(keyword_type == "provider"){
				$('#keyword1').empty();
				$('#keyword2').empty();
				$('#keyword1').hide();
				$('#keyword2').attr("type", "text"); 
				$('#keyword2').attr("disabled",false); 
		    }else if(keyword_type == "pro_name"){
    				$('#keyword1').empty();
   					$('#keyword2').empty();
   					$('#keyword2').attr("type", "hidden"); 
    				$('#keyword1').show();
    				$('#keyword1').attr("disabled",false);
    				
    		}else if(keyword_type == "null"){
    				$('#keyword1').empty();
     				 $('#keyword2').empty();
     				$('#keyword1').attr("disabled",true);
     				$('#keyword2').attr("disabled",true);
   			}
	});
   $('#keyword1').attr("disabled",true);	
   
   $("#basket_list").click(function(){  
	    var str = new Array();
	    $("input[name=basket]:checked").each(function(){  
	        str.push($(this).val());
	    });

	    jQuery.ajaxSettings.traditional = true;
	    $.ajax({
	    	url:'${pageContext.request.contextPath }/basketgo.do',
	    	type:'get',
	    	dataType:'text',
	    	data:{blist:str},
	    	success  : function(){
                alert("체크하신 상품들이 장바구니에  담겼습니다. 확인해 보세요");
            },error:function(request,status,error){
	    	    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
	    });
  	}); 
  });

		</script>

	</body>
</html>

