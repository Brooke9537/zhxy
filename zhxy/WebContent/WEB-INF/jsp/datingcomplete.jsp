<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/head_s.jsp"%>
<!DOCTYPE html>、
<head>

 <meta charset="utf-8">
 <title>学生心理咨询预约成功界面</title>
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="keywords" content="table">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="icon" type="image/png" href="assets/i/favicon.png">
  <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
  <meta name="apple-mobile-web-app-title" content="Amaze UI" />
  <link rel="stylesheet" href="assets/css/amazeui.min.css"/>
  <link rel="stylesheet" href="assets/css/admin.css">
</head>

<div class="right">
  <div class="admin-content">
  	<div class="admin-content-body">
    <div class="am-cf am-padding am-padding-bottom-0">
      <div class="am-fl am-cf">
        <strong class="am-text-primary am-text-lg">你现在所在的位置是:</strong> >> <small>心理咨询预约完成页面</small> 
      </div>
    </div>

    <div class="am-u-sm-12">
          <form class="am-form">
          	<table class="am-table am-table-striped am-table-hover table-main">
             <thead>
              	<tr>
               	<th class="table-id">学号 </th>
               	<th class="table-name">预约姓名</th>
               	<th class="table-gender">预约时间</th>
               	<th class="table-gender">预约状态</th>               				
              	</tr>
            </thead>
             <tbody>
              		<tr>
              		<c:forEach var="datestudent" items="${datestudentList }" varStatus="status">
						<tr>
						<td>
						<span>${datestudent.stuId }</span>
						</td>
						<td>
						<span>${datestudent.stuName }</span>
						</td>
						<td>
						<span>${ddatastudent.gender }</span>
						</td>
						<td>
						<span>${datestudent.major }</span>
						</td><td>
						<span>${datestudent.telephtone }</span>
						</td><td>
						<span>${datestudent.time }</span>
						</td>
						<td>
						<div class="am-btn-toolbar">
                    		<div class="am-btn-group am-btn-group-xs">
                      		<button class="am-btn am-btn-default am-btn-xs am-text-secondary"><span class="am-icon-pencil-square-o"></span> 查看</button>
                      		<button class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only"><span class="am-icon-trash-o" ></span> 删除</button>
                    		</div>
                  		</div>
						</td>
						</tr>
					</c:forEach>
              		</tr>
              	</tbody>
            	
            	</div>
            
            </div>
          
			</table>
			<input type="hidden" id="totalPageCount" value="${totalPageCount}"/>
		  	<c:import url="rollpage.jsp">
	          	<c:param name="totalCount" value="${totalCount}"/>
	          	<c:param name="currentPageNo" value="${currentPageNo}"/>
	          	<c:param name="totalPageCount" value="${totalPageCount}"/>
          	</c:import>
        </div>
      </div>
    </div>


<%@include file="/WEB-INF/jsp/common/foot.jsp" %>
