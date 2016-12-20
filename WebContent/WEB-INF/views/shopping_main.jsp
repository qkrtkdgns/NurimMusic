<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="inc/head.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/shopping_main.css" />

</head>
<body>

	<%@include file="inc/top_nav.jsp"%>
	<div class="ddd"></div>
	<!--빈 박스-->
	<!-- 본문내용 작성 start -->
	<div id="content">
		<h2>쇼핑</h2>
		<hr>
		<!--사이드 메뉴-->
		<%@include file="inc/category.jsp"%>
		<!-- end 사이드 메뉴-->


		<div class="shop_content">
			<!--캐러셀 영역 구성 -->
			<div id="carousel-example-generic" class="carousel slide"
				data-ride="carousel">
				<!-- 현재 위치 표시 -->
				<ol class="carousel-indicators">
					<li data-target="#carousel-example-generic" data-slide-to="0"
						class="active"></li>
					<li data-target="#carousel-example-generic" data-slide-to="1"></li>
					<li data-target="#carousel-example-generic" data-slide-to="2"></li>
				</ol>

				<!-- 내용 영역 -->
				<div class="carousel-inner">
					<!-- 항목 (1) -->
					<div class="item active">
						<img src="${pageContext.request.contextPath }/img/Shop1.jpg"
							alt="슬라이더(1)">
						<div class="carousel_cont"></div>
					</div>

					<!-- 항목 (2) -->
					<div class="item">
						<img src="${pageContext.request.contextPath }/img/Shop2.jpg"
							alt="슬라이더(2)">
						<div class="carousel_cont"></div>
					</div>

					<!-- 항목 (3) -->
					<div class="item">
						<img src="${pageContext.request.contextPath }/img/Shop3.png"
							alt="슬라이더(3)">
						<div class="carousel_cont"></div>
					</div>
				</div>
				<!-- // 내용영역 구성 -->

				<!-- 이동 버튼 -->
				<a class="left carousel-control" href="#carousel-example-generic"
					data-slide="prev"> <span class="icon-prev"></span>
				</a> <a class="right carousel-control" href="#carousel-example-generic"
					data-slide="next"> <span class="icon-next"></span>
				</a>
			</div>
			<!-- //캐러셀 영역 구성 끝 -->

			<div class="shop_items">
				<div class="shop_im">
					<img src="${pageContext.request.contextPath }/img/md1.png">
				</div>
				<div class="items">

					<ul class="new_item_ul">
						<c:choose>
							<c:when test="${fn:length(shppingItemList) > 0}">
								<c:forEach var="product" items="${shppingItemList }">
									<li class="shop_li"><input type="hidden" name="product_id"
										value="${product.id}"> 
										<a href="${pageContext.request.contextPath }/item.do">
										<span class="thumb">
											<c:choose>
													<c:when test="${product.proImg != null}">
														<c:url var="downloadUrl" value="/download.do">
															<c:param name="file" value="${product.proImg}" />
														</c:url>
														<img src="${downloadUrl}" />
													</c:when>
													<c:otherwise>
														<img src="${pageContext.request.contextPath}/img/noimage.png" />
													</c:otherwise>
												</c:choose>
										</span> <span class="ab_name">${product.proName}</span></a>
										<span class="price">${product.proPrice}원</span></li>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<span class="thumb"><img
									src="${pageContext.request.contextPath}/img/noimage.png" /></span>
								<span class="ab_name">상품 없음</span>
							</c:otherwise>
						</c:choose>
					</ul>


				</div>
				<div class="items2">
					<div class="shop_im">
						<img src="${pageContext.request.contextPath }/img/md2.png">
					</div>

					<div class="items">

						<ul class="new_item_ul">
							<c:choose>
								<c:when test="${fn:length(HotItemList) > 0}">
									<c:forEach var="product" items="${HotItemList }">
										<li class="shop_li">
										<input type="hidden" name="product_id" value="${product.id}">
											<a href="${pageContext.request.contextPath }/item.do?id=${product.id}&category=${product.proCategoryName}">
												<span class="thumb"> <c:choose>
														<c:when test="${product.proImg != null}">
															<c:url var="downloadUrl" value="/download.do">
																<c:param name="file" value="${product.proImg}" />
															</c:url>
															<img src="${downloadUrl}" />
														</c:when>
														<c:otherwise>
															<img
																src="${pageContext.request.contextPath}/img/noimage.png" />
														</c:otherwise>
													</c:choose>
											</span> <span class="ab_name">${product.proName}</span></a>
											<span class="price">${product.proPrice}원</span>
											</li>
						</c:forEach>
						</c:when>
						<c:otherwise>
							<span class="thumb"><img
								src="${pageContext.request.contextPath}/img/noimage.png" /></span>
							<span class="ab_name">상품 없음</span>
						</c:otherwise>
						</c:choose>
						</ul>
						

					</div>
				</div>
				<!-- items2 end -->
			</div>
			<!-- shop_items end -->
		</div>
		<!-- shop_content end -->
	</div>

	<!--본문내용 작성 end -->

	<%@include file="inc/footer.jsp"%>

</body>
</html>
