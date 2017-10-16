<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lc
  Date: 2017/6/20
  Time: 19:25
  To change this template use File | Settings | File Templates.
--%>
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
  <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left" style="color: white;"></a>
  <h1 class="mui-title"style="color: white">角色选择</h1>
</header>

<!--

-->

<div class="mui-content">
  <link href="/index/css/font.css" rel="stylesheet" />
  <ul class="mui-table-view" style="margin-top: 10px;">
    <li class="mui-table-view-cell mui-media">
     <a href="/jobfind">
      <div align=center>
        <img src="/RecruitModule/images/qiuzhi.png"width="50">
        </br>
							<span style="text-align: center;" >
								我要求职</span>

      </div>
      </a>
    </li>
  </ul>
  <ul class="mui-table-view">
    <li class="mui-table-view-cell mui-media">
      <a href="/recruiter">
      <div align=center>
        <img src="/RecruitModule/images/zhaopin.png" width="50">
        </br>
							<span style="text-align: center;">
								我要招聘</span>

      </div>
      </a>
    </li>
  </ul>
</div>
</div>

</body>
</html>
