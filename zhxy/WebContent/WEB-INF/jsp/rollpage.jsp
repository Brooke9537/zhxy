<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/rollpage.js"></script>
<div class="am-cf">共 ${param.totalCount } 条记录
	<div class="am-fr">
		<ul class="am-pagination">

			<c:choose>  
				<c:when test="${param.currentPageNo > 1}"> 
					<li><a href="javascript:page_nav(document.forms[0],${param.currentPageNo-1});">&laquo;</a></li>
				</c:when>
				<c:otherwise> 
					<!-- li class="am-disabled"><a href="javascript:page_nav(document.forms[0],${param.currentPageNo-1});">&laquo;</a></li--> 
				</c:otherwise>
			</c:choose>

			<c:forEach var="page" begin="1" end="${param.totalPageCount }">
				<c:choose>  
					<c:when test="${page == param.currentPageNo }"> 
						<li class="am-active"><a href="javascript:page_nav(document.forms[0],${page });">${page }</a></li>
					</c:when>
					<c:otherwise> 
						<li><a href="javascript:page_nav(document.forms[0],${page });">${page }</a></li> 
					</c:otherwise>
				</c:choose>
			</c:forEach>
    
			<c:choose>  
				<c:when test="${param.currentPageNo < param.totalPageCount }"> 
					<li><a href="javascript:page_nav(document.forms[0],${param.currentPageNo+1});">&raquo;</a></li>
				</c:when>
				<c:otherwise> 
					<!-- li class="am-disabled"><a href="javascript:page_nav(document.forms[0],${param.currentPageNo+1});">&raquo;</a></li--> 
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
</div>