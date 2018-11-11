<%@page import="kh.com.a.model.PerformScheduleBBSDto"%>
<%@page import="kh.com.a.model.PerformCastBBSDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	String iamgePath=request.getServletContext().getRealPath("/upload");
%>
<style>
h3{
	margin:0px;
	padding: 0px;
}
</style>
<style>
/* ### ### ### 05 */
.button_base {
    margin: 0;
    border: 0;
    font-size: 18px;
    position: relative;
    width: 230px;
    height: 50px;
    text-align: center;
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    -webkit-user-select: none;
    cursor: default;
}
.button_base:hover {
    cursor: pointer;
}

.b05_3d_roll {
    perspective: 500px;
    -webkit-perspective: 500px;
    -moz-perspective: 500px;
}

.b05_3d_roll div {
    position: absolute;
    text-align: center;
    width: 100%;
    height: 51px;
    padding: 10px;
    pointer-events: none;
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
}

.b05_3d_roll div:nth-child(1) {
    color: #ffffff;
    background-color: #ffffff;
    transform: rotateX(90deg);
    -webkit-transform: rotateX(90deg);
    -moz-transform: rotateX(90deg);
    transition: all 0.2s ease;
    -webkit-transition: all 0.2s ease;
    -moz-transition: all 0.2s ease;
    transform-origin: 50% 50% -25px;
    -webkit-transform-origin: 50% 50% -25px;
    -moz-transform-origin: 50% 50% -25px;
}

.b05_3d_roll div:nth-child(2) {
    color: #ffffff;
    background-color: #7F8289;
    transform: rotateX(0deg);
    -webkit-transform: rotateX(0deg);
    -moz-transform: rotateX(0deg);
    transition: all 0.2s ease;
    -webkit-transition: all 0.2s ease;
    -moz-transition: all 0.2s ease;
    transform-origin: 50% 50% -25px;
    -webkit-transform-origin: 50% 50% -25px;
    -moz-transform-origin: 50% 50% -25px;
}

.b05_3d_roll:hover div:nth-child(1) {
    color: #7F8289;
    transition: all 0.2s ease;
    -webkit-transition: all 0.2s ease;
    -moz-transition: all 0.2s ease;
    transform: rotateX(0deg);
    -webkit-transform: rotateX(0deg);
    -moz-transform: rotateX(0deg);
}

.b05_3d_roll:hover div:nth-child(2) {
    background-color: #ffffff;
    transition: all 0.2s ease;
    -webkit-transition: all 0.2s ease;
    -moz-transition: all 0.2s ease;
    transform: rotateX(-90deg);
    -webkit-transform: rotateX(-90deg);
    -moz-transform: rotateX(-90deg);
}


</style>
<script>
$(function(){ 
	var $win = $(window); 
	var top = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다. 
	/*사용자 설정 값 시작*/  	
 	var speed = 500; // 따라다닐 속도 : "slow", "normal", or "fast" or numeric(단위:msec) 
	var easing = 'linear'; // 따라다니는 방법 기본 두가지 linear, swing 
	var $layer = $('.float_sidebar'); // 레이어 셀렉팅 
	var layerTopOffset = 0; // 레이어 높이 상한선, 단위:px 
	$layer.css('position', 'relative').css('z-index', '1'); 
	/*사용자 설정 값 끝*/ 
	// 스크롤 바를 내린 상태에서 리프레시 했을 경우를 위해 
	if (top > 0 ) 
		$win.scrollTop(layerTopOffset+top); 
	else 
		$win.scrollTop(0); 
	
	//스크롤이벤트가 발생하면 
	$(window).scroll(function(){ 
		yPosition = $win.scrollTop() - 550; //이부분을 조정해서 화면에 보이도록 맞추세요 
		if (yPosition < 0) {
			yPosition = 0; 
		} 
		$layer.animate({"top":yPosition }, {duration:speed, easing:easing, queue:false}); 
	}); 
});

</script>


<script>
// Initialize and add the map
function initMap() {
  // The location of Uluru
  var uluru = {lat: ${performCastBBSDto.lati}, lng: ${performCastBBSDto.longi}};
  // The map, centered at Uluru
  var map = new google.maps.Map(
      document.getElementById('map'), {zoom: 12, center: uluru});
  // The marker, positioned at Uluru
  var marker = new google.maps.Marker({position: uluru, map: map});
}
</script>
    <!--Load the API from the specified URL
    * The async attribute allows the browser to render the page while the API loads
    * The key parameter will contain your own API key (which is not needed for this tutorial)
    * The callback parameter executes the initMap() function
    -->
<script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyANm_LhhJlAxtWnzBHskkYxoHViNJhqiKw&callback=initMap">
</script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>


<%
	PerformScheduleBBSDto pDto = (PerformScheduleBBSDto)request.getAttribute("performScheduleBBSDto");
	PerformCastBBSDto cDto = (PerformCastBBSDto)request.getAttribute("performCastBBSDto");
%>
<script>


function requestPay() {
	
	IMP.init("imp13945276"); 

	//IMP.request_pay(param, callback) 호출
	IMP.request_pay({ // param
	    pg: "html5_inicis",
	    pay_method: "card",
	    merchant_uid: "merchant_"+new Date().getTime(),
	    name: '<%=pDto.getTitle() %>',
	    amount: <%-- <%=pDto.getTicket_price() %> --%> 100,
	    buyer_email: '<%=cDto.getEmail() %>',
	    buyer_name: '<%=cDto.getCompname()%>',
	    buyer_tel: '<%=cDto.getPhone() %>',
	    buyer_addr: " ",
	    buyer_postcode: " "
	}, function (rsp) { // callback
	    if (rsp.success) {
	        // 결제 성공 시 로직,		
	        location.href="buyTicket.do?perform_schedule_seq="+<%=pDto.getPerform_schedule_seq() %>;
	    } else {
	        // 결제 실패 시 로직,
	    	 alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
	    }
	});	
}

</script>
<div class="container" style=" width:950px;">
	<div style="float: left; background-color: #26292E; padding: 20px; box-shadow: 1px 1px 10px #000; width:73%"  >
		<table style="width: 100%">
			<tr>
				
				
				<th colspan="2" align="left">
					<h2>${performScheduleBBSDto.title }</h2>
				</th>
			</tr>
			<tr>
				<td>
					<table style="border: 1px gray solid; width: 100%; ">
						<tr>
							<td style="width: 40%">
							<img style="width: 218px; margin:20px; height: 280px;" src="/FinalProject/upload/${performScheduleBBSDto.new_consertIMG }">
							</td>
							<td style="width: 60%; padding: 20px;">
								<span>지역: ${performCastBBSDto.location }</span><br>
								<span>장소: ${performCastBBSDto.place }</span><br>
								<fmt:parseDate value="${fn:substring(performCastBBSDto.perform_date,0,10) }" var="perform_date" pattern="yyyy-MM-dd"/>
								<span>날짜: <fmt:formatDate value="${perform_date }" pattern="yyyy년 MM월 dd일"/></span><br>
								<hr>
								<span>가격정보: ${performScheduleBBSDto.ticket_price }</span><br>							
								<hr>
								<span>참가뮤지션: 
									<c:if test="${musiList ne null }">
										<c:forEach items="${musiList }" var="items">
											${items }
										</c:forEach>							
								
									</c:if>  
								</span><br>
								
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<hr style="border: 1.8px solid white;">
					<h3>공연시간 정보</h3> 
					<hr>
					<div class="perform_date" style="min-height: 100px">
					<fmt:formatDate value="${perform_date }" pattern="yyyy년 MM월 dd일"/>
					</div> 
					<hr style="border: 1.8px solid white;">
					<h3>공연장소 위치 및  지도</h3> 
					<hr>
					<div id="map" style="width: 100%; height: 300px"></div>
					<div class="place">
						${performCastBBSDto.place }
					</div>
					<hr style="border: 1.8px solid white;">
					<h3>알립니다</h3>
					<hr>
					<div class="notice">
						${performScheduleBBSDto.notice }
					</div>
					<hr style="border: 1.8px solid white;">
					<h3>작품설명</h3>
					<hr>
					<div class="perform_info">
						${performScheduleBBSDto.consert_info }	
					</div>
					<hr style="border: 1.8px solid white;">
					<h3>기획사 정보</h3>
					<hr>
					<div class="company_info">
						주관 및 주최: ${performCastBBSDto.compname }<br>
						대표번호(문의): ${performCastBBSDto.phone }<br>
						이메일: ${performCastBBSDto.email }<br>
					</div>
				</td>
				
			</tr>
		</table>
	</div>
	<div class="float_sidebar" align="center" style="float: left; margin: 10px; background-color: #26292E; width: 20%;height: 200px; box-shadow: 1px 1px 10px #000; ">
		
		<div style="padding: 10px;" align="left">
			<span>상품명: ${performScheduleBBSDto.title } </span><br>
			<span>가격: ${performScheduleBBSDto.ticket_price } </span><br>
			<span>남은 티켓수: ${countTicket } </span>
		</div>
		<br>
		<!-- <button onclick="requestPay()" style="width: 150px; height: 50px">결제하기</button> -->
		<div class="button_base b05_3d_roll" id="mRegiBtn" style="width: 160px; height: 50px" onclick="requestPay()">
			<div>결제하기</div>
			<div>결제하기</div>
		</div>
	</div>
</div>
