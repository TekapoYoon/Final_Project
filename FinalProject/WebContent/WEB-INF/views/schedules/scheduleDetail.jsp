<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=7jDiA2eGlnohjqqS_ELa&submodules=geocoder"></script>
<head>
<style type="text/css">
#map_v3 {
	height:400px;
	margin:0 auto;
	max-width:100%;
	width:700px;
}

.iw_inner {padding:10px}
.iw_inner h3 {font-size: 18px; padding-bottom: 7px}

</style>
<h1 align="center">${getSchedule.id }의 버스킹</h1>
<div style="width:900px;margin:auto">
	<div style="display: inline-block; width: 49%; height: 500px; margin: auto">		
		<div id="map_v3"></div>
		
		<p align="center">장소 : ${getSchedule.place}</p>
	</div>
	<div style="display: inline-block; vertical-align: top; margin-left:10%; text-align: center">
		<h3 style="border-top: solid 1px white">팀명</h3><p><a data-toggle="modal" href="#museDetailModal">${getSchedule.id }</a></p>
		<h3 style="border-top: solid 1px white">날짜</h3><p>${getSchedule.scheduledate}</p>
		<h3 style="border-top: solid 1px white">시간</h3><p>${getSchedule.buskingTime}</p>
		<h3 style="border-top: solid 1px white">지역</h3><p>${getSchedule.location}</p>
	</div>	
</div>

<script>
	// div 에 설정된 id 값을 이용해서 지도를 생성합니다.
		new naver.maps.Map('map_v3', { // map_v3 사용
		center : new naver.maps.LatLng(${getSchedule.lati}, ${getSchedule.longi}), // 지도위치 설정. 위도, 경도를 입력합니다.
		zoom : 10, // 지도 줌 상태. 값은 1 ~ 14 이고 클수록 지도가 확대됩니다. (줌인)
		mapTypeControl : true // 일반, 위성 컨트롤 버튼 보이기
	});
	
		var map = new naver.maps.Map('map_v3', {
		    center: new naver.maps.LatLng(${getSchedule.lati}, ${getSchedule.longi}),
		    zoom: 10
		});

		var marker = new naver.maps.Marker({
		    position: new naver.maps.LatLng(${getSchedule.lati}, ${getSchedule.longi}),
		    map: map
		});

</script>