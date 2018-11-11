<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<script language="javascript">
//ENTER 안먹게 하는것
function captureReturnKey(e) {
    if(e.keyCode==13 && e.srcElement.type != 'textarea')
    return false;
}
</script>

<script type="text/javascript" src="./smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>

<div class="container" style="width: 750px;">
	<!-- Title Page -->
	<div class="row">
			<div class="title-page">
				<h2 class="title">공연 추가</h2>
				<h6 class="title-description">공연에 대한 상세항목 기재 바랍니다.</h6>
			</div>
	</div>
	<!-- End Title Page -->
	
	<form id="contact-form" class="contact-form" method="post" enctype="multipart/form-data" action="perform_schedulewriteAf.do" onkeydown="return captureReturnKey(event)">
    <input type="hidden" name="perform_seq" value="${performCastBBSDto.perform_seq }">
    <input type="hidden" name="musi_recu_seq" value="${musi_recu_seq }">
    <div class="row">
    		<p class="contact-name">
            	<input id="contact_title" type="text" placeholder="제목 입력" value="" name="title" id="title"/>
			</p>
			<div align="center" style="border: 1px solid #26292E;">
				<input type="text" value="포스터 등록" readonly="readonly">
				<div align="center" style="padding-top: 10px; padding-bottom: 10px;">
					
					<img alt="파일 없슴" src="" id="consertImg" style="height: 280px; width: 218px">
					<br><br>
					<input type="file" style="display: none;" id="upload" name="consertImgUpload" >
					<div class="button_base b05_3d_roll" style="width: 218px" id="uploadBtn">
						<div>파일 업로드</div>
						<div>파일 업로드</div>
					</div>					
				</div>
			<p class="contact-ticket_price">
            	<input id="contact_ticket_price" type="number" placeholder="티켓 가격 입력" value="" name="ticket_price"/>
			</p>
			<p>
				<table style="width: 100%">
					<col width="40%"><col width="20%"><col width="40%">
					<tr style="height :50px; background-color: #26292E">
						<th>
							지원 팀 목록
						</th>
						<th rowspan="2">
							<div id="btnAdd" class="button_base b05_3d_roll" style="width: 99%; left:1px">
								<div>추 가</div>
								<div>추 가</div>
							</div>
							<br>
							<div id="btnSub" class="button_base b05_3d_roll" style="width: 99%; left:1px">
								<div>삭 제</div>
								<div>삭 제</div>
							</div>
						</th>
						<th>
							공연 팀 목록
						</th>
					</tr>
					<tr>
						<td>
							<select id="leftValues" size="10" multiple="multiple" style="background-color:#2F3238; overflow: auto; padding:2; height: 300px;">
								<c:forEach items="${recuMusiInfoList }" var="item" varStatus="status">
								
									<option style="margin: 2px; width: auto; height: auto">${item.musiid }</option>
								</c:forEach>
								
								
								<!-- <option style="margin: 2px; width: auto; height: auto">1</option>
							 -->
					
							</select>
						</td>
						<td>
							<select id="rightValues" name="musiList" size="10" multiple="multiple" style="background-color:#2F3238; overflow: auto; padding:2; height: 300px;">
							
							</select>
						</td>			
					</tr>
					<tr style="height: 50px; background-color: #26292E">
						<td colspan="3">
						</td>
					</tr>
				</table>
			</p>
			
			<p class="contact-notice">
				<div align="center" style="border: 1px solid #26292E;">
					<input type="text" value="Notice 입력" readonly="readonly">
	            	
	            	<div style="width: 702px; height:500px; margin: 0px; padding-bottom: 10px; padding-top: 10px;">
					<textarea name="notice" id="ir2" style="width: 700px; height: 450px;"></textarea>   
	            	<!-- <input id="contact_notice" type="text" placeholder="알려드립니다 입력" value="" name="notice" /> -->
					</div>
				</div>
			</p>
			<p class="contact-consert_info" >
				<div align="center" style="border: 1px solid #26292E;">
					<input type="text" value="공연 정보 입력" readonly="readonly">
					<br>
					<div style="width: 702px; height:500px; margin: 0px;  padding-bottom: 10px; padding-top: 10px;">
					<textarea name="consert_info" id="ir1" style="width	: 700px; height: 450px;"></textarea>   
	            	<!-- <input id="contact_consert_info" type="text" placeholder="공연 정보 입력" value="" name="consert_info" /> -->
					</div>
				</div>
			</p>
			 <input id="sending" type="button" onclick="submitContents(this)" value="공연 공고 올리기" style="background: #5e0404">
                </div>	
    </div>
    </form>
	
</div>

<script type="text/javascript">

$("#uploadBtn").click(function () {
	$("#upload").click();
});

$("#upload").on('change', function () {
	var reader = new FileReader();
	var tmppath="";
    reader.onload = function (e) {
    	
    	$("#consertImg").attr('src', e.target.result);
    }
    reader.readAsDataURL($(this)[0].files[0]);
    
});

$("#btnSub").click(function () {
    var selectedItem = $("#rightValues option:selected");
    $("#leftValues").append(selectedItem);
});

$("#btnAdd").click(function () {
    var selectedItem = $("#leftValues option:selected");
    $("#rightValues").append(selectedItem);
});

$(document).on("dblclick","option",function () {
	//alert(this.value);
	var musiid=this.value;
	$.ajax({
		url:"musiInfo.do",
		data:{
			id:musiid
		},
		dataType:"json",
		success:function(data){
			$("#meminfo_id").html(data.musiInfo.id);
			$("#meminfo_teamname").html(data.musiInfo.teamname);
			$("#meminfo_location").html(data.musiInfo.location);
			$("#meminfo_genre").html(data.musiInfo.genre);
			$("#meminfo_email").html(data.musiInfo.email);
			$("#meminfo_phone").html(data.musiInfo.phone);
			$("#followerCnt").html(data.followerCnt);
			
		},
		error:function(){
			
		}
		
	});
	
	
	$("#museDetailModal").modal("show");
});


</script>
<script type="text/javascript">
      var oEditors = [];

      // 추가 글꼴 목록
      //var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];

      nhn.husky.EZCreator.createInIFrame({
         oAppRef : oEditors,
         elPlaceHolder : "ir1",
         sSkinURI : "./smarteditor/SmartEditor2Skin.html",
         htParams : {
            bUseToolbar : true, // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : true, // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : true, // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            //bSkipXssFilter : true,      // client-side xss filter 무시 여부 (true:사용하지 않음 / 그외:사용)
            //aAdditionalFontList : aAdditionalFontSet,      // 추가 글꼴 목록
            fOnBeforeUnload : function() {
               //alert("완료!");
            }
         }, //boolean
         fOnAppLoad : function() {
            //예제 코드
            //oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
         },
         fCreator : "createSEditor2"
      });

</script>
<script type="text/javascript">
      var oEditors2 = [];

      // 추가 글꼴 목록
      //var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];

      nhn.husky.EZCreator.createInIFrame({
         oAppRef : oEditors2,
         elPlaceHolder : "ir2",
         sSkinURI : "./smarteditor/SmartEditor2Skin.html",
         htParams : {
            bUseToolbar : true, // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : true, // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : true, // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            //bSkipXssFilter : true,      // client-side xss filter 무시 여부 (true:사용하지 않음 / 그외:사용)
            //aAdditionalFontList : aAdditionalFontSet,      // 추가 글꼴 목록
            fOnBeforeUnload : function() {
               //alert("완료!");
            }
         }, //boolean
         fOnAppLoad : function() {
            //예제 코드
            //oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
         },
         fCreator : "createSEditor2"
      });

      function submitContents(elClickedObj) {
    	  oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됩니다.
    	  oEditors2.getById["ir2"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됩니다.
    	  
    	  if($("#upload").val() == ""){
    			alert("공연 포스터를 업로드 해주세요");
    			//location.href="#upload";
    			return;
    		}

    		if($("#title").val() == ""){
    			alert("제목을 입력해 주세요");
    			//location.href="#title";
    			return;
    		}
    		if($("#contact_ticket_price").val() == ""){
    			alert("티켓 가격을 입력해 주세요");
    			//location.href="#contact_ticket_price";
    			return;
    		}
    		if($("#rightValues").children('option').length == 0){
    			alert("공연할 뮤지션을 1명 이상 선택해야 합니다");
    			//location.href="#rightValues";
    			return;
    		}
/* 
    		if($("#ir2").val() == ""){
    			alert("notice를 작성해주세요~!");
    			//location.href="#ir2";
    			return;
    		}
    		if($("#ir1").val() == ""){
    			alert("공연 정보를 작성해 주세요~!");
    			//location.href="#ir1";
    			return;
    		} */
    		
    	  $("#rightValues option").attr("selected","selected");
  
    	  
    	  alert($("#rightValues").children('option').length);
    	 
         try {
            elClickedObj.form.submit();
         } catch (e) {
         }
      }
	
</script>
