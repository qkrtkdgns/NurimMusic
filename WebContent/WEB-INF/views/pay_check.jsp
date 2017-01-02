<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html lang="ko">
   <head>
     <%@include file="inc/head.jsp" %>
         <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/info.css">
         <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/pay_check.css">
      
   </head>
   <body>
<%@include file="inc/top_nav.jsp" %>

<!-- 본문내용 작성 start -->
         <div id="content">
            <!--  내용 탭 start -->
        <ul class="nav nav-tabs">
         <li><a href="${pageContext.request.contextPath }/info_service_list.do?category=notice">공지사항</a></li>
         <li><a href="${pageContext.request.contextPath }/question_top10.do">자주하는 질문</a></li>
         <li><a href="${pageContext.request.contextPath }/bbs/qna_write.do?category=qna">문의하기</a></li>
         <li class="active"><a href="${pageContext.request.contextPath }/pay_check.do">입금확인</a></li>
         </ul>
        <!-- 내용 탭 end -->

            <div class="board">
             <form style="margin-bottom: 10px;" id="check" method="post" action="${pageContext.request.contextPath }/pay_check_insert.do">
				<input type="text" name="user_id" id="user_id" value="${loginInfo.userId }"
					disabled
					style="width: 10%; padding-left: 10px; border: none; background: none;" />
				<input type="text" name="pay_check" id="pay_check"
					style="width: 80%;" />
				<button style="float: right; width: 6%;">확인</button>
			</form>
			<table class="table table-striped table-hover">
				<!-- 게시판 컬럼 주기 (분류) start -->
				<colgroup>
					<col style="width: 5%;"></col>
					<col style="width: 50%;"></col>
					<col style="width: 5%;"></col>
					<col style="width: 5%;"></col>
				</colgroup>
				<thead>
				</thead>
				<!-- 게시판 컬럼 주기 (분류) end -->

				<!-- 게시물 내용 start -->
				<tbody id="result">
					
				</tbody>
				<!-- 게시물 내용 start -->
			</table>

   <!--게시판 이동 버튼 start -->
   
   </div>
   <!--게시판 이동 버튼 end -->
   </div>
<!--본문내용 작성 end -->
<Script id="tmpl_check_item" type="text/x-handlebars-template">
	<tr>
	<td>{{userId }}</td>
	<td>{{content }}</td>
	<td>{{ipAddress }}</td>
	<td>{{payCheck }}</td>
	</tr>
	</Script>
	<script>
		$(function() {
			$.get("${pageContext.request.contextPath}/pay_check_list.do", {
			}, function(json) {
				if (json.rt != "OK") {
					alert(json.rt);
					return false;
				}

				//템플릿 HTML을 로드한다.
				var template = Handlebars.compile($("#tmpl_check_item")
						.html());
				for (var i = 0; i < 10; i++) {
					if(json.item[i]==null){
						break;
					}
					//줄 바꿈에 대한 처리
					// --> 정규표현식 /~~~/g는 문자열 전체의 의미.
					// --> JSON에 포함된 '&lt;br//&gt;'을 검색에서 <br/>로 변경함.
					json.item[i].content = json.item[i].content.replace(/&lt;br\/&gt;/g, "<br/>");

					//JSON에 포함된 작성 결과 데이터를 템플릿에 결합한다.
					var html = template(json.item[i]);
					//결합된 결과를 더슥ㄹ 목록에 추가한다.
					$("#result").append(html);
				}
			});
			
			$("#check").ajaxForm(
					function(json) {
						if (json.rt != "OK") {
							alert(json.rt);
							return false;
						}
						var template = Handlebars.compile($("#tmpl_check_item").html());
						var html = template(json.item);
						$("#check").trigger('reset');
						$("#result").empty();
						$.get("${pageContext.request.contextPath}/pay_check_list.do", {
						}, function(json) {
							if (json.rt != "OK") {
								alert(json.rt);
								return false;
							}

							//템플릿 HTML을 로드한다.
							var template = Handlebars.compile($("#tmpl_check_item")
									.html());
							for (var i = 0; i < 10; i++) {

								if(json.item[i]==null){
									break;
								}
								//줄 바꿈에 대한 처리
								// --> 정규표현식 /~~~/g는 문자열 전체의 의미.
								// --> JSON에 포함된 '&lt;br//&gt;'을 검색에서 <br/>로 변경함.
								json.item[i].content = json.item[i].content.replace(/&lt;br\/&gt;/g, "<br/>");

								//JSON에 포함된 작성 결과 데이터를 템플릿에 결합한다.
								var html = template(json.item[i]);
								//결합된 결과를 더슥ㄹ 목록에 추가한다.
								$("#result").append(html);
							}
						});
					});
		});
	</script>
<%@include file="inc/footer.jsp" %>

   </body>
</html>
