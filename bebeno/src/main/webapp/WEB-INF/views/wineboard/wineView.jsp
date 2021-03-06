<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<c:set var="path" value ="${ pageContext.request.contextPath }"/>   

	<jsp:include page="/WEB-INF/views/common/header_wine.jsp" />

<section class="sub-contents wrap-wine-view clear">
    <div class="inner">
        <div class="btn_list">
            <a href="${path}/wineboard/wineList" class="button btn_list_small">목록</a>
        </div>
        <div class="clear">
            <div class="wine-top-left">
                <div class="swiper-container gallery-top swiper-container-initialized swiper-container-horizontal">
                    <div class="swiper-wrapper" >
						<c:if test="${ !empty wineboard.renamedFileName }">
                        <div class='swiper-slide'><img id="image" src="${path}/resources/upload/wineimg/${wineboard.renamedFileName}" width="400px" height="550px"/></div>
                        <div class="wine-pagination"></div>
                        </c:if>
                    </div>
                    </div>
                </div>
            </div>      
            <div class="wine-top-right">
                <div class='bagde-box'>
                    <p class="dib">
                        <span class="bagde-item bagde-blue-fill">${wineboard.wineType}</span>
                        <span>${wineboard.wineMf}</span>
                        <span>${wineboard.wineNational}</span>                 </p>
                    </div>
                    <dl>
                        <dt class="wine-name" id="wineName">${wineboard.wineName}</dt>
                        <dd class="wine-name-en">${wineboard.wineEng}</dd>
                    </dl>
                    <p class="wine-price">
                        <strong>${wineboard.winePrice} 원</strong>      
                    </p>
                    <p>
                        <select name="amount">
                        	<option value="1">1</option>
                        	<option value="2">2</option>
                        	<option value="3">3</option>
                        	<option value="4">4</option>
                        	<option value="5">5</option>
                        </select>&nbsp;개 <button type="button" class="btn-wine-wish btn-pop-wine-01 btn_open btn-cart cart_btn">장바구니 담기</button>
                        <form action="${path}/payment/orderPage" method="get">
                       <c:forEach var="list" items="${cartList}">
			         <div class="paymentScreenBtn">
								<input type="hidden" name="wineBno" value="${list.wine_bno}">
								<input type="hidden" name="wineName" value="${list.wineName}">
								<input type="hidden" name="winePrice" value="${list.winePrice}">
								<input type="hidden" name="merchant_uid" value="" id="merchant_uid">
                    </div>
                    </c:forEach>
                        <!-- <button type="submit" class="btn-wine-wish btn-pop-wine-01 btn_open btn-order cart_btn2" id="paymentSubmit">구매하기</button>  -->
                    </p> 
                  	 </form> 
                    <p class="wine-price-etc">※ 수입사가 제공한 가격으로 판매처별로 가격이 다를 수 있습니다.  와인은 최대 5개까지 구매 가능합니다.</p>

                    <div class="wine-components">
                        <ul>
                            <li>
                                <p class="wine-c-txt">당도</p>
                                <div id="" class="filter-grade">
                                    <a class='on'></a><a class='on'></a><a class='on'></a><a class='on'></a><a class='on'></a>								</div>
                                </li>
                                <li>
                                    <p class="wine-c-txt">산도</p>
                                    <div id="" class="filter-grade">
                                        <a class='on'></a><a class='on'></a><a ></a><a ></a><a ></a>								</div>
                                    </li>
                                    <li>
                                        <p class="wine-c-txt">바디</p>
                                        <div id="" class="filter-grade">
                                            <a class='on'></a><a class='on'></a><a class='on'></a><a class='on'></a><a class='on'></a>								</div>
                                        </li>
                                        <li>
                                            <p class="wine-c-txt">타닌</p>
                                            <div id="" class="filter-grade">
                                                <a class='on'></a><a class='on'></a><a ></a><a ></a><a ></a>								</div>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="wine-top-right-inner" style="white-space:pre-line;">
                                    <span><c:out value="${wineboard.wineInfo}"/></span>
                                    </div>
                                </div>
								<div class="wineviewright">
								<c:if test="${loginMember.id eq 'eunjin'}">
                                    <a class="button btn_list_ch" href="${path}/wineboard/wineUpdate?wineBno=${wineboard.wineBno}">수정</a>
                                    <a class="button btn_list_del" id="btnDelete" onclick="deleteWrite(${wineboard.wineBno})">삭제</a>
                                </c:if>
                                </div>
                            </div>
                    </section>
                        <!-- js영역 -->

                        <script src="${ path }/js/jquery.min.js"></script>
                        <script src="${ path }/js/swiper.min.js"></script>
                        <script src="${ path }/js/swiper.js"></script>
                        <script src="${ path }/js/browser.min.js"></script>
						<script src="${ path }/js/breakpoints.min.js"></script>
						<script src="${ path }/js/util.js"></script>
						<script src="${ path }/js/menubar.js"></script>

						
						<script>
						$(document).ready(() => {
							$("#btnDelete").on("click", () => {
								if(confirm("정말로 게시글을 삭제 하시겠습니까?")) {
									location.replace("${path}/wineboard/wineList");
								}
							})
						});
						

						//장바구니 담기
				            $(".cart_btn").click(function(){
				                  
				                  var wineBno=${wineboard.wineBno};
				                  var wineName = $("#wineName").val();
				                  var cartqty = $(".numBox").val();
				                  var renamedFileName= $("#image").attr("src");
				                 
				               if(wineBno == 1){
				            	   wineBno=1;
				               }else{
				            	   wineBno=${wineboard.wineBno};
				               }
				               
				                 console.log(wineBno);
				                  var data = {
				                	wine_bno : wineBno,
				                	cart_qty : cartqty

				                  };
				                  $.ajax({
				                      url : "${path}/wineView/addCart",
				                      type : "post",
				                      data : data,
				                      success : function(result){
				                       alert("카트 담기 성공");
				                       $(".numBox").val("1");
				                       location.replace("${path}/payment/cart");
				                      },
				                      error : function(){
				                       alert("로그인 후 이용해주세요.");
				                       console.log(wineBno);
				                       console.log(cartqty);
				                       console.log(renamedFileName);
				                      }
				                  });
				                  
		                    });
						
				          //상품 삭제 버튼
							deleteWrite = (wineBno) => {
								
								fetch("${path}/wineboard/wineView/delete/" + ${wineboard.wineBno} , {
									method : "GET"
								})
								.then(response => {
									if(response.ok){
										alert("게시글 삭제가 완료되었습니다.");
										location.reload();
									} else {
										alert("삭제를 실패하였습니다.");
										location.reload();
									}
								})
							} 
				                  
	
    				
						  
     

</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />                    