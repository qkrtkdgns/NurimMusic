<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="ko">
<head>
<%@ include file="inc/head.jsp"%>
<%@ include file="inc/layout.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/admin_assets/css/member.css" />
<style type="text/css">
#dropdown, #search_item, #submit_bt {
	margin-top: 0;
	height: 30px;
	display: block;
	float: left;
}
</style>

</head>
<body>
	<div id="container">
		<div id="top">
			<a href="main.html">Admin</a>
		</div>
		<%@ include file="inc/category.jsp"%>

		<!-- 컨텐츠 영역 start -->
		<form method="post" action="../admin/new_item.do">
			<div id="content">
				<div id="member">
					<!--검색 start -->
					<div id="search">
						<form>
							<div id="filter_box">
								<b>분류검색&nbsp;</b> <select id="filter">
									<option value="검색조건">검색조건</option>
									<option value="국내음반">국내음반</option>
									<option value="해외음반">해외음반</option>
									<option value="쇼핑">쇼핑</option>
								</select>
							</div>
							<div id="state_box">
								<b>상품상태&nbsp;</b> <input type="radio" name="state" id="state"
									value="1" checked />전체 <input type="radio" name="state"
									id="state" value="2" />진열 <input type="radio" name="state"
									id="state" value="3" />미진열
							</div>
							<div id="search_form">
								<select id="dropdown">
									<option value="검색조건">검색조건</option>
									<option value="제목">제목</option>
									<option value="내용">내용</option>
								</select> <input type="text" name="search_item" id="search_item"
									placeholder="검색어를 입력하세요." />
								<button type="submit" id="submit_bt">검색</button>
							</div>
						</form>
					</div>
					<!--검색 end -->

					<!-- 테이블 start -->
					<div id="items">
						<table>
							<colgroup>
								<col style="width: 50px;">
								<col style="width: 100px;">
								<col style="width: 500px;">
								<col style="width: 100px;">
								<col style="width: 100px;">
								<col style="width: 100px;">
								<col style="width: 100px;">
								<col style="width: 100px;">
								<col style="width: 100px;">
							</colgroup>
							<thead>
								<tr>
									<th><input type="checkbox" id="all_check" /></th>
									<th>이미지</th>
									<th>상품명(상품번호)</th>
									<th>가격</th>
									<th>수량</th>
									<th>조회</th>
									<th>리뷰</th>
									<th>등록일</th>
									<th>진열여부</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${fn:length(productList) > 0}">
										<c:forEach var="product" items="${productList }">
											<tr>
												<td><input type="checkbox" class="item_checked" /></td>

												<td>
												<c:choose>
														<c:when test="${product.proImg != null}">
															<c:url var="downloadUrl" value="/download.do">
																<c:param name="file" value="${product.proImg}" />
															</c:url>
															<img src="${downloadUrl}" class="img-responsive" />
														</c:when>
														<c:otherwise>
															<img
																src="${pageContext.request.contextPath}/assets/img/no_image.jpg"
																class="img-responsive" />
														</c:otherwise>
													</c:choose>
												</td>
												
												<td>${product.proName}(${product.id})</td>
												<td>${product.proPrice}</td>
												<td>${product.amount}</td>
												<td>${product.proHit}</td>
												<td>null</td>
												<td>${product.regDate}</td>
												<td>null</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="9" class="text-center"
												style="line-height: 100px;">조회된 글이 없습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						<%@ include file="inc/new_item_page.jsp"%>
					</div>
					<!-- 테이블 end -->
				</div>
				<!-- 버튼 start -->
				<div id="bt_box">
					<button id="delete">삭제</button>
				</div>
				<!-- 버튼 end -->

				<!-- 컨텐츠 영역 end -->
			</div>
		</form>
	</div>

	<!-- jquery start -->
	<script type="text/javascript">
		
	</script>
	<!-- jquery end -->
</body>
</html>
