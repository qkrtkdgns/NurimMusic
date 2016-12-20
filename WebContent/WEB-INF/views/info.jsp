<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
	<%@ include file="inc/head.jsp"%>
		<%@ include file="inc/layout.jsp"%>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin_assets/css/member.css" />
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
	<div id="member">
	<!--검색 start -->
	<div id="search">
	<form>
	<select id="dropdown">
	<option value="검색조건">검색조건</option>
	<option value="제목">제목</option>
	<option value="내용">내용</option>	</select>
	<input type="text" name="search_item" id="search_item" placeholder="검색어를 입력하세요." />
	<button type="submit" id="submit_bt">검색</button>
	</form>
	</div>
	<!--검색 end -->

	<!-- 테이블 start -->
	<div id="items">
	<table>
	<colgroup>
		<col style="width:50px;">
		<col style="width:50px;">
		<col style="width:100px;">
		<col style="width:100px;">
		<col style="width:250px;">
		<col style="width:100px;">
		<col style="width:100px;">
		<col style="width:100px;">
	</colgroup>
	<thead>
	<tr>
	<th><input type="checkbox" id="all_check" /></th>
	<th>글번호</th>
	<th>아이디</th>
	<th>제목</th>
	<th>내용</th>
	<th>이미지</th>
	<th>작성일</th>
	<th>조회수</th>
	</tr>
	</thead>
	<tbody>
	<tr>
	<td><input type="checkbox" class="item_checked"/></td>
	<td>4</td>
	<td>qkrtkdqkrtkd</td>
	<td style="max-width:100px; white-space:nowrap; overflow:hidden;">앱 서비스 종료 안내</td>
	<td style="max-width:200px; white-space:nowrap; overflow:hidden;">안드로이드 타블렛 사용자는 구글플레이 스토어를 통해 최신 누림뮤직앱을 업데이트 하시면 종전과 동일한 기능 외에도 더욱 풍성한 콘텐츠와 다양한 아티스트들의 소식을 제공 받을 수 있습니다. </td>
	<td><input type="file" /></td>
	<td>2016.10.19</td>
	<td>0</td>
	</tr>
	<tr>
	<td><input type="checkbox" class="item_checked"/></td>
	<td>3</td>
	<td>qkrtkdqkrtkd</td>
	<td style="max-width:100px; white-space:nowrap; overflow:hidden;">고객센터 시스템 점검 안내</td>
	<td style="max-width:200px; white-space:nowrap; overflow:hidden;">더욱 안정된 서비스를 제공해 드리기 위해 누림뮤직 고객센터 시스템 점검이 진행됩니다. </td>
	<td><input type="file" /></td>
	<td>2016.10.19</td>
	<td>0</td>
	</tr>
	<tr>
	<td><input type="checkbox" class="item_checked"/></td>
	<td>2</td>
	<td>qkrtkdqkrtkd</td>
	<td style="max-width:100px; white-space:nowrap; overflow:hidden;">개인정보취급방침 개정</td>
	<td style="max-width:200px; white-space:nowrap; overflow:hidden;">개인정보취급방침이 아래와 같이 개정되어 안내 드리니, 이용에 참고하여 주시기 바랍니다.</td>
	<td><input type="file" /></td>
	<td>2016.10.19</td>
	<td>0</td>
	</tr>
	<tr>
	<td><input type="checkbox" class="item_checked" /></td>
	<td>1</td>
	<td>qkrtkdqkrtkd</td>
	<td style="max-width:100px; white-space:nowrap; overflow:hidden;">KT 휴대폰 결제 일시 제한 안내</td>
	<td style="max-width:200px; white-space:nowrap; overflow:hidden;">KT 휴대폰 결제 시스템 작업으로 인해 아래와 같이 KT 휴대폰 결제가 일시 제한 되오니 이점 양해 부탁 드립니다.</td>
	<td><input type="file" /></td>
	<td>2016.10.19</td>
	<td>0</td>
	</tr>
	</tbody>
	</table>
	</div>
	<!-- 테이블 end -->
	</div>
	<!-- 버튼 start -->
	<div id="bt_box">
	<button id="delete">삭제</button>
	<button id="insert">등록</button>
	<button id="update">수정</button>
	</div>
	<!-- 버튼 end -->
	<!-- 컨텐츠 영역 end -->
	</div>


	<!-- 업데이트 버튼 클릭시 start -->
	<div id="update_box">
		<div class="control_box">
		<form>
		<div class="control_box2">
			<div class="input_box">
			<label>아이디</label>
			<input type="text" name="update_id" id="update_id" />
			</div>
			<div class="input_box">
			<label>제목</label>
			<input type="text" name="update_title" id="update_title" />
			</div>
			<div class="input_box">
			<label>내용</label>
			<input type="text" name="update_content" id="update_content" />
			</div>
			<div class="input_box">
			<label>이미지</label>
			<input type="file" name="update_file" id="update_file" />
			</div>
			<button class="cancel">취소</button>
			<button id="update_commit">등록</button>
			</div>
			</form>
		</div>
		<div class="no_touch"></div>
	</div>
	<!-- 업데이트 버튼 클릭시 end -->
	<!-- 인설트 버튼 클릭시 start -->
	<div id="insert_box">
		<div class="control_box">
			<form>
		<div class="control_box2">
			<div class="input_box">
			<label>아이디</label>
			<input type="text" name="insert_id" id="insert_id" />
			</div>
			<div class="input_box">
			<label>제목</label>
			<input type="text" name="insert_title" id="insert_title" />
			</div>
			<div class="input_box">
			<label>내용</label>
			<input type="text" name="insert_content" id="insert_content" />
			</div>
			<div class="input_box">
			<label>이미지</label>
			<input type="file" name="insert_file" id="insert_file" />
			</div>
			<button class="cancel">취소</button>
			<button id="insert_commit">등록</button>
			</div>
			</form>
		</div>
		<div class="no_touch"></div>
		</div>
	<!-- 인설트 버튼 클릭시 end -->
	</div>



		<!-- jquery start -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/admin_assets/js/info.js"></script>
		<script type="text/javascript">
		$(function(){
			$("#update").click(function(){
				$("#update_box").css("visibility","visible")
			});
			$("#insert").click(function(){
				$("#insert_box").css("visibility","visible")
			});
			$(".cancel").click(function(){
				$("#update_box").css("visibility","hidden")
				$("#insert_box").css("visibility","hidden")
				return false;
			});
		});
		</script>
		<!-- jquery end -->
	</body>
</html>
