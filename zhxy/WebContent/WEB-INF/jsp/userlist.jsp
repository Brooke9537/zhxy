<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/head_s.jsp"%>
 <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Amaze UI Admin table Examples</title>
  <meta name="keywords" content="table">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="icon" type="image/png" href="assets/i/favicon.png">
  <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
  <meta name="apple-mobile-web-app-title" content="Amaze UI" />
  <link rel="stylesheet" href="assets/css/amazeui.min.css"/>
  <link rel="stylesheet" href="assets/css/admin.css">
        <div class="right">
           <div class="admin-content">
            <div class="admin-content-body">
            	<div class="am-g">
            	<div class="am-cf am-padding am-padding-bottom-0">
        			<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">你现在所在的位置是:</strong> >> <small>用户管理页面</small>
        			</div>
      			</div>
      			<div class="am-u-sm-12 am-u-md-3">
         			 <div class="am-input-group am-input-group-sm">
           			 	<form method="post" action="${pageContext.request.contextPath }/user/booklist.html">
							<input name="method" value="query" class="input-text" type="hidden">
						    <input name="queryUserName" class="input-text"	type="text" value="${queryUserName }">
					 		<input type="hidden" name="pageIndex" value="1"/>
					
						</form>
          			 	<span class="am-input-group-btn">
            		 	<button class="am-btn am-btn-primary" type="button">查询</button>
<!--       	<button class="am-btn am-btn-default am-btn-xs am-hide-sm-only"><span class="am-icon-copy"></span> 复制</button> -->          			 </span>
          			</div>
       			 </div>
      			
            		<div class="am-u-sm-12">
          				<form class="am-form">
          				<table class="am-table am-table-striped am-table-hover table-main">
              			<thead>
	              			<tr>
               				<th class="table-id">学工账号</th>
               				<th class="table-name">用户姓名</th>
               				<th class="table-gender">性别</th>
               				<th class="table-grade">年级</th>
               				<!-- <th class="table-major">学院</th> -->
               				<th class="table-telephone">电话</th>
               				   	
              			</tr>
            			</thead>
             	 <tbody>
              		<tr>
              		 <c:forEach var="user" items="${userList }" varStatus="status">
						<tr>
						<td>
						<span>${user.userId }</span>
						</td>
						<td>
						<span>${user.userName }</span>
						</td>
						<td>
						<span>${user.gender }</span>
						</td>
						<td>
						<span>${user.grade }</span>
						</td>
						<%-- <td>
						<span>${user.major }</span>
						</td> --%>
						<td>
						<span>${user.telephone}</span>
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
 </div>
<%@include file="/WEB-INF/jsp/common/foot.jsp" %>


