<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<%@include file="inc/head.jsp" %>
		<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/css/kor_sub.css"/>

	</head>
	<body>

 <%@include file="inc/top_nav.jsp" %>

<!-- 본문내용 작성 start -->
         <div id="content">
         <h2>국내음반</h2><hr>
         <!--사이드 메뉴-->
         <%@include file="inc/category.jsp" %>
         <!-- end 사이드 메뉴-->
		<div class="goods_list">
				<div class="list-topbar">
					<div class="check_list">
						체크한 음반
						<a href="#" class="btn btn-default btn-sm">장바구니 담기</a>
						<a href="#" class="btn btn-default btn-sm">관심상품</a>
					</div>
					<div class="search_list">
						<a href="#">발매일</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">높은가격</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">낮은가격</a>
					</div>
				</div>

				<div class="list_lineup">
					<ul>
		<c:choose>
			<c:when test="${fn:length(productList) > 0}">
				<c:forEach var="product" items="${productList }">
							<li>
							<table >
								<tr>
								<td style="width:10;"><input type="checkbox" name="basket"></td>
								<td width="145">
								<a href="${pageContext.request.contextPath }/item.do">
								<c:choose>
									<c:when test="${product.proImg != null}">
											<c:url var="downloadUrl" value="/download.do">
												<c:param name="file" value="${product.proImg}" />
											</c:url>
												<img src="${downloadUrl}" />
											</c:when>
										<c:otherwise>
												<img src="${pageContext.request.contextPath}/assets/img/no_image.jpg" />
										</c:otherwise>
								</c:choose>			
								</a>
								</td>
								<td width="493">
								<a href="${pageContext.request.contextPath }/item.do"><span class="title">${product.proName}
								</span></a>
								<span class="substance">${product.provider}</span>
								</td>
								<th width="183"><p class="price1">${product.proPrice}</p>
								<p class="price2">${product.proPrice}</p>
								</th>
								
								<th class="item_button">
								<a href="#" class="btn btn-default" id="A1" name="list_01"/><font color="red">품&nbsp;&nbsp;절</font></a>
								
								<a href="${pageContext.request.contextPath }/basket.do" class="btn btn-default" id="A" name="list_01" />장바구니</a>
								<a href="#" class="btn btn-default" id="B1" name="list_01" />입고알림</a>
								
								<a href="${pageContext.request.contextPath }/pay.do" class="btn btn-default" id="B" name="list_01" />바로구매</a>
								</th>
								
								</tr>
			
					</table>
						</li>
				</c:forEach>
				</c:when>		

				<c:otherwise>
							<p class="text-center"style="line-height: 100px;">조회된 글이 없습니다.</p>			
				</c:otherwise>
			</c:choose>	
					</ul>
					</div>
			<div class="page_num">
			<ul class="pagination pagination-mg">
			<li class="disabled"><a href="#">&laquo;</a></li>
			<li class="active"><span>1<span class="sr-only">(current)</span></span></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
			<li><a href="#">&raquo;</a></li>
			</ul>
				
			</div>
			</div>
	
</div>

<!--본문내용 작성 end -->
						<!-- 템플릿 참조 -->
<script id="tmpl_comment_item" type="text/x-handlebars-template">

   						

			
												
														
			
								
</script>
<%@include file="inc/footer.jsp" %>
		 <script type="text/javascript">
    	
	$(function(){
    			var sell= false;

    			if(sell==false){
    			$(".list_lineup > ul > li > table #A1").hide();
    			$(".list_lineup > ul > li > table #B1").hide();
    			}else{
    			$(".list_lineup > ul > li > table #A").hide();
    			$(".list_lineup > ul > li > table #B").hide();
    			}
			
    			
    			
    		});

    	
		</script>

	</body>
</html>
