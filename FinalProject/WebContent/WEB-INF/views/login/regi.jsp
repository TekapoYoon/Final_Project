<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<style type="text/css">
#id,#pwd,#name,#phone,#email,#birth{
	height: 30px
}

.btn span.glyphicon {    			
	opacity: 0;				
}
.btn.active span.glyphicon {				
	opacity: 1;				
}
submit:hover{

 color: white;
}

/* Customize the label (the container) */
.genderLabel {
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
.genderLabel input {
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
  background-color: #eee;
}

/* On mouse-over, add a grey background color */
.genderLabel:hover input ~ .checkmark {
  background-color: #ccc;
}

/* When the checkbox is checked, add a blue background */
.genderLabel input:checked ~ .checkmark {
  background-color: #26292E;
}

/* Create the checkmark/indicator (hidden when not checked) */
.checkmark:after {
  content: "";
  position: absolute;
  display: none;
}

/* Show the checkmark when checked */
.genderLabel input:checked ~ .checkmark:after {
  display: block;
}



.checkmark .gender{
	position: absolute;
	top:15px;
	left:14px;
	color: white;
}

/* Style the checkmark/indicator */
.genderLabel .checkmark:after {
  opacity:0;
 
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

<script src="https://code.jquery.com/jquery-3.3.1.js"></script>

<!-- Our Work Section -->
<div class="container" align="center">
	<!-- Title Page -->
			<h3 class="title-description">당신의 정보에 맞게 회원가입을 하세요</h3>
	<!-- End Title Page -->
<br>
<div align="center" class="content">

<div class="button_base b05_3d_roll"id="general">
	<div>일반 회원가입</div>
    <div>일반 회원가입</div>
</div>
<br><br>
<div class="button_base b05_3d_roll" id="musition">
	<div>뮤지션 회원가입</div>
    <div>뮤지션 회원가입</div>
</div>

</div>

<div class="general" align="center" style="display: none; width: 50%" >
<form action="generalregi.do" method="post" id="contact-form" class="generalForm">
<h5 class="title-description" style="margin: 15 0 0 0">아이디</h5>
<table style="width: 100%">
	<tr>
		<td style="width: 80%">
			<input type="text" id="gid" name="id" placeholder="아이디을 입력하세요" onkeyup="idCheck(this.value)">
		</td>
		<td style="width: 20%">
			<div class="button_base b05_3d_roll" style="margin-left: 10px; width: 120px">
				<div>중복 체크</div>
			    <div>중복 체크</div>
			</div>
		</td>
	</tr>
</table>

<span class="id_check_label"></span>
<br>
<h5 class="title-description" style="margin: 15 0 0 0">비밀번호</h5>
<input type="password" id="gpwd" name="pwd" placeholder="비밀번호를 입력하세요">
<br>
<h5 class="title-description" style="margin: 15 0 0 0">이름</h5>
<input type="text" name="name" id="gname" placeholder="이름을 입력하세요">
<br>
<table>
	<col width="200px"><col width="200px">
	<tr>
		<td align="center">
			<h5 class="title-description" style="margin: 15 0 0 0">생년월일</h5>
		</td>
		<td align="center">
			<h5 class="title-description" style="margin: 15 0 0 0">성별</h5>
		</td>
	</tr>
	<tr>
		<td align="center">	
			<input type="date" id="gbirth" name="birth" style="width: 300px">
		</td>
		<td align="center">
			<div class="btn-group" data-toggle="buttons">	
				<label class="genderLabel" style="top: -18px; left: -34px; font-weight: bolder;">
				  <input type="radio" name="gender" checked="checked" value="남">
				  <span class="checkmark"><span class="gender">남</span></span>
				</label>
				
				<label class="genderLabel" style="top: -30px; left: 18px; font-weight: bolder;">
				  <input type="radio" name="gender" value="여">
				  <span class="checkmark"><span class="gender">여</span></span>
				</label>
			</div>
		</td>
	</tr>
</table>

<br>
<h5 class="title-description" style="margin: 15 0 0 0">연락처</h5>
<input type="text" name="phone" id="gphone" maxlength="13" oninput="autoHypenPhone(this)" placeholder="핸드폰 번호를 입력하세요">
<br>
<h5 class="title-description" style="margin: 15 0 0 0">이메일</h5>
<input type="text" name="email" id="gemail" placeholder="이메일을 입력하세요">
<br>
<table>
	<col width="200px"><col width="200px">
	<tr>
		<td align="center">
			<h5 class="title-description" style="margin: 15 0 0 0">좋아하는 장르</h5>
		</td>
		<td align="center">
			<h5 class="title-description" style="margin: 15 0 0 0">거주지</h5>
		</td>
	</tr>
	<tr>
		<td align="center">	
			<select style="width: 150px" name="genre">
				<c:forEach items="${genreList}" var="genreitem" varStatus="status">
					<option>${genreitem.genre }</option>
				</c:forEach>
			</select>
		</td>
		<td align="center">
			<select style="width: 150px" name="location">
				<c:forEach items="${locationList}" var="locationitem" varStatus="status">
					<option>${locationitem.location }</option>
				</c:forEach>
			</select>
		</td>
	</tr>
</table>
<br>
<div class="button_base b05_3d_roll" id="gRegiBtn" style="width: 400px">
	<div>회원가입</div>
	<div>회원가입</div>
</div>
</form>
</div>

<div class="musition" align="center" style="display: none;" >
<form action="musitionregi.do" id="contact-form" method="post" enctype="multipart/form-data" class="musiForm">
<table>
<tr>
<td align="center">
<img alt="" src="/FinalProject/_include/img/profile_upload.png" id="profileImg" style="height: 300px; width: 300px">
<br><br>
<input type="file" style="display: none;" id="upload" name="profileImgUpload" >

<div class="button_base b05_3d_roll" id="uploadBtn" style="width: 100%">
	<div>파일 업로드</div>
    <div>파일 업로드</div>
</div>
</td>

<td style="width: 100px"></td>

<td align="center">
<h5 class="title-description" style="margin:15 0 0 0">아이디</h5>
<table style="width: 100%">
	<tr>
		<td style="width: 80%">
			<input type="text" id="mid" name="id" placeholder="아이디을 입력하세요" onkeyup="idCheck(this.value)">
		</td>
		<td width="20%">
			<div class="button_base b05_3d_roll" style="width:120px; margin-left: 10px">
				<div>중복 체크</div>
			    <div>중복 체크</div>
			</div>
		</td>
	</tr>
</table>
<span class="id_check_label"></span>
<br>
<h5 class="title-description" style="margin: 15 0 0 0">비밀번호</h5>
<input type="password" id="mpwd" name="pwd" placeholder="비밀번호를 입력하세요">
<br>
<h5 class="title-description" style="margin: 15 0 0 0">이름</h5>
<input type="text" name="name" id="mname" placeholder="이름을 입력하세요">
<br>
<h5 class="title-description" style="margin: 15 0 0 0">팀명</h5>
<input type="text" name="teamname" id="teamname" placeholder="팀명을 입력하세요">
<br>
<h5 class="title-description" style="margin: 15 0 0 0">Position</h5>
<select style="width: 150px" name="position">
	<c:forEach items="${positionList}" var="positionitem" varStatus="status">
		<option>${positionitem.position }</option>
	</c:forEach>
</select>
<br>
<table>
	<col width="200px"><col width="200px">
	<tr>
		<td align="center">

			<h5 class="title-description" style="margin: 15 0 0 0">생년월일</h5>
		</td>
		<td align="center">
			<h5 class="title-description" style="margin: 15 0 0 0">성별</h5>
		</td>
	</tr>
	<tr>
		<td align="center">	
			<input type="date" name="birth" id="mbirth" style="width: 300px">
		</td>
		<td align="center">
			<div class="btn-group" data-toggle="buttons">
				
				<label class="genderLabel" style="top: -18px; left: -34px; font-weight: bolder;">
				  <input type="radio" name="gender" checked="checked" value="남">
				  <span class="checkmark"><span class="gender">남</span></span>
				</label>
				
				<label class="genderLabel" style="top: -30px; left: 18px; font-weight: bolder;">
				  <input type="radio" name="gender" value="여">
				  <span class="checkmark"><span class="gender">여</span></span>
				</label>

			</div>
		</td>
	</tr>
</table>

<br>

<h5 class="title-description" style="margin: 15 0 0 0">연락처</h5>
<input type="text" name="phone" id="mphone" maxlength="13" oninput="autoHypenPhone(this)" placeholder="핸드폰 번호를 입력하세요">
<br>
<h5 class="title-description" style="margin: 15 0 0 0">이메일</h5>
<input type="text" name="email" id="memail" placeholder="이메일을 입력하세요">
<br>
<table>
	<col width="200px"><col width="200px">
	<tr>
		<td align="center">
			<h5 class="title-description" style="margin: 15 0 0 0">좋아하는 장르</h5>
		</td>
		<td align="center">
			<h5 class="title-description" style="margin: 15 0 0 0">거주지</h5>
		</td>
	</tr>
	<tr>
		<td align="center">	
			<select style="width: 150px" name="genre">
				<c:forEach items="${genreList}" var="genreitem" varStatus="status">
					<option>${genreitem.genre }</option>
				</c:forEach>
			</select>
		</td>
		<td align="center">
			<select style="width: 150px" name="location">
				<c:forEach items="${locationList}" var="locationitem" varStatus="status">
					<option>${locationitem.location }</option>
				</c:forEach>
			</select>
		</td>
	</tr>
</table>
<br>
</td>
</tr>
<tr>
<td colspan="3" align="center">
<div class="button_base b05_3d_roll" id="mRegiBtn" style="width: 400px">
	<div>회원가입</div>
	<div>회원가입</div>
</div>
</td>
</tr>
</table>
</form>
</div>
</div>



<script type="text/javascript">
$("#general").click(function () {
   $(this).parent().hide(1000);
   $(".general").show(1000);
});

$("#musition").click(function () {
   $(this).parent().hide(1000);
   $(".musition").show(1000);
});


</script>



<script type="text/javascript">
	
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

var cellgPhone = document.getElementById('gphone');
cellgPhone.onkeyup = function(event){
event = event || window.event;
var _val = this.value.trim();
this.value = autoHypenPhone(_val) ;
}

var cellmPhone = document.getElementById('mphone');
cellmPhone.onkeyup = function(event){
event = event || window.event;
var _val = this.value.trim();
this.value = autoHypenPhone(_val) ;
}

$("#uploadBtn").click(function () {
	$("#upload").click();
});

$("#upload").on('change', function () {
	var reader = new FileReader();
	var tmppath="";
    reader.onload = function (e) {
    	
    	$("#profileImg").attr('src', e.target.result);
    }
    reader.readAsDataURL($(this)[0].files[0]);
    
});

var id_check=true;
function idCheck(id) {
	var idfirst=/^[A-Za-z0-9]{5,15}$/g;
	if(id.length == 0){
		$(".id_check_label").html("");
	}
	if(!idfirst.test(id)) {
		if(id.length > 5)
			$(".id_check_label").html("<font color='red'>대/소문자 및 숫자만 사용 가능합니다</font>");
		id_check = false;
		return;
	}else{
		$(".id_check_label").html("<font color='green'>사용 가능한 아이디 입니다. 중복확인 버튼을 눌러주세요.</font>");
		id_check = true;
	}
}
</script>



<script type="text/javascript">
$("#gRegiBtn").click(function () {
	
	
	
	if($("#gid").val() == ""){
		alert("아이디를 입력해 주세요");
		return;
	}
	if($("#gid").val().length < 5){
		alert("아이디가 너무 짧습니다");
		return;
	}
	if( $("#gpwd").val() == ""){
		alert("비밀번호를 입력해 주세요");
		return;
	}
	if($("#gname").val() == ""){
		alert("이름을 입력해 주세요");
		return;
	}
	if( $("#gbirth").val() == ""){
		alert("생년월일을 입력해 주세요");
		return;
	}
	if($("#gphone").val() == "" || $("#gphone").val().length != 13){
		alert("연락처를 입력해 주세요");
		return;
	}
	if($("#gemail").val() == ""){
		alert("이메일을 입력해 주세요");
		return;
	}
	
	
	$(".generalForm").attr("target", "_self").submit();
});

$("#mRegiBtn").click(function () {
	
	if($("#upload").val() == ""){
		alert("프로필 사진을 업로드 해주세요");
		return;
	}
	
	if($("#mid").val() == ""){
		alert("아이디를 입력해 주세요");
		return;
	}
	if($("#mid").val().length < 5){
		alert("아이디가 너무 짧습니다");
		return;
	}
	if( $("#mpwd").val() == ""){
		alert("비밀번호를 입력해 주세요");
		return;
	}
	if($("#mname").val() == ""){
		alert("이름을 입력해 주세요");
		return;
	}
	if($("#teamname").val() == ""){
		alert("팀명을 입력해 주세요");
		return;
	}
	if( $("#mbirth").val() == ""){
		alert("생년월일을 입력해 주세요");
		return;
	}
	if($("#mphone").val() == "" || $("#mphone").val().length != 13){
		alert("연락처를 입력해 주세요");
		return;
	}
	if($("#memail").val() == ""){
		alert("이메일을 입력해 주세요");
		return;
	}
	
	
	$(".musiForm").attr("target", "_self").submit();
});
</script>
