<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/head_s.jsp"%>
        <div class="right">
            <div class="location">
                <strong>你现在所在的位置是:</strong>
                <span>图书信息页面</span>
            </div>
            <div class="search">
           		<form method="post" action="${pageContext.request.contextPath }/user/booklist.html">
					<input name="method" value="query" class="input-text" type="hidden">
					 <span>书名：</span>
					 <input name="queryBookName" class="input-text"	type="text" value="${queryBookName }">
					 <input type="hidden" name="pageIndex" value="1"/>
					 <input	value="查 询" type="submit" id="searchbutton">
					
				</form>
            </div>
            <!--用户-->
            <table class="providerTable" cellpadding="0" cellspacing="0">
                <tr class="firstTr">
                    <th width="10%">书籍编号</th>
                    <th width="10%">书名</th>
                    <th width="5%">是否借出</th>
                    

                </tr>
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
						<span><a class="deleteUser" href="javascript:;" BookId=${book.bookId } BookName=${book.bookName }><img src="${pageContext.request.contextPath }/statics/images/schu.png" alt="删除" title="删除"/></a></span>
						</td>
					</tr>
				</c:forEach>
			</table>
			<input type="hidden" id="totalPageCount" value="${totalPageCount}"/>
		  	<c:import url="rollpage.jsp">
	          	<c:param name="totalCount" value="${totalCount}"/>
	          	<c:param name="currentPageNo" value="${currentPageNo}"/>
	          	<c:param name="totalPageCount" value="${totalPageCount}"/>
          	</c:import>
        </div>
    </section>

<!--点击删除按钮后弹出的页面-->
<div class="zhezhao"></div>
<div class="remove" id="removeUse">
    <div class="removerChid">
        <h2>提示</h2>
        <div class="removeMain">
            <p>你确定要删除该用户吗？</p>
            <a href="#" id="yes">确定</a>
            <a href="#" id="no">取消</a>
        </div>
    </div>
</div>

<%@include file="/WEB-INF/jsp/common/foot.jsp" %>
