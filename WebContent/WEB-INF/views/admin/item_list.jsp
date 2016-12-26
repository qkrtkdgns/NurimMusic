<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="ko">
<head>
<%@ include file="inc/head.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/admin_assets/css/member.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin_assets/css/layout.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin_assets/js/layout.js"></script>
<style type="text/css">
#dropdown, #search_item, #submit_bt {
	margin-top: 0;
	height: 30px;
	display: block;
	float: left;
}
td a{
	color: #000 !important;
}
.help{
margin-left:400px;
margin-bottom:5px;
color:#249;
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
	<form method="post" action="../admin/item_list.do" >	
			<div id="content">
			
				<div id="member">
					<!--검색 start -->
					<div id="search">
							<div id="state_box">
								<b>상품상태&nbsp;</b> <input type="radio" name="state" id="state"
									value="1" checked />전체 <input type="radio" name="state"
									id="state" value="2" />진열 <input type="radio" name="state"
									id="state" value="3" />미진열
							</div>
							<div id="search_form">
								<select name="dropdown" id="dropdown">
									<option>검색조건</option>
									<option value="1">상품명</option>
									<option value="2">공급업체</option>
								</select> <input type="text" name="search_item" id="search_item"
									placeholder="검색어를 입력하세요." />
								<button type="submit" id="submit_bt">검색</button>
							</div>
						
					</div>
					<!--검색 end -->
					<div class="help">상품명을 클릭하여 해당 상품의 정보 수정이 가능합니다.</div>
					<!-- 테이블 start -->
					<div id="items">
						<table>
							<colgroup>
								<col style="width: 40px;">
								<col style="width: 100px;">
								<col style="width: 80px;">
								<col style="width: 330px;">
								<col style="width: 80px;">
								<col style="width: 80px;">
								<col style="width: 80px;">
								<col style="width: 100px;">
								<col style="width: 80px;">
							</colgroup>
							<thead>
								<tr>
									<th><input type="checkbox" id="all_check" /></th>
									<th>이미지</th>
									<th>카테고리</th>
									<th>상품명(상품번호)</th>
									<th>가격</th>
									<th>수량</th>
									<th>조회</th>
									<th>등록일</th>
									<th>진열여부</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${fn:length(productList) > 0}">
										<c:forEach var="product" items="${productList }">
											<input type="hidden" name="img" value="${product.proImg}" />
											<tr>
												<td><input type="checkbox" class="item_checked"   name="check" value="${product.id}"   /></td>
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
												<td>
												${product.proCategoryName}
												</td>
												<td>
												<c:url var="readUrl" value="/admin/edit_item.do">
													<c:param name="id" value="${product.id}"/>
													<c:param name="category" value="${product.proCategoryName}"/>
												</c:url>
												<a href="${readUrl}">${product.proName}(${product.id})</a>
												</td>
												<td>${product.proPrice}원</td>
												<td>${product.amount}개</td>
												<td>${product.proHit}</td>
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
					<input type="hidden" id="ok"  name="ok">
				</div>
				<!-- 버튼 end -->			
				<!-- 컨텐츠 영역 end -->
			</div>
</form>
	</div>

	<!-- jquery start -->

	<script type="text/javascript">
	$(function(){
		
		 $("#all_check").change(function(){
			  var is_check=$(this).is(":checked");

			  $(".item_checked").prop("checked", is_check);
			});
		
		  $("#delete").click(function(){
			  $('#ok').attr("value", "B"); 
		    if($("input[type='checkbox']").is(":checked")){
		      var result = confirm("정말 삭제하시겠습니까?");
		      if(result){
		          alert("삭제완료");
		          $('#ok').attr("value", "A"); 
		          location.reload();
		      }
		    }else{
		      alert("삭제할 데이터를 선택해주세요.");
		      $('#ok').attr("value", "B"); 
		      location.reload();
		    }
		  }); 
	});

	</script>
	<!-- jquery end -->
</body>
</html>
