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
         <li><a href="${pageContext.request.contextPath }/info.do">공지사항</a></li>
         <li><a href="${pageContext.request.contextPath }/question_top10.do">자주하는 질문</a></li>
         <li><a href="${pageContext.request.contextPath }/question_send.do">문의하기</a></li>
         <li class="active"><a href="${pageContext.request.contextPath }/pay_check.do">입금확인</a></li>
         </ul>
        <!-- 내용 탭 end -->

            <div class="board">
              <form style="margin-bottom:10px;">
              <input type="text" name="user_id" id="user_id" value="qkrtkdqkrtkd" disabled style="width:10%; padding-left:10px; border:none; background:none;"/>
              <input type="text" name="pay_check" id="pay_check" style="width:80%;" />
              <button style="float:right; width:6%;">확인</button>
            </form>
   <table class="table table-striped table-hover">
      <!-- 게시판 컬럼 주기 (분류) start -->
      <colgroup>
         <col style="width:5%;"></col>
         <col style="width:50%;"></col>
         <col style="width:5%;"></col>
         <col style="width:5%;"></col>
         </colgroup>
   <thead>
   </thead>
   <!-- 게시판 컬럼 주기 (분류) end -->

   <!-- 게시물 내용 start -->
   <tbody>
   <tr>
     <td>qkrtkdqkrtkd</td>
     <td>입금확인 해주세요.</td>
     <td>000.000.0</td>
     <td>확인완료</td>
   </tr>
   <tr>
     <td>qkrtkdqkrtkd</td>
     <td>입금확인 해주세요.</td>
     <td>000.000.0</td>
     <td></td>
   </tr>
   <tr>
     <td>qkrtkdqkrtkd</td>
     <td>입금확인 해주세요.</td>
     <td>000.000.0</td>
     <td>확인완료</td>
   </tr>
   <tr>
     <td>qkrtkdqkrtkd</td>
     <td>입금확인 해주세요.</td>
     <td>000.000.0</td>
     <td></td>
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
   </div>
<!--본문내용 작성 end -->

<%@include file="inc/footer.jsp" %>

   </body>
</html>
