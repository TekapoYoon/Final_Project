<%@page import="kh.com.a.model.VideoBBSDto"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<style>
/* ### ### ### 05 */
.button_base {
    margin: 0;
    border: 0;
    font-size: 14px;
    position: relative;
    width: 100px;
    height: 10px;
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

<div style="width: 1000px; margin: auto">
<div style="display: inline-block; width:auto; border-right: 1px solid gray; margin: auto">
<form name="bbsfrm" id="_bbsfrm" method="post" action="videoBbsUpdate.do" style="margin: 40px">	
	<table>
		<tr align="center">
			<td>
				<video
					style="display: inline-block; width: 600px;"
					src=${getVideoBbs.video } controls="controls">이 브라우저는 재생이 불가능합니다.
				</video>
				<br>
			</td>
		</tr>
		<tr>
			<td><h2>&nbsp;&nbsp;${getVideoBbs.title }</h2></td>
		</tr>
		<tr>
			<td>
				조회수&nbsp;&nbsp;<span id="ReadCnt"></span>회				
			</td>
			<td>
				<c:if test="${likecheck == true }">
					<a class="font-icon-heart" name="like" id="_like" onClick="fn_like()"/>&nbsp;&nbsp;<span id="likeCnt"><br></span>
				</c:if>
				<c:if test="${likecheck == false }">
					<a class="font-icon-heart-line" name="like" id="_like" onClick="fn_like()"/>&nbsp;&nbsp;<span id="likeCnt"><br></span>
				</c:if>
			</td>
		</tr>
		<tr>
		</tr>
		</table>
		<table style="border-top: solid 1px white; width: 100%">
		<tr>
			<td><span class="font-icon-group">&nbsp;&nbsp;<a data-toggle="modal" href="#museDetailModal">${getVideoBbs.id }</a></td>
			<td>
					<c:if test="${followcheck == true }">
						&nbsp;&nbsp;<a id="followB" onclick="Follow()" class="font-icon-ok-sign"></a>
					</c:if>
					<c:if test="${followcheck == false }">
						&nbsp;&nbsp;<a id="followB" onclick="Follow()" class="font-icon-ok-circle"></a>
					</c:if>
			</td>
		</tr>
		<tr>
			<td>게시일 : ${getVideoBbs.wdate }</td>
		</tr>
		<tr>
			<td align="center">${getVideoBbs.content }</td>
		</tr>
		</table>
		
	
	
	<c:if test="${getVideoBbs.id eq user.id}">
	<div align="right">
		<a href="#none" id="_btnUpdate" title="글수정하기">수정하기</a>
		<a href="#none" id="_btnDelete" title="삭제하기">삭제하기</a>
	</div>
	</c:if>
	
</form>

<form name="commentfrm" id="commentfrm" method="post" style="margin: 20px">
        <div>
            <div>
                <span><strong>Comments</strong></span> <span id="cCnt"></span>
            </div>
            <div>
                <table class="table">                    
                    <tr>
                        <td>
                        <textarea type="text" style="width: 105%"  rows="1" cols="40" id="comment" name="_comment" placeholder="댓글을 입력하세요"></textarea>
                        </td>
                        <td>
                            <div>
                                <div class="button_base b05_3d_roll"id="commentBtn" style="margin:auto">
									<div>댓글</div>
								    <div>댓글</div>
								</div>
                            	
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <input type="hidden" id="b_code" name="b_code" value="${getVideoBbs.video_seq }" />
</form>
<form id="commentListForm" name="commentListForm" method="post" style="margin: 20px">
    <div id="commentList" style="display: inline-block">
    </div>
</form>
</div>

<div style="display: inline-block; vertical-align: top; margin-left: 50px">


<div style="display: inline-block; vertical-align: top; width: 150px; white-space: nowrap;">
<p align="center"><strong>뮤지션의 다른영상</strong></p>
	<c:set var = "thisvideo" value = "${getVideoBbs.id }"/>
  	<c:forEach items="${bbslist }" var="bbs" varStatus="vs">
	<c:set var = "othervideo" value = "${bbs.id }"/>
  	<c:if test = "${thisvideo eq othervideo }">
	  	<img alt="썸네일" src=${bbs.thumbnail } width="150px" height="80px" ><br>	
	  	<div style=" width:150px; padding:0 5px; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;">
	  	<span class="font-icon-book">&nbsp;<a href="VideoBbsDetail.do?seq=${bbs.video_seq}">${bbs.title }</a><br>
	  	</div>
	  	<div>
		<span class="font-icon-eye">&nbsp;${bbs.readcount }<br>
		<span class="font-icon-calendar">&nbsp;${bbs.wdate }<br>
		</div>
		<p></p>
	</c:if>
	</c:forEach>
</div>
</div>


<script type="text/javascript">

$(document).ready(function() {
	fn_getReadCount();
	fn_getLikeCount();
	getCommentList();	
});

$("#commentBtn").click(function () {

	fn_comment();
});

function fn_comment(code){
	
	var seq = ${getVideoBbs.video_seq};
	var _comment = $("#comment").val();
	
	var list = {
			"video_seq" : seq,
            "comment" : _comment
            };
	
    $.ajax({
        type:'POST',
        url : "addComment.do",
        data:list,
        async:true,
        success : function(data){
            if(data=="success")
            {
                getCommentList();
                $("#comment").val("");
            }
        },
        error:function(request,status,error){
            alert("내용을 입력해주세요");
       }
    });
}
    
    function Follow() {
		
		var following_id = "${getVideoBbs.id}";
		var follower = "${user.id}";
		if (follower == null || follower == "") {
			alert("로그인 하셔야 합니다");
			return;
		}
		$.ajax({
			
			url : "ClickFollow.do",
			async : true,
			type : 'POST',
			cache : false,
			data : "follower="+follower+"&following="+following_id,
			dataType : 'json',
			success : function(data) {
				if (data == 1) {
					$('#followB').prop("class","font-icon-ok-sign");
				}else if (data == 0) {
					$("#followB").prop("class", "font-icon-ok-circle");
				}
					
			
			}, error : function (xhr, status, error) {
				alert("ajax 에러 발생");
			}
			
		});
	}
	
    function getCommentList(){
    	var seq = ${getVideoBbs.video_seq};
    	var list = {
    			"video_seq" : seq,
                };
    	
        $.ajax({
            type:'POST',
            url : "commentList.do",
            data: list,
            contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
            success : function(data){
                var html = "";
                var cCnt = data.length;
                
                if(data.length > 0){
                    
                    for(i=0; i<data.length; i++){
                        html += "<div>";
                        html += "<div><table class='table'><h6><strong>"+data[i].id+"</strong></h6>";
                        html += data[i].vcomment + "<tr><td></td></tr>";
                        html += "</table></div>";
                        html += "</div>";
                    }
                    
                } else {
                    html += "<div>";
                    html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
                    html += "</table></div>";
                    html += "</div>";
                }
                
                $("#cCnt").html(cCnt);
                $("#commentList").html(html);
                
            },
            error:function(request,status,error){
            	alert("댓글불러오기 안돼");
           }
            
        });
    }

function fn_like(){
	
	var seq = ${getVideoBbs.video_seq};
	var list = {
			"video_seq" : seq,
            };
	
    $.ajax({
        type:'POST',
        url : "like.do",
        data:list,
        async:true,
        success : function(data){
            if(data=="like")
            {
            	$('#_like').prop("class","font-icon-heart");
            	fn_getLikeCount();
            }
            else if(data == "unlike")
            {
            	$('#_like').prop("class","font-icon-heart-line");
            	fn_getLikeCount();
            }
        },
        error:function(request,status,error){
            alert("좋아요 실패");
       }
    });
}

function fn_getLikeCount(){
	
	var seq = ${getVideoBbs.video_seq};
	var list = {
			"video_seq" : seq,
            };
	
    $.ajax({
        type:'POST',
        url : "likeCount.do",
        data:list,
        async:true,
        success : function(data){
        	var likeCnt = data;
        	 $("#likeCnt").html(likeCnt);
        },
        error:function(request,status,error){
            alert("좋아요카운트 ajax실패");
       }
    });
}

function fn_getReadCount(){
	
	var seq = ${getVideoBbs.video_seq};
	var list = {
			"video_seq" : seq,
            };
	
    $.ajax({
        type:'POST',
        url : "ReadCount.do",
        data:list,
        async:true,
        success : function(data){
        	var ReadCnt = data;
        	 $("#ReadCnt").html(ReadCnt);
        },
        error:function(request,status,error){
            alert("조회수 ajax실패");
       }
    });
}


$("#_btnUpdate").click(function() {		
	$("#_bbsfrm").attr({ "target":"_self", "action":"videoBbsUpdate.do?seq="+${getVideoBbs.video_seq}}).submit();
});
$("#_btnDelete").click(function() {
	$("#_bbsfrm").attr({ "target":"_self", "action":"videoBbsDelete.do?seq="+${getVideoBbs.video_seq}}).submit();
});
</script>




