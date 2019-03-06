<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/head_s.jsp"%>
   <div class="admin-content-body">
   	<div class="am-g">
   	<div class="am-cf am-padding am-padding-bottom-0">
		<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">我的书架</strong> / <small>MyBook</small>
		</div>
</div><hr>
   		<div class="am-u-sm-12">
 				
 				<table class="am-table am-table-striped am-table-hover table-main">
     			<thead>
     			<tr>
      				<th class="table-id">书籍编号</th>
      				<th class="table-name">书名</th>
      				
      				
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
<div class="am-btn-toolbar">			
              		<div class="am-btn-group am-btn-group-xs">
              		<form>
              		<input type="hidden" id="BookId">
              		<input type="hidden" id="BookName">
              		<input type="hidden" id="isborrow" value="${userSession.userId }">
                		<button class="am-btn am-btn-default am-btn-xs am-text-secondary"><span class="am-icon-pencil-square-o"></span> 查看</button>
                		</form></div>
            		</div>
</td>
</tr>
</c:forEach>
   		</tr>
   	</tbody>
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
