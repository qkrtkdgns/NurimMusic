<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
   <head>
     <%@include file="inc/head.jsp" %>
      <link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/css/basket.css" />
      <link rel="stylesheet"  type="text/css" href="${pageContext.request.contextPath }/css/pay.css" />
      
   </head>
   <body>
<%@include file="inc/top_nav.jsp" %>

<!-- 본문내용 작성 start -->
         <div id="content">
            <h2>주문/결제</h2>
            <hr/>
            <form name="barket" method="post" action="${pageContext.request.contextPath }/pay_ok.do">
            <div class="barket">
               <div class="board">
               <table class="table table-striped table-hover" style="margin-top:50px;">
                  <colgroup>
                     <col width="65%"/>
                     <col width="10%"/>
                     <col width="5%"/>
                     <col width="7%"/>
                     <col width="7%"/>
                  </colgroup>
               <thead style="border-top:1px solid gray;">
               <tr>
               <th class="text-center">상품</th>
               <th class="text-center">상품금액</th>
               <th class="text-center">수량</th>
               <th class="text-center">할인금액</th>
               <th class="text-center">주문금액</th>
               </tr>
               </thead>
               <tbody>
               <c:choose>
						<c:when test="${fn:length(BasketList) > 0}">
							<c:forEach var="b" items="${BasketList }">
								<input type="hidden" name="id" value="${b.id }" />
								<input type="hidden" name="price" value="${b.proPrice }" />
								<tr>
								<td id="item"><a><img src="${b.proImg }" /> ${b.proName }</a></td>
									<td class="text-center" id="item">${b.proPrice }원</td>
									<td class="text-center" id="item">${b.amount } 개</td>
									<td class="text-center" id="item">0원</td>
									<td class="text-center" id="item">${b.proPrice * b.amount }원</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="10" class="text-center" style="line-height: 100px;">
									조회된 글이 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
               <tr>
                  <td colspan="6" class="text-right" style="border-bottom:1px solid #bbb; border-top:1px solid #bbb; background:#ddd">
                     주문금액: <b>${price }원</b> + 배송비: <b>0원</b> = <b>${price }원</b></td>
               </tr>
               </tbody>
               </table>
               </div>
            </div>
            <div id="address">
            <table>
               <tbody>
               <tr>
                  <th>받으시는 분</th>
                  <td><input type="text" name="name" /></td>
               </tr>
               <tr>
                  <th rowspan="3">배송지 주소</th>
                  <td><input type="text" name="postcode" id="sample6_postcode"
								placeholder="우편번호">
								<input type="button"
								onclick="sample6_execDaumPostcode()" value="우편번호 찾기"></td>
               </tr>
               <tr>
                  <td><input type="text" name="addr1" id="sample6_address" placeholder="주소"></td>
               </tr>
               <tr>
                  <td><input type="text" name="addr2" id="sample6_address2" placeholder="주소"></td>
               </tr>
               <tr>
                  <th>휴대폰번호</th>
                  <td><input type="tel" name="tel" /></td>
               </tr>
            </tbody>
            </table></div>
            <div id="sale">
               <table>
                  <tbody>
                     <tr>
                        <th>
                           총 주문금액
                        </th>
                        <th>
                           총 배송비
                        </th>
                        <th>
                           총 할인금액
                        </th>
                        <th>
                           총 결제금액
                        </th>
                     </tr>
                     <tr>
                        <td>
                           ${price }원
                        </td>
                        <td>
                           0원
                        </td>
                        <td>
                           0원
                        </td>
                        <td>
                           ${price }원
                        </td>
                     </tr>
                  </tbody>
               </table>
            </div>
            <input type="hidden" name="price" value="${price }" />
            <button type="submit" id="pay" class="ruby">결제하기</button>
         </form>
         </div>
<!--본문내용 작성 end -->

<%@include file="inc/footer.jsp" %>
      <script src="js/basket.js"></script>
      <script>
     
      function sample6_execDaumPostcode() {

			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var fullAddr = ''; // 최종 주소 변수
							var extraAddr = ''; // 조합형 주소 변수

							// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								fullAddr = data.roadAddress;

							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								fullAddr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
							if (data.userSelectedType === 'R') {
								//법정동명이 있을 경우 추가한다.
								if (data.bname !== '') {
									extraAddr += data.bname;
								}
								// 건물명이 있을 경우 추가한다.
								if (data.buildingName !== '') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
								fullAddr += (extraAddr !== '' ? ' ('
										+ extraAddr + ')' : '');
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
							document.getElementById('sample6_address').value = fullAddr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById('sample6_address2').focus();
						}
					}).open();
		}
      </script>
      <script
		src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js?autoload=false"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		

   </body>
</html>