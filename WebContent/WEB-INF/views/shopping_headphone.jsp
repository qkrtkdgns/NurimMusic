<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html lang="ko">
  <head>
   <%@include file="inc/head.jsp" %>
    <link rel="stylesheet"  type="text/css" href="css/kor_sub.css"/>

  </head>
  <body>

<%@include file="inc/top_nav.jsp" %>
<div class="ddd"></div><!--빈 박스-->
<!-- 본문내용 작성 start -->
         <div id="content">
         <h2>쇼핑</h2><hr>
         <!--사이드 메뉴-->
         <%@include file="inc/category.jsp" %>
         <!-- end 사이드 메뉴-->
    <div class="goods_list">
        <div class="list-topbar">
          <div class="check_list">
            체크한 음반
            <a href="#" class="btn btn-default">장바구니 담기</a>
            <a href="#" class="btn btn-default">관심상품</a>
          </div>
          <div class="search_list">
            <a href="#">발매일</a>&nbsp;|&nbsp;<a href="#">높은가격</a>&nbsp;|&nbsp;<a href="#">낮은가격</a>
          </div>
        </div>

        <div class="list_lineup">
          <ul>
            <li>
              <table>
                <tr>
                <td style="width:10;"><input type="checkbox" name="basket"></td>
                <td width="145">
                <a href="${pageContext.request.contextPath }/item.do"><img src="img/headphone_list01.jpg"></a>
                </td>
                <td width="493">
                <a href="${pageContext.request.contextPath }/item.do"><span class="title">크레신 접이식헤드폰 C555S [BK]</span></a>
                <span class="substance">2013.06.14 | Accessory</span>
                </td>
                <td width="183"><p class="price1">85,000원</p>
                <p class="price2">72,000원</p>
                </td>
                
                <td class="item_button">
                <a href="#" class="btn btn-default" id="A1" name="list_01"/><font color="red">품&nbsp;&nbsp;절</font></a>
                <a href="${pageContext.request.contextPath }/basket.do" class="btn btn-default" id="A" name="list_01" />장바구니</a>
                <a href="#" class="btn btn-default" id="B1" name="list_01" />입고알림</a>
                <a href="${pageContext.request.contextPath }/pay.do" class="btn btn-default" id="B" name="list_01" />바로구매</a>
                </td>
                
                </tr>
                
              </table>
            </li>
            <br/>
          <li>
              <table>
                <tr>
                <td style="width:10;"><input type="checkbox" name="basket"></td>
                <td width="145">
                <a href="${pageContext.request.contextPath }/item.do"><img src="img/headphone_list01.jpg"></a>
                </td>
                <td width="493">
                <a href="${pageContext.request.contextPath }/item.do"><span class="title">크레신 접이식헤드폰 C555S [WT]</span></a>
                <span class="substance">2013.06.14 | Accessory</span>
                </td>
                <td width="183"><p class="price1">85,000원</p>
                <p class="price2">72,000원</p></td>
                
                <td class="item_button">
                <a href="#" class="btn btn-default" id="A1" name="list_02"/><font color="red">품&nbsp;&nbsp;절</font></a>
                <a href="${pageContext.request.contextPath }/basket.do" class="btn btn-default" id="A" name="list_02" />장바구니</a>
                <a href="#" class="btn btn-default" id="B1" name="list_02" />입고알림</a>
                <a href="${pageContext.request.contextPath }/pay.do" class="btn btn-default" id="B" name="list_02" />바로구매</a>
                </td>
                
                </tr>
                
              </table>
            </li>
            <br/>
            <li>
              <table>
                <tr>
                <td style="width:10;"><input type="checkbox" name="basket"></td>
                <td width="145">
                <a href="${pageContext.request.contextPath }/item.do"><img src="img/headphone_list02.jpg"></a>
                </td>
                <td width="493">
                <a href="${pageContext.request.contextPath }/item.do"><span class="title">필립스 SHL1602 [그레이]</span></a>
                <span class="substance">2013.06.14 | Accessory</span>
                </td>
                <td width="183"><p class="price1">38,000원</p>
                <p class="price2">22,000원</p></td>
                
                <td class="item_button">
                <a href="#" class="btn btn-default" id="A1" name="list_03"/><font color="red">품&nbsp;&nbsp;절</font></a>
                <a href="${pageContext.request.contextPath }/basket.do" class="btn btn-default" id="A" name="list_03" />장바구니</a>
                <a href="#" class="btn btn-default" id="B1" name="list_03" />입고알림</a>
                <a href="${pageContext.request.contextPath }/pay.do" class="btn btn-default" id="B" name="list_03" />바로구매</a>
                </td>
                
                </tr>
                
              </table>
            </li>
            <br/>
              <li>
              <table>
                <tr>
                <td style="width:10;"><input type="checkbox" name="basket"></td>
                <td width="145">
                <a href="${pageContext.request.contextPath }/item.do"><img src="img/headphone_list04.jpg"></a>
                </td>
                <td width="493">
                <a href="${pageContext.request.contextPath }/item.do"><span class="title">접이식헤드폰 CS-HP500 [BK]</span></a>
                <span class="substance">2013.06.14 | Accessory</span>
                </td>
                <td width="183"><p class="price1">45,000원</p>
                <p class="price2">29,000원</p></td>
                
                <td class="item_button">
                <a href="#" class="btn btn-default" id="A1" name="list_04"/><font color="red">품&nbsp;&nbsp;절</font></a>
                <a href="${pageContext.request.contextPath }/basket.do" class="btn btn-default" id="A" name="list_04" />장바구니</a>
                <a href="#" class="btn btn-default" id="B1" name="list_04" />입고알림</a>
                <a href="${pageContext.request.contextPath }/pay.do" class="btn btn-default" id="B" name="list_04" />바로구매</a>
                </td>
                
                </tr>
                
              </table>
            </li>
            <br/>
            <li>
              <table>
                <tr>
                <td style="width:10;"><input type="checkbox" name="basket"></td>
                <td width="145">
                <a href="${pageContext.request.contextPath }/item.do"><img src="img/headphone_list03.jpg"></a>
                </td>
                <td width="493">
                <a href="${pageContext.request.contextPath }/item.do"><span class="title">크레신 접이식헤드폰 C555H [BK]
                </span></a>
                <span class="substance">워너뮤직코리아(주) | 2016.08.12 | CD</span>
                </td>
                <td width="183"><p class="price1">77,500원</p>
                <p class="price2">67,000원</p></td>
                
                <td class="item_button">
                <a href="#" class="btn btn-default" id="A1" name="list_05"/><font color="red">품&nbsp;&nbsp;절</font></a>
                <a href="${pageContext.request.contextPath }/basket.do" class="btn btn-default" id="A" name="list_05" />장바구니</a>
                <a href="#" class="btn btn-default" id="B1" name="list_05" />입고알림</a>
                <a href="${pageContext.request.contextPath }/pay.do" class="btn btn-default" id="B" name="list_05" />바로구매</a>
                </td>
                
                </tr>
                
              </table>
            </li>
            <br/>

              <li>
              <table>
                <tr>
                <td style="width:10;"><input type="checkbox" name="basket"></td>
                <td width="145">
                <a href="${pageContext.request.contextPath }/item.do"><img src="img/headphone_list03.jpg"></a>
                </td>
                <td width="493">
                <a href="${pageContext.request.contextPath }/item.do"><span class="title">크레신 접이식헤드폰 C555H [WT]
                </span></a>
                <span class="substance">2013.06.14 | Accessory</span>
                </td>
                <td width="183"><p class="price1">77,000원</p>
                <p class="price2">67,000원</p></td>
                
                <td class="item_button">
                <a href="#" class="btn btn-default" id="A1" name="list_06"/><font color="red">품&nbsp;&nbsp;절</font></a>
                <a href="${pageContext.request.contextPath }/basket.do" class="btn btn-default" id="A" name="list_06" />장바구니</a>
                <a href="#" class="btn btn-default" id="B1" name="list_06" />입고알림</a>
                <a href="${pageContext.request.contextPath }/pay.do" class="btn btn-default" id="B" name="list_06" />바로구매</a>
                </td>
                
                </tr>
                
              </table>
            </li>
            <br/>

              <li>
              <table>
                <tr>
                <td style="width:10;"><input type="checkbox" name="basket"></td>
                <td width="145">
                <a href="${pageContext.request.contextPath }/item.do"><img src="img/headphone_list04.jpg"></a>
                </td>
                <td width="493">
                <a href="${pageContext.request.contextPath }/item.do"><span class="title">접이식헤드폰 CS-HP500 [RED]
                </span></a>
                <span class="substance">2013.06.14 | Accessory</span>
                </td>
                <td width="183"><p class="price1">45,000원</p>
                <p class="price2">29,000원</p></td>
                
                <td class="item_button">
                <a href="#" class="btn btn-default" id="A1" name="list_07"/><font color="red">품&nbsp;&nbsp;절</font></a>
                <a href="${pageContext.request.contextPath }/basket.do" class="btn btn-default" id="A" name="list_07" />장바구니</a>
                <a href="#" class="btn btn-default" id="B1" name="list_07" />입고알림</a>
                <a href="${pageContext.request.contextPath }/pay.do" class="btn btn-default" id="B" name="list_07" />바로구매</a>
                </td>
                
                </tr>
                
              </table>
            </li>
            <br/>

              <li>
              <table>
                <tr>
                <td style="width:10;"><input type="checkbox" name="basket"></td>
                <td width="145">
                <a href="${pageContext.request.contextPath }/item.do"><img src="img/headphone_list05.jpg"></a>
                </td>
                <td width="493">
                <a href="${pageContext.request.contextPath }/item.do"><span class="title">파스텔헤드폰 C300H [화이트]
                </span></a>
                <span class="substance">2013.06.14 | Accessory</span>
                </td>
                <td width="183"><p class="price1">30,000원</p>
                <p class="price2">19,800원</p></td>
                
                <td class="item_button">
                <a href="#" class="btn btn-default" id="A1" name="list_08"/><font color="red">품&nbsp;&nbsp;절</font></a>
                <a href="${pageContext.request.contextPath }/basket.do" class="btn btn-default" id="A" name="list_08" />장바구니</a>
                <a href="#" class="btn btn-default" id="B1" name="list_08" />입고알림</a>
                <a href="${pageContext.request.contextPath }/pay.do" class="btn btn-default" id="B" name="list_08" />바로구매</a>
                </td>
                
                </tr>
                
              </table>
            </li>
            <br/>

              <li>
              <table>
                <tr>
                <td style="width:10;"><input type="checkbox" name="basket"></td>
                <td width="145">
                <a href="${pageContext.request.contextPath }/item.do"><img src="img/headphone_list04.jpg">
                </td></a>
                <td width="493">
                <a href="${pageContext.request.contextPath }/item.do"><span class="title">접이식헤드폰 CS-HP500 [WT]
                </span></a>
                <span class="substance">2013.06.14 | Accessory</span>
                </td>
                <td width="183"><p class="price1">45,000원</p>
                <p class="price2">29,000원</p></td>
                
                <td class="item_button">
                <a href="#" class="btn btn-default" id="A1" name="list_09"/><font color="red">품&nbsp;&nbsp;절</font></a>
                <a href="${pageContext.request.contextPath }/basket.do" class="btn btn-default" id="A" name="list_09" />장바구니</a>
                <a href="#" class="btn btn-default" id="B1" name="list_09" />입고알림</a>
                <a href="${pageContext.request.contextPath }/pay.do" class="btn btn-default" id="B" name="list_09" />바로구매</a>
                </td>
                
                </tr>
                
              </table>
            </li>
            <br/>

              <li>
              <table>
                <tr>
                <td style="width:10;"><input type="checkbox" name="basket"></td>
                <td width="145">
                <a href="${pageContext.request.contextPath }/item.do"><img src="img/headphone_list05.jpg">
                </td></a>
                <td width="493">
                <a href="${pageContext.request.contextPath }/item.do"><span class="title">파스텔헤드폰 C300H [핑크]
                </span></a>
                <span class="substance">2013.06.14 | Accessory</span>
                </td>
                <td width="183"><p class="price1">30,000원</p>
                <p class="price2">19,800원</p></td>
                
                <td class="item_button">
                <a href="#" class="btn btn-default" id="A1" name="list_10"/><font color="red">품&nbsp;&nbsp;절</font></a>
                <a href="${pageContext.request.contextPath }/basket.do" class="btn btn-default" id="A" name="list_10" />장바구니</a>
                <a href="#" class="btn btn-default" id="B1" name="list_10" />입고알림</a>
                <a href="${pageContext.request.contextPath }/pay.do" class="btn btn-default" id="B" name="list_10" />바로구매</a>
                </td>
                
                </tr>
                
              </table>
            </li>
            <br/>
                


          </ul>
          </div>
          <div class="page_num">
      <ul class="pagination pagination-mg">
      <li class="disabled"><a href="#">&laquo;</a></li>
      <li class="active"><span>1<span class="sr-only">(current)</span></span></li>
      <li><a href="#">2</a></li>
      <li><a href="#">3</a></li>
      <li><a href="#">4</a></li>
      <li><a href="#">5</a></li>
      <li><a href="#">&raquo;</a></li>
      </ul>
        
      </div>
      </div>
  
</div>

<!--본문내용 작성 end -->

<%@include file="inc/footer.jsp" %>
     <script type="text/javascript">
        $(function(){
          var sell= true;

          if(sell==false){
          $(".list_lineup > ul > li > table #A1").hide();
          $(".list_lineup > ul > li > table #B1").hide();
          }else{
          $(".list_lineup > ul > li > table #A").hide();
          $(".list_lineup > ul > li > table #B").hide();
          }

        });


      
    </script>

  </body>
</html>

            <li>
              <table>
                <tr>
                <td style="width:10;"><input type="checkbox" name="basket"></td>
                <td width="145">
                <img src="img/headphone_list01.jpg">
                </td>
                <td width="493">
                <span class="title">크레신 접이식헤드폰 C555S [BK]</span>
                <span class="substance">2013.06.14 | Accessory</span>
                </td>
                <td width="183"><p class="price1">85,000원</p>
                <p class="price2">72,000원</p>
                </td>
                
                <td class="item_button">
                <a href="#" class="btn btn-default" id="A1" name="list_01"/><font color="red">품&nbsp;&nbsp;절</font></a>
                <a href="#" class="btn btn-default" id="A" name="list_01" />장바구니</a>
                <a href="#" class="btn btn-default" id="B1" name="list_01" />입고알림</a>
                <a href="#" class="btn btn-default" id="B" name="list_01" />바로구매</a>
                </td>
                
                </tr>
                
              </table>
            </li>
            <br/>
          <li>
              <table>
                <tr>
                <td style="width:10;"><input type="checkbox" name="basket"></td>
                <td width="145">
                <img src="img/headphone_list01.jpg">
                </td>
                <td width="493">
                <span class="title">크레신 접이식헤드폰 C555S [WT]</span>
                <span class="substance">2013.06.14 | Accessory</span>
                </td>
                <td width="183"><p class="price1">85,000원</p>
                <p class="price2">72,000원</p></td>
                
                <td class="item_button">
                <a href="#" class="btn btn-default" id="A1" name="list_02"/><font color="red">품&nbsp;&nbsp;절</font></a>
                <a href="#" class="btn btn-default" id="A" name="list_02" />장바구니</a>
                <a href="#" class="btn btn-default" id="B1" name="list_02" />입고알림</a>
                <a href="#" class="btn btn-default" id="B" name="list_02" />바로구매</a>
                </td>
                
                </tr>
                
              </table>
            </li>
            <br/>
            <li>
              <table>
                <tr>
                <td style="width:10;"><input type="checkbox" name="basket"></td>
                <td width="145">
                <img src="img/headphone_list02.jpg">
                </td>
                <td width="493">
                <span class="title">필립스 SHL1602 [그레이]</span>
                <span class="substance">2013.06.14 | Accessory</span>
                </td>
                <td width="183"><p class="price1">38,000원</p>
                <p class="price2">22,000원</p></td>
                
                <td class="item_button">
                <a href="#" class="btn btn-default" id="A1" name="list_03"/><font color="red">품&nbsp;&nbsp;절</font></a>
                <a href="#" class="btn btn-default" id="A" name="list_03" />장바구니</a>
                <a href="#" class="btn btn-default" id="B1" name="list_03" />입고알림</a>
                <a href="#" class="btn btn-default" id="B" name="list_03" />바로구매</a>
                </td>
                
                </tr>
                
              </table>
            </li>
            <br/>
              <li>
              <table>
                <tr>
                <td style="width:10;"><input type="checkbox" name="basket"></td>
                <td width="145">
                <img src="img/headphone_list04.jpg">
                </td>
                <td width="493">
                <span class="title">접이식헤드폰 CS-HP500 [BK]</span>
                <span class="substance">2013.06.14 | Accessory</span>
                </td>
                <td width="183"><p class="price1">45,000원</p>
                <p class="price2">29,000원</p></td>
                
                <td class="item_button">
                <a href="#" class="btn btn-default" id="A1" name="list_04"/><font color="red">품&nbsp;&nbsp;절</font></a>
                <a href="#" class="btn btn-default" id="A" name="list_04" />장바구니</a>
                <a href="#" class="btn btn-default" id="B1" name="list_04" />입고알림</a>
                <a href="#" class="btn btn-default" id="B" name="list_04" />바로구매</a>
                </td>
                
                </tr>
                
              </table>
            </li>
            <br/>
            <li>
              <table>
                <tr>
                <td style="width:10;"><input type="checkbox" name="basket"></td>
                <td width="145">
                <img src="img/headphone_list03.jpg">
                </td>
                <td width="493">
                <span class="title">크레신 접이식헤드폰 C555H [BK]
                </span>
                <span class="substance">워너뮤직코리아(주) | 2016.08.12 | CD</span>
                </td>
                <td width="183"><p class="price1">77,500원</p>
                <p class="price2">67,000원</p></td>
                
                <td class="item_button">
                <a href="#" class="btn btn-default" id="A1" name="list_05"/><font color="red">품&nbsp;&nbsp;절</font></a>
                <a href="#" class="btn btn-default" id="A" name="list_05" />장바구니</a>
                <a href="#" class="btn btn-default" id="B1" name="list_05" />입고알림</a>
                <a href="#" class="btn btn-default" id="B" name="list_05" />바로구매</a>
                </td>
                
                </tr>
                
              </table>
            </li>
            <br/>

              <li>
              <table>
                <tr>
                <td style="width:10;"><input type="checkbox" name="basket"></td>
                <td width="145">
                <img src="img/headphone_list03.jpg">
                </td>
                <td width="493">
                <span class="title">크레신 접이식헤드폰 C555H [WT]
                </span>
                <span class="substance">2013.06.14 | Accessory</span>
                </td>
                <td width="183"><p class="price1">77,000원</p>
                <p class="price2">67,000원</p></td>
                
                <td class="item_button">
                <a href="#" class="btn btn-default" id="A1" name="list_06"/><font color="red">품&nbsp;&nbsp;절</font></a>
                <a href="#" class="btn btn-default" id="A" name="list_06" />장바구니</a>
                <a href="#" class="btn btn-default" id="B1" name="list_06" />입고알림</a>
                <a href="#" class="btn btn-default" id="B" name="list_06" />바로구매</a>
                </td>
                
                </tr>
                
              </table>
            </li>
            <br/>

              <li>
              <table>
                <tr>
                <td style="width:10;"><input type="checkbox" name="basket"></td>
                <td width="145">
                <img src="img/headphone_list04.jpg">
                </td>
                <td width="493">
                <span class="title">접이식헤드폰 CS-HP500 [RED]
                </span>
                <span class="substance">2013.06.14 | Accessory</span>
                </td>
                <td width="183"><p class="price1">45,000원</p>
                <p class="price2">29,000원</p></td>
                
                <td class="item_button">
                <a href="#" class="btn btn-default" id="A1" name="list_07"/><font color="red">품&nbsp;&nbsp;절</font></a>
                <a href="#" class="btn btn-default" id="A" name="list_07" />장바구니</a>
                <a href="#" class="btn btn-default" id="B1" name="list_07" />입고알림</a>
                <a href="#" class="btn btn-default" id="B" name="list_07" />바로구매</a>
                </td>
                
                </tr>
                
              </table>
            </li>
            <br/>

              <li>
              <table>
                <tr>
                <td style="width:10;"><input type="checkbox" name="basket"></td>
                <td width="145">
                <img src="img/headphone_list05.jpg">
                </td>
                <td width="493">
                <span class="title">파스텔헤드폰 C300H [화이트]
                </span>
                <span class="substance">2013.06.14 | Accessory</span>
                </td>
                <td width="183"><p class="price1">30,000원</p>
                <p class="price2">19,800원</p></td>
                
                <td class="item_button">
                <a href="#" class="btn btn-default" id="A1" name="list_08"/><font color="red">품&nbsp;&nbsp;절</font></a>
                <a href="#" class="btn btn-default" id="A" name="list_08" />장바구니</a>
                <a href="#" class="btn btn-default" id="B1" name="list_08" />입고알림</a>
                <a href="#" class="btn btn-default" id="B" name="list_08" />바로구매</a>
                </td>
                
                </tr>
                
              </table>
            </li>
            <br/>

              <li>
              <table>
                <tr>
                <td style="width:10;"><input type="checkbox" name="basket"></td>
                <td width="145">
                <img src="img/headphone_list04.jpg">
                </td>
                <td width="493">
                <span class="title">접이식헤드폰 CS-HP500 [WT]
                </span>
                <span class="substance">2013.06.14 | Accessory</span>
                </td>
                <td width="183"><p class="price1">45,000원</p>
                <p class="price2">29,000원</p></td>
                
                <td class="item_button">
                <a href="#" class="btn btn-default" id="A1" name="list_09"/><font color="red">품&nbsp;&nbsp;절</font></a>
                <a href="#" class="btn btn-default" id="A" name="list_09" />장바구니</a>
                <a href="#" class="btn btn-default" id="B1" name="list_09" />입고알림</a>
                <a href="#" class="btn btn-default" id="B" name="list_09" />바로구매</a>
                </td>
                
                </tr>
                
              </table>
            </li>
            <br/>

              <li>
              <table>
                <tr>
                <td style="width:10;"><input type="checkbox" name="basket"></td>
                <td width="145">
                <img src="img/headphone_list05.jpg">
                </td>
                <td width="493">
                <span class="title">파스텔헤드폰 C300H [핑크]
                </span>
                <span class="substance">2013.06.14 | Accessory</span>
                </td>
                <td width="183"><p class="price1">30,000원</p>
                <p class="price2">19,800원</p></td>
                
                <td class="item_button">
                <a href="#" class="btn btn-default" id="A1" name="list_10"/><font color="red">품&nbsp;&nbsp;절</font></a>
                <a href="#" class="btn btn-default" id="A" name="list_10" />장바구니</a>
                <a href="#" class="btn btn-default" id="B1" name="list_10" />입고알림</a>
                <a href="#" class="btn btn-default" id="B" name="list_10" />바로구매</a>
                </td>
                
                </tr>
                
              </table>
            </li>
            <br/>
                


          </ul>
          </div>
          <div class="page_num">
      <ul class="pagination pagination-mg">
      <li class="disabled"><a href="#">&laquo;</a></li>
      <li class="active"><span>1<span class="sr-only">(current)</span></span></li>
      <li><a href="#">2</a></li>
      <li><a href="#">3</a></li>
      <li><a href="#">4</a></li>
      <li><a href="#">5</a></li>
      <li><a href="#">&raquo;</a></li>
      </ul>
        
      </div>
      </div>
  
</div>

<!--본문내용 작성 end -->

<%@include file="inc/footer.jsp" %>
     <script type="text/javascript">
        $(function(){
          var sell= true;

          if(sell==false){
          $(".list_lineup > ul > li > table #A1").hide();
          $(".list_lineup > ul > li > table #B1").hide();
          }else{
          $(".list_lineup > ul > li > table #A").hide();
          $(".list_lineup > ul > li > table #B").hide();
          }

        });


      
    </script>

  </body>
</html>