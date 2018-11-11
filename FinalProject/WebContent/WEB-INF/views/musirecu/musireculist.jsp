<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 검색 카테고리를 유지 start -->
<%
	String category = (String) request.getAttribute("s_category");
	if (category == null)
		category = "";
%>
<style>
/* ### ### ### 05 */
.button_base {
    margin: 0;
    border: 0;
    font-size: 18px;
    position: relative;
    width: 100px;
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
<script type="text/javascript">
var str='<%=category%>';
	$(document).ready(function() {
		document.frmForm1.s_category.value = str;

		// text에 문자를 입력하지 않았을 경우, 초기화 해준다.
		if ($("#_s_keyword").val().trim() == "") {
			document.frmForm1.s_category.value = "";
		}
	});
</script>
<!-- 검색 카테고리를 유지 end -->


<div class="container">
	<!-- Title Page -->
	<div class="row">
		<div class="span12">
			<div class="title-page">
				<h2 class="title">뮤지션 모집</h2>
				<h3 class="title-description">자선사업 및 다양한 컨텐츠의 공연으로 재능기부하여 당신의 커리어를 쌓을 수 있는 기회 제공해 드립니다.</h3>
				<h3 class="title-description">지금 도전하세요!</h3>
			</div>
		</div>
	</div>


	<div class="row">
		<div class="span3">
			<!-- Filter -->
			<nav id="options" class="work-nav">
				<ul id="filters" class="option-set" data-option-key="filter">
					<li class="type-work">Type of Work</li>
					<li><a href="#filter" data-option-value="*" class="selected">All
							Projects</a></li>
					<li><a href="#filter" data-option-value=".ing">Ing</a></li>
					<li><a href="#filter" data-option-value=".end">End</a></li>

				</ul>
			</nav>
			<!-- End Filter -->
		</div>

		<div class="span9">
			<div class="row">
				<section id="projects">
					<ul id="thumbs">
						<!-- 여기 for문 돌리면 됨 -->
						<c:forEach items="${musiRecuList}" end="9" var="item"
							varStatus="status">
							<!-- Item Project and Filter Name -->
							<li class="item-thumbs span3 <c:choose>
										<c:when test="${item.edate >= now}">
											ing					
										</c:when>
										<c:otherwise>
											end
										</c:otherwise>
									</c:choose>" style=" background-color:#26292E; box-shadow: 3px 3px 20px #000;">
								<a class="hover-wrap fancybox" data-fancybox-group="gallery" 
								href="musirecudetail.do?musi_recu_seq=${item.musi_recu_seq }"> 
									<span class="overlay-img" ></span> 
									
								</a> 
								<!-- Thumb Image and Description --> 
								<c:choose>
									<c:when test="${item.edate < now}">
										<img src="_include/img/work/thumbs/end.jpg">
									</c:when>
									<c:otherwise>
										<img src="_include/img/work/thumbs/ing.jpg">
									</c:otherwise>
								</c:choose>
								<div>
									<span style="margin: 10px">${item.title }</span>
									<hr style="width:93%">
									<span style="margin: 10px">모집기간
									<p style="margin: 10px">
										<fmt:parseDate value="${fn:substring(now,0,10) }" var="sdate" pattern="yyyy-MM-dd" />
										<fmt:parseDate value="${fn:substring(item.edate,0,10) }" var="edate" pattern="yyyy-MM-dd"/>
										
										<fmt:formatDate value="${edate }" pattern="yyyy년 MM월 dd일"/> 까지
										<fmt:parseNumber value="${edate.time / (1000*60*60*24) - sdate.time / (1000*60*60*24) }" integerOnly="true" var="resultDate"/>
										<c:choose>
											<c:when test="${resultDate < 0 }">
												<font color="red">(지남)</font>	
											</c:when>
											<c:when test="${resultDate > 0 }">
												(D - ${resultDate})
											</c:when>
											<c:when test="${resultDate == 0 }">
												<font color="green">(오늘 마감)</font>
											</c:when>
										</c:choose>
										
										
										
									   	</p>
									</span>
								</div>
							</li>
							<!-- End Item Project -->

						</c:forEach>

					</ul>
				</section>
				<!-- 페이징 처리 -->
				<div id="paging_wrap" align="center">
					<jsp:include page="/WEB-INF/views/common/paging.jsp" flush="false">
						<jsp:param value="${pageNumber }" name="pageNumber" />
						<jsp:param value="${pageCountPerScreen }"
							name="pageCountPerScreen" />
						<jsp:param value="${recordCountPerPage }"
							name="recordCountPerPage" />
						<jsp:param value="${totalRecordCount }" name="totalRecordCount" />
					</jsp:include>
				</div>
				<!--  -->

				<div class="box_border"
					style="margin-top: 5px; margin-bottom: 10px;" align="right">

					<form name="frmForm1" id="contact-form" method="post" action="">

						<table
							style="margin-left: auto; margin-right: auto; margin-top: 3px; margin-bottom: 3px; border: 0; padding: 0;">
							<tr>
								<td style="padding-left: 5px;">
								<select id="_s_category" name="s_category" style="height: 49.5px">
										<option value="" selected="selected">선택</option>
										<option value="title">제목</option>
										<option value="contents">내용</option>
										<option value="writer">작성자</option>
								</select></td>
								<td style="padding-left: 5px;"><input type="text"
									id="_s_keyword" name="s_keyword" value="${s_keyword}" /></td>
								<td style="padding-left: 5px;">
									<div  class="button_base b05_3d_roll" class="button_base b05_3d_roll" id="_btnSearch">
								        <div>검색</div>
								        <div>검색</div>
								    </div>
								</td>
							</tr>
						</table>

						<input type="hidden" name="pageNumber" id="_pageNumber"
							value="${(empty pageNumber)?0:pageNumber}" /> <input
							type="hidden" name="recordCountPerPage" id="_recordCountPerPage"
							value="${(empty recordCountPerPage)?10:recordCountPerPage}" />

					</form>
				</div>
			</div>
		</div>

	</div>
</div>

<script type="text/javascript">
	function goPage(pageNumber) {
		$("#_pageNumber").val(pageNumber);
		$("#_frmFormSearch").attr("target", "_self").attr("action",
				"musireculist.do").submit();
	}
	$("#_btnSearch").click(function () {
		$("#contact-form").attr("target", "_self").attr("action",
		"musireculist.do").submit();
	});
</script>