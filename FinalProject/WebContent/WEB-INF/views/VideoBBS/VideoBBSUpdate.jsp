<%@page import="kh.com.a.model.VideoBBSDto"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

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

<h1 style="text-align: center">영상게시글 수정</h1>

<div style="width: 520px; margin: auto;text-align: center">
<form name="bbsfrm" id="_bbsfrm" method="post" action="videoBbsUpdateAf.do">
	<table>
		<tr align="center">
			<td><img src= ${getVideoBbs.thumbnail } width="100%" alt="Thumbnail" title="Thumbnail"></td>
		</tr>
		<tr>
			<td align="center"><h3>ID</h3><input type="text" style="text-align: center" readonly="readonly" value="${getVideoBbs.id }"></input></td>
		</tr>
		<tr>
			<td align="center"><h3>TITLE</h3><input type="text" style="text-align: center" name="title" id="_title" value="${getVideoBbs.title }"></td>
		</tr>
		<tr>
			<td align="center"><h3>CONTENT</h3><textarea type="text" name="content" id="_content"  cols="1" rows="7">${getVideoBbs.content }</textarea></td>
		</tr>
	</table>
	
	<c:if test="${getVideoBbs.id eq user.id}">
	<a href="#none" id="_btnUpdate" title="글수정하기">수정하기</a>
	</c:if>
</form>
</div>

<script type="text/javascript">
$("#_btnUpdate").click(function() {	
		
	$("#_bbsfrm").attr({ "target":"_self", "action":"videoBbsUpdateAf.do?seq="+${getVideoBbs.video_seq } }).submit();
});
</script>




