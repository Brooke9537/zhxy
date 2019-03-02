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
        			<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">你现在所在的位置是:</strong> >> <small>图书信息页面</small>
        			</div>
      			</div>
      			<div class="am-u-sm-12 am-u-md-3">
         			 <div class="am-input-group am-input-group-sm">
           			 	<form method="post" action="${pageContext.request.contextPath }/user/booklist.html">
							<input name="method" value="query" class="input-text" type="hidden">
						    <input name="queryBookName" class="input-text"	type="text" value="${queryBookName }">
					 		<input type="hidden" name="pageIndex" value="1"/>
					
						</form>
          			 	<span class="am-input-group-btn">
            		 	<button class="am-btn am-btn-default" type="button">查询</button>
          			 </span>
          			</div>
       			 </div>
            		<div class="am-u-sm-12">
          				<form class="am-form">
          				<table class="am-table am-table-striped am-table-hover table-main">
              			<thead>
              			<tr>
               				<th class="table-id">书籍编号</th>
               				<th class="table-name">书名</th>
               				<th class="table-gender">价格</th>
               				
              			</tr>
            			</thead>
             	 <tbody>
              		<tr>
              		<c:forEach var="book" items="${bookList }" varStatus="status">
						<tr>
						<td>
						<span>${book.bookId }</span>
						</td>
						<td>
						<span>${book.bookName }</span>
						</td>
						<td>
						<span>${book.isborrow }</span>
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
