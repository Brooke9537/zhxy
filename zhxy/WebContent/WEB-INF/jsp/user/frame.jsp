<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/head_s.jsp"%>
    <div class="admin-content-body">
        <img class="wColck" src="${pageContext.request.contextPath }/statics/images/clock.jpg" alt=""/>
        <div class="wFont">
            <h2 style="color:#66CD00">${userSession.userName }</h2>
            <p style="font-size:20px"><strong>欢迎使用 曲阜师范大学心理咨询预约系统!</strong></p>
        </div>
    </div>
<%@include file="/WEB-INF/jsp/common/foot.jsp" %>
