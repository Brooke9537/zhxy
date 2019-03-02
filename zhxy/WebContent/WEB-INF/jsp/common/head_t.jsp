<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>	
<!doctype html>
<html class="no-js fixed-layout">
<head>
  <!--[if lt IE 9]>
  <script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
  <script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
  <script src="http://cdn.amazeui.org/amazeui/2.7.2/js/amazeui.ie8polyfill.min.js"></script>
  <![endif]-->
  <!--[if (gte IE 9)|!(IE)]><!-->
  <script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
  <!--<![endif]-->
  <script src="http://cdn.amazeui.org/amazeui/2.7.2/js/amazeui.min.js"></script>

  <title>教师首页</title>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="keywords" content="index">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <meta name="apple-mobile-web-app-title" content="Amaze UI" />

  <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/statics/images/logo.png">
  <link rel="stylesheet" href="http://cdn.amazeui.org/amazeui/2.7.2/css/amazeui.min.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/admin.css">
</head>
<body>
<!--头部-->
<header class="am-topbar am-topbar-inverse admin-header">
  <div class="am-topbar-brand">
    <strong>智慧校园</strong> <small>教师端</small>
  </div>

  <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only" data-am-collapse="{target: '#topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></button>

  <div class="am-collapse am-topbar-collapse" id="topbar-collapse">

    <ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list">
      <li class="am-dropdown" data-am-dropdown>
        <a class="am-dropdown-toggle" data-am-dropdown-toggle href="javascript:;">
          <span class="am-icon-users"></span>  ${userSession.userName } , 欢迎你！ <span class="am-icon-caret-down"></span>
        </a>
        <ul class="am-dropdown-content">
          <li><a href="tinfo.html"><span class="am-icon-user"></span> 个人信息</a></li>
          <li><a href="setting.html"><span class="am-icon-cog"></span> 系统设置</a></li>
          <li><a href="#"><span class="am-icon-power-off"></span> 退出登录</a></li>
        </ul>
      </li>
    </ul>
  </div>
</header>

<div class="am-cf admin-main">
  <!-- sidebar start -->
  <div class="admin-sidebar am-offcanvas" id="admin-offcanvas">
    <div class="am-offcanvas-bar admin-offcanvas-bar">
      <ul class="am-list admin-sidebar-list">
        <li><a href="/zhxy/user/admin.html"><span class="am-icon-home"></span> 首页 </a></li>
        <li><a href="${pageContext.request.contextPath}/user/useradd.html"><span class="am-icon-home"></span> 个人信息 </a></li>

        <li class="admin-parent">
            <a class="am-cf" data-am-collapse="{parent: '#accordion', target: '#collapse-nav2'}"><span class="am-icon-file"></span> 心理咨询预约 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
            <ul class="am-panel-collapse am-collapse am-list admin-sidebar-sub am-in" id="collapse-nav2">
              <li><a href="${pageContext.request.contextPath }/user/userlist.html" class="am-cf"><span class="am-icon-th"></span>  待确定预约<span class="am-badge am-badge-danger am-margin-right am-fr">1</span></a></li>
              <li><a href="${pageContext.request.contextPath }/user/userlist.html"><span class="am-icon-puzzle-piece"></span>  未完成预约<span class="am-badge am-badge-warning am-margin-right am-fr">2</span></a></li>
              <li><a href="${pageContext.request.contextPath }/user/userlist.html"><span class="am-icon-check"></span>  已完成预约<span class="am-badge am-badge-secondary am-margin-right am-fr">24</span></a></li>
            </ul>
          </li>
        <li><a href="${pageContext.request.contextPath }/user/userlist.html"><span class="am-icon-table"></span> 预约计划</a></li>
        <li><a href="/zhxy/welcome#about"><span class="am-icon-pencil-square-o"></span> BUG反馈</a></li>
        <li><a href="${pageContext.request.contextPath }/user/logout.html"><span class="am-icon-sign-out"></span> 退出登录</a></li>
      </ul>

      <div class="am-panel am-panel-default admin-sidebar-panel">
        <div class="am-panel-bd">
          <p><span class="am-icon-bookmark"></span> 公告</p>
          <p>${gg }</p>
        </div>
      </div>

    </div>
  </div>
 <!--主体内容-->
 <div class="admin-content">
     <input type="hidden" id="path" name="path" value="${pageContext.request.contextPath }"/>
     <input type="hidden" id="referer" name="referer" value="<%=request.getHeader("Referer")%>"/>