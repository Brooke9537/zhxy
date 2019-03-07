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
           <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">报修</strong> / <small> Repair</small>
           </div>
      	</div><hr>
        <div class="am-u-sm-12 am-u-md-8 ">
          <form class="am-form am-form-horizontal" action="/zhxy/user/baoxiu.do" method="POST">
            <div class="am-form-group">

              <label for="user-name" class="am-u-sm-3 am-form-label">故障位置 / Location</label>
              <div class="am-u-sm-9">
                <input type="text" name="address" id="address" placeholder="故障位置 / Location">
              </div>
            </div>

            <div class="am-g am-form-group">
              <label for="user-intro" class="am-u-sm-3 am-form-label">故障描述 / Intro</label>
              <div class="am-u-sm-9"> 
                <textarea class="" rows="5"  cols="50" id="content" name="content" placeholder="输入故障介绍"></textarea>
              </div>
            </div>

            <div class="am-form-group">
              <div class="am-u-sm-9 am-u-sm-push-3">
                <input type="submit" value="提交" class="am-btn am-btn-primary">
              </div>
            </div>
          </form>
        </div>
      </div>
      </div>
<%@include file="/WEB-INF/jsp/common/foot.jsp" %>