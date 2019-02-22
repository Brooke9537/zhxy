<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/head_t.jsp"%>
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>用户信息页面 >> 学生用户修改页面</span>
        </div>
        <div class="providerAdd">
        <form id="userForm" name="userForm" method="post" action="${pageContext.request.contextPath }/user/usermodifysave1.html">
			<input type="hidden" name="id" value="${user.userId }"/>
			 <div>
                    <label for="userName">用户名称：</label>
                    <input type="text" name="userName" id="userName" value="${user.userName }"> 
					<font color="red"></font>
             </div>
			 <div>
                    <label >用户性别：</label>
                    <select name="gender" id="gender">
						<c:choose>
							<c:when test="${user.gender == 1 }">
								<option value="1" selected="selected">male</option>
					    		<option value="2">female</option>
							</c:when>
							<c:otherwise>
								<option value="1">male</option>
					    		<option value="2" selected="selected">female</option>
							</c:otherwise>
						</c:choose>
					 </select>
             </div>
			
	
		       <div>
                    <label for="usertelephone">用户电话：</label>
                    <input type="text" name="telephone" id="telephone" value="${user.telephone }"> 
                    <font color="red"></font>
               </div>
              
				<div>
                    <label >用户角色：</label>
                    <!-- 列出所有的角色分类 -->
					<%-- <input type="hidden" value="${user.userRole }" id="rid" />
					<select name="userRole" id="userRole"></select> --%>
					
					<select name="userRole" id="userRole">
						<c:choose>
							<c:when test="${user.userRole == 1 }">
								<option value="1" selected="selected">学生</option>
					    		<option value="2">教师</option>
					    		<option value="3">管理员</option>
							</c:when>
							<c:when test="${user.userRole == 2 }">
								<option value="1" selected="selected">学生</option>
					    		<option value="2">教师</option>
					    		<option value="3">管理员</option>
							</c:when>
							<c:otherwise>
								<option value="1" selected="selected">学生</option>
					    		<option value="2">教师</option>
					    		<option value="3">管理员</option>
							</c:otherwise>
						</c:choose>
					 </select>
        			<font color="red"></font>
                </div>
			 <div class="providerAddBtn">
                    <input type="button" name="save" id="save" value="保存" />
                    <input type="button" id="back" name="back" value="返回"/>
                </div>
            </form>
        </div>
    </div>
</section>
<%@include file="/WEB-INF/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/studentusermodify.js"></script>
