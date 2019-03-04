<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/head_s.jsp"%>
<div class="admin-content-body">
      <div class="am-cf am-padding am-padding-bottom-0">
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">个人资料</strong> / <small>Personal information</small></div>
      </div>

      <hr/>

      <div class="am-g">
        <div class="am-u-sm-12 am-u-md-4 am-u-md-push-8">
          

        </div>

        <div class="am-u-sm-12 am-u-md-8 am-u-md-pull-4">
          <form class="am-form am-form-horizontal">
          	<!-- Chrome自动填充真的烦  -->
			
            <div class="am-form-group">
              <label for="userName" class="am-u-sm-3 am-form-label">姓名 / Name</label>
              <div class="am-u-sm-9">
                <input type="text" id="userName" value="${userSession.userName }" placeholder="姓名 / Name" autocomplete="new-userName">
              </div>
            </div>
			<div class="am-form-group">
			  <label for="gender" value="${userSession.gender }" class="am-u-sm-3 am-form-label">性别 / Sex</label>
				<div class="am-u-sm-9">
				  <select id="gender">
					<option value="男">男</option>
					<option value="女">女</option>
					
				  </select>
				</div>
			</div>
            <div class="am-form-group">
              <label for="grade" class="am-u-sm-3 am-form-label">年级 / Grade</label>
              <div class="am-u-sm-9">
                <input type="text" id="grade" value="${userSession.grade }" placeholder="输入你的年级 / Grade" autocomplete="off">
              </div>
            </div>
            
			 <div class="am-form-group">
              <label for="major" class="am-u-sm-3 am-form-label">学院 / Academy</label>
              <div class="am-u-sm-9">
                <input type="text" id="major" value="${userSession.major }" placeholder="学院 / Academy" autocomplete="off">
              </div>
            </div>
            
            <div class="am-form-group">
              <label for="Sclass" class="am-u-sm-3 am-form-label">班级 /Class</label>
              <div class="am-u-sm-9">
                <input type="text" id="Sclass" value="${userSession.sclass }" placeholder="班级 /Class" autocomplete="off">
              </div>
            </div>

            <div class="am-form-group">
              <label for="telephone" class="am-u-sm-3 am-form-label">电话 / Telephone</label>
              <div class="am-u-sm-9">
                <input type="tel" id="telephone" value="${userSession.telephone }" placeholder="输入你的电话号码 / Telephone" autocomplete="off">
              </div>
            </div>
            
            <div class="am-form-group">
              <label for="userPassword" class="am-u-sm-3 am-form-label">密码 / Password</label>
              <div class="am-u-sm-9">
                <input type="password" id="userPassword" value="${userSession.userPassword }"  placeholder="修改你的密码 / Password" autocomplete="new-password">
              </div>
            </div>

            <div class="am-form-group">
              <div class="am-u-sm-9 am-u-sm-push-3">
                <input type="submit" class="am-btn am-btn-primary" value="保存修改">
              </div>
            </div>
          </form>
        </div>
      </div>
      </div>

<%@include file="/WEB-INF/jsp/common/foot.jsp" %>


