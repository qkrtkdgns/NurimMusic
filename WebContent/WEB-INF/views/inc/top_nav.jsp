<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 상단 바 start -->
<div class="top_container">
  <div id="top_bar">
    <div class="top_bar">
        <div class="top_search">
         <form>
              <!-- 홈버튼 -->
              <a href="${pageContext.request.contextPath }/index.do">
                <span class="glyphicon glyphicon-home" aria-hidden="true"></span>
              </a>
              
          </form>
       </div>
     <div class="top_nav">
   <ul class="list-inline">
   <c:choose>
   <c:when test="${loginInfo ==null}">
      <li><a href="${pageContext.request.contextPath }/LoginPage.do">로그인</a></li>
      <li><a href="${pageContext.request.contextPath }/join.do">회원가입</a></li>
      </c:when>
      <c:otherwise>
      <li><a>${loginInfo.userName}님 </a></li>
      <li><a href="${pageContext.request.contextPath}/login_page_out.do">
	로그아웃</a></li>
      </c:otherwise>
   </c:choose>
      <li><a href="${pageContext.request.contextPath }/mypage.do">마이페이지</a></li>
      <li><a href="${pageContext.request.contextPath }/basket.do">장바구니</a></li>
      <li><a href="${pageContext.request.contextPath }/info.do">고객센터</a></li>
  </ul>
  </div>
</div>
</div>
    <div id="top_header">
    <!-- 로고 -->
    <div id="top_name">
            <center><a href="${pageContext.request.contextPath }/index.do"><img src="img/누림뮤직 폰트2.jpg"></a><h1>누림뮤직</h1><h5>생활속의 여유, 음악의 중심!</h5></center>
            </div>
      <!-- end로고 -->

     <!-- 메인 메뉴바-->
            <div id="main_nav">
            <ul class="navi">
            <li><a href="${pageContext.request.contextPath }/kor.do">국내음악</a>
            <ul>
                  <li><a href="${pageContext.request.contextPath }/kor_rc1.do">KPOP</a></li>
                  <li><a href="${pageContext.request.contextPath }/kor_rc2.do">대중가요</a></li>
                  <li><a href="${pageContext.request.contextPath }/kor_rc3.do">OST</a></li>
               </ul>
            </li>
             <li><a href="${pageContext.request.contextPath }/foreign.do">해외음악</a>
               <ul>
                  <li><a href="${pageContext.request.contextPath }/foreign_rc1.do">POP</a></li>
                  <li><a href="${pageContext.request.contextPath }/foreign_rc2.do">Rock</a></li>
                  <li><a href="${pageContext.request.contextPath }/foreign_rc3.do">Jazz</a></li>
               </ul>
            </li>
            <li>
               <a href="${pageContext.request.contextPath }/shopping_main.do">쇼핑</a>
               <ul>
                  <li><a href="${pageContext.request.contextPath }/shopping_earphone.do">이어폰</a></li>
                  <li><a href="${pageContext.request.contextPath }/shopping_headphone.do">헤드폰</a></li>
               </ul>
            </li>
            <li><a href="${pageContext.request.contextPath }/community.do">커뮤니티</a>
                  <ul>
                  <li><a href="${pageContext.request.contextPath }/Review.do">회원리뷰</a></li>
                  <li><a href="${pageContext.request.contextPath }/discussion.do">토론광장</a></li>
               </ul>
            </li>
         </ul>
            </div>
      <!-- end 메인 메뉴바-->
      </div>
      </div>
<!-- 상단바 end -->