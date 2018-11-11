<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
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

<div style="display: table; margin: auto">
  	<c:forEach items="${bbslist }" var="bbs" varStatus="vs">
	<div style="width: 300px; height: 300px; float: left; margin-right: 30px; margin-left: 70px">  	
	  	<div style="width: 300px; ">
	  		<img alt="썸네일" src=${bbs.thumbnail } width="100%" height="100%">
	  	</div>
	  	<div style="width: 300px; height: 140px;">
	  	<div align="center">
	  		<table>
	  	<tr>
	  		<td>
	  			<span class="font-icon-book">&nbsp;</span><a href="VideoBbsDetail.do?seq=${bbs.video_seq}">${bbs.title }</a><br>
	  		</td>
	  	</tr>
	  	<tr>
	  		<td>
	  			<span class="font-icon-group">&nbsp;${bbs.id }<br>
	  		</td>
	  	</tr>
	  	<tr>
	  		<td>
	  			<span class="font-icon-eye">&nbsp;${bbs.readcount }<br>
	  		</td>
	  	</tr>
	  	<tr>
	  		<td>
	  			<span class="font-icon-calendar">&nbsp;${bbs.wdate }
	  		</td>
	  	</tr>
	  	</table>
	  	</div>
	  	</div>
	</div>
	</c:forEach>
</div>

<tr>
<form action="VideoBBSWrite.do" method="post" style="text-align: center" class="generalForm">
	<c:set var = "auth" value = "${user.auth}"/>

	<c:if test="${auth == 0 || auth == 2}" >
		<div class="button_base b05_3d_roll"id="write" style="margin: auto">
			<div>게시글 작성</div>
		    <div>게시글 작성</div>
		</div>
	</c:if>

</form>
</tr>


<script type="text/javascript">
$("#write").click(function () {

	$(".generalForm").attr("target", "_self").submit();
});
</script>

<script>
	function authCheck(auth) {
		if (auth == 1 || auth == undefined) {
			alert("뮤지션만 이용할 수 있습니다");
			alert(auth);
			return false;
		}else{
		    location.href = "VideoBBSWrite.do";	
		}
	}
</script>


