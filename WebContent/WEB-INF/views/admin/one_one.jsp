<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<%@ include file="inc/head.jsp"%>
		<%@ include file="inc/layout.jsp"%>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin_assets/css/one_one.css" />
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
	<option value="아이디">아이디</option>
	<option value="제목">제목</option>
	<option value="내용">내용</option>
	<option value="문의유형">문의유형</option>
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
		<col style="width:50px;">
		<col style="width:50px;">
		<col style="width:70px;">
		<col style="width:100px;">
		<col style="width:300px;">
		<col style="width:80px;">
		<col style="width:80px;">
		<col style="width:80px;">
	</colgroup>
	<thead>
	<tr>
	<th>문의번호</th>
	<th>아이디</th>
	<th>문의 유형</th>
	<th>제목</th>
	<th>문의 내용</th>
	<th>답변 내용</th>
	<th>문의 날짜</th>
	<th>답변 상태</th>
	</tr>
	</thead>
	<tbody>
	<tr>
	<td>4</td>
	<td>qkrtkd12</td>
	<td>쇼핑/결제</td>
	<td><a href="#" class="content">결제문의</a></td>
	<td>결제 Plug-in 설치가 자동으로 안돼요. 어떻게 해야 하나요 ?</td>
	<td>답변합니다.</td>
	<td>2016.10.19</td>
	<td><button class="answer_end">답변완료</button></td>
	</tr>
	<tr>
	<td>3</td>
	<td>qkrtkd12</td>
	<td>쇼핑/결제</td>
	<td><a href="#" class="content">상품문의</a></td>
	<td>지역코드란 무엇인가요?</td>
	<td>답변합니다.</td>
	<td>2016.10.19</td>
	<td><button class="answer_end">답변완료</button></td>
	</tr>
	<tr>
	<td>2</td>
	<td>qkrtkd12</td>
	<td>쇼핑/결제</td>
	<td><a href="#" class="content">배송문의</a></td>
	<td>배송비는 얼마인가요?</td>
	<td></td>
	<td>2016.10.19</td>
	<td><button class="answer">답변</button></td>
	</tr>
	<tr>
	<td>1</td>
	<td>qkrtkd12</td>
	<td>쇼핑/결제</td>
	<td><a href="#" class="content">반품문의</a></td>
	<td>주문을 취소하고 싶어요</td>
	<td></td>
	<td>2016.10.19</td>
	<td><button class="answer">답변</button></td>
	</tr>
	</tbody>
	</table>
	</div>
	<!-- 테이블 end -->
	</div>
	<!-- 컨텐츠 영역 end -->
	</div>

	<!--답변박스 start -->
	<div id="answer_box">
	<div class="control_box">
		<form>
			<div class="input_box">
			<label>제목</label>
			<input type="text" name="answer_title" id="answer_title" />
			</div>
			<div class="input_box">
			<label>내용</label>
			<textarea name="answer_ans" id="answer_ans"></textarea>
			</div>
		<button id="commit">답변등록</button>
		<button class="cancel">취소</button>
		</form>
	</div>
	<div class="no_touch"></div>
	</div>

	<!-- 답변박스 end -->

	<!-- 게시글 박스 start -->

	<div id="content_box">
	<div class="control_box">
		<form>
			<div class="input_box">
			<label>제목</label>
			<input type="text" name="answer_title" id="answer_title" value="결제문의" disabled/>
			</div>
			<div class="input_box">
			<label>내용</label>
			<textarea name="answer_ans" id="answer_ans" disabled>결제 Plug-in 설치가 자동으로 안돼요. 어떻게 해야 하나요 ?</textarea>
			</div>
		<button class="cancel">닫기</button>
		</form>
	</div>
	<div class="no_touch"></div>
	</div>

	<!-- 게시글 박스 end -->
	</div>

		<!-- jquery start -->
		<script type="text/javascript">
		$(function(){
			$(".answer").click(function(){
				$("#answer_box").css("visibility","visible")

				$("#commit").click(function(){

				});
				$(".cancel").click(function(){
					$("#answer_box").css("visibility","hidden")
					return false;
				});
				return;false;
			});
			$(".content").click(function(){
				$("#content_box").css("visibility","visible")

				$("#commit").click(function(){

				});
				$(".cancel").click(function(){
					$("#content_box").css("visibility","hidden")
					return false;
				});
				return;false;
			});
			$(".answer_end").parents("tr").css("background","rgba(200,200,200,0.3)");

		});
		</script>
		<!-- jquery end -->
	</body>
</html>
