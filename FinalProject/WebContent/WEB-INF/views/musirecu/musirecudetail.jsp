
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
			<tr style="height: 8%">
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
						<!-- <h3>asd</h3>
						<h3>asd</h3>
						<h3>asd</h3>
						<h3>asd</h3>
						<h3>asd</h3> -->
						
					</div>
				</td>
			</tr>
		</table>
		
		</div>
	</div>
	
	<div class="basicDiv" align="center">
		<fmt:parseDate value="${fn:substring(now,0,10) }" var="now_date" pattern="yyyy-MM-dd"/>
		<fmt:parseDate value="${fn:substring(musiRecuBBSDto.edate,0,10) }" var="e_date" pattern="yyyy-MM-dd"/>
		
		<fmt:parseNumber value="${e_date.time / (1000*60*60*24) - now_date.time / (1000*60*60*24) }" integerOnly="true" var="resultDate"/>
		<c:if test="${resultDate >= 0 }">
		 
		<input type="button" value="취소" id="recuCancelBtn" <c:if test="${check eq true}"> 
																	style='display: none;'
															</c:if> >
		<input type="button" value="신청" id="recuBtn" <c:if test="${check eq false}"> 
																	style='display: none;'
															</c:if>>			
		</c:if>
	</div>


<script>

$("#recuBtn").click(function(){
	
	$.ajax({
		url:"recu_musi.do",
		data:{
			musi_recu_seq: $("#seq").val(),
			musiid: $("#userid").val()
		},
		type:"POST",
		dataType:"JSON",
		success:function(data){
			
			$("#recuBtn").hide();
			$("#recuCancelBtn").show();
			$("#musiCount").html(data.count);
	
		},
		error:function(){
			
		}
		
		
	});
	
});
$("#recuCancelBtn").click(function(){
	
	$.ajax({
		url:"recu_musi_cancel.do",
		data:{
			musi_recu_seq: $("#seq").val(),
			musiid: $("#userid").val()
		},
		type:"POST",
		dataType:"JSON",
		success:function(data){
			
			$("#recuCancelBtn").hide();
			$("#recuBtn").show();
			$("#musiCount").html(data.count);
	
		},
		error:function(){
			
		}
		
		
	});
	
});
</script>