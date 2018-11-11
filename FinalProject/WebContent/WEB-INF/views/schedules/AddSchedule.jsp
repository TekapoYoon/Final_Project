<%@page import="kh.com.a.model.MemDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyANm_LhhJlAxtWnzBHskkYxoHViNJhqiKw&libraries=places"></script> 

<style>
/* ### ### ### 05 */
.button_base {
    margin: 0;
    border: 0;
    font-size: 18px;
    position: relative;
    width: 100px;
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
<% 
MemDto dto = (MemDto)session.getAttribute("user");
%>
var labels = '▼';
var labelIndex = 0;
var lat= 5.980408;
var lng = 116.0734568;
var Marker_lat=null;
var Marker_lng=null;
var Marker= [];
var id = '<%=dto.getId()%>';
var map;

function initialize() {
  Marker_lat=null;
  Marker_lng=null;
  map = new google.maps.Map(document.getElementById('map'), {
      zoom: 12,
      center: {lat:lat, lng:lng}
   });
   // This event listener calls addMarker() when the map is clicked.
   google.maps.event.addListener(map, 'click', function(event) {
      //Marker 초기화 부분 modal은 마커 1개만 필요하기 떄문에 누를떄마다 선 초기화
      if(Marker.length!=0){
         Marker[0].setMap(null);
         Marker=[];   
      }
           
      Marker_lat=event.latLng.lat();
      Marker_lng=event.latLng.lng();
           
      add_Marker(event.latLng, map);
   });
      
   //자동완성    
     var input = document.getElementById('search');

     var autocomplete = new google.maps.places.Autocomplete(input);

     // Bind the map's bounds (viewport) property to the autocomplete object,
     // so that the autocomplete requests use the current map bounds for the
     // bounds option in the request.
     autocomplete.bindTo('bounds', map);

     // Set the data fields to return when the user selects a place.
     autocomplete.setFields(
         ['address_components', 'geometry', 'icon', 'name']);


     autocomplete.addListener('place_changed', function() {
      var place = autocomplete.getPlace();
      if (!place.geometry) {
         // User entered the name of a Place that was not suggested and
            // pressed the Enter key, or the Place Details request failed.
         window.alert("자동완성된 장소목록중에서 선택해 주세요");
         return;
      }
      
      // If the place has a geometry, then present it on a map.
      if (place.geometry.viewport) {
         map.fitBounds(place.geometry.viewport);
      } else {
         map.setCenter(place.geometry.location);
         map.setZoom(17);  // Why 17? Because it looks good.
      }
      if (place.address_components) {
         address = [
            (place.address_components[0] && place.address_components[0].short_name || ''),
            (place.address_components[1] && place.address_components[1].short_name || ''),
            (place.address_components[2] && place.address_components[2].short_name || '')
         ].join(' ');
      }
      window.alert("지도에 해당 장소를 클릭해 주세요");
       
   });

}

// Adds a marker to the map.
function add_Marker(location) {
   // Add the marker at the clicked location, and add the next-available label
   // from the array of alphabetical characters.
   var marker = new google.maps.Marker({
      position: location,
      label: labels[labelIndex++ % labels.length],
      map: map,
      title:"뿌리뿌리"
   });
   Marker.push(marker);
}

//Sets the map on all markers in the array.
	function setMapOnAll(map) {
	  for (var i = 0; i < basic_Marker.length; i++) {
		  Marker[i].setMap(map);
	  }
	}

	// Removes the markers from the map, but keeps them in the array.
	function clearMarkers() {
	  setMapOnAll(null);
	}

	// Shows any markers currently in the array.
	function showMarkers() {
	  setMapOnAll(map);
	}

	// Deletes all markers in the array by removing references to them.
	function deleteMarkers() {
	  clearMarkers();
	  Marker = [];
	}

google.maps.event.addDomListener(window, 'load', initialize);
</script>



<script language="javascript">
//ENTER 안먹게 하는것
function captureReturnKey(e) {
    if(e.keyCode==13 && e.srcElement.type != 'textarea')
    return false;
}
</script>

<div id="contact" class="page">
<div class="container">
<div class="row">
        <div class="span12">
            <div class="title-page">
                <h2 class="title">버스킹일정 등록</h2>
                <h6 class="title-description">버스킹 일정을 등록해 사람들이게 공연계획을 공유하세요!</h6>
            </div>
        </div>
    </div>

<form method="post" action="AddScheduleAf.do" class="generalForm" onkeydown="return captureReturnKey(event)">
    <div class="row">
    	<div class="span9" style="margin-left:16%">
			<p class="contact-name">
				<input type="text" style="margin-bottom: 1px; width: 100%" value="${user.id }" name="id" readonly="readonly" />
			</p>
			   <p class="contact-company">
				<input type="text" style="margin-bottom: 1px; width: 100%"  value="${user.teamname }" name="teamname" readonly="readonly" />
			   </p>
			  
			   <!-- Map -->
			   <div id="map" style="height: 400px;"></div>
			   <input type="text" style="margin-bottom: 1px; width: 100%" class="text text-default" id="search" placeholder="지도 검색할 위치를 입력해주세요" style="width: 100%">

			   <p class="contact-place">
			   	<input type="text" style="margin-bottom: 1px; width: 100%" placeholder="상세장소(ex:강남 파이낸스센터)" name="place"/>
			    <input type="hidden" name="lati" id="lat" value="">
			    <input type="hidden" name="longi" id="lng" value="">
			   </p>
			   
			   <select style="margin-bottom: 1px; width: 100%" name="location">
			   	<option draggable="false">지역</option>
			<c:forEach items="${locationList}" var="locationitem" varStatus="status">
			<option>${locationitem.location }</option>
			</c:forEach>
			</select>
			
			<p class="contact-performdate">
				<input type="date" style="margin-bottom: 1px; width: 100%" placeholder="버스킹 날짜" value="" name="scheduledate"/>
			</p>
			
			<select style="margin-bottom: 1px; width: 100%" name="buskingTime">
			<option draggable="false">시간</option>
			<c:forEach items="${timetableList}" var="timeitem" varStatus="status">
			<option>${timeitem.buskingTime }</option>
			</c:forEach>
			</select>
			
			<div class="button_base b05_3d_roll" id="btnAdd" style="margin: auto; margin-top: 10px">
				<div>일정등록</div>
			    <div>일정등록</div>
			</div>
		</div>
	</div>
</form>
</div>
</div>

<script>
	function show_alert(){
	if(confirm("버스킹일정을 등록하시겠습니까?"))
		document.forms[0].submit();
	}
	
	 $("#btnAdd").click(function() {	
		$("#lat").val(Marker_lat);
		$("#lng").val(Marker_lng);
		alert("lat = " + $("#lat").val());
		alert("lng = " + $("#lng").val());
		alert('버스킹일정 등록완료');
		$(".generalForm").attr("target", "_self").submit();
	}); 
</script>
