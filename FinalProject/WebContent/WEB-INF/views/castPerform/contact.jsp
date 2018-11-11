<%@page import="kh.com.a.model.MemDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyANm_LhhJlAxtWnzBHskkYxoHViNJhqiKw&libraries=places"></script>    


<style>
/* Customize the label (the container) */
.agegradeLabel {
  display: block;
  position: relative;
  padding-left: 35px;
  margin-bottom: 12px;
  cursor: pointer;
  font-size: 22px;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

/* Hide the browser's default checkbox */
.agegradeLabel input {
  position: absolute;
  opacity: 0;
  cursor: pointer;
  height: 0;
  width: 0;
}

/* Create a custom checkbox */
.checkmark {
  position: absolute;
  top: 0;
  left: 0;
  height: 50px;
  width: 50px;
  background-color: #2F3238;
}

/* On mouse-over, add a grey background color */
.agegradeLabel:hover input ~ .checkmark {
  background-color: #ccc;
}

/* When the checkbox is checked, add a blue background */
.agegradeLabel input:checked ~ .checkmark {
  background-color: #26292E;
}

/* Create the checkmark/indicator (hidden when not checked) */
.checkmark:after {
  content: "";
  position: absolute;
  display: none;
}

/* Show the checkmark when checked */
.agegradeLabel input:checked ~ .checkmark:after {
  display: block;
}



.checkmark .agegrade{
	position: absolute;
	top:15px;
	left:14px;
	color: white;
}

/* Style the checkmark/indicator */
.agegradeLabel .checkmark:after {
  opacity:0;
 
}
</style>
<script>
   // In the following example, markers appear when the user clicks on the map.
   // Each marker is labeled with a single alphabetical character.
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

// Sets the map on all markers in the array.
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
 
<!-- Contact Section -->

<div id="contact" class="page">
<div class="container">
    <!-- Title Page -->
    <div class="row">
        <div class="span12">
            <div class="title-page">
                <h2 class="title">공연 섭외 문의</h2>
                <h6 class="title-description">공연문의 내용을 이메일이나 핸드폰 메세지를 남겨주시면 빠른연락 드리겠습니다.</h6>
                <h7 class="title-description"><font color="red">*</font>최소 1주일 전 문의 주시기 바랍니다</h7>
            </div>
        </div>
    </div>
    <!-- End Title Page -->


	<!-- 희망공연날짜: <input type="text" id="datepicker1" style="position: absolute;
	z-index: 1000; font-size: 1em; color: #CCC; text-align: center; 
	cursor: default; border: 1px solid; border-radius: 2px;
	margin: 6px 0; background: #222; box-shadow: 8px 8px 12px rgba(0,0,0,0.2);"> -->
	
	
    <!-- Contact Form -->
    <form id="contact-form"  name="Form" class="contact-form" method="post" action="castSchedule.do" onkeydown="return captureReturnKey(event)">
    <div class="row">
    	<div class="span9">
        
        	<!-- <form id="contact-form" class="contact-form" method="post" action="castSchedule.do"> -->
            	<p class="contact-name">
            		<input id="contact_name" style="margin-bottom: 1px; width: 100%" type="text" placeholder="문의자 성함" value="" name="name" />
                </p>
                <p class="contact-company">
            		<input id="contact_company" style="margin-bottom: 1px; width: 100%" type="text" placeholder="기업 또는 단체명" value="" name="compname" />
                </p>
                <p class="contact-email">
            		<input id="contact_email" style="margin-bottom: 1px; width: 100%" type="text" placeholder="이메일 주소" value="" name="email" />
                </p>
                <p class="contact-phone">
                	<input id="contact_phone" style="margin-bottom: 1px; width: 100%" type="text" placeholder="연락처 " maxlength="13" oninput="autoHypenPhone(this)" value="" name="phone"/>
                </p>
                
                <!-- Map -->
                <div id="map" style="height: 400px;" ></div>
                <input type="text" class="text text-default" id="search" placeholder="지도 검색할 위치를 입력해주세요" style="width: 100%; margin-bottom: 2px;">
                                            
                
                <p class="contact-place">
                	<input id="contact_place" style="margin-bottom: 1px; width: 100%" type="text" placeholder="상세장소(ex:강남 파이낸스센터)" value="" name="place"/>
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
                	<input id="contact-performd_ate" style="margin-bottom: 1px; width: 100%" type="date" placeholder="공연날짜" value="" name="perform_date"/>
                </p>
                
                <select  style="margin-bottom: 1px; width: 100%" name="price">
                	<option value="init" style="text-shadow: background;">예상 섭외 예산(최소 50만원 이상)</option>
  					<option value="50-100">50-100만원</option>
					  <option value="100-150">100-150만원</option>
					  <option value="150-200">150-200만원</option>
					  <option value="200-250">200-250만원</option>
				</select>
				
				<p class="contact-totalcount">
                	<input id="contact_totalcount" style="margin-bottom: 1px; width: 100%" type="number" placeholder="수용 관객 수" value="" name="totalcount"/>
                </p>
			
				
                <p class="contact-comment">
                	<textarea id="contact-comment"  placeholder="기관이나 단체에 대한 한마디 또는 다른 문의사항 입력해주세요" name="content" rows="15" style="margin-bottom: 1px; width: 100%"></textarea>
                </p>              
                	 <input id="sending" type="submit" value="문의하기" style="background: #5e0404">
                	
                <div id="response">
                
                </div>
         <!-- </form> -->
        </div>
        
        <div class="span3">
        	<div class="contact-details">
        		<p style="font-family: fantasy; color: #7da5e8">공연을 관람하는 대상, 연령별 선택 <br>(중복선택 가능)<font color="red">*</font></p>
        		<span id="ch7" style="width: auto;"></span>
        		<label class="agegradeLabel" style="font-weight: bolder; top:0px">
				  <input id="Check1" type="checkbox" name="agegrade" value="중,고등학생">
				  <span class="checkmark" style="width:88%;"><span class="agegrade" style=" left:60px;">중,고등학생</span></span>
				</label>
				<label class="agegradeLabel" style="font-weight: bolder; top:40px;">
				  <input id="Check2" type="checkbox" name="agegrade" value="대학생">
				  <span class="checkmark" style="width:88%;"><span class="agegrade" style=" left:84px;">대학생</span></span>
				</label>
				<label class="agegradeLabel" style="font-weight: bolder; top:90px;">
				  <input id="Check3" type="checkbox" name="agegrade" value="성인남녀">
				  <span class="checkmark" style="width:88%;"><span class="agegrade" style=" left:72px;">성인남녀</span></span>
				</label>
				<label class="agegradeLabel" style="font-weight: bolder; top:140px;">
				  <input id="Check4" type="checkbox" name="agegrade" value="고령자">
				  <span class="checkmark" style="width:88%;"><span class="agegrade" style=" left:84px;">고령자</span></span>
				</label>
				<label class="agegradeLabel" style="font-weight: bolder; top:190px;">
				  <input id="Check5" type="checkbox" name="agegrade" value="장애인">
				  <span class="checkmark" style="width:88%;"><span class="agegrade" style=" left:84px;">장애인</span></span>
				</label>
				<label class="agegradeLabel" style="font-weight: bolder; top:240px;">
				  <input id="Check6" type="checkbox" name="agegrade"  value="외국인">
				  <span class="checkmark" style="width:88%;"><span class="agegrade" style=" left:84px;">외국인</span></span>
				</label>

				<!-- <span id="ch1" style="width: 78%" class="wpcf7-list-item first"><input style="width: 40%" type="checkbox" class="agegrade" name="agegrade" value="중,고등학생"><span class="wpcf7-list-item-label">중,고등학생</span></span>
				<span id="ch2" style="width: 78%" class="wpcf7-list-item first"><input style="width: 40%" type="checkbox" class="agegrade" name="agegrade" value="대학생"><span class="wpcf7-list-item-label">대학생</span></span>
				<span id="ch3" style="width: 78%" class="wpcf7-list-item first"><input style="width: 40%" type="checkbox" class="agegrade" name="agegrade" value="성인남녀"><span class="wpcf7-list-item-label">성인남녀</span></span>
				<br>
				<span id="ch4" style="width: 78%" class="wpcf7-list-item first"><input style="width: 40%" type="checkbox" class="agegrade" name="agegrade" value="고령자"><span class="wpcf7-list-item-label">고령자</span></span>
				<span id="ch5" style="width: 78%" class="wpcf7-list-item first"><input style="width: 40%" type="checkbox" class="agegrade" name="agegrade" value="장애인"><span class="wpcf7-list-item-label">장애인</span></span>
				<span id="ch6" style="width: 78%" class="wpcf7-list-item first"><input style="width: 40%" type="checkbox" class="agegrade" name="agegrade" value="외국인"><span class="wpcf7-list-item-label">외국인</span></span>
				</span> -->

                
            </div>
        </div>       
    </div>
     </form>   
    <!-- End Contact Form -->
</div>
</div>


<!-- End Contact Section -->

<!-- Twitter Feed -->
<div id="twitter-feed" class="page-alternate">
	<div class="container">
    	<div class="row">
            <div class="span12">
                <div class="follow">
                    <a href="https://twitter.com/Bluxart" title="Follow Me on Twitter" target="_blank"><i class="font-icon-social-twitter"></i></a>
                </div>
                    
                <div id="ticker" class="query"> 
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Twitter Feed -->

<!-- Socialize -->
<div id="social-area" class="page">
	<div class="container">
    	<div class="row">
            <div class="span12">
                <nav id="social">
                    <ul>
                        <li><a href="https://twitter.com/Bluxart" title="Follow Me on Twitter" target="_blank"><span class="font-icon-social-twitter"></span></a></li>
                        <li><a href="http://dribbble.com/Bluxart" title="Follow Me on Dribbble" target="_blank"><span class="font-icon-social-dribbble"></span></a></li>
                        <li><a href="http://forrst.com/people/Bluxart" title="Follow Me on Forrst" target="_blank"><span class="font-icon-social-forrst"></span></a></li>
                        <li><a href="http://www.behance.net/alessioatzeni" title="Follow Me on Behance" target="_blank"><span class="font-icon-social-behance"></span></a></li>
                        <li><a href="https://www.facebook.com/Bluxart" title="Follow Me on Facebook" target="_blank"><span class="font-icon-social-facebook"></span></a></li>
                        <li><a href="https://plus.google.com/105500420878314068694" title="Follow Me on Google Plus" target="_blank"><span class="font-icon-social-google-plus"></span></a></li>
                        <li><a href="http://www.linkedin.com/in/alessioatzeni" title="Follow Me on LinkedIn" target="_blank"><span class="font-icon-social-linkedin"></span></a></li>
                        <li><a href="http://themeforest.net/user/Bluxart" title="Follow Me on ThemeForest" target="_blank"><span class="font-icon-social-envato"></span></a></li>
                        <li><a href="http://zerply.com/Bluxart/public" title="Follow Me on Zerply" target="_blank"><span class="font-icon-social-zerply"></span></a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>
<!-- End Socialize -->

<script>

	
	/* function show_alert(){ */
	/* if(confirm("문의신청을 하시겠습니까?"))
		document.forms[0].submit();
	} */
	
	 $("#sending").click(function(event) {	      
		 
		$("#lat").val(Marker_lat);
		$("#lng").val(Marker_lng);	
		
		 var name = document.forms["Form"]["name"].value;
		 var compname = document.forms["Form"]["compname"].value;
		 var email = document.forms["Form"]["email"].value;
		 var phone = document.forms["Form"]["phone"].value;
		 var place = document.forms["Form"]["place"].value;
		 var price = document.forms["Form"]["price"].value;
		 var location = document.forms["Form"]["location"].value;
		 
		 var content = document.forms["Form"]["content"].value;
		 var perform_date = document.forms["Form"]["perform_date"].value;
		 var lati = $("#lat").val(); 
		 var longi = $("#lng").val(); 
		 
		 var deny_char = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|\*]+$/; // 이름 입력시 한글 및 영어만 쓰도록 하는 체크변수
		 var regex= /[^0-9]+$/; // 전화번호 입력시 숫자만 입력하도록 체킹변수
		 
		 //document.forms["Form"]["lati"].value;
		 //document.forms["Form"]["longi"].value;
		 	
			if (name == null || name=="") {
		        alert("성함을 입력하세요");
		        return false;
		    }else if (compname==null || compname=="") {
		    	alert("회사명을 입력하세요");
		        return false;
			}else if (email==null || email=="") {
				alert("이메일을 입력하세요");
		        return false;
			}else if (phone==null || phone=="") {
				alert("전화번호를 입력해주세요");
		        return false;
			}else if (price==null || price=="") {
				alert("공연예산을 선택해주세요");
		        return false;
			}else if (location==null || location=="") {
				alert("지역을 선택해주세요");
		        return false;
			}else if (content==null || content=="") {
				alert("기타 문의사항을 입력하세요");
		        return false;
			}else if (perform_date==null || perform_date=="") {
				alert("공연날짜를 선택하세요");
		        return false;
			}else if (lati==null || lati=="") {
				alert("지도 위치를 클릭해주세요");
		        return false;
			}else if (longi==null || longi=="") {
				alert("지도 위치를 클릭해주세요");
		        return false;
			}else if (place==null || place=="") {
				alert("상세장소를 입력하세요");
		        return false;
			}else if (!deny_char.test(name)){
				alert("올바른 이름을 입력해주세요");
				return false;
			}/* else if(!/^[0-9]+$/.test(phone)){
				alert("연락처에 숫자만 입력해주세요");
				return false;
				
			} */
						
			var ch1 = $("#Check1").prop("checked"); //단일건
			var ch2 = $("#Check2").prop("checked"); //단일건
			var ch3 = $("#Check3").prop("checked"); //단일건
			var ch4 = $("#Check4").prop("checked"); //단일건
			var ch5 = $("#Check5").prop("checked"); //단일건
			var ch6 = $("#Check6").prop("checked"); //단일건
			
			if (ch1 == false && ch2 == false && ch3 == false && ch4 == false && ch5 == false && ch6 == false) {
				alert("연령대를 선택하세요");
				return false;
			}
			
			
			var email = document.getElementById("contact_email").value;

			var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

			if(exptext.test(email)==false){	
				alert("이메일형식이 올바르지 않습니다.");
				return false;
			}
			
		alert('문의신청이 되었습니다');	
		
	}); 
	 	
	 function autoHypenPhone(str){
	     str = str.toString().replace(/[^0-9]/g, '');
	     
	     var tmp = '';
	     if( str.length < 4){
	         return str;
	     }else if(str.length < 7){
	         tmp += str.substr(0, 3);
	         tmp += '-';
	         tmp += str.substr(3);
	         return tmp;
	     }else if(str.length < 11){
	         tmp += str.substr(0, 3);
	         tmp += '-';
	         tmp += str.substr(3, 3);
	         tmp += '-';
	         tmp += str.substr(6);
	         return tmp;
	     }else{              
	         tmp += str.substr(0, 3);
	         tmp += '-';
	         tmp += str.substr(3, 4);
	         tmp += '-';
	         tmp += str.substr(7);
	         return tmp;
	     }
	     return str;
	 }

	 var cellgPhone = document.getElementById('contact_phone');
	 cellgPhone.onkeyup = function(event){
	 event = event || window.event;
	 var _val = this.value.trim();
	 this.value = autoHypenPhone(_val) ;
	 }
</script>


	


