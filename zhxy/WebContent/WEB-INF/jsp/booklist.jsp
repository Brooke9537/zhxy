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
         	<div class="am-g">
         	<div class="am-cf am-padding am-padding-bottom-0">
     			<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">查询图书</strong> / <small>Book</small>
     			</div>
   			</div><hr>
   			<div class="am-u-sm-12 am-u-md-3">
      			 <div class="am-input-group am-input-group-sm">
        		<form method="GET" action="${pageContext.request.contextPath }/user/booklist.html">
			    <input name="queryBookName" class="input-text"	type="text" value="${queryBookName }">
				<input type="submit" class="am-btn am-btn-default" value="查询">
			</form>
       			 	
       			</div>
    			 </div>
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
                 		<input type="hidden" id="BookId" value="${book.bookId }">
                 		<input type="hidden" id="BookName" value="${book.bookName }">
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
