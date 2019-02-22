<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="zh">
  <meta charset="UTF-8">
  <title>登录 | 智慧校园</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="format-detection" content="telephone=no">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="stylesheet" href="${pageContext.request.contextPath }/statics/css/amazeui.min.css"/>
  <style>
    .header {
      text-align: center;
    }
    .header h1 {
      font-size: 200%;
      color: #333;
      margin-top: 30px;
    }
    .footer p {
      color: #000000;
      margin: 0;
      padding: 15px 0;
      text-align: center;
    }
  </style>
</head>
<body>
<div class="header">
  <div class="am-g">
    <h1>智慧校园——登录</h1>
  </div>
  <hr />
</div>
<div class="am-g">
  <div class="am-u-lg-6 am-u-md-8 am-u-sm-centered">
    <form class="am-form" action="${pageContext.request.contextPath }/user/dologin.html"  name="actionForm" id="actionForm"  method="post" >
      <label for="user">学号/工号:</label>
      <input type="text" name="userId" id="userId" value="">
      <br>
      <label for="password">密码:</label>
      <input type="password" name="userPassword" id="userPassword" value="">
      <br>
      <label for="remember-me">
        <input id="remember-me" type="checkbox">
        记住密码
      </label>
      <br/><br/>
      <div class="am-cf">
        <input type="submit" name="" value="登 录" class="am-btn am-btn-primary am-btn-sm am-fl">
        <a href="forget.html" class="am-btn am-btn-sm am-btn-default am-fr">忘记密码?</a>
      </div>
    </form>
    <hr>
    
<footer class="footer">
  <p>智慧校园 © 2019</p>
</footer>
  </div>
</div>
</body>
</html>
