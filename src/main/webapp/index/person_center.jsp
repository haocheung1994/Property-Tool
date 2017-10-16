<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lc
  Date: 2017/6/19
  Time: 12:38
  To change this template use File | Settings | File Templates.
--%>
  <%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <!doctype html>
  <body>

  <head>
    <meta charset="UTF-8">
    <title></title>
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <link href="/index/css/mui.min.css" rel="stylesheet" />
    <link href="/index/iconfont/iconfont.css" rel="stylesheet" />
  </head>

  <body>
  <link href="/RecruitModule/css/mui.min.css" type="text/css" rel="stylesheet" />
  <script type="text/javascript" src="/index/js/mui.js" ></script>
  <script src="/index/iconfont/iconfont.js"></script>
  <script type="text/javascript">
    mui.init()
  </script>
  <style type="text/css">
    .icon {
      width: 2em; height: 2em;
      vertical-align: -0.15em;
      fill: currentColor;
      overflow: hidden;
    }
    .icon1 {
      width: 1em; height: 1em;
      vertical-align: -0.15em;
      fill: currentColor;
      overflow: hidden;
    }
    .mui-table-view.mui-grid-9{
      /*替换成自己的颜色*/
      background-color: white;
    }
  </style>
  </body>

  <!--
      标题栏
  -->
  <header class="mui-bar mui-bar-nav" style="font-family: '微软雅黑'; background-color: rgb(71,155,241);">
    <h1 class="mui-title">个人中心</h1>
  </header>

  <div class="mui-content">
    <!--
        描述：头像、昵称、账号 start
    -->
    <ul class="mui-table-view mui-table-view-chevron">
      <li class="mui-table-view-cell mui-media">
        <!--<a href="myInfo.html" class="mui-navigate-right">-->
        <a>

          <img class="mui-media-object mui-pull-left head-img" src="${wechatUserInfo.headImgUrl}">
          <div class="mui-media-body" style="padding-top: 6px; font-family: '微软雅黑';">
            ${wechatUserInfo.nickname}
            <p class='mui-ellipsis' style="margin-top: 10px; font-family: '微软雅黑'">${wechatUserInfo.province} ${wechatUserInfo.city}</p>
          </div>
        </a>
      </li>
    </ul>

    <!--
       描述：我的订单 start
   -->
    <div style="margin-top: 10px;">
      <ul class="mui-table-view mui-table-view-chevron">
        <li class="mui-table-view-cell">
          <a href="/page/orderList.html" class="mui-navigate-right">
            <svg class="icon1" aria-hidden="true">
              <use xlink:href="#icon-wodedingdan"></use>
            </svg>
            <span style="font-size: 14px;color: #555555;font-family: '微软雅黑'">我的订单</span>
            <span style="font-size: 12px;color: #555555;padding-top: 3px;font-family: '微软雅黑'" class="mui-pull-right update">查看全部订单</span>
          </a>
        </li>
      </ul>
    </div>

    <!--
    功能模块
    -->

    <ul class="mui-table-view mui-grid-view mui-grid-9">
      <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><a href="/page/unpay.html">
        <!--<span class="mui-icon iconfont icon icon-kuaidigui" style="color: rgb(54,192,255);"></span>-->
        <svg class="icon" aria-hidden="true">
          <use xlink:href="#icon-daifukuan1"></use>
        </svg>
        <div class="mui-media-body">待付款</div></a></li>
      <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><a href="/page/unfahuo.html">
        <!--<span class="mui-icon iconfont icon icon-zhiyinshui" style="color: rgb(255,162,0);"></span>-->
        <svg class="icon" aria-hidden="true">
          <use xlink:href="#icon-daifahuo"></use>
        </svg>
        <div class="mui-media-body">代发货</div></a></li>
      <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><a href="/page/daishouhuo.html">
        <!-- <span class="mui-icon iconfont icon-chongdianzhuang" style="color: rgb(250,98,85);"></span>-->
        <svg class="icon" aria-hidden="true">
          <use xlink:href="#icon-daishouhuo"></use>
        </svg>
        <div class="mui-media-body">待收货</div></a></li>
    <%--  <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><a href="#">
        <!--<span class="mui-icon iconfont icon-guanggaofabu" style="color: rgb(100,210,115);"></span>-->
        <svg class="icon" aria-hidden="true">
          <use xlink:href="#icon-daipingjia"></use>
        </svg>
        <div class="mui-media-body">待评价</div></a></li>--%>
      <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><a href="/positionManage">
        <!--<span class="mui-icon iconfont icon-qita"></span>-->
        <svg class="icon" aria-hidden="true">
          <use xlink:href="#icon-zhiweiguanli"></use>
        </svg>
        <div class="mui-media-body">职位管理</div></a></li>
      <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
        <c:if test="${loginUser.usertype =='个人'}">
        <a href="/manageresume">
          <svg class="icon" aria-hidden="true">
            <use xlink:href="#icon-jianliguanli"></use>
          </svg>
          <div class="mui-media-body">简历管理</div></a></li>

         </c:if>
           <c:if test="${loginUser.usertype =='企业'}">
           <a href="/allCompanyApply?userid=${userId}">
             <svg class="icon" aria-hidden="true">
               <use xlink:href="#icon-jianliguanli"></use>
             </svg>
             <div class="mui-media-body">简历管理</div></a>
        </li>

             </c:if>
      <c:if test="${loginUser.usertype == null||loginUser.usertype =='' }">
        <a href="/unserve">
          <svg class="icon" aria-hidden="true">
            <use xlink:href="#icon-jianliguanli"></use>
          </svg>
          <div class="mui-media-body">简历管理</div></a>
        </li>

      </c:if>


        <!--<span class="mui-icon iconfont icon-qita"></span>-->


      <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><a href="#">
        <!--<span class="mui-icon iconfont icon-qita"></span>-->
        <svg class="icon" aria-hidden="true">
          <use xlink:href="#icon-bangzhuzhongxin"></use>
        </svg>
        <div class="mui-media-body">帮助中心</div></a></li>

    </ul>


</div></div>
    <!--
        底部菜单
    -->
    <jsp:include page="foot4.jsp"></jsp:include>


</body>
  </html>
