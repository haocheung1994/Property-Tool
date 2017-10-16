<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>

<head>
  <meta charset="UTF-8">
  <title></title>
  <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
  <link href="/RecruitModule/css/mui.min.css" rel="stylesheet" />
  <link rel="stylesheet" type="text/css" href="/index/iconfont/iconfont.css"/>
  <link rel="stylesheet" href="/index/iconfont/demo.css">
</head>

<body>
<style>
  A:hover
  {
    text-decoration:none;
  }
</style>
<script src="/index/js/mui.min.js"></script>
<script type="text/javascript" src="/index/js/mui.js" ></script>
<script src="/index/iconfont/iconfont.js"></script>
<script type="text/javascript">
  mui.init()
</script>
<style type="text/css">
  .icon {
    width: 4em; height: 4em;
    vertical-align: -0.15em;
    fill: currentColor;
    overflow: hidden;
    margin-left: 100px;
    margin-right: 100px;
  }
</style>

<!--
    标题栏
-->
<link href="/index/css/position_info.css" rel="stylesheet"/>
<header class="mui-bar mui-bar-nav" >

  <h1 class="mui-title">简历管理</h1>
</header>
<div class="mui-content" style="margin-top: 40%;padding-bottom: 50px;">
  <div style="color: #4d525d;font-size: 20px" align="center">
    <div align="center"><img src="/index/img/error.png"style="max-width:50%;"></div>
    您尚未开通本模块服务
  </div>
</div>
</div>
<jsp:include page="foot1.jsp"></jsp:include>
</body>
</html>
