<%@page import="kh.com.a.model.MemDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<fmt:requestEncoding value="utf-8"/>

<!-- Our Work Section -->


<!-- 
model.addAttribute("videoRankList", videoRank);
model.addAttribute("followingList", followingList);
model.addAttribute("performScheduleList", scheduleList);
model.addAttribute("latelyVideoList", latelyVideoList); 
-->


   

   <!-- End Title Page -->
             
      
      
     
 <%-- <div class="container">
   <!-- Title Page -->
   <div class="row">
      <div class="span12">
         <div class="title-page">
            <h2 class="title">MusiCulture</h2>
            <h3 class="title-description">
               <!-- Check Out Our Projects on <a href="#">Dribbble</a>. -->
            </h3>
         </div>
      </div>
   </div>   
   <!-- Portfolio Projects -->
   <div class="row">
      <div class="span3">
         <!-- Filter -->
         <nav id="options" class="work-nav">
            <ul id="filters" class="option-set" data-option-key="filter">
               <li class="type-work">MusiCulture</li>
               
               <li><a href="#filter" data-option-value=".lately">개인영상(최신순)</a></li>
               <li><a href="#filter" data-option-value=".like">개인영상(인기순)</a></li>
               <li><a href="#filter" data-option-value=".following">팔로잉 영상</a></li>
               <li><a href="#filter" data-option-value=".schedule">기부공연 행사일정</a></li>
            </ul>
         </nav>
         <!-- End Filter -->
      </div>
   

          
      <div class="span9">
         <div class="row">   
            <section id="projects">
            
            
            
               <ul id="thumbs">                  
                  <!-- Item Project and Filter Name -->
                   <c:forEach items="${videoRankList}" var="Vrank" varStatus="vs" begin = "1" end = "9">
                  <c:if test="${empty videoRankList}">
                  <li style="margin: 30px;" class="item-thumbs span3 like">
                  <div>인기순</div>
                  <h3>인기 영상이 없습니다</h3>
                  </li>
                  </c:if>
                  </c:forEach>
                  
                  <c:if test="${!empty videoRankList}">
                  <c:forEach items="${videoRankList}" var="Vrank" varStatus="vs" end="3">
                  
                  <li class="item-thumbs span3 like">
                  
                  <c:if test="${vs.count eq 1 }">
                  <font size="5px" style="font-family: sans-serif; font-weight: bold; color: #fff;">인기순</font>
                  </c:if>
                  <hr style="border: none; border: 5px double #0066cc;">
                     <!-- Fancybox - Gallery Enabled - Title - Full Image --> <a
                     class="hover-wrap fancybox" data-fancybox-group="gallery"
                     title="${Vrank.title}" href="VideoBbsDetail.do?seq=${Vrank.video_seq}">
                        <span class="overlay-img"></span> <span
                        class="overlay-img-thumb font-icon-plus"></span>
                  </a> <!-- Thumb Image and Description --> <img
                     src="${Vrank.thumbnail}"
                     alt="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus quis elementum odio. Curabitur pellentesque, dolor vel pharetra mollis.">
                     <div>
                           <span>제목: ${Vrank.title }</span><br>
                           <span>뮤지션: ${Vrank.id }</span><br>
                        </div>
                  </li>
                  </c:forEach>
                  <c:if test="${fn:length(videoRankList) eq 2}">
                  <li class="item-thumbs span3">                     
                        </li>
                        </c:if>
                  <c:if test="${fn:length(videoRankList) eq 1}">
                  <li class="item-thumbs span3">                     
                        </li>
                        <li class="item-thumbs span3">
                        </li>
                  </c:if>
                  </c:if>
                  
                  
               <!-- </ul>
               </section> -->
               
               <!-- End Item Project -->
               
               <!-- <section id="projects2">
               <ul id="thumbs"> -->
               
               
                  <!-- Item Project and Filter Name -->
                  <c:if test="${empty followingList}">
                  <li class="item-thumbs span3 following">
                  <div>팔로잉</div>
                  <h3>팔로잉 대상이 없습니다</h3>
                  </li>
                  </c:if>
                  
                  <c:if test="${!empty followingList}">
                  <c:forEach items="${followingList}" var="followings" varStatus="vs" end="3">
                  
                  <li class="item-thumbs span3 following">
                  
                  <font size="5px" style="font-family: sans-serif; font-weight: bold; color: #fff;">팔로잉</font>
                  
                  <hr style="border: none; border: 5px double #0066cc;">
                     <!-- Fancybox - Gallery Enabled - Title - Full Image --> <a
                     class="hover-wrap fancybox" data-fancybox-group="gallery"
                     title="${followings.title}" href="VideoBbsDetail.do?seq=${followings.video_seq}">
                        <span class="overlay-img"></span> <span
                        class="overlay-img-thumb font-icon-plus"></span>
                  </a> <!-- Thumb Image and Description --> <img
                     src="${followings.thumbnail }"
                     alt="">
                  </li>
                  </c:forEach>
                  <c:if test="${fn:length(followingList) eq 2}">
                  <li class="item-thumbs span3">                     
                        </li>
                        </c:if>
                  <c:if test="${fn:length(followingList) eq 1}">
                  <li class="item-thumbs span3">                     
                        </li>
                        <li class="item-thumbs span3">
                        </li>
                  </c:if>
                  </c:if>
               
                  <!-- End Item Project -->
            
            <!-- <section id="projects3">
               <ul id="thumbs"> -->
            
            
                  <!-- Item Project and Filter Name -->
                  <c:if test="${empty latelyVideoList}">
                  <li class="item-thumbs span3 lately">
                  <div>최신순</div>
                  <h3>최신 영상이 없습니다</h3>
                  </li>
                  </c:if>
                  
                  <c:if test="${!empty latelyVideoList}">
                   <c:forEach items="${latelyVideoList}" var="lateVideo" varStatus="vs" end="2">
                   
                
                  <li class="item-thumbs span3 lately">
                  <c:if test="${vs.count eq 1 }">
                  <font size="5px" style="font-family: sans-serif; font-weight: bold; color: #fff;">최신순</font>
                  </c:if>
                  
                  <hr style="border: none; border: 5px double #0066cc;">
                     <!-- Fancybox - Gallery Enabled - Title - Full Image --> <a
                     class="hover-wrap fancybox" data-fancybox-group="gallery"
                     title="${lateVideo.title}"
                     href="VideoBbsDetail.do?seq=${lateVideo.video_seq}"> <span
                        class="overlay-img"></span> <span
                        class="overlay-img-thumb font-icon-plus"></span>
                  </a> <!-- Thumb Image and Description --> <img
                     src="${lateVideo.thumbnail}"
                     alt="">
                     
                  </li>
                  </c:forEach>
                  <c:if test="${fn:length(latelyVideoList) eq 2}">
                  <li class="item-thumbs span3">                     
                        </li>
                        </c:if>
                  <c:if test="${fn:length(latelyVideoList) eq 1}">
                  <li class="item-thumbs span3">                     
                        </li>
                        <li class="item-thumbs span3">
                        </li>
                  </c:if>
                  </c:if>
                  
                  <!-- </ul>
                  </section> -->
                  <!-- End Item Project -->
               
               <!-- <section id="projects4">
               <ul id="thumbs"> -->
               
                  <!-- Item Project and Filter Name -->
                  <c:if test="${empty performScheduleList}">
                  <li class="item-thumbs span3 schedule">
                  
                  <h3>최신 공연행사가 없습니다</h3>
                  </li>
                  </c:if>
                  
                  <c:if test="${!empty performScheduleList}">
                  <c:forEach items="${performScheduleList}" var="lateSchedule" varStatus="vs" end="3">
                  
                  <li class="item-thumbs span3 schedule">
                  <c:if test="${vs.count eq 1 }">
                  <font size="5px" style="font-family: sans-serif; font-weight: bold; color: #fff;">공연/행사</font>
                  
                  </c:if>
                  
                     
                     <hr style="border: none; border: 5px double #0066cc;">
                  
                  
                  
                  
                     <!-- Fancybox - Gallery Enabled - Title - Full Image --> <a
                     class="hover-wrap fancybox" data-fancybox-group="gallery"
                     title="${lateSchedule.title}"
                     href="perform_scheduledetail.do?perform_schedule_seq=${lateSchedule.perform_schedule_seq}"> <span
                        class="overlay-img"></span> <span
                        class="overlay-img-thumb font-icon-plus"></span>
                  </a> <!-- Thumb Image and Description --> <img
                     src="/FinalProject/upload/${lateSchedule.new_consertIMG}"
                     alt="">
                  </li>
                  </c:forEach>
                  <c:if test="${fn:length(performScheduleList) eq 2}">
                  <li class="item-thumbs span3">                     
                        </li>
                        </c:if>
                  <c:if test="${fn:length(performScheduleList) eq 1}">
                  <li class="item-thumbs span3">                     
                        </li>
                        <li class="item-thumbs span3">
                        </li>
                  </c:if>
                  </c:if>
                  
                  <!-- End Item Project -->
                  </ul>
                  </section>            
               </div>
                  
                  

         </div>
      </div>
   </div> --%>
   
    <%
      MemDto loginDto = (MemDto)session.getAttribute("user");
      
      if(loginDto != null){
               
      %>
   <div class="container">
   <!-- Title Page -->
   <div class="row">
      <div class="span12">
         <div class="title-page">
            <h2 class="title">MusiCulture</h2>
            <h3 class="title-description">
               <!-- Check Out Our Projects on <a href="#">Dribbble</a>. -->
            </h3>
         </div>
      </div>
   </div>
   
   
   <div class="row">
      
            
   <!-- ============================================================= -->
   
   <!-- ============================================================= -->
    <div id="columns" style="height: 2012px; width: 100%">
    <div style="display: inline-block; height: 2005px">
    <h2 style="text-align: center">좋아요 순</h2>
    <c:forEach items="${videoRankList }" var="Vrank" varStatus="vs" end="4">
      <figure class="like">
         <a class="hover-wrap fancybox" data-fancybox-group="gallery"
         title="${Vrank.title}" href="VideoBbsDetail.do?seq=${Vrank.video_seq}">
         <span class="overlay-img"></span><span
         class="overlay-img-thumb font-icon-plus"></span>
         <img src="${Vrank.thumbnail}" style="width: 250px"></a> 
        <figcaption>${Vrank.id}</figcaption>
        <figcaption>${Vrank.title}</figcaption>
        <figcaption>${Vrank.readcount}</figcaption>
        <%-- <figcaption>${Vrank.}</figcaption> 좋아요--%> 
      </figure>
    </c:forEach>
     </div>
     <div style="height:2005px">
     <h2 style="text-align: center">공연/행사</h2>
     <c:forEach items="${performScheduleList }" var="lateSchedule" varStatus="vs" end="4">
      <figure class="schedule">
      
         <a class="hover-wrap fancybox" data-fancybox-group="gallery"
         title="${lateSchedule.title}"
         href="perform_scheduledetail.do?perform_schedule_seq=${lateSchedule.perform_schedule_seq}"> <span
         class="overlay-img"></span> <span
         class="overlay-img-thumb font-icon-plus"></span>
                     
        <img src="/FinalProject/upload/${lateSchedule.new_consertIMG}" style="width: 250px"></a> 
        <%-- <figcaption>${lateSchedule.id}</figcaption> --%>
        <figcaption>제목: ${lateSchedule.title}}</figcaption>
        <figcaption>가격: ${lateSchedule.ticket_price}원</figcaption>
        <%-- <figcaption>${Vrank.}</figcaption> 좋아요--%> 
      </figure>
    </c:forEach>
    </div>
    <div style="display: inlin-block; vertical-align: top; height:2002px">
    <h2 style="text-align: center">팔로우 뮤지션</h2>
    <c:forEach items="${followingList}" var="followings" varStatus="vs" end="4">
      <figure class="following">
      
      <a class="hover-wrap fancybox" data-fancybox-group="gallery"
      title="${followings.title}" href="VideoBbsDetail.do?seq=${followings.video_seq}">
      <span class="overlay-img"></span> <span
      class="overlay-img-thumb font-icon-plus"></span>

        <img src="${followings.thumbnail}" style="width: 250px"></a>
        <figcaption>${followings.id}</figcaption>
        <figcaption>${followings.title}</figcaption>
        <figcaption>${followings.readcount}</figcaption>
        <%-- <figcaption>${Vrank.}</figcaption> 좋아요--%> 
      </figure>
    </c:forEach>
    </div>
    <div style="display: inlin-block; height:2012px">
    <h2 style="text-align: center">최신 업로드 영상</h2>
    <c:forEach items="${latelyVideoList}" var="lateVideo" varStatus="vs" end="4">
      <figure class="lately">
      
      <a class="hover-wrap fancybox" data-fancybox-group="gallery"
         title="${lateVideo.title}"
         href="VideoBbsDetail.do?seq=${lateVideo.video_seq}"> <span
         class="overlay-img"></span> <span
         class="overlay-img-thumb font-icon-plus"></span>
    
        <img src="${lateVideo.thumbnail}" style="width: 250px"></a>
        <figcaption>${lateVideo.id}</figcaption>
        <figcaption>${lateVideo.title}</figcaption>
        <figcaption>${lateVideo.readcount}</figcaption>
        <%-- <figcaption>${Vrank.}</figcaption> 좋아요--%> 
      </figure>
    </c:forEach>
    </div>
    </div>
   
      </div>
   </div>
   
   
      <%} else{ %>
   
   <div class="container">
   <!-- Title Page -->
   <div class="row">
      <div class="span12">
         <div class="title-page">
            <h2 class="title">MusiCulture</h2>
            <h3 class="title-description">
               <!-- Check Out Our Projects on <a href="#">Dribbble</a>. -->
            </h3>
         </div>
      </div>
   </div>
   
   
   <div class="row">
      
            
   <!-- ============================================================= -->
   
   <!-- ============================================================= -->
    <div id="columns" style="height: 2005px; margin-left: 100px; margin-right:100px">
    <div style="display: inline-block; height: 2005px">
    <h2 style="text-align: center">좋아요 순</h2>
    <c:forEach items="${videoRankList }" var="Vrank" varStatus="vs" end="4">
      <figure class="like">
         <a class="hover-wrap fancybox" data-fancybox-group="gallery"
         title="${Vrank.title}" href="VideoBbsDetail.do?seq=${Vrank.video_seq}">
         <span class="overlay-img"></span><span
         class="overlay-img-thumb font-icon-plus"></span>
         <img src="${Vrank.thumbnail}" style="width: 250px"></a> 
        <figcaption>${Vrank.id}</figcaption>
        <figcaption>${Vrank.title}</figcaption>
        <figcaption>${Vrank.readcount}</figcaption>
        <%-- <figcaption>${Vrank.}</figcaption> 좋아요--%> 
      </figure>
    </c:forEach>
     </div>
     <div style="height:2005px">
     <h2 style="text-align: center">공연/행사</h2>
     <c:forEach items="${performScheduleList }" var="lateSchedule" varStatus="vs" end="4">
      <figure class="schedule">
      
         <a class="hover-wrap fancybox" data-fancybox-group="gallery"
         title="${lateSchedule.title}"
         href="perform_scheduledetail.do?perform_schedule_seq=${lateSchedule.perform_schedule_seq}"> <span
         class="overlay-img"></span> <span
         class="overlay-img-thumb font-icon-plus"></span>
                     
        <img src="/FinalProject/upload/${lateSchedule.new_consertIMG}" style="width: 250px"></a> 
        <%-- <figcaption>${lateSchedule.id}</figcaption> --%>
        <figcaption>제목: ${lateSchedule.title}}</figcaption>
        <figcaption>가격: ${lateSchedule.ticket_price}원</figcaption>
        <%-- <figcaption>${Vrank.}</figcaption> 좋아요--%> 
      </figure>
    </c:forEach>
    </div>
    
    <div style="display: inlin-block; height:2002px">
    <h2 style="text-align: center">최신 업로드 영상</h2>
    <c:forEach items="${latelyVideoList}" var="lateVideo" varStatus="vs" end="4">
      <figure class="lately">
      
      <a class="hover-wrap fancybox" data-fancybox-group="gallery"
         title="${lateVideo.title}"
         href="VideoBbsDetail.do?seq=${lateVideo.video_seq}"> <span
         class="overlay-img"></span> <span
         class="overlay-img-thumb font-icon-plus"></span>
    
        <img src="${lateVideo.thumbnail}" style="width: 250px"></a>
        <figcaption>${lateVideo.id}</figcaption>
        <figcaption>${lateVideo.title}</figcaption>
        <figcaption>${lateVideo.readcount}</figcaption>
        <%-- <figcaption>${Vrank.}</figcaption> 좋아요--%> 
      </figure>
    </c:forEach>
    </div>
    </div>
   <!-- ============================================================= -->
    <!-- projects2 -->
   <!-- ============================================================= -->
      </div>
   </div>
   
<%} %>

<script>


</script>
<!-- End Our Work Section -->