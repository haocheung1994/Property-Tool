<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lc
  Date: 2017/6/21
  Time: 15:40
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
  <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
  <h1 class="mui-title">简历管理</h1>
</header>

<!--

-->
<%--<c:if test="${loginUser.usertype == '企业' }">--%>

<c:if test="${loginUser.usertype =='个人'}">
<div class="mui-content" style="padding-bottom: 50px;">
  <link href="/index/css/font.css" rel="stylesheet" />


  <ul class="mui-table-view" style="margin-top: 10px; margin-left: 10px; margin-right: 10px;">
    <li class="mui-table-view-cell mui-media">
      <a href="/myResume?userid=${userId}">
      <div align=center>

        <svg class="icon" aria-hidden="true">
          <use xlink:href="#icon-xiugai"></use>
        </svg>
        </br>
        <span>点击修改简历</span>

      </div>
      </a>
    </li>
  </ul>
</div>
</c:if>





</html>
