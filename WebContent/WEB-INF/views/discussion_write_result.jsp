<!-- 수정본 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<%@include file="inc/head.jsp" %>
		<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/css/grid.css" />
		<link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/css/discussion_write_result.css" />

	<!-- handlebars -->
	<script src="${pageContext.request.contextPath}/assets/plugins/handlebars/handlebars-v4.0.5.js"></script>

	<!-- ajax -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.js"></script>

	<!-- ajaxForm -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/plugins/ajax-form/jquery.form.min.js"></script>
	</head>

<body>
 <%@include file="inc/top_nav.jsp" %>

			<div id="content">
				<h2>커뮤니티 |&nbsp;</h2><h3>토론광장</h3>
				<!-- 회원리뷰 테이블 시작 -->
				
				<div class="dis_board">
				<hr>
					<table class="table table-bordered">
						<colgroup>
							<col width="81" />
							<col width="410" />
							<col width="81" />
							<col width="178" />
						</colgroup>
							<tbody>
								<tr>
								<th class="active">제목</th>
									<td colspan="4">
										<p class="dboard_sub" name="subject">${readDocument.subject }</p>
									
									</td>
									
								</tr>
								
								<tr>
									<th class="active">작성자</th>
									<td>${readDocument.memberId }</td>
									<th class="active">작성일</th>
									<td>${readDocument.regDate }</td>
								</tr>
								
								<tr>
									<th class="active">토론기간</th>
									<td>${Document.endDate }</td>
									<th class="active">조회수</th>
									<td>${readDocument.hit }</td>
									
								</tr>
															
							</tbody>
						</table>
						<!-- //회원 리뷰 테이블 끝 -->
					</div>
					
					<div class="dis_cont">
						${readDocument.content }
					</div>
					

					<!--토론 참여 -->
					<div class="dis_parti">
					<span class="thumb1">
						<img src="${pageContext.request.contextPath }/img/dis_btn1.png" onclick="test()">
						<div id="test">
						</div>
					</span>

					<span class="thumb2">
						<img src="${pageContext.request.contextPath }/img/dis_btn2.png" onclick="test2()">
						<div id="test2">
						</div>
					</span>
					</div>
					<hr>

					<!-- 목록 버튼 -->
					<div class="dis_btn">
					<div class="list">
						<a href="${pageContext.request.contextPath }/discussion.do?category=${category}">
						<button type="button" class="btn btn-primary btn-md">목록</button></a>
					<!-- 수정 버튼 -->
					<div class="modify">	
						<a href="${pageContext.request.contextPath }/discussion_edit.do?category=${category}&document_id=${readDocument.id }">
						<button type="button" class="btn btn-primary btn-md">수정</button></a>
					</div>
					</div>
					</div>
					<hr>
					
					<!-- //댓글이 표시되는 영역 끝 -->
					
					<!-- 페이지 이동
						<div class="page_num">
						<center>
							<ul class="pagination">
								<li class="disabled"><a href="#">&laquo;</a></li>
								<li class="active"><span>1<span class="sr-only">(current)</span></span></li>
								<li><a href="#">&raquo;</a></li>
							</ul>
						</center>
						</div>
						-->
		
					<!-- 댓글 영역 -->
					<form id="comment_form" method="post" action="${pageContext.request.contextPath }/bbs/comment_insert.do">
					<!-- 글 번호 상태 유지 -->
					<input type='hidden' name='document_id' value='${readDocument.id }' />
					<div id="comment_box">
						<div class="comment_box1">
						<div class="comment_id">
							${document.userId }
						</div>
						<textarea class="comment_txt" name='content'>
						</textarea>
					
						<div class="res_btn">
							<button type="submit" class="btn btn-default btn-md">등록</button>
						</div>
						</div>
					</div>
					</form>
					<!-- //댓글 영역 끝 -->
					
					<!-- 댓글이 표시되는 영역 -->
					<ul class="comment" id="comment_list">
						
					</ul>
					
					<!-- 이전글, 다음글 -->
					<table class="move_page">
					<colgroup>
						<col width="90">
						<col width="1080">
					</colgroup>
						<tbody>
							<tr>
								<th class="active">이전글</th>
								<td>
								<c:choose>
						<c:when test="${prevDocument != null }">
							<c:url var="prevUrl" value="/discussion_write_result.do">
								<c:param name="category" value="${category }" />
								<c:param name="document_id" value="${prevDocument.id }" />
							</c:url>
							<a href="${prevUrl }">${prevDocument.subject }</a>
						</c:when>
						<c:otherwise>
							이전글이 없습니다.
						</c:otherwise>
					</c:choose>
								</td>
							</tr>

							<tr>
								<th class="active">다음글</th>
								<td>
								<c:choose>
						<c:when test="${nextDocument != null }">
							<c:url var="nextUrl" value="/discussion_write_result.do">
								<c:param name="category" value="${category }" />
								<c:param name="document_id" value="${nextDocument.id }" />
							</c:url>
							<a href="${nextUrl }">${nextDocument.subject }</a>
						</c:when>
						<c:otherwise>
							다음글이 없습니다.
						</c:otherwise>
					</c:choose>
								</td>
							</tr>
						</tbody>
					</table>
					<!--//이전글, 다음글 끝  -->
			</div>
<%@include file="inc/footer.jsp" %>

<!-- 덧글 항목에 대한 템플릿 참조 -->
<script id="tmpl_comment_item" type="text/x-handlebars-template">
	<li class="media" style='border-top: 1px dotted #ccc; padding-top: 15px;' id="{{id}}">
		<div class="media-body" style='display: block;'>
			<h4 class="media-heading clearfix">
				<!--작성자, 작성일시 -->
				<div class='pull-left'>
					{{userId}}
					<small>
						 {{regDate}}
					</small>
				</div>
				<!--수정 버튼 -->
				<div class='pull-right'>
					<a href='${pageContext.request.contextPath}/bbs/comment_edit.do?comment_id={{id}}' data-toggle="modal" data-target="#comment_edit_modal"
					class='btn btn-warning btn-xs'>
						<i class='glyphicon glyphicon-edit'></i>
					</a>
				</div>
			</h4>
			<!--내용 -->
			<p>{{{content}}}</p>
		</div>
	</li>
</script>

<!-- 댓글 수정 시 사용될 Modal -->
<div class="modal fade" id="comment_edit_modal">
	<div class="modal-dialog">
		<div class="modal-content">
		
		</div>
	</div>
</div>

<script type="text/javascript">
	$(function() {
		/** 페이지가 열리면서 동작하도록 이벤트 정의 없이 Ajax 요청 */
		$.get("${pageContext.request.contextPath}/bbs/comment_list.do", {
			document_id: "${readDocument.id}"
		}, function(json) {
			if (json.rt != "OK") {
				alert(json.rt);
				return false;
			}
			
			//템플릿 HTML을 로드한다.
			var template = Handlebars.compile($("#tmpl_comment_item").html());
			
			//JSON에 포함된 '&lt;br/&gt;'을 검색해서 <br/>로 변경함
			//-> 정규표현식 /~~~~/g는 문자열 전체를 의미
			for (var i = 0; i < json.item.length; i++) {
				json.item[i].content = json.item[i].content.replace(/&lt;br\/&gt;/g, "<br/>");
				
				//댓글 아이템 항목 하나를 템플릿과 결합한다.
				var html = template(json.item[i]);
				//결합된 결과를 댓글 목록에 추가한다.
				$("#comment_list").append(html);
			}
		});
		
		/** 덧글 작성 폼의 submit 이벤트 Ajax 구현 */
		//<form>요소의 method, action 속성과 <input>태그를
		//Ajax 요청으로 자동 구성한다.
		$("#comment_form").ajaxForm(function(json) {
			//json은 API에서 표시하는 전체 데이터
			if (json.rt != "OK") {
				alert(json.rt);
				return false;
			}
			
			//줄바꿈에 대한 처리
			//-> 정규표현식 /~~~~/g는 문자열 전체를 의미
			//-> JSON에 포함된 '&lt;br/&gt;'을 검색에서 <br/>로 변경함
			json.item.content = json.item.content.replace(/&lt;br\/&gt;/g, "<br/>");
			
			//템플릿 HTML을 로드한다.
			var template = Handlebars.compile($("#tmpl_comment_item").html());
			//JSON에 포함된 작성 결과 데이터를 템플릿에 결합한다.
			var html = template(json.item);
			//결합된 결과를 댓글 목록에 추가한다.
			$("#comment_list").append(html);
			//폼 태그의 입력값을 초기화하기 위해서 reset 이벤트를 강제로 호출
			$("#comment_form").trigger('reset');
		});
		
		/** 동적으로 로드된 폼 안에서의 submit 이벤트 */
		//Remote Modal안에 포함된 <form>요소의 동적 이벤트 구현 -> on() 함수 사용
		$(document).on('submit', "#comment_edit", function(e) {
			e.preventDefault();
			
			//AjaxForm 플러그인의 강제 호출
			$(this).ajaxSubmit(function(json) {
				if (json.rt != "OK") {
					alert(json.rt);
					return false;
				}
				
				//줄바꿈에 대한 처리
				//-> 정규 표현식 /~~~~/g는 문자열 전체를 의미
				//-> JSON에 포함된 '&lt;br/&gt;'을 검색에서 <br/>로 변경함
				json.item.content = json.item.content.replace(/&lt;br\/&gt;/g, "<br/>");
				
				//템플릿 HTML을 로드한다.
				var template = Handlebars.compile($("#tmpl_comment_item").html());
				//JSON에 포함된 작성 결과 데이터를 템플릿에 결합한다.
				var html = template(json.item);
				//결합된 결과를 기존의 댓글 항목과 교체한다.
				$("#" + json.item.id).replaceWith(html);
				
				//댓글 수정 모달 강제로 닫기
				$("#comment_edit_modal").modal('hide');
			});
		});
	});
</script>
<script type="text/javascript">
	function test() {
		var div = document.getElementById("test");
		var n = Number(div.innerHTML);
		div.innerHTML = n + 1;
	}
</script>

<script type="text/javascript">
	function test2() {
		var div2 = document.getElementById("test2");
		var n = Number(div2.innerHTML);
		div2.innerHTML = n + 1;
	}
</script>
	</body>
</html>
