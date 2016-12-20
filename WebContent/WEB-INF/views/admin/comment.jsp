<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<%@ include file="inc/head.jsp"%>
		<%@ include file="inc/layout.jsp"%>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin_assets/css/member.css" />
		<style type="text/css">
		img{
			width:50px;
			height:auto;
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
	<option value="제목">내용</option>
	<option value="내용">카테고리</option>
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
		<col style="width:50px;">
		<col style="width:100px;">
		<col style="width:50px;">
		<col style="width:50px;">
		<col style="width:350px;">
		<col style="width:100px;">
	</colgroup>
	<thead>
	<tr>
	<th><input type="checkbox" id="all_check" /></th>
	<th>글번호</th>
	<th>카테고리</th>
	<th>아이디</th>
	<th>이름</th>
	<th>성별</th>
	<th>내용</th>
	<th>작성일</th>
	</tr>
	</thead>
	<tbody>
	<tr>
	<td><input type="checkbox" class="item_checked"/></td>
	<td>4</td>
	<td>쇼핑</td>
	<td>qkrtkd12</td>
	<td>사용자</td>
	<td>남자</td>
	<td>너밖에 몰라 명곡인데 진짜 노래를 너밖에몰라....ㅋㅋㅋ</td>
	<td>2016.10.20</td>
	</tr>
	<tr>
	<td><input type="checkbox" class="item_checked"/></td>
	<td>3</td>
	<td>쇼핑</td>
	<td>qkrtkd12</td>
	<td>사용자</td>
	<td>남자</td>
	<td>예전 솔로앨범 꽃게춤이 진리</td>
	<td>2016.10.20</td>
	</tr>
	<tr>
	<td><input type="checkbox" class="item_checked"/></td>
	<td>2</td>
	<td>쇼핑</td>
	<td>qkrtkd12</td>
	<td>사용자</td>
	<td>남자</td>
	<td>노래 완전 잼나다...... 세상에..</td>
	<td>2016.10.20</td>
	</tr>
	<tr>
	<td><input type="checkbox" class="item_checked"/></td>
	<td>1</td>
	<td>쇼핑</td>
	<td>qkrtkd12</td>
	<td>사용자</td>
	<td>남자</td>
	<td>아니 뭐 컬투는 가수도 아닌데 노래가 넘나 좋은것</td>
	<td>2016.10.20</td>
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

		</script>
		<!-- jquery end -->
	</body>
</html>
<!-- 
 <li class="media" style='border-top: 1px dotted #ccc; padding-top: 15px' id="comment_{{id}}">
        <div class="media-body" style='display: block;'>
            <h4 class="media-heading clearfix">
                
                <div class='pull-left'>
                    {{writerName}}
                    <small>
                        <a href='mailto:{{email}}'>
                            <i class='glyphicon glyphicon-envelope'></i></a>
                            / {{regDate}}
                    </small>
                </div>
                
                <div class='pull-right'>
                    <a href="${pageContext.request.contextPath}/bbs/comment_edit.do?" data-toggle="modal" data-target="#comment_edit_modal" class='btn btn-warning btn-xs'>
                        <i class='glyphicon glyphicon-edit'></i></a>
                    <a href="${pageContext.request.contextPath}/bbs/comment_delete.do?comment_id={{id}}" data-toggle="modal" data-target="#comment_delete_modal" class='btn btn-danger btn-xs'>
                        <i class='glyphicon glyphicon-remove'></i> </a>
                </div>
            </h4>
         ]
            <p>{{{content}}}</p>
        </div>
    </li>
 -->
