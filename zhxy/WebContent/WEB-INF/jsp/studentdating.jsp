<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/head_s.jsp"%>
<!DOCTYPE html>、
<head>

 <meta charset="utf-8">
 <title>学生心理咨询预约界面</title>
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="keywords" content="table">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="icon" type="image/png" href="assets/i/favicon.png">
  <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
  <meta name="apple-mobile-web-app-title" content="Amaze UI" />
  <link rel="stylesheet" href="assets/css/amazeui.min.css"/>
  <link rel="stylesheet" href="assets/css/admin.css">
</head>

<div class="right">
  <div class="admin-content">
  	<div class="admin-content-body">
    <div class="am-cf am-padding am-padding-bottom-0">
      <div class="am-fl am-cf">
        <strong class="am-text-primary am-text-lg">你现在所在的位置是:</strong> >> <small>心理咨询预约页面</small> 
      </div>
    </div>
    <hr>

    <div class="am-tabs am-margin" data-am-tabs>
      <ul class="am-tabs-nav am-nav am-nav-tabs">
        <li class="am-active"><a href="#tab1">基本信息</a></li>
      </ul>
       <div class="am-tabs-bd">
        <div class="am-tab-panel am-fade am-in am-active" id="tab1">
          <div class="am-g am-margin-top">
            <div class="am-u-sm-4 am-u-md-2 am-text-right">
              预约日期
            </div>
            <div class="am-u-sm-8 am-u-md-10">
              <form action="" class="am-form am-form-inline">
                <div class="am-form-group am-form-icon">
                  <i class="am-icon-calendar"></i>
                  <input type="date" class="am-form-field am-input-sm" placeholder="日期">
                </div>
              </form>
            </div>
          </div>
          
          <div class="am-g am-margin-top">
            <div class="am-u-sm-4 am-u-md-2 am-text-right">预约课时时间</div>
            <div class="am-u-sm-8 am-u-md-10">
              <select data-am-selected="{btnSize: 'sm'}">
                <option value="option1">8：00 --9：40</option>
                <option value="option2">10：00 --11：40</option>
                <option value="option3">14：00 --15：40</option>
                <option value="option4">16：00 --17：40</option>
              </select>
            </div>
          </div>
    	</div>
      <div class="am-margin">
      	<button type="button" class="am-btn am-btn-primary am-btn-xs">提交保存</button>
      	<button type="button" class="am-btn am-btn-primary am-btn-xs">放弃保存</button>
      </div>
  	</div>
	</div>
   </div>
</div>
</div>

<%@include file="/WEB-INF/jsp/common/foot.jsp" %>
