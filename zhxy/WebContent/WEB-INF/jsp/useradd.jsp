<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/head_t.jsp"%>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/useradd.js"></script>
<div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>个人信息修改界面</span>
        </div>
        <div class="providerAdd">
            <form id="userForm" name="userForm" method="post" action="${pageContext.request.contextPath }/user/useraddsave.html" enctype="multipart/form-data">
				<input type="hidden" name="method" value="add">
                <!--div的class 为error是验证错误，ok是验证成功-->
                <div>
                    <label for="userCode">学工账号：</label>
                    <input type="text" name="userCode" id="userCode" value="${userSession.userId }"> 
					<!-- 放置提示信息 -->
					<font color="red"></font>
                </div>
                <div>
                    <label for="userName">用户姓名：</label>
                    <input type="text" name="userName" id="userName" value="${userSession.userName }"> 
					<font color="red"></font>
                </div>
                <div>
                    <label for="userPassword">用户密码：</label>
                    <input type="password" name="userPassword" id="userPassword" value=""> 
					<font color="red"></font>
                </div>
                <div>
                    <label for="ruserPassword">确认密码：</label>
                    <input type="password" name="ruserPassword" id="ruserPassword" value=""> 
					<font color="red"></font>
                </div>
                <div>
                    <label >用户性别：</label>
					<select name="gender" id="gender">
					    <option value="1" selected="selected">male</option>
					    <option value="2">female</option>
					 </select>
                </div>
                <div>
                    <label for="grade">年级：</label>
                    <input type="text" name="grade" id="grade" value=""> 
					<font color="red"></font>
                </div>
                <div>
                    <label for="major">学院：</label>
                    <input type="text" name="major" id="major" value=""> 
					<font color="red"></font>
                </div>
                <div>
                    <label for="Sclass">班级：</label>
                    <input type="text" name="Sclass" id="Sclass" value=""> 
					<font color="red"></font>
                </div>
                <div>
                    <label for="telephone">用户电话：</label>
                    <input type="text" name="telephone" id="telephone" value=""> 
					<font color="red"></font>
                </div>
                
                <div>
                    <label >用户角色：</label>
                    <!-- 列出所有的角色分类 -->
					<!-- <select name="userRole" id="userRole"></select> -->
					<select name="userRole" id="userRole">
						<option value="1">学生</option>
					</select>
	        		<font color="red"></font>
                </div>
                <div>
                	<input type="hidden" id="errorinfo" value="${uploadFileError}"/>
                    <label for="a_idPicPath">证件照：</label>
                   	<input type="file" name="attachs" id="a_idPicPath"/>
                    <font color="red"></font>
                </div>
               
                <div class="providerAddBtn">
                    <input type="button" name="add" id="add" value="保存" >
					<input type="button" id="back" name="back" value="返回" >
                </div>
            </form>
        </div>
</div>
</section>
<%@include file="/WEB-INF/jsp/common/foot.jsp" %>

