<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<style>
 .basicDiv{
	margin:20px;
	padding:10px;
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
    background-color: #26292E;
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
    color: #26292E;
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
    
<input type="hidden" id="userid" value="${user.id }">
<input type="hidden" id="seq" value="${musiRecuBBSDto.musi_recu_seq }">


<div class="container" style="background-color: #26292E; box-shadow: 3px 3px 20px #000;" >
	<div class="basicDiv" style="margin-bottom: 0px; padding-bottom: 0px;">
		<table style="width: 100%; height: 100%">
			<col width="15%"><col width="35%"><col width="15%"><col width="35%">
			<tr style="height: 10%">
				<th colspan="4">
					<h1>${musiRecuBBSDto.title}</h1>
				</th>
			</tr>
			<tr style="height: 8%">
				<th>
					<h3>지역</h3>
				</th>
				<td>
					<h3>${performCastBBSDto.location }</h3>
				</td>
				<th>
					<h3>장소</h3>
				</th>
				<td>
					<h3>${performCastBBSDto.place }</h3>
				</td>
			</tr>
			<tr>
				<td colspan="4" style="height: 400px">
					<div id="map" style="height: 100%; " ></div>
				</td>
			</tr>
			<tr style="height: 8%;">
				<th>
					<br>
					<h3>공연일정</h3>
				</th>
				<td colspan="3">
					<br>
					<fmt:parseDate value="${fn:substring(performCastBBSDto.perform_date,0,10) }" var="perform_date" pattern="yyyy-MM-dd"/>
					<h3><fmt:formatDate value="${perform_date }" pattern="yyyy년 MM월 dd일"/></h3>
				</td>
			</tr>
			<tr style="height: 8%">
				<th>
					<h3>관람연령 </h3>
				</th>
				
				<td colspan="3">
					<h3>${performCastBBSDto.agegrade }</h3>
				</td>
			</tr>
			<tr style="height: 8%">
				<th>
					<h3>관객 수</h3>
				</th>
				
				<td>
					<h3>${performCastBBSDto.totalcount }</h3>
				</td>
				<th>
					<h3>지원자 수</h3>
				</th>
				
				<td>
					<h3><span id="musiCount">${musiCount }</span></h3>
				</td>
			</tr>
			<tr style="height: 8%">
				<th>
					<h3>주관</h3>
				</th>
				<td colspan="3">
					<h3>${performCastBBSDto.compname }</h3>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<div class="basicDiv" style="border: 1px solid gray; margin-top: 0px; margin-bottom: 5%">
						${musiRecuBBSDto.content}<br>
					</div>
				</td>
			</tr>
		</table>
		
		</div>
	</div>
	
	<div class="basicDiv" align="center">	
		<div class="button_base b05_3d_roll" id="addPerformBtn" style="width: 400px" onclick="location.href='perform_schedulewrite.do?perform_seq=${musiRecuBBSDto.perform_seq}&musi_recu_seq=${musiRecuBBSDto.musi_recu_seq }'">
			<div>공연 일정 추가</div>
			<div>공연 일정 추가</div>
		</div>
	</div>
</div>
