<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/6/1
  Time: 14:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
  <meta charset="UTF-8">
  <title></title>
  <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
  <link href="/RecruitModule/css/mui.min.css" type="text/css" rel="stylesheet" />
  <link href="/RecruitModule/iconfont/iconfont.css" rel="stylesheet" />
  <link href="/RecruitModule/css/homepage.css" rel="stylesheet"/>
  <link href="/RecruitModule/css/mui.poppicker.css" rel="stylesheet" />
  <link href="/RecruitModule/css/mui.picker.css" rel="stylesheet" />

</head>

<body class="mui-fullscreen">
<script src="/RecruitModule/js/mui.min.js"></script>
<script type="text/javascript">
  mui.init()
</script>
<!--页面主结构开始-->

<div id="app" class="mui-views">
  <div class="mui-view">
    <div class="mui-navbar">
    </div>
    <div class="mui-pages">
    </div>
  </div>
</div>
<!--页面主结构结束-->
<link href="/RecruitModule/css/search.css" rel="stylesheet"/>
<header id="header1" class="mui-bar mui-bar-nav">
  <h1 class="mui-title" >个人信息</h1>
</header>

<div id="account" class="mui-page" >
  <!--	<div class="mui-navbar-inner mui-bar mui-bar-nav">
          <button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left">
              <span class="mui-icon mui-icon-left-nav"></span>设置
          </button>
          <h1 class="mui-center mui-title">账号与安全</h1>
      </div>-->
  <div class="mui-page-content">
    <div class="mui-scroll-wrapper ">
      <div class="mui-scroll mui-content" style="margin-top: 40px;">
        <ul class="mui-table-view">
          <li class="mui-table-view-cell">
            <a id="head" >头像
								<span class="mui-pull-right head">
									<img class="head-img mui-action-preview" id="head-img1" src="${wechatUserInfo.headImgUrl}" style="width:50;height: 50"/>
								</span>
            </a>
          </li>
          <li class="mui-table-view-cell">
            <a>昵称<span class="mui-pull-right">${wechatUserInfo.nickname}</span></a>
          </li>

          <li class="mui-table-view-cell">
            <c:if test="${wechatUserInfo.sex == '1' }">
              <a>性别<span class="mui-pull-right">男</span></a>
            </c:if>
            <c:if test="${wechatUserInfo.sex == '2' }">
              <a>性别<span class="mui-pull-right">女</span></a>
            </c:if>
            <c:if test="${wechatUserInfo.sex == '0' }">
              <a>性别<span class="mui-pull-right">未知</span></a>
            </c:if>
          </li>

        </ul>
        <ul class="mui-table-view">
          <li class="mui-table-view-cell">
            <a>国家<span class="mui-pull-right">${wechatUserInfo.country}</span></a>
          </li>
          <li class="mui-table-view-cell">
            <a>所在地<span class="mui-pull-right">${wechatUserInfo.province} ${wechatUserInfo.city}</span></a>
          </li>
          <!--<li class="mui-table-view-cell">
              <a>邮箱地址<span class="mui-pull-right">hbuilder@dcloud.io</span></a>
          </li>-->
        </ul>
      </div>
    </div>
  </div>

  <!--
              底部菜单
              -->
  <div class="mui-bar mui-bar-tab">
    <div class="mui-tab-item mui-active ">
      <a class="mui-tab-item " id="shouye" >
        <span class="mui-icon iconfont icon-shouye-shouye"></span>
        <span class="mui-tab-label">首页</span>
      </a>
    </div>
    <script>
      var shouye = document.getElementById("shouye");
      shouye.addEventListener('tap',function(){
        location.href ='/recruitModule' ;
      })
    </script>


    <%--个人身份登录--%>
    <c:if test="${loginUser.usertype == '个人' }">
      <div class="mui-tab-item mui-active" >
        <a  class="mui-tab-item " id="jianli" >
          <span  class="mui-icon iconfont icon-jianli"></span>
          <span class="mui-tab-label">简历</span>
        </a>
      </div>
      <script>
        var jianli = document.getElementById("jianli");
        jianli.addEventListener('tap',function(){
          location.href = '/myResume?userid=${userId}';
        })
      </script>
    </c:if>

    <%--企业身份登录--%>
    <c:if test="${loginUser.usertype == '企业' }">
      <div class="mui-tab-item mui-active" >
        <a  class="mui-tab-item " id="zhaoping" >
          <span  class="mui-icon iconfont icon-fabu"></span>
          <span class="mui-tab-label">发布</span>
        </a>
      </div>
      <script>
        var zhaoping = document.getElementById("zhaoping");
        zhaoping.addEventListener('tap',function(){
          location.href = '/showapply?userid=${userId}';
        })
      </script>
    </c:if>

    <div class="mui-tab-item " >
      <a class="mui-tab-item mui-active" id="wo" >
        <span class="mui-icon iconfont icon-gerenzhongxin"></span>
        <span class="mui-tab-label">我</span>
      </a>
    </div>
    <script>
      var wo = document.getElementById("wo");
      wo.addEventListener('tap',function(){
        location.href = '/weixininfo';
      })
    </script>


  </div>

</div>
</body>

</html>
