<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/6/2
  Time: 12:26
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
  <link href="/RecruitModule/css/mui.poppicker.css" rel="stylesheet" />
  <link href="/RecruitModule/css/mui.picker.css" rel="stylesheet" />
  <link href="/RecruitModule/css/mui.dtpicker.css" rel="stylesheet" />
</head>

<body>
<script src="/RecruitModule/js/mui.min.js"></script>
<script src="/RecruitModule/js/mui.dtpicker.js"></script>
<script src="/RecruitModule/js/mui.picker.js"></script>
<script src="/RecruitModule/js/mui.poppicker.js"></script>
<script src="/RecruitModule/js/jquery1.9.1.min.js"></script>
<script src="/RecruitModule/js/city.data-3.js"></script>
<script type="text/javascript">
  mui.init()
</script>

<!--
    标题栏
-->
<link href="/RecruitModule/css/position_info.css" rel="stylesheet"/>
<header class="mui-bar mui-bar-nav" >
  <a class=" mui-icon mui-icon-left-nav mui-pull-left" href="/showapply?userid=${userId}" ></a>
  <a class="mui-icon iconfont icon-fabu mui-pull-right" style="color: white;"></a>
  <h1 class="mui-title">发布成功</h1>
</header>

<!--
    编辑内容
-->

<div class="mui-content">


  <ul class="mui-table-view" style="margin-left: 10px;margin-right: 10px;margin-bottom: 10px;">
    <input  class="mui-btn mui-btn-blue mui-btn-block" value="发布成功">
  </ul>



</body>

</html>
