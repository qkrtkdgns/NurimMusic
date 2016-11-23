<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	<select name="dropdown" id="dropdown">
	<option value="검색조건">검색조건</option>
	<option value="아이디">아이디</option>
	<option value="이름">이름</option>
	</select>
	<input type="text" name="search_item" id="search_item" placeholder="검색어를 입력하세요." />
	<button type="submit" id="submit_bt">검색</button>
	</form>
	</div>
	<!--검색 end -->

	<!-- 테이블 start -->
	<div id="items">
	<table>
	<colgroup>
		<col style="width:30px;">
		<col style="width:30px;">
		<col style="width:50px;">
		<col style="width:50px;">
		<col style="width:50px;">
		<col style="width:260px;">
		<col style="width:100px;">
		<col style="width:100px;">
		<col style="width:70px;">
		<col style="width:70px;">
	</colgroup>
	<thead>
	<tr>
	<th>번호</th>
	<th><input type="checkbox" id="all_check" /></th>
	<th>아이디</th>
	<th>이름</th>
	<th>성별</th>
	<th>주소</th>
	<th>전화번호</th>
	<th>이메일</th>
	<th>가입일</th>
	<th>최근 로그인</th>
	</tr>
	</thead>
	<tbody>
	<c:choose>
		<c:when test="${fn:length(memberList) > 0}">
		<c:forEach var="member" items="${memberList }">
		<tr>
		<td>${member.id}</td>
		<td><input type="checkbox" class="item_checked" /></td>
		<td>${member.user_id}</td>
		<td>${member.user_name}</td>
		<td>${member.gender}</td>
		<td>${member.postcode}</td>
		<td>${member.tel}</td>
		<td>${member.email}</td>
		<td>${member.reg_date}</td>
		<td>${member.edit_date}</td>
		</tr>
		</c:forEach>
		</c:when>
		<c:otherwise>
		<tr>
		<td colspan="10" class="text-center" style="line-height:100px;">
		조회된 글이 없습니다.</td>
		</tr>		
		</c:otherwise>
		</c:choose>
	</tbody>
	</table>
	<%@ include file="inc/member_page.jsp" %>
	</div>
	<!-- 테이블 end -->

	<!-- 버튼 start -->
	<div id="bt_box">
	<button id="delete">삭제</button>
	<button id="insert">등록</button>
	<button id="update">수정</button>
	</div>
	<!-- 버튼 end -->
	
	</div>
	<!-- 컨텐츠 영역 end -->
	</div>
	<!-- 업데이트 버튼 클릭시 start -->
	<div id="update_box">
		<div class="control_box">
		<form method="post" action="/admin/member_edit.do">
		<div class="control_box2">
			<div class="input_box">
			<label>아이디</label>
			<input type="text" name="update_user_id" id="update_user_id" />
			</div>
			<div class="input_box">
			<label>비밀번호</label>
			<input type="text" name="update_user_pw" id="update_user_pw" />
			</div>
			<div class="input_box">
			<label>이름</label>
			<input type="text" name="update_user_name" id="update_user_name" />
			</div>
			<div class="input_box">
			<label>성별</label>
			<select name="update_user_gender" id="update_user_gender">
				<option value="">---성별을 선택해 주세요---</option>
				<option value="M">M</option>
				<option value="F">F</option>
			</select>
			</div>
			<div class="input_box">
			<label>주소</label>
			<input type="text" name="update_user_home" id="update_user_home" />
			</div>
			<div class="input_box">
			<label>전화번호</label>
			<input type="tel" name="update_user_tel" id="update_user_tel" />
			</div>
			<div class="input_box">
			<label>이메일</label>
			<input type="email" name="update_user_email" id="update_user_email" />
			</div>
			<button class="cancel">취소</button>
			<button type="submit" id="update_commit">등록</button>
			</div>
			</form>
		</div>
		<div class="no_touch"></div>
	</div>
	<!-- 업데이트 버튼 클릭시 end -->
	<!-- 인설트 버튼 클릭시 start -->
	<div id="insert_box">
		<div class="control_box">
			<form method="post" action="../admin/member_add.do">
		<div class="control_box2">
			<div class="input_box">
			<label>아이디</label>
			<input type="text" name="insert_user_id" id="insert_user_id" />
			</div>
			<div class="input_box">
			<label>비밀번호</label>
			<input type="text" name="insert_user_pw" id="insert_user_pw" />
			</div>
			<div class="input_box">
			<label>이름</label>
			<input type="text" name="insert_user_name" id="insert_user_name" />
			</div>
			<div class="input_box">
			<label>성별</label>
			<select name="insert_user_gender" id="insert_user_gender">
				<option value="">---성별을 선택해 주세요---</option>
				<option value="M">남자</option>
				<option value="F">여자</option>
			</select>
			</div>
			<div class="input_box">
			<label>주소</label>
			<input type="text" name="insert_user_home" id="insert_user_home" />
			</div>
			<div class="input_box">
			<label>전화번호</label>
			<input type="tel" name="insert_user_tel" id="insert_user_tel" />
			</div>
			<div class="input_box">
			<label>이메일</label>
			<input type="email" name="insert_user_email" id="insert_user_email" />
			</div>
			<button class="cancel">취소</button>
			<button type="submit" id="insert_commit">등록</button>
			</div>
			</form>
			
		</div>
		<div class="no_touch"></div>
		</div>
	<!-- 인설트 버튼 클릭시 end -->
	</div>

		<!-- jquery start -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/admin_assets/js/member.js"></script>
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
