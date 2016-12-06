<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
   <head>
     <%@include file="inc/head.jsp" %>
         <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/info.css">
     
   </head>
   <body>
 <%@include file="inc/top_nav.jsp" %>

<!-- 본문내용 작성 start -->
         <div id="content">
            <!--  내용 탭 start -->
        <ul class="nav nav-tabs" id="mytab">
         <li class="active"><a href="${pageContext.request.contextPath }/info.do">공지사항</a></li>
         <li><a href="${pageContext.request.contextPath }/question_top10.do">자주하는 질문</a></li>
         <li><a href="${pageContext.request.contextPath }/bbs/qna_write.do?category=qna">문의하기</a></li>
         <li><a href="${pageContext.request.contextPath }/pay_check.do">입금확인</a></li>
         </ul>
        <!-- 내용 탭 end -->

	<form class="form-horizontal" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath }/bbs/info_write_ok.do"></form>
   <div class="board">
   <table class="table table-striped table-hover">
      <!-- 게시판 컬럼 주기 (분류) start -->
   <thead>
      <colgroup>
         <col style="width:5%;"></col>
         <col style="width:10%;"></col>
         <col style="width:55%;"></col>
         <col style="width:10%;"></col>
         <col style="width:10%;"></col>
      </colgroup>
   <tr>
   <th class="text-center">No.</th>
   <th class="text-center">분류</th>
   <th class="text-center">제목</th>
   <th class="text-center">조회수</th>
   <th class="text-center">등록일</th>
   </tr>
   </thead>
   <!-- 게시판 컬럼 주기 (분류) end -->

   <!-- 게시물 내용 start -->
   <tbody>
   <tr>
   		<td colspan="5" class="text-center" style="line-height:100px;">
   		조회된 글이 없습니다. </td>
   </tr>
   </tbody>
   <!-- 게시물 내용 start -->
   </table>

   <!--게시판 이동 버튼 start -->
   <div class="text-center">
   <ul class="pagination pagination-md">
   <li class="disabled"><a href="#">&laquo;</a></li>
   <li class="active"><span class="purple">1<span class="sr-only">(current)</span></span></li>
   <li><a href="#">2</a></li>
   <li><a href="#">&raquo;</a></li>
   </ul>
   </div>
   </div>
   <!--게시판 이동 버튼 end -->
   </form>
   </div>
<!--본문내용 작성 end -->

<%@include file="inc/footer.jsp" %>

   </body>
</html>
