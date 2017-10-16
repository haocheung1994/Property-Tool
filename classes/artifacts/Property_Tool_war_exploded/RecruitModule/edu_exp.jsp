<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/31
  Time: 16:34
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
  <link rel="stylesheet" type="text/css" href="/RecruitModule/iconfont/iconfont.css"/>
</head>

<body>
<script src="/RecruitModule/js/mui.min.js"></script>
<script type="text/javascript">
  mui.init()
</script>

<link href="/RecruitModule/css/position_info.css" rel="stylesheet"/>
<header class="mui-bar mui-bar-nav" >
  <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
  <h1 class="mui-title">教育经历</h1>
</header>

<div class="mui-content">

</div>
<div class="mui-table-view" class="mui-media-body" style="margin-top: 10px; margin-left: 10px;margin-right: 10px;margin-bottom: 10px;">
  <ul class="mui-table-view" style="margin-top: 10px;">

    <c:forEach var="var" items="${eduExpList}" >
      <li class="mui-table-view-cell mui-media">
        <div class="mui-media-body" >
          <p class="mui-icon iconfont icon-bianji mui-icon-left-nav mui-pull-right" style="font-family: '微软雅黑';"><a href="edi_edu.html">编辑</p></a>
          <p>${var.graduationtime}</p>
          <p>${var.eduschoolname}</p>
          <p>${var.degree}-${var.edumajor}</p>
        </div>
      </li>
    </c:forEach>
  </ul>
</div>
</div>
<ul class="mui-table-view" style="margin-left: 10px;margin-right: 10px;margin-bottom: 10px;">
  <a href="/neweduexp">
    <button type="button" class="mui-btn mui-btn-blue mui-btn-block">添加教育经历</button>
  </a>
</ul>
</body>

</html>
