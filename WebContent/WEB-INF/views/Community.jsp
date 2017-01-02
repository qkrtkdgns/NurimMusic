<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
   <head>
      <%@include file="inc/head.jsp" %>
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/Community.css" />

      <style type="text/css">

      </style>

   </head>
   <body>

<%@include file="inc/top_nav.jsp" %>
<div class="ddd"></div>
<!-- 본문내용 작성 start -->
         <div id="content">
            <!--youtube 플레이어 시작 -->
            <div id="youtube_box">
               <div class="youtube">
                 <iframe width="760" height="430" src="https://www.youtube.com/embed/l1hxg1rY17I" frameborder="0" allowfullscreen></iframe>
               </div>
               <div class="youtube_list">
                  <ul>
                     <li><a href="#"><img src="https://i.ytimg.com/vi/l1hxg1rY17I/hqdefault.jpg?custom=true&w=168&h=94&stc=true&jpg444=true&jpgq=90&sp=68&sigh=mtgLbEshX0xOSSrh-xdXt7izdbQ" />
                     </a><span><b>아이오아이</b><br/>
                    <p>너무너무너무</p><p>작성자 : ggzzzzzz</p></span></li>
                     <li>
                     <a href="#">
                     <img src="https://i.ytimg.com/vi/WJua7KEP_oE/hqdefault.jpg?custom=true&w=120&h=90&jpg444=true&jpgq=90&sp=68&sigh=iYhQ_e0K1httmeGiBO43kcsVcJg" /></a><span><b>샤이니</b><br/>
                    <p>1 of 1</p><p>작성자 : ggzzzzzz</p></span></li>
                     <li><a href="#"><img src="https://i.ytimg.com/vi/QslJYDX3o8s/hqdefault.jpg?custom=true&w=120&h=90&jpg444=true&jpgq=90&sp=68&sigh=4CwqSdyeZLBPoaY8KZu1OReJ9s0" />
                    </a><span><b>레드벨벳</b><br/>
                     <p>러시안룰렛</p><p>작성자 : ggzzzzzz</p></span></li>
                     <li><a href="#"><img src="https://i.ytimg.com/vi/tbe3pe2BtwA/hqdefault.jpg?custom=true&w=168&h=94&stc=true&jpg444=true&jpgq=90&sp=68&sigh=kSDeHnaY-iJUKvQzrfG8cRTabF0" /></a><span><b>엑소</b><br/>
                    <p>Monster</p><p>작성자 : ggzzzzzz</p></span></li>
                  </ul>
               </div>
            </div>
            <!--youtube 플레이어 끝 -->

            <!--토론광장 & 회원리뷰 영역 시작 -->
            <div id="comm_main_foot">

              <div class="dis_comm">

              <!-- 자세히 보러가기 버튼 -->
            <div class="dis_btn">
            <a class="btn btn-default" href="${pageContext.request.contextPath }/discussion.do?category=discussion" role="button">자세히 보러가기 &raquo;</a>
            </div>
            <!-- //자세히 보러가기 버튼 끝 -->

                <h2>토론광장</h2>
                <table class="dis_table">
                  <colgroup>
                      <col width="320" />
                      <col width="110" />
                      <col width="90" />
                      <col width="80" />
                      <col width="80" />
                      <col width="80" />
                  </colgroup>

           <thead>
            <tr>
              <th scope="col" class="text-center">제목</th>
              <th scope="col" class="text-center">작성일</th>
              <th scope="col" class="text-center">토론 종료일</th>
              <th scope="col" class="text-center">조회수</th>
              <th scope="col" class="text-center">찬성</th>
              <th scope="col" class="text-center">반대</th>
            </tr>

          </thead>

          <tbody>
           <c:forEach var="document" items="${discussionList}">
           <tr>
              <td class="cont_sub" >
					<a href="${pageContext.request.contextPath}/discussion_write_result.do?category=${document.category}&document_id=${document.id}">${document.subject}</a>
              </td>
             <td class="cont_date">${document.regDate }</td>
              <td class="cont_datec">${document.endDate }</td>
              <td class="cont_view">${document.hit }</td>
              <td class="cont_ag">${document.agree }</td>
              <td class="cont_disag">${document.disagree}</td>
            </tr></c:forEach>
          </tbody>
            </table>

             </div>

              <div class="review_comm">
                <h2>회원리뷰</h2>
                <c:forEach var="document" items="${reviewList}">
                <div class="rv_list1">

                  <span class="thumb">
                  <a href="${pageContext.request.contextPath }/Review_write_result.do?category=${document.category}&document_id=${document.id}">

                  <c:choose>
						<c:when test="${document.imagePath != null }">
							<c:url var="downloadUrl" value="/download.do">
								<c:param name="file" value="${document.imagePath }" />
							</c:url>
							<img src="${downloadUrl }" />
						</c:when>
						<c:otherwise>
							<img src="${pageContext.request.contextPath }/img/noimage.png" />
						</c:otherwise>
				</c:choose>

                  </a>
                  </span>
                  <div class="rev_text">
                  <span class="rev_sub">${document.subject }</span><br>
                  <span class="user_id">
                  회원ID - ${document.memberId } <br>
                  </span>
                  <span class="rev_desc">${document.content }</span>
                </div>
                </div>
                </c:forEach>
              </div>
         </div>
      <!-- //토론광장 & 회원리뷰 영역 끝 -->
      </div>

<!--본문내용 작성 end -->

<%@include file="inc/footer.jsp" %>


     <script type="text/javascript">
       $(function(){
          $(".youtube_list >ul> li:nth-child(1) img").click(function(){
            $(".youtube > iframe").attr("src","https://www.youtube.com/embed/l1hxg1rY17I");
            return false;
          });
          $(".youtube_list >ul> li:nth-child(2) img").click(function(){
            $(".youtube > iframe").attr("src","https://www.youtube.com/embed/WJua7KEP_oE");
   return false;
          });
          $(".youtube_list >ul> li:nth-child(3) img").click(function(){
            $(".youtube > iframe").attr("src","https://www.youtube.com/embed/QslJYDX3o8s");
   return false;
          });
          $(".youtube_list >ul> li:nth-child(4) img").click(function(){
            $(".youtube > iframe").attr("src","https://www.youtube.com/embed/tbe3pe2BtwA");
   return false;
          });
       });
      </script>

   </body>
</html>
