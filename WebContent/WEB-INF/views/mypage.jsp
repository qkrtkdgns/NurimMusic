<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html lang="ko">
   <head>
      <%@include file="inc/head.jsp" %>
      <link rel="stylesheet"  type="text/css" href="css/mypage.css" />
	  <link rel="stylesheet"  type="text/css" href="css/mypage_mypage.css" />
   </head>
   <body>
<%@include file="inc/top_nav.jsp" %>
<div class="ddd"></div>
<!-- 본문내용 작성 start -->
         <div id="content">
            <h2>마이페이지</h2>
<hr/>

<div id="Mypage_title"></div>

<div id="Mypage_content">
<span>QUICK MENU</span>
<div>
   <div class="img_size" onclick="location.href='${pageContext.request.contextPath }/delivery.do'">
      <img src="${pageContext.request.contextPath }/img/shopping-cart.png" />
      <span>주문/배송 조회</span>
   </div>
   <div class="text_size">
      <span>회원님이 주문하신 상품의 현재상황을 보여드립니다.</span>
   </div>
</div>

<div class="content_bottom">
   <div class="img_size" onclick="location.href='${pageContext.request.contextPath }/cancel.do'">
      <img src="${pageContext.request.contextPath }/img/cancel.png" />
      <span>주문취소/교환/반품 조회</span>
   </div>
   <div class="text_size">
      <span>회원님께서 주문을 취소하시거나 교환, 반품하신 내역을 보여드립니다.</span>
   </div>
</div>

<div>
   <div class="img_size" onclick="location.href='${pageContext.request.contextPath }/mypage_qna.do'">
      <img src="${pageContext.request.contextPath }/img/chat.png" />
      <span>1:1 문의내역</span>
   </div>
   <div class="text_size">
      <span>회원님께서 문의하신 내용들과 답변들을 보여줍니다.</span>
   </div>
</div>

<div class="content_bottom">
   <div class="img_size" onclick="location.href='user_information_access.do'">
      <img src="${pageContext.request.contextPath }/img/avatar.png" />
      <span>회원정보관리</span>
   </div>
   <div class="text_size">
      <span>회원님의 비밀번호 및 연락처, 주소를 수정합니다.</span>
   </div>
</div>

<div>
   <div class="img_size" onclick="location.href='drop_out.do'">
      <img src="${pageContext.request.contextPath }/img/logout.png" />
      <span>회원탈퇴</span>
   </div>
   <div class="text_size">
      <span>홈페이지에서 회원님의 정보를 삭제합니다.</span>
   </div>
</div>

</div>
</div>
<!--본문내용 작성 end -->

<%@include file="inc/footer.jsp" %>


   </body>
</html>