<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/head_s.jsp"%>

 	<div class="admin-content-body">
   <div class="am-cf am-padding am-padding-bottom-0">
     <div class="am-fl am-cf">
       <strong class="am-text-primary am-text-lg">已成功预约</strong> / <small>Complete</small> 
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
					
					</tr>
				</c:forEach>
             		</tr>
             	</tbody>
         
		</table>
       </div>
     </div>
<%@include file="/WEB-INF/jsp/common/foot.jsp" %>
