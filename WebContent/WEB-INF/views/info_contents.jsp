<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html lang="ko">
   <head>
     <%@include file="inc/head.jsp" %>
         <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/info_contents.css">
     
   </head>
   <body>
 <%@include file="inc/top_nav.jsp" %>

<!-- 본문내용 작성 start -->
         <div id="content">
            <!--  내용 탭 start -->
        <ul class="nav nav-tabs">
         <li class="active"><a href="${pageContext.request.contextPath }/info.do">공지사항</a></li>
         <li><a href="${pageContext.request.contextPath }/question_top10.do">자주하는 질문</a></li>
         <li><a href="${pageContext.request.contextPath }/question_send.do">문의하기</a></li>
         <li><a href="${pageContext.request.contextPath }/pay_check.do">입금확인</a></li>
         </ul>
        <!-- 내용 탭 end -->
            <div class="board">
   <table class="table table-striped table-hover">
      <!-- 게시판 컬럼 주기 (분류) start -->
   <thead>
   <tr>
      <th class="text-center">1</th>
      <th class="text-center">공지</th>
      <th class="text-right">2016.10.06</th>
   </tr>
   </thead>
</table>
   <!-- 게시판 컬럼 주기 (분류) end -->
   <!-- 게시글 제목 start -->
   <div class="title text-center" style="border-bottom:2px dotted gray; padding-top:10px; height:80px;">
      <h4>개인정보 취급 방침</h4>
   </div>
   <!-- 게시글 제목 end -->

   <!-- 게시글 본문 내용 start -->
   <div class="contents">
   <p><p>안녕하세요? 누림뮤직입니다.<br/><br/>누림뮤직 개인정보취급방침이 개정되어 2013년 11월 07일부터 시행될 예정입니다.<br/>이에 변경 내용을 아래와 같이 안내 드리오니 이용에 참고해 주시기 바랍니다.<br/><br/><br/>1. 개정 주요 내용<br/>회원가입 시 수집하는 항목 정정, 개인정보 취급 수탁업체 상호 변경사항 적용 및 수탁업체에 관한 사항 정정<br/><br/>2. 개정 시행일자<br/>   2013년 11월 07일<br/><br/>3. 세부 개정 내용<br/>가. 2조. 수집하는 개인정보항목에 관한 사항 정정 : ‘회원 가입시 수집하는 정보’ 내 항목 [성별] 추가   <br/><br/>[개정후]</p>





                                    <img src="http://cdnimg.melon.co.kr/resource/image/cds/announcement/ANCM20140612214555.jpg" alt=""/>



                                    <p>나. 5조 1항. 개인정보의 취급위탁에 관한 사항 정정<br/>- 수탁업체 상호 변경 : NICE신용정보 주식회사 -> 나이스평가정보 주식회사<br/>- 수탁업체 및 위탁업무 정정 : 에스케이플래닛 주식회사 누림뮤직 서비스 이용대금(IMPAY) 결제 대행 <br/><br/>[개정후]</p>





                                    <img src="http://cdnimg.melon.co.kr/resource/image/cds/announcement/ANCM20140612214645.jpg" alt=""/>



                                    <p>▶ 본 개인정보취급방침의 개정 시행에 대하여 동의하지 않는 고객께서는 누림뮤직 서비스의 이용이 <br/>제한될 수 있으며, 관련 법령에 의거 누림뮤직 서비스 이용계약을 해지하실 수 있습니다.<br/><br/>더욱 편리하고 안정적인 서비스로 고객님의 성원에 보답하겠습니다.<br/><br/>감사합니다.</p>


   </p>
   </div>
   <!-- 게시글 본문 내용 end -->

   <!-- 목록 버튼 및 이전, 다음페이지 이동 start -->
   <input type="button" id="list" class="btn btn-default btn-md" onclick="location.href='${pageContext.request.contextPath }/info.do'" value="목록" />

   <table class="move_list">
      <tbody>
         <tr>
         <td>이전글</td>
         <td>공지</td>
         <td><a href="#">회원가입 안내에 대한 공지</a></td>
         <td class="text-center">2016.10.06</td>
      </tr>
      <tr>
      <td>다음글</td>
      <td>공지</td>
      <td><a href="#">회원가입 안내에 대한 공지</a></td>
      <td class="text-center">2016.10.06</td>
   </tr>
      </tbody>
   </table>
</div>
   <!-- 목록 버튼 및 이전, 다음페이지 이동 end -->
   </div>
<!--본문내용 작성 end -->

<%@include file="inc/footer.jsp" %>

   </body>
</html>