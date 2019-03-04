<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
  <meta charset="UTF-8">
  <title>智慧校园——只为同学</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport"
        content="width=device-width, initial-scale=1">
  <meta name="format-detection" content="telephone=no">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp"/>

  <link rel="alternate icon" type="image/png" href="${pageContext.request.contextPath}/statics/images/logo.png">
  <link rel="stylesheet" href="http://cdn.amazeui.org/amazeui/2.7.2/css/amazeui.css"/>
  <link rel="stylesheet" href="http://cdn.amazeui.org/amazeui/2.7.2/css/amazeui.min.css"/>
  <style>
    .get {
      background: #1E5B94;
      color: #fff;
      text-align: center;
      padding: 100px 0;
    }

    .get-title {
      font-size: 200%;
      border: 2px solid #fff;
      padding: 20px;
      display: inline-block;
    }

    .get-btn {
      background: #fff;
    }

    .detail {
      background: #fff;
    }

    .detail-h2 {
      text-align: center;
      font-size: 150%;
      margin: 40px 0;
    }

    .detail-h3 {
      color: #1f8dd6;
    }

    .detail-p {
      color: #7f8c8d;
    }

    .detail-mb {
      margin-bottom: 30px;
    }

    .hope {
      background: #0bb59b;
      padding: 50px 0;
    }

    .hope-img {
      text-align: center;
    }

    .hope-hr {
      border-color: #149C88;
    }

    .hope-title {
      font-size: 140%;
    }

    .about {
      background: #fff;
      padding: 40px 0;
      color: #7f8c8d;
    }

    .about-color {
      color: #34495e;
    }

    .about-title {
      font-size: 180%;
      padding: 30px 0 50px 0;
      text-align: center;
    }

    .footer p {
      color: #7f8c8d;
      margin: 0;
      padding: 15px 0;
      text-align: center;
      background: #2d3e50;
    }
  </style>
</head>
<body>
<header class="am-topbar am-topbar-fixed-top">
  <div class="am-container">
    <h1 class="am-topbar-brand">
      <a href="#"><img src="${pageContext.request.contextPath}/statics/images/logo.png" alt="logo" style="height:45px;"></a>
    </h1>

    <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-secondary am-show-sm-only"
            data-am-collapse="{target: '#collapse-head'}"><span class="am-sr-only">导航切换</span> <span
        class="am-icon-bars"></span></button>

    <div class="am-collapse am-topbar-collapse" id="collapse-head">
      <ul class="am-nav am-nav-pills am-topbar-nav">
        <li class="am-active"><a href="#">首页</a></li>
        <li><a href="#news">最新动态</a></li>
        <li><a href="#about">关于我们</a></li>
        <li class="am-dropdown" data-am-dropdown>
          <a class="am-dropdown-toggle" data-am-dropdown-toggle href="javascript:;">
            友情链接 <span class="am-icon-caret-down"></span>
          </a>
          <ul class="am-dropdown-content">
            <li><a href="#">GitHub</a></li>
            <li><a href="#">Gitee</a></li>
            <li><a href="#">Bolg</a></li>
          </ul>
        </li>
      </ul>

      <div class="am-topbar-right">
        <button class="am-btn am-btn-primary am-topbar-btn am-btn-sm" onclick="openpage()"><span class="am-icon-user"></span> 登录</button>
      </div>
    </div>
  </div>
</header>

<div class="get">
  <div class="am-g">
    <div class="am-u-lg-12">
      <h1 class="get-title">智慧校园——只为同学</h1>

      <p>
        老师您好，本系统管理员账户为admin，密码为123456，此账号为管理员账号即老师账号 ，<br/>
        学生账号为student1，密码为123456。
     老师辛苦了<br/>
     <a href="/zhxy/login">点击此处登录</a>或点击右上方登录。
      </p>

      <p>
        <a href="#about" class="am-btn am-btn-sm get-btn">I'm in</a>
      </p>
    </div>
  </div>
</div>

<div class="detail">
  <div class="am-g am-container">
    <div class="am-u-lg-12">
      <h2 class="detail-h2">一个网页，全部功能，迎接便捷校园生活!</h2>

      <div class="am-g">
        <div class="am-u-lg-4 am-u-md-6 am-u-sm-12 detail-mb">

          <h3 class="detail-h3">
            <i class="am-icon-mobile am-icon-sm"></i>
            电脑、手机双端WEB
          </h3>

          <p class="detail-p">
            整体使用 Amaze UI ，其业内先进的 mobile first 理念，从小屏逐步扩展到大屏，无论是用手机还是用电脑，都可以快速得到想要的功能。
          </p>
        </div>
        <div class="am-u-lg-4 am-u-md-6 am-u-sm-12 detail-mb">
          <h3 class="detail-h3">
            <i class="am-icon-cogs am-icon-sm"></i>
            功能丰富，多样化
          </h3>

          <p class="detail-p">
            智慧校园并不满足于其主体———心理咨询预约，同时拥有数十个日常使用最频繁的功能如看课表、查空自习室、考试提醒、学习监督、自习抢座……涵盖校园生活、学习。
          </p>
        </div>
        <div class="am-u-lg-4 am-u-md-6 am-u-sm-12 detail-mb">
          <h3 class="detail-h3">
            <i class="am-icon-check-square-o am-icon-sm"></i>
            学校自定义小功能
          </h3>

          <p class="detail-p">
            我们的智慧校园可以在任意校园使用，每套系统拥有独立服务器、独立数据库，充分利用学校空余资源，本校运营者可在此基础上自行开发并同意与我们共享开发成果，一起努力实现大学校园信息化。
          </p>
        </div>

      </div>
    </div>
  </div>
</div>



<div id="about" class="about">
  <div class="am-g am-container">
    <div class="am-u-lg-12">

      <div class="am-g">
        <div class="am-u-lg-6 am-u-md-4 am-u-sm-12">
            
          <form class="am-form" action="/zhxy/user/fankui.do" method="POST">
            <label for="address" class="about-color">你的姓名</label>
            <input name="address" id="address" type="text">
            <br/>
            <label for="content" class="about-color">你的留言</label>
            <textarea rows="12" name="content" id="content"></textarea>
            <br/>
            <button type="submit" class="am-btn am-btn-primary am-btn-sm"><i class="am-icon-check"></i> 提 交</button>
          </form>
          <hr class="am-article-divider am-show-sm-only">
        </div>

        <div class="am-u-lg-6 am-u-md-8 am-u-sm-12">
          <h4 class="about-color">关于我们</h4>

          <p>智慧校园心理预约系统，意在实现在大学生成长成才过程中从防治心理疾病、加强心理调节、完善心理品质三个层次履行教育职能 ，
		          实现服务功能，为师生提供主动、便捷、及时、有效的心理健康服务；通过系统的在线预约功能，学生可以提前和辅导老师进行预约，
		          在规定的时间进行心理咨询，避免了排队等待造成的时间的浪费，切实提高大学生的心理健康教育与咨询工作效率与质量，
		          为大学生健康成长和全面成才服务。</p>
          <h4 class="about-color">团队介绍</h4>

          <p>本系统的使用人员，主要包括学生、辅导老师和系统管理员。学生通过本系统在自己合适的时间提出预约申请，
		          并在约定的时间及时进行交流沟通，节省漫无目的的排队时间，提高效率。辅导老师进入本系统，
		          可以接受或拒绝学生的预约，查看学生的预约咨询记录，分析该学生的心理健康状况，
		          能够尽早地发现和预防学生较为普遍存在的各种心理问题。</p>
        </div>
      </div>
    </div>
  </div>
</div>

<footer class="footer">
  <p>智慧校园 © 2019</p>
</footer>

<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="http://cdn.amazeui.org/amazeui/2.7.2/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->



<!--[if (gte IE 9)|!(IE)]><!-->
  
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<!--<![endif]-->
<script src="http://cdn.amazeui.org/amazeui/2.7.2/js/amazeui.min.js"></script>
<script>
  $(function(){
    $('a').click(function(){
        //根据a标签的href转换为id选择器，获取id元素所处的位置，并高度减50px（这里根据需要自由设置）
        $('html,body').animate({scrollTop: ($($(this).attr('href')).offset().top -50 )},300);
    });
  });
    function openpage(){
  window.location.href="./login"
  }
  </script>
</body>
</html>