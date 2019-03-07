<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:choose>  
<c:when test="${userSession.roleId == '1' }"> 
	<c:import url="common/head_s.jsp"></c:import>
</c:when>
<c:otherwise> 
	<c:import url="common/head_t.jsp"></c:import>
</c:otherwise>
</c:choose>

 	<div class="admin-content-body">
   <div class="am-cf am-padding am-padding-bottom-0">
     <div class="am-fl am-cf">
       <strong class="am-text-primary am-text-lg">学生预约</strong> / <small>DateList</small> 
     </div>
   </div><hr>
   
   <div class="am-u-sm-12">
         	<table class="am-table am-table-striped am-table-hover table-main">
            <thead>
             	<tr>
              	<th class="table-title">学号 </th>
              	<th class="table-title">姓名</th>
              	<th class="table-title">手机号</th>
              	<th class="table-title">日期</th>
              	<th class="table-title">时间</th>
              	<th class="table-title">状态</th>      
              	<th class="table-title">操作</th>         				
             	</tr>
           </thead>
            <tbody>
             		<tr>
             		<c:forEach var="date" items="${datingList }">
					<tr>
					<td>
					<span>${date.stuId }</span>
					</td>
					<td>
					<span>${date.stuName }</span>
					</td>
					<td>
					<span>${date.telephone }</span>
					</td><td>
					<span>${date.date }</span>
					</td>
					<td>
					<span>${date.time }</span>
					</td>
					<td>
					<span>${date.statue }</span>
					</td>
					<td>
					<button class="am-btn am-btn-default am-btn-xs am-text-secondary" onclick="subm(${date.dateid })"><span class="am-icon-pencil-square-o"></span> 编辑</button>
					</td>
					</tr>
				</c:forEach>
             		</tr>
             	</tbody>
         
		</table>
       </div>
     </div>
     <form name="dateidForm" id="dateidForm" action="date.up" method="post">
     <input type="hidden" name="dateid" id="dateid">
     <input type="hidden" name="statue" id="statue">
     </form>
<script>
function subm(dateid){
	 var statue=prompt("请输入状态或备注");
	 if(statue){
		 var dateidForm=document.getElementById("dateidForm");
		 document.getElementById("dateid").value=dateid;
		 document.getElementById("statue").value=statue;
		 dateidForm.submit();
	 }else
     alert("输入有误！");
	
}
       
</script>
<%@include file="/WEB-INF/jsp/common/foot.jsp" %>
