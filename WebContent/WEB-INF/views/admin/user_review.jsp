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
		table > tbody > tr > td{
			max-width: 150px !important;
			white-space: nowrap !important;
			overflow: hidden !important;
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
		<col style="width:100px;">
		<col style="width:100px;">
		<col style="width:350px;">
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
	<th>작성일</th>
	<th>조회수</th>
	</tr>
	</thead>
	<tbody>
	<c:choose>
		<c:when test="${fn:length(reviewList) > 0}">
		<c:forEach var="review" items="${reviewList }">
		<tr>
		<td><input type="checkbox" class="item_checked" /></td>
		<td>${review.id}</td>		
		<td>${review.userId}</td>
		<td>${review.userName}</td>
		<td>${review.gender}</td>
		<td>${review.postcode}</td>
		<td>${review.tel}</td>
		<td>${review.email}</td>
		<td>${review.regDate}</td>
		<td>${review.editDate}</td>
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
	<tr>
	<td><input type="checkbox" class="item_checked"/></td>
	<td>4</td>
	<td>qkrtkdqkrtkd</td>
	<td>SBS 파워FM 20주년 쏭 프로젝트 3탄! 컬YP '십만원'</td>
	<td>박진영은 지난 4월 라디오 "두시 탈출 컬투쇼 (이하 컬투쇼)"에 출연해 컬투에게 곡을 주겠다는 농담 아닌 농담을 던졌다. 그리고 6개월 뒤, 세 사람은 실제로 JYP 녹음 스튜디오에서 만나 '십만원'을 녹음했다. </td>
	<td>2016.10.19</td>
	<td>0</td>
	</tr>
	<tr>
	<td><input type="checkbox" class="item_checked"/></td>
	<td>3</td>
	<td>qkrtkdqkrtkd</td>
	<td>TWICE, 또 한 번 정상에 서다!</td>
	<td>발라드가 감성에 맞을 것 같은 요즘, 지난 주 I.O.I에 이어 댄스 트랙이 2주 연속 정상을 이어갔는데요. 작년 이맘때 정상을 차지했던 아이유의 '스물셋'과 지코 (ZICO)의 'Boys And Girls (Feat. Babylon)'에 이어 이번 사례까지 화제성이 있는 곡들은 장르와 계절에 관계 없이 사랑 받는다는 사실을 다시 한 번 확인 할 수 있었네요.</td>
	<td>2016.10.19</td>
	<td>0</td>
	</tr>
	<tr>
	<td><input type="checkbox" class="item_checked"/></td>
	<td>2</td>
	<td>qkrtkdqkrtkd</td>
	<td>빅스 2016 CONCEPTION의 완결판, 3번째 미니앨범 [Kratos] 발매!</td>
	<td>지난 8월, 여섯 번 째 앨범 [Hades]에서 다크하고 섹시한 매력으로 대중들의 시선을 사로잡았던 빅스가 약 한 달 반 만에 빅스 2016 CONCEPTION 마지막 이야기 [Kratos]로 돌아왔다.</td>
	<td>2016.10.19</td>
	<td>0</td>
	</tr>
	<tr>
	<td><input type="checkbox" class="item_checked"/></td>
	<td>1</td>
	<td>qkrtkdqkrtkd</td>
	<td>월간 유희열의 스케치북 첫 주인공, 박효신!</td>
	<td>대망의 첫 주자는 바로 박효신! 7년 만에 공중파 출연, 80분 단독공연이라는 타이틀로 방송 전부터 이미 많은 사람들의 기대를 모았는데요. 그 반가운 현장을 지금 공개합니다!</td>
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
	</div>
	<!-- 버튼 end -->
	<!-- 컨텐츠 영역 end -->
	</div>
	</div>

		<!-- jquery start -->
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
			})
			/**ì²´í¬ë°ì¤ íì¤í¸ ì¤
			$("input[type='checkbox']").click(function(){
			var check = $(this).is(":checked");
			if(check==true){
				$(this).parents("tr").css("background","gray");
			}else{
				$(this).parents("tr").css("background","white");
			}
			var no = $(this).parents("tr").find("td:nth-child(2)").text();
			alert(no);
			});
			**/
		});
		</script>
		<!-- jquery end -->
	</body>
</html>
