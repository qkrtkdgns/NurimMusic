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
	href="${pageContext.request.contextPath }/css/slide.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/index.css" />

</head>
<body>
	<%@include file="inc/top_nav.jsp"%>
	<div class="ddd"></div>
	<!-- 본문내용 작성 start -->
	<div id="content">
		<div class=top_menu>
			<div class="slide">
				<ul class="slide_ul">
					<li><a><img
							src="${pageContext.request.contextPath }/img/메인1.jpg" width="700"
							height="360" alt="슬라이드"> </a></li>
					<li><a><img
							src="${pageContext.request.contextPath }/img/slide-6aa.jpg"
							width="700" height="360" alt="슬라이드"> </a></li>
					<li><a><img
							src="${pageContext.request.contextPath }/img/slide-gg.jpg"
							width="700" height="360" alt="슬라이드"> </a></li>
					<li><a><img
							src="${pageContext.request.contextPath }/img/메인3.jpg" width="700"
							height="360" alt="슬라이드"> </a></li>
					<li><a><img
							src="${pageContext.request.contextPath }/img/메인2.jpg" width="700"
							height="360" alt="슬라이드"> </a></li>
				</ul>
			</div>
			<div class="side">
				<table>
					<tr>
						<td width="400" align="center"><a
							href="${pageContext.request.contextPath }/kor.do"> <img
								src="${pageContext.request.contextPath }/img/text2.jpg"
								width="410" height="135" alt="사이드메뉴" /></a></td>
					<tr>
						<td height="4"></td>
					</tr>
					</tr>
					<td width="400" align="center"><a
						href="${pageContext.request.contextPath }/foreign.do"> <img
							src="${pageContext.request.contextPath }/img/text.png"
							width="410" height="135" alt="사이드메뉴" /></a></td>
					<tr>
						<td height="4"></td>
					</tr>
					<td width="400" align="center"><a
						href="${pageContext.request.contextPath }/shopping_main.do"> <img
							src="${pageContext.request.contextPath }/img/123.png" width="410"
							height="135" alt="사이드메뉴" /></a></td>
				</table>
			</div>
		</div>
		<div class="best_item">
			<img src="${pageContext.request.contextPath }/img/Best_Item1.jpg">
			<h1>best item</h1>
			<div id="carousel">
				<c:choose>
					<c:when test="${fn:length(bestItem) > 0}">
						<c:forEach var="b" items="${bestItem }" varStatus="i">
							<a
								href="${pageContext.request.contextPath }/item.do?productId=${b.id}">
								<c:choose>
									<c:when test="${b.proImg != null}">
										<c:url var="downloadUrl" value="/download.do">
											<c:param name="file" value="${b.proImg}" />
										</c:url>
										<img src="${downloadUrl}" id="item-${i.count }"
											style="max-width: 100%; height: 100%;" />
									</c:when>
									<c:otherwise>
										<img
											src="${pageContext.request.contextPath}/assets/img/no_image.jpg"
											id="item-${i.count }" style="max-width: 100%; height: 100%;" />
									</c:otherwise>
								</c:choose>
							</a>
						</c:forEach>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div id="new_item">
			<div class="new_img">
				<img src="img/New_Item1.jpg">
			</div>
			<ul class="new_item_ul1">
				<c:choose>
					<c:when test="${fn:length(newItem) > 0}">
						<c:forEach var="n" items="${newItem }" varStatus="i">
							<li><a
								href="${pageContext.request.contextPath }/item.do?productId=${n.id}">
									<span class="thumb"> <c:choose>
											<c:when test="${n.proImg != null}">
												<c:url var="downloadUrl" value="/download.do">
													<c:param name="file" value="${n.proImg}" />
												</c:url>
												<img src="${downloadUrl}"
													style="max-width: 140px; max-height: 140px;" />
											</c:when>
											<c:otherwise>
												<img
													src="${pageContext.request.contextPath}/assets/img/no_image.jpg"
													style="width: 60%; height: 100%;" />
											</c:otherwise>
										</c:choose></span> <span class="ab_name"
									style="height: 60px; text-overflow: ellipsis; overflow: hidden">${n.proName }</span>
							</a> <span class="price">${n.proPrice }원</span></li>
						</c:forEach>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		<!-- 누림 MD 추천음반 영역 시작 -->
		<div class="main_rev">
			<img src="${pageContext.request.contextPath }/img/main_md2.png">
			<ul>
				<c:choose>
					<c:when test="${fn:length(MDItem) > 0}">
						<c:forEach var="md" items="${MDItem }" begin="0" end="3" varStatus="i">
							<li class="rv_list"><a
								href="${pageContext.request.contextPath }/item.do?productId=${md.id}">
									<span class="thumb"> <c:choose>
											<c:when test="${md.proImg != null}">
												<c:url var="downloadUrl" value="/download.do">
													<c:param name="file" value="${md.proImg}" />
												</c:url>
												<img src="${downloadUrl}"
													style="max-width: 140px; max-height: 140px;" />
											</c:when>
											<c:otherwise>
												<img
													src="${pageContext.request.contextPath}/assets/img/no_image.jpg"
													style="width: 60%; height: 100%;" />
											</c:otherwise>
										</c:choose></span>
									<div class="text">
										<span class="title">${md.proName }</span> <span
											class="md_price"> ${md.proPrice }원 </span> <span
											class="text_1"> ${md.content } </span>
									</div></li>
						</c:forEach>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		<!-- 누림 MD 추천음반 영역 끝 -->
	</div>
	<!--본문내용 작성 end -->
	<%@include file="inc/footer.jsp"%>
	<script
		src="${pageContext.request.contextPath }/assets/js/mainslide.js"></script>
	<script
		src="${pageContext.request.contextPath }/assets/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/js/jquery.waterwheelCarousel.js"></script>
	<script type="text/javascript">
		$(document).ready(
				function() {
					var carousel = $("#carousel").waterwheelCarousel(
							{
								flankingItems : 3,
								movingToCenter : function($item) {
									$('#callback-output').prepend(
											'movingToCenter: '
													+ $item.attr('id')
													+ '<br/>');
								},
								movedToCenter : function($item) {
									$('#callback-output').prepend(
											'movedToCenter: '
													+ $item.attr('id')
													+ '<br/>');
								},
								movingFromCenter : function($item) {
									$('#callback-output').prepend(
											'movingFromCenter: '
													+ $item.attr('id')
													+ '<br/>');
								},
								movedFromCenter : function($item) {
									$('#callback-output').prepend(
											'movedFromCenter: '
													+ $item.attr('id')
													+ '<br/>');
								},
								clickedCenter : function($item) {
									$('#callback-output').prepend(
											'clickedCenter: '
													+ $item.attr('id')
													+ '<br/>');
								}
							});

					$('#prev').bind('click', function() {
						carousel.prev();
						return false
					});

					$('#next').bind('click', function() {
						carousel.next();
						return false;
					});

					$('#reload').bind('click', function() {
						newOptions = eval("(" + $('#newoptions').val() + ")");
						carousel.reload(newOptions);
						return false;
					});

				});
	</script>
</body>
</html>