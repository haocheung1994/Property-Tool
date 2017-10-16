<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/31
  Time: 16:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>

<head>
  <meta charset="UTF-8">
  <title></title>
  <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
  <link href="css/mui.min.css" rel="stylesheet" />
  <link rel="stylesheet" type="text/css" href="iconfont/iconfont.css"/>
</head>

<body>
<script src="js/mui.min.js"></script>
<script type="text/javascript">
  mui.init()
</script>
<!--
    搜索框
-->
<div id="search" class="mui-search mui-active">
  <input type="search" class="mui-input-clear" placeholder="搜索职位/公司">
</div>
<!--
    数据列表
-->
<div>
  <ul class="mui-table-view ">
    <li class="mui-table-view-cell mui-media">
      <a href="javascript:;">
        <link href="css/font.css" rel="stylesheet" />
        <div id="divcss5">
          <img class="mui-media-object mui-pull-left" src="img/test2.jpg">
        </div>
        <div id="JobPosted" class="mui-media-body">
          <span2>3.5千-4千</span2>
          <p class="mui-ellipsis"><span1>徐州万科物业高薪诚聘管理人员</span1></p>
          <p class="mui-ellipsis"><span3>南京万科物业管理有限公司</span3></p>
          <span3 class="mui-active" style="margin-left: auto;">徐州</span3>
          <span class="mui-active" >5-17</span>
        </div>
    </li>
    <li class="mui-table-view-cell mui-media">
      <a href="javascript:;">
        <link href="css/font.css" rel="stylesheet" />
        <div id="divcss5">
          <img class="mui-media-object mui-pull-left" src="img/test2.jpg">
        </div>
        <div id="JobPosted" class="mui-media-body">
          <span2>3.5千-4千</span2>
          <p class="mui-ellipsis"><span1>徐州万科物业高薪诚聘管理人员</span1></p>
          <p class="mui-ellipsis"><span3>南京万科物业管理有限公司</span3></p>
          <span3 class="mui-active" style="margin-left: auto;">徐州</span3>
          <span class="mui-active" >5-17</span>
        </div>
    </li>
    <li class="mui-table-view-cell mui-media">
      <a href="javascript:;">
        <link href="css/font.css" rel="stylesheet" />
        <div id="divcss5">
          <img class="mui-media-object mui-pull-left" src="img/test2.jpg">
        </div>
        <div id="JobPosted" class="mui-media-body">
          <span2>3.5千-4千</span2>
          <p class="mui-ellipsis"><span1>徐州万科物业高薪诚聘管理人员</span1></p>
          <p class="mui-ellipsis"><span3>南京万科物业管理有限公司</span3></p>
          <span3 class="mui-active" style="margin-left: auto;">徐州</span3>
          <span class="mui-active" >5-17</span>
        </div>
    </li>
    <li class="mui-table-view-cell mui-media">
      <a href="javascript:;">
        <link href="css/font.css" rel="stylesheet" />
        <div id="divcss5">
          <img class="mui-media-object mui-pull-left" src="img/test2.jpg">
        </div>
        <div id="JobPosted" class="mui-media-body">
          <span2>3.5千-4千</span2>
          <p class="mui-ellipsis"><span1>徐州万科物业高薪诚聘管理人员</span1></p>
          <p class="mui-ellipsis"><span3>南京万科物业管理有限公司</span3></p>
          <span3 class="mui-active" style="margin-left: auto;">徐州</span3>
          <span class="mui-active" >5-17</span>
        </div>
    </li>
    <li class="mui-table-view-cell mui-media">
      <a href="javascript:;">
        <link href="css/font.css" rel="stylesheet" />
        <div id="divcss5">
          <img class="mui-media-object mui-pull-left" src="img/test2.jpg">
        </div>
        <div id="JobPosted" class="mui-media-body">
          <span2>3.5千-4千</span2>
          <p class="mui-ellipsis"><span1>徐州万科物业高薪诚聘管理人员</span1></p>
          <p class="mui-ellipsis"><span3>南京万科物业管理有限公司</span3></p>
          <span3 class="mui-active" style="margin-left: auto;">徐州</span3>
          <span class="mui-active" >5-17</span>
        </div>
    </li>
    <li class="mui-table-view-cell mui-media">
      <a href="javascript:;">
        <link href="css/font.css" rel="stylesheet" />
        <div id="divcss5">
          <img class="mui-media-object mui-pull-left" src="img/test2.jpg">
        </div>
        <div id="JobPosted" class="mui-media-body">
          <span2>3.5千-4千</span2>
          <p class="mui-ellipsis"><span1>徐州万科物业高薪诚聘管理人员</span1></p>
          <p class="mui-ellipsis"><span3>南京万科物业管理有限公司</span3></p>
          <span3 class="mui-active" style="margin-left: auto;">徐州</span3>
          <span class="mui-active" >5-17</span>
        </div>
    </li>
  </ul>
</div>
<!--
        描述：底部菜单 strat
    -->


<div class="nav">
  <ul>
    <li>
      <a href="ndex.html"><span><img id="imag1" src="img/market.png" height="20" ></span>
        </br><span>首页</span></a>
    </li>
    <li style="position:relative;">
      <a href="resume.html"><span><img id="imag2" src="img/resume.png" height="20"></span>
        </br><span>简历</span></a>
    </li>
    <li>
      <a href="position.html"><span><img id="imag3" src="img/position.png" height="20" ></span>
        </br><span>职位</span></a>
    </li>
    <li>
      <a href="market.html"><span><img id="imag4" src="img/market.png" height="20"></span>
        </br><span>商城</span></a>
    </li>
    <li>
      <a href="order.html"><span><img id="imag5" src="img/order.png" height="20" ></span>
        </br><span>订单</span></a>
    </li>

  </ul>

</div>
</body>
</html>
