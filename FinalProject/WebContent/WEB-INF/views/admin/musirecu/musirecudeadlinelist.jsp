<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
 
<fmt:requestEncoding value="utf-8"/>

<h2 style="position: relative; margin-bottom: 100px; text-align: center;">musiRecuDeadLineList.jsp</h2>    


<div align="center" class="box_border" style="margin-top:5px; margin-bottom: 10px;">

</div>


<div class="container">
<div class="span12">
           <h3 class="spec">신청 목록</h3>
              
            	<!-- Start Accordion -->
	
<div class="accordion2" id="accordionArea2">
		<c:forEach items="${musiRecuDeadLineList}" var="item" varStatus="vs">
			
			<div id="index${vs.count}" class="accordion-group2">
				
				<div class="accordion-heading2 accordionize2">
					<div style="margin: 30px;" align="left">
					<a class="accordion-toggle2 inactive2 collapsed"
						data-parent="#accordionArea2" href='musirecudeadlinedetail.do?musi_recu_seq=${item.musi_recu_seq}'>
						공고 제목 : ${item.title}<p style="margin-right: 30px;" align="right">마감날짜</p><p style="margin-right: 30px;" align="right">${item.edate}</p>
					</a>									
				</div>
				</div>
			</div>
		</c:forEach>
		</div>
	</div>
</div>
		
<%-- 

<table id="list_table" class="list_table" style="width:85%;">
	<colgroup>
		<col style="width:70px;" />
		<col style="width:auto;" />
		<col style="width:100px;" />
	</colgroup>

<thead>
	<tr>
		<th>순서</th> <th>모집 공고 제목</th> <th>마감날짜</th>
	</tr>
</thead>

<tbody>	
	<c:if test="${empty musiRecuDeadLineList}">
	<tr>
		<td colspan="3">신청 목록이 없습니다.</td>
	</tr>	
	</c:if>

	<c:forEach items="${musiRecuDeadLineList}" var="item" varStatus="vs">
	
	<tr class="_hover_tr">
		<td>${vs.count}</td>
		
		<!-- 문의자성함/연락처/이메일/지역/연령대/공연횟수/예산/기타 문의사항 -->
		
		<td style="text-align: left">
				<a href='musirecudeadlinedetail.do?musi_recu_seq=${item.musi_recu_seq}'>
					${item.title}
				</a>		
		</td>
		
		<td>${item.edate}</td> 
	</tr>
	</c:forEach>
</tbody>

</table>
 --%>


<div id="add">
<button id="addbtn" onclick="moreList();">더보기</button>
</div>






<script>
var vs = 5;

	function moreList(){
		alert("alram");
		
		
	    $.ajax({
	        url : "<%=application.getContextPath() %>/moreMusiRecuDeadLineList.do",
	        async:true,
	        type : "GET",
	        cache : false,
	        dataType: 'json',
	        success : function(data){
	            //console.log(data);
	            alert("success");
	            var content="";
	            var btn="";
	            
	           
	            if (data != null) {
	            	
				alert("dataList 도착");
				
	            for(var i=0; i<data.length; i++){
	                vs += 1; 
	                content +=
	                "<tr class='_hover_tr'>"+
	                    "<td>"+vs+"</td>"+ 
	                    "<td><a href='musirecudeadlinedetail.do?musi_recu_seq="+data[i].musi_recu_seq+"'>"+
	                    data[i].title+"</a></td>"+	
	                    "<td>"+data[i].edate+"</td>"+
	                "</tr>";
	            	}
	           
	            }
	            btn="<button id='addbtn' onclick='moreList();'>더보기</button>";
	            $('#addbtn').remove();//remove btn
	            $(content).appendTo("#list_table");
	            $(btn).appendTo("#add");
	        }, error:function(request,status,error){
	            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	           }
	    }); 
	};
</script>

