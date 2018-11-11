<%@ page import="kh.com.a.model.MemDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    




<fmt:requestEncoding value="utf-8"/>



<%
	MemDto dto = (MemDto)session.getAttribute("user");
%>

<style>
.modal.fade{
	top:-100%;
}
.modal-body {
	vertical-align: middle;
}

#menu-nav ul{
	display:none;
	position:absolute;
}

#menu-nav li:hover ul {
 display: block;
}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/jquery.cookie.js"></script>
<!-- Header -->
<div class="sticky-nav">
	<div id="logo">
		<a id="goUp" href="#home-slider"
			title="Brushed | Responsive One Page Template" style="width: 163px">Brushed Template</a>
	</div>


	<nav id="menu">
		<ul id="menu-nav">
		
			<li><a href="main.do" class="external">Main</a></li>
			<%if(dto!=null){ 
				if(dto.getAuth()==0){
			%>
			<li><a href="*" id="current">관리</a>
		         <ul>
		           <li ><a href="castbbs.do" class="external">섭외신청목록</a></li>
		           <li ><a href="musi_recu_deadline.do" class="external">뮤지션 모집 마감 목록</a></li>
		         </ul>
	      	</li>
			<%	} %>
			<li><a href="myPage.do" class="external">My page</a></li>
			<%} %>
			<li class="afterloginOK"><%if(dto !=null){ %>
										<a href="musireculist.do"  class="external">뮤지션 모집</a>
									<%}else{ %>
										<a data-toggle="modal" href="#myModal" >뮤지션 모집</a>
									<%} %>
										</li><!-- 로그인이 필요한 경우  -->
			
			<li class="afterloginOK"><%if(dto !=null){ %>
										<a href="perform_scheduleslist.do"  class="external">공연 일정</a>
									<%}else{ %>
										<a data-toggle="modal" href="#myModal">공연 일정</a>
									<%} %>
										</li><!-- 로그인이 필요한 경우  -->

            <li class="afterloginOK"><%if(dto !=null){ %>
            							<a class="external" href="schedule.do">뮤지션's 버스킹</a>
            						<%}else{ %>
            							<a data-toggle="modal" href="#myModal" >뮤지션's 버스킹</a>
            						<%} %>
            							</li>
            <li class="afterloginOK"><%if(dto !=null){ %>
            							<a class="external" href="contact.do">공연섭외</a>
            						<%}else{ %>
            							<a data-toggle="modal" href="#myModal" >공연섭외</a>
            						<%} %>
            							</li>
            
			<li><a class="external" href="VideoBBS.do">영상게시판</a></li>
			
			<%if(dto==null){ %>
				<li><a data-toggle="modal" data-target="#myModal" href="#myModal">Login</a></li>
			<%}else{ %>
				<li><a href="logoff.do" class="external">LogOff</a></li>
			<%} %>
		</ul>
	</nav>

</div>
<!-- End Header -->

<!-- Modal -->
<div class="modal fade login" id="myModal" role="dialog"
	style="background-color: #26292E; width: 20%; height: 40%; " >
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" ><font color="white">x</font></button>
				<h4 class="modal-title"
					style="font-family: Icons; font-size: 40; font-weight: bold; margin: 0">로그인</h4>
			</div>
			<div class="modal-body" align="center" style="background-color: #2F3238; height: 60%">
				<br> 
				<input type="text" style="height: 20%" placeholder="아이디 입력" name="id" id="id">
				<br><br> 
				<input type="password" style="height: 20%" placeholder="비밀번호 입력" name="pwd" id="pwd">
				
			</div>
			<div class="modal-footer" style="background-color: #26292E;">
				<a href="regi.do" class="external">Sign up</a>
				<button type="button" class="btn btn-default" id="login">로그인</button>
			</div>
		</div>

	</div>
</div>

<!-- Modal -->
<div align="center" class="modal fade" id="castModal" role="dialog"
	style="background-color: #26292E; width: 50%; height: 80%; ">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" ><font color="white">x</font></button>
				<h4 class="modal-title"
					style="font-family: Icons; font-size: 40; font-weight: bold; margin: 0">추가 기재사항</h4>
			</div>
			<div class="modal-body" align="left" style="background-color: #2F3238; height: 90%">
				<h5 style="margin-bottom: 0">제목</h5>
				<input type="text" style="height: 30px" placeholder="제목 입역" id="_title">
				<br>
				<h5 style="margin-bottom: 0">모집 마감일</h5>
				<input type="date" style="height: 30px" id="_edate">
				<br>
				<h5 style="margin-bottom: 0">모집 설명</h5>
				<textarea placeholder="모집에 대한 설명을 입력 하세요" rows="10" style="width: 100%" id="_content"></textarea>
			</div>
			<div class="modal-footer" style="background-color: #26292E;">
			<!-- castbbs에 있는 castBtn을 누르게 하는 버튼  -->
				<button type="button" class="btn btn-default" data-dismiss="modal" id="movecastBtn">승인</button>
			</div>
		</div>

	</div>
</div>


<div class="modal fade" id="museDetailModal" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">


	<div class="modal-dialog modal-sm"><!--  큰창:<div class="modal-dialog modal-lg"> 작은창 :<div class="modal-dialog modal-sm">  -->
		<div class="modal-header" align="center" style="background-color: #2F3238">
			<h4 class="modal-title"
					style="font-family: Icons; font-size: 40; font-weight: bold; margin: 0">뮤지션 정보</h4>
		</div>
		<div class="modal-content" style="text-align: center">
			<div class="modal-body" align="center" style="background-color: #2F3238; height: 60%">
				아이디 : <span id="meminfo_id">${meminfo.id }</span>
	        	<br>
				소속그룹 / 멤버 : <span id="meminfo_teamname">${meminfo.teamname }</span>
	       		<br>
				이메일 : <span id="meminfo_email">${meminfo.email }</span>
	        	<br>
				연락처 : <span id="meminfo_phone">${meminfo.phone }</span>
	        	<br>
				장르 : <span id="meminfo_genre">${meminfo.genre }</span>
	        	<br>
				지역 : <span id="meminfo_location">${meminfo.location }</span>
	        	<br>
				팔로워 수 : <span id="followerCnt">${followerCnt }</span>
			</div>
			<div class="modal-footer" style="background-color: #26292E;">
	            <button type="button" class="btn btn-default" data-dismiss="modal">
				닫기
	            </button>
			</div>
		</div> 
	</div> 

</div>

<script type="text/javascript">
var tmp = 0;

$("#movecastBtn").click(function () {
	var btnName = "#"+$("#vsValue").val();
	$(btnName).click();
});

$("#login").on('click',function(){
	$.ajax({
		url:"login.do",
		data:{
			id: $("#id").val(),
			pwd:$("#pwd").val()
		},
		dataType:"json",
		success:function(data){
			if(data.result != "success"){
				alert(data.result);
				
			}else{
				alert($("#id").val()+"님 반갑습니다.");
				location.href="main.do";
			}
		},
		error:function(){
			
		}
	});

});

$("ul li").click(function () {
	<%
	if(session.getAttribute("user") == null){
	%>
		if( $(this).hasClass("afterloginOK") == true ){
			alert("로그인 후 가능합니다.");	
			location.href="#home-slider";
		}
	<%
	}
	%>
});
</script>


 



<!-- End Header -->
<script type="text/javascript">

var user_id = $.cookie("user_id");
if(user_id != null){
   $("#id").val(user_id);
   $("#_chk_save_id").attr("checked", "checked");
}     

$("#_chk_save_id").click(function() {      
   if($('input:checkbox[id="_chk_save_id"]').is(":checked")){
      if($("#id").val() == ""){
         $(this).prop("checked", false);
         alert("아이디를 입력해 주십시오");
      }else{
         $.cookie("user_id", $("#id").val(), { expires: 7, path: '/' });
         alert("aaa");
      }      
   }else{
      $.removeCookie("user_id", { path:'/' });
   }
});
</script>