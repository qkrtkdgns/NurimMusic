<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
   <head>
     <%@include file="inc/head.jsp" %>
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/kor.css" />

   </head>
   <body>

<%@include file="inc/top_nav.jsp" %>
<div class="ddd"></div><!--빈 박스-->
<!-- 본문내용 작성 start -->
         <div id="content">
         <h2>해외음반</h2><hr>
         <!--사이드 메뉴-->
         <%@include file="inc/category.jsp" %>
         <!-- end 사이드 메뉴-->
         <div class="top_list">
            <div class="img_slide"><span>최신음반</span>
                        <ul>
                          <c:choose>
					<c:when test="${fn:length(newItem) > 0}">
						<c:forEach var="n" items="${newItem }" begin="0" end="8" varStatus="i">
							<li><a href="${pageContext.request.contextPath }/item.do?productId=${n.id}">
								<c:choose>
									<c:when test="${n.proImg != null}">
										<c:url var="downloadUrl" value="/download.do">
											<c:param name="file" value="${n.proImg}" />
										</c:url>
										<img src="${downloadUrl}" />
									</c:when>
									<c:otherwise>
										<img src="${pageContext.request.contextPath}/assets/img/no_image.jpg" />
									</c:otherwise>
								</c:choose>
							</a><span>${n.proName }</span><br/><span class="price">${n.proPrice }원</span></li>
						</c:forEach>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
                        </ul>
                  </div>
            <div class="goods">
               <ul class="new_item_ul1">
               <c:choose>
					<c:when test="${fn:length(newItem) > 0}">
						<c:forEach var="n" items="${newItem }" varStatus="i">
							<li><a href="${pageContext.request.contextPath }/item.do?productId=${n.id}">
							<span class="thumb">
								<c:choose>
									<c:when test="${n.proImg != null}">
										<c:url var="downloadUrl" value="/download.do">
											<c:param name="file" value="${n.proImg}" />
										</c:url>
										<img src="${downloadUrl}" />
									</c:when>
									<c:otherwise>
										<img src="${pageContext.request.contextPath}/assets/img/no_image.jpg" />
									</c:otherwise>
								</c:choose>
								</span>
							</a><span class="ab_name">${n.proName }</span>
							<span class="price">${n.proPrice }원</span></li>
						</c:forEach>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
            </ul>
            </div>
         </div>
      </div>


<!--본문내용 작성 end -->

<%@include file="inc/footer.jsp" %>
       <script type="text/javascript">
          $(function(){
             //좌 -> 우 로 이동하는 슬라이드 변수
             var j=0;
             //정해진 시간마다 움직이는 변수
             var move = setInterval(function slide(){

                for(var i=0; i<=9; i++){
                   if((i+j)>8){
                   $("li:nth-child("+i+")").animate({left:((200*(j+i)-2100)+"px")});
                   $("li:nth-child("+i+")").css("z-index","-10");
                   }else{
                   $("li:nth-child("+i+")").animate({left:((200*(j+i)-300)+"px")});
                   $("li:nth-child("+i+")").css("z-index","10");
                    }
                }

                //슬라이드 횟수가 8회이면 초기화
                if(j==8){
                   j=-1;
                }
                //슬라이드 횟수 증가
                j++;
             },1500);
          });
      </script>

   </body>
</html>