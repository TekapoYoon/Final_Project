<%@page import="kh.com.a.model.MemDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
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
<div class="title-page">
    <h2 class="title">영상게시물 등록</h2>
    <h6 class="title-description">음악영상을 공유해서 재능을 알려보세요!</h6>
</div>

<form action="VideoBBSWriteAf.do" id="contact-form" method="post" enctype="multipart/form-data" class="generalForm">
<table style="margin: auto; width: 50%">
	<tr>
		<td>
			<h5 class="title-description" align="center">영상파일</h5>
		</td>
	</tr>
	<tr>
		<td>
			<input type="file" id="videofile" name="videofile" style="text-align: center">
		</td>
	</tr>
	<tr>
		<td>
			<h5 class="title-description" style="text-align: center">아이디</h5>
		</td>
	</tr>
	<tr>
		<td style="width: 100%">
			<input type="text" name="id" readonly="readonly" style="text-align: center" value="${user.id }">
		</td>
	</tr>
	<tr>
		<td>
			<h5 class="title-description" style="margin: 15 0 0 0; text-align: center">제목</h5>
		</td>
		</tr>
		<tr>
		<td>
			<input type="text" name="title" style="text-align: center" placeholder="제목을 입력하세요.">
		</td>
	</tr>
	<tr>
		<td>
			<h5 class="title-description" style="margin: 15 0 0 0; text-align: center">내용</h5>
		</td>
		</tr>
		<tr>
		<td>
			<textarea type="text" name="content" style="text-align: center" cols="1" rows="10" placeholder="내용을 입력하세요."></textarea><br>
		</td>
	</tr>
</table>
<table style="margin: auto">
<tr>
<td colspan="3" align="center">
<div class="button_base b05_3d_roll" id="writeBtn" style="margin-top: 10px">
	<div>작성완료</div>
	<div>작성완료</div>
</div>
</td>
</tr>
</table>
</form>


<script type="text/javascript">
$("#writeBtn").click(function () {
	
	$(".generalForm").attr("target", "_self").submit();
});
</script>