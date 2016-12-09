<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="inc/head.jsp"%>
<%@ include file="inc/layout.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/admin_assets/css/edit.css" />
<style type="text/css">
</style>

</head>
<body>
	<div id="container">
		<div id="top">
			<a href="main.html">Admin</a>
		</div>
		<%@ include file="inc/category.jsp"%>

		<!-- 컨텐츠 영역 start -->
		<div id="content">
			<form method="post" action="../admin/edit_item_ok.do" enctype="multipart/form-data">
			<table>
					<tbody>
						<tr>
							<th colspan="2">상품명</th>
							<td><input type="text" name="title" id="title" value="${readproduct.proName}" /></td>
						</tr>
						<tr>
							<th colspan="2">일반 판매가</th>
							<td><input type="text" name="price" id="price" value="${readproduct.proPrice}" /></td>
						</tr>
						<tr>
							<th colspan="2">할인 가격</th>
							<td><input type="text" name="price2" id="price2" /></td>
						</tr>
						<tr>
							<th colspan="2">재고설정</th>
							<td><input type="radio" name="sal_no" id="sal_yes" checked  value="1"    />수량&nbsp;<input
								type="text" name="no" id="no"  class="text-right"  value="${readproduct.amount}"/>개&nbsp;&nbsp;&nbsp;&nbsp;<input
								type="radio" name="sal_no" id="sal_no"  value="2"   />품절</td>
						</tr>
						<tr>
							<th colspan="2">출고 예상일</th>
							<td><input type="text" id="date" name="date"
								class="form-control"  value="${readproduct.regDate}"/></td>
						</tr>
						<tr>
							<th colspan="2">진열 여부</th>
							<td><input type="radio" name="state" id="state_on" checked value="ON"/>진열&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="state" id="state_off" value="OFF"/>미진열</td>
						</tr>
						<tr>
							<th colspan="2">이미지 추가</th>
							<td><input type="file" name="file" id="file"  value="${readproduct.proImg}"/>
							기존 파일 ${readproduct.proImg}</td>
						</tr>
						<tr>
							<th colspan="2">카테고리</th>
							<td>
							<select name="category_a" id="category_a">
									<option value="">----------</option>
							<c:choose>
								<c:when test="${readproduct.proCategoryName =='k-pop' }">
									<option value="kor" selected>국내음반</option>
								</c:when>
								<c:when test="${readproduct.proCategoryName =='dance' }">
									<option value="kor" selected>국내음반</option>
								</c:when>
								<c:when test="${readproduct.proCategoryName =='ost' }">
									<option value="kor" selected>국내음반</option>
								</c:when>
								<c:otherwise>
								<option value="kor">국내음반</option>
								</c:otherwise>
								</c:choose>
							<c:choose>
								<c:when test="${readproduct.proCategoryName =='pop' }">
									<option value="for" selected>해외음반</option>
								</c:when>
								<c:when test="${readproduct.proCategoryName =='Rock' }">
									<option value="for" selected>해외음반</option>
								</c:when>
								<c:when test="${readproduct.proCategoryName =='jazz' }">
									<option value="for" selected>해외음반</option>
								</c:when>
								<c:otherwise>
									<option value="for">해외음반</option>
								</c:otherwise>
							</c:choose>
							
							<c:choose>
								<c:when test="${readproduct.proCategoryName =='이어폰' }">
									<option value="shapping" selected>상품</option>
								</c:when>
								<c:when test="${readproduct.proCategoryName =='헤드폰' }">
									<option value="shapping" selected>상품</option>
								</c:when>
								<c:otherwise>
									<option value="shapping" selected>상품</option>
								</c:otherwise>
							</c:choose>
									
									
							</select>
							<!-- 2차 카테고리 -->
							<select name="category"  id="category_b">
							<option value="${readproduct.proCategoryName}">${readproduct.proCategoryName}</option>
							</select>
						</td>
						</tr>
						<tr>
							<th colspan="2">공급업체</th>
							<td><input type="text" name="provider" id="provider"
								class="form-control"  value="${readproduct.provider}"/></td>
						</tr>
						<tr>
							<th colspan="2" style="vertical-align: top">상품 상세내용</th>
							<td>
								<div class="textarea">
									<textarea name="content" id="content" class="ckeditor" >
									${readproduct.content}
									</textarea>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
				<div id="bt">
				<input type="hidden" id="product_id" value="${readproduct.id }" />
					<button type="submit">수정 완료</button>
					<button type="button" onclick="history.back();">취소</button>
				</div>
			</form>
		</div>
		<!-- 컨텐츠 영역 end -->
	</div>


	<!-- jquery start -->
	<!-- Ajax로 읽어온 내용을 출력하는데 사용될 HTML 템플릿 -->
<script id="category_item_tmpl" type="text/x-handlebars-template">
{{#each item}}
	<option value="{{value}}">{{text}}</option>
{{/each}}
</script>
<script type="text/javascript">
	$(function() {
		
		/** 드롭다운의 선택 변경 이벤트 */
		$("#category_a").change(function() {
			// 결과가 표시될 #child에 내용 지우기
			$("#category_b").empty();
			// 사용자 선택값 가져오기
			var choice = $(this).find("option:selected").val();	
			// 선택값이 없다면 처리 중단
			if (!choice) {
				return false;
			}

			$.get('../category.do', { type: choice }, function(req) {
				// 미리 준비한 HTML틀을 읽어온다.
				var template = Handlebars.compile($("#category_item_tmpl").html());
				// Ajax를 통해서 읽어온 JSON을 템플릿에 병합한다.
				var html = template(req);
				// #child 읽어온 내용을 추가한다.
				$("#category_b").append(html);
			}); // end $.get
		}); // end change
		
		$("#date").pickadate();
	
		//품절 관리
		$("input[name='sal_no']:radio").change(function(){
		var sal_no = this.value;
		if(sal_no == "1"){
			 $('#no').attr('disabled',false); 
		}else{
			    $('#no').attr('disabled',true);
		}
	});

		
	});
</script>
	<!-- jquery end -->
</body>
</html>
