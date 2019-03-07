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
		<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">我的书架</strong> / <small>MyBook</small>
		</div>
</div><hr>
   		<ul class="am-avg-sm-2 am-avg-md-2 am-avg-lg-4 am-margin gallery-list">
        <li>
          <a href="#">
            <img class="am-img-thumbnail am-img-bdrs" src="http://img3m3.ddimg.cn/20/16/25079393-1_w_3.jpg" alt="">
            <div class="gallery-title"> 人生的智慧</div>
          </a>
        </li>
        <li>
          <a href="#">
            <img class="am-img-thumbnail am-img-bdrs" src="http://img3m5.ddimg.cn/77/22/26470895-1_w_3.jpg" alt="">
            <div class="gallery-title">美的进化</div>
          </a>
        </li>
        <li>
          <a href="#">
            <img class="am-img-thumbnail am-img-bdrs" src="http://img3m3.ddimg.cn/60/23/26487213-1_w_2.jpg" alt="">
            <div class="gallery-title">我的瓦格纳人生</div>
          </a>
        </li>
        <li>
          <a href="#">
            <img class="am-img-thumbnail am-img-bdrs" src="http://img3m5.ddimg.cn/57/14/26445135-1_w_8.jpg" alt="">
            <div class="gallery-title">生活需要节奏感</div>
          </a>
        </li>
        <p>以上书籍及图片来自当当网。</p>
      </ul>
  </div>
</div>

<%@include file="/WEB-INF/jsp/common/foot.jsp" %>
