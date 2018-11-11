<%@page import="kh.com.a.model.MemDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	MemDto dto=(MemDto)session.getAttribute("user");
%>
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

</style>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>

<!-- Our Work Section -->
<div class="container" align="center">
	<!-- Title Page -->
			<h2 class="title">My Page</h2>
	<!-- End Title Page -->
</div>
<%if(dto.getAuth()==1){//일반회원%>
<div class="general" align="center">
<div class="container" style="width: 50%">
<form action="generalUpdate.do" id="contact-form" class="contact-form" method="post">
<h5 class="title-description" style="margin: 15 0 0 5">I D</h5>
<input type="text" id="gid" name="id" placeholder="아이디을 입력하세요" style="width: 50%" readonly="readonly" value="<%=dto.getId() %>">
<br>
<h5 class="title-description" style="margin: 15 0 0 5">비밀번호</h5>
<input type="password" id="gpwd" name="pwd" style="width: 50%" placeholder="비밀번호를 입력하세요" value="<%=dto.getPwd() %>">
<br>
<h5 class="title-description" style="margin: 15 0 0 5"	>생년월일</h5>
<input type="date" id="gbirth" name="birth" style="width: 50%" value="<%=dto.getBirth() %>">
<br>
<h5 class="title-description" style="margin: 15 0 0 5">연락처</h5>
<input type="text" name="phone" id="gphone" maxlength="13" style="width: 50%" oninput="autoHypenPhone(this)" placeholder="핸드폰 번호를 입력하세요" value="<%=dto.getPhone() %>">
<br>
<h5 class="title-description" style="margin: 15 0 0 5">이메일</h5>
<input type="text" name="email" placeholder="이메일을 입력하세요" style="width: 50%" value="<%=dto.getEmail() %>">
<br>
<table>
	<col width="200px"><col width="200px">
	<tr>
		<td align="center">
			<h5 class="title-description" style="margin: 15 0 0 0;">좋아하는 장르</h5>
		</td>
		<td align="center">
			<h5 class="title-description" style="margin: 15 0 0 0;">거주지</h5>
		</td>
	</tr>
	<tr>
		<td align="center">	
			<select style="width: 150px" name="genre">
				<c:forEach items="${genreList}" var="genreitem" varStatus="status">
					<option <c:if test="${genreitem.genre eq user.genre}">selected='selected'</c:if>  >${genreitem.genre }</option>
				</c:forEach>
			</select>
		</td>
		<td align="center">
			<select style="width: 150px" name="location">
				<c:forEach items="${locationList}" var="locationitem" varStatus="status">
					<option <c:if test="${locationitem.location eq user.location}">selected='selected'</c:if> >${locationitem.location }</option>
				</c:forEach>
			</select>
		</td>
	</tr>
</table>
<br>
<input type="submit" value="정보 수정">
</form>
</div>
</div>
<%}else{	//뮤지션%>


<div class="musition" align="center">
<form action="musitionUpdate.do" method="post" id="contact-form" class="contact-form"  enctype="multipart/form-data">
<table>
<tr>
<td align="center">
<!-- src d://tmp로 하면 권한때문에 이미지를 못가지고옴... -->

<img alt="" src="/FinalProject/upload/${user.new_profilIMG }" id="profileImg" style="height: 300px; width: 300px">
<br><br>
<input type="file" style="display: none;" id="upload" name="profileImgUpload" >
<input type="button" value="파일 업로드" id="uploadBtn" style="width: 300px; height: 50px">
</td>

<td style="width: 100px"></td>

<td align="left">
<div class="row">
<h5 class="title-description" style="margin: 15 0 0 5">I D</h5>
<p class="contact-name">
<input type="text" id="mid" name="id" placeholder="아이디을 입력하세요" readonly="readonly" value="${user.id}">
</p>
<h5 class="title-description" style="margin: 15 0 0 5">비밀번호</h5>
<input type="password" id="mpwd" name="pwd" placeholder="비밀번호를 입력하세요" value="${user.pwd }">
<br>
<h5 class="title-description" style="margin: 15 0 0 5">팀명</h5>
<input type="text" name="teamname" placeholder="팀명을 입력하세요" value="${user.teamname }">
<br>
<h5 class="title-description" style="margin: 15 0 0 5">Position</h5>
<select style="width: 100%" name="position">
	<c:forEach items="${positionList}" var="positionitem" varStatus="status">
		<option <c:if test="${positionitem.position eq user.position}">selected='selected'</c:if> >${positionitem.position }</option>
	</c:forEach>
</select>
<br>
<h5 class="title-description" style="margin: 15 0 0 5">생년월일</h5>
<input type="date" name="birth" style="width: 100%" value="${user.birth }">
<br>
<h5 class="title-description" style="margin: 15 0 0 5">연락처</h5>
<input type="text" name="phone" maxlength="13" id="mphone" oninput="autoHypenPhone(this.value)" placeholder="핸드폰 번호를 입력하세요" value="${user.phone }">
<br>
<h5 class="title-description" style="margin: 15 0 0 5">이메일</h5>
<input type="text" name="email" placeholder="이메일을 입력하세요" value="${user.email }">
<br>
<table>
	<col width="200px"><col width="200px">
	<tr>
		<td align="center">
			<h5 class="title-description" style="margin: 15 0 0 0;">좋아하는 장르</h5>
		</td>
		<td align="center">
			<h5 class="title-description" style="margin: 15 0 0 0;">거주지</h5>
		</td>
	</tr>
	<tr>
		<td align="center">	
			<select style="width: 150px" name="genre">
				<c:forEach items="${genreList}" var="genreitem" varStatus="status">
					<option <c:if test="${genreitem.genre eq user.genre }">selected='selected'</c:if> >${genreitem.genre }</option>
				</c:forEach>
			</select>
		</td>
		<td align="center">
			<select style="width: 150px" name="location">
				<c:forEach items="${locationList}" var="locationitem" varStatus="status">
					<option <c:if test="${locationitem.location eq user.location }">selected='selected'</c:if> >${locationitem.location }</option>
				</c:forEach>
			</select>
		</td>
	</tr>
</table>
<br>

</div>
</td>
</tr>
<tr>
<td colspan="3" align="center">
<input type="submit" value="정보 수정">
</td>
</tr>
</table>
</form>
</div>
<%}%>
<br>
<div class="container" align="center">
<hr>
<br>
	<h2 class="title">Ticket 구매 이력</h2>
<table style="width: 100%; background-color: #26292E;" >
<col width="20%"><col width="40%"><col width="20%"><col width="20%">
<tr>
	<th>
		포스터
	</th>
	<th>
		제목
	</th>
	<th>
		티켓 번호
	</th>
	<th>
		공연 날짜
	</th>
</tr>
<c:if test="${empty myTicketList}">
<tr>
	<td colspan="4" align="center">
		<h3 style="margin: 30">구매한 이력이 없습니다</h3>
	</td>
</tr>
</c:if>
<c:forEach items="${myTicketList }" var="tickets">
<tr align="center">
	<td>
		<img src="/FinalProject/upload/${tickets.new_consertIMG }" style="width: 70%; height: auto; margin: 10px">
	</td>
	<td>
		<a href="perform_scheduledetail.do?perform_schedule_seq=${tickets.perform_schedule_seq }">${tickets.title }</a>
	</td>
	<td>
		${tickets.ticketserial }
	</td>
	<td>
		${tickets.perform_date }
	</td>
</tr>
</c:forEach>

</table>
</div>

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

 $(document).on("keyup","#gphone",function(event){
		event = event || window.event;
		var _val = this.value.trim();
		this.value = autoHypenPhone(_val) ;	
	});
$(document).on("keyup","#mphone",function(event){
	event = event || window.event;
	var _val = this.value.trim();
	this.value = autoHypenPhone(_val) ;	
});


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
</script>