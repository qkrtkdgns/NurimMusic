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
<div class="ddd"></div><!--빈 박스-->
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
						<a href="#" class="btn btn-default">장바구니 담기</a>
					</div>
					<div class="search_list">
						<a href="#">발매일</a>&nbsp;|&nbsp;<a href="#">높은가격</a>&nbsp;|&nbsp;<a href="#">낮은가격</a>
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
								<a href="${pageContext.request.contextPath }/item.do">
								<span class="title">${product.proName}</span></a>
								<span class="substance">${product.provider}</span>
								</td>
								<th width="183">
									<p class="price1">${product.proPrice}원</p>
									<p class="price2">${product.proPrice}원</p>
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
			<c:url var="pageUrl" value="/kor_rc1.do">
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
				<c:url var="nextUrl" value="/kor_rc1.do">
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
		<form action="${pageContext.request.contextPath}/kor_rc2.do" method="get">
					<div class="result_search">
						<select class="input_form" id="keyword_type" name="keyword_type">
							<option value="null">선택</option>
							<option value="pro_name">가수명</option>
							<option value="provider">공급업체</option>
						</select>
						<input type="text" class="input_txt" id="keyword" name="keyword"  value="${keyword}"/>
						<button type="submit" class="btn btn-default">검색</button>
					</div>
		</form>
		<!-- //검색 영역 끝 -->
</div>
</div>

<!--본문내용 작성 end -->

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
