  <%--
    Created by IntelliJ IDEA.
    User: lc
    Date: 2017/6/7
    Time: 16:35
    To change this template use File | Settings | File Templates.
  --%>
  <%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <!doctype html>
  <html>

  <head>
    <meta charset="UTF-8">
    <title></title>
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <link href="/SupplierModule/css/mui.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="/SupplierModule/iconfont/iconfont.css"/>
    <link rel="stylesheet" href="/SupplierModule/iconfont/demo.css">
  </head>

  <body>
  <script src="/SupplierModule/js/mui.min.js"></script>
  <script type="text/javascript" src="/SupplierModule/js/mui.js" ></script>
  <script src="/SupplierModule/iconfont/iconfont.js"></script>
  <script type="text/javascript">
    mui.init()
  </script>
  <style type="text/css">
    .icon {
      width: 3em; height: 3em;
      vertical-align: -0.15em;
      fill: currentColor;
      overflow: hidden;
    }
  </style>

  <header class="mui-bar mui-bar-nav" style="background-color: rgb(71,155,241);">
    <!--<h1 class="mui-title">标题</h1>-->
    <form action="/supSearch" method="post">
      <div id="search" class="mui-search mui-active">
        <input type="search" name="search" class="mui-input-clear" placeholder="搜索供应商" style="font-family: '微软雅黑';font-size: 12px;color: white;">
      </div>
    </form>
  </header>
  <!--
      轮播图片1
  -->
  <div id="slider1" class="mui-slider mui-content" >
    <div class="mui-slider-group mui-slider-loop">
      <!-- 额外增加的一个节点(循环轮播：第一个节点是最后一张轮播) -->
      <div class="mui-slider-item mui-slider-item-duplicate">
        <a href="#">
          <img src="/SupplierModule/img/banner1.jpg">
        </a>
      </div>
      <!-- 第一张 -->
      <div class="mui-slider-item">
        <a href="#">
          <img src="/SupplierModule/img/banner1.jpg">
        </a>
      </div>
      <!-- 第二张 -->
      <div class="mui-slider-item">
        <a href="#">
          <img src="/SupplierModule/img/banner2.jpg">
        </a>
      </div>
      <!-- 额外增加的一个节点(循环轮播：最后一个节点是第一张轮播) -->
      <div class="mui-slider-item mui-slider-item-duplicate">
        <a href="#">
          <img src="/SupplierModule/img/banner1.jpg">
        </a>
      </div>
    </div>
    <div class="mui-slider-indicator">
      <div class="mui-indicator mui-active"></div>
      <div class="mui-indicator"></div>
    </div>
  </div>
  <script>
    var gallery = mui("#slider1");
    gallery.slider({
      interval:3000
    });
    function tab(url) {
      location.href = url + "?a=" + Math.random() * 1000;
    }
  </script>
  <!--
      功能模块
  -->
  <div >
    <ul class="mui-table-view mui-grid-view mui-grid-9">
      <li class="mui-table-vi
  <div >
    <ul class="mui-table-view mui-grid-view mui-grid-9">
      <li class="mui-tew-cell mui-media mui-col-xs-4 mui-col-sm-3"><a href="/showsupplier?stype=1">
        <!--<span class="mui-icon iconfont icon icon-kuaidigui" style="color: rgb(54,192,255);"></span>-->
        <svg class="icon" aria-hidden="true">
          <use xlink:href="#icon-kuaidigui"></use>
        </svg>
        <div class="mui-media-body">快递柜</div></a></li>
      <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><a href="/showsupplier?stype=2">
        <!--<span class="mui-icon iconfont icon icon-zhiyinshui" style="color: rgb(255,162,0);"></span>-->
        <svg class="icon" aria-hidden="true">
          <use xlink:href="#icon-zhiyinshui"></use>
        </svg>
        <div class="mui-media-body">直饮水</div></a></li>
      <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><a href="/showsupplier?stype=3">
        <!-- <span class="mui-icon iconfont icon-chongdianzhuang" style="color: rgb(250,98,85);"></span>-->
        <svg class="icon" aria-hidden="true">
          <use xlink:href="#icon-chongdianzhuang"></use>
        </svg>
        <div class="mui-media-body">充电桩</div></a></li>
      <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><a href="/showsupplier?stype=4">
        <!--<span class="mui-icon iconfont icon-guanggaofabu" style="color: rgb(100,210,115);"></span>-->
        <svg class="icon" aria-hidden="true">
          <use xlink:href="#icon-guanggaofabu"></use>
        </svg>
        <div class="mui-media-body">广告商</div></a></li>
      <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><a href="/showsupplier?stype=5">
        <!--<span class="mui-icon iconfont icon-qita"></span>-->
        <svg class="icon" aria-hidden="true">
          <use xlink:href="#icon-shequxiche"></use>
        </svg>
        <div class="mui-media-body">社区洗车</div></a></li>
      <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><a href="/showsupplier?stype=6">
        <!--<span class="mui-icon iconfont icon-qita"></span>-->
        <svg class="icon" aria-hidden="true">
          <use xlink:href="#icon-xiyiyeji"></use>
        </svg>
        <div class="mui-media-body">洗衣液机</div></a></li>
      <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><a href="/showsupplier?stype=7">
        <!--<span class="mui-icon iconfont icon-qita"></span>-->
        <svg class="icon" aria-hidden="true">
          <use xlink:href="#icon-kaihuansuo"></use>
        </svg>
        <div class="mui-media-body">开换锁</div></a></li>
  <%--    <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><a href="/showsupplier?stype=8">
        <!--<span class="mui-icon iconfont icon-qita"></span>-->
        <svg class="icon" aria-hidden="true">
          <use xlink:href="#icon-xiannai"></use>
        </svg>
        <div class="mui-media-body">鲜奶</div></a></li>
      <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><a href="/showsupplier?stype=9">
        <!--<span class="mui-icon iconfont icon-qita"></span>-->
        <svg class="icon" aria-hidden="true">
          <use xlink:href="#icon-tongxunshang"></use>
        </svg>
        <div class="mui-media-body">通讯商</div></a></li>
      <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><a href="/showsupplier?stype=10">
        <!--<span class="mui-icon iconfont icon-qita"></span>-->
        <svg class="icon" aria-hidden="true">
          <use xlink:href="#icon-lingshouji"></use>
        </svg>
        <div class="mui-media-body">零售机</div></a></li>
      <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><a href="/showsupplier?stype=11">
        <!--<span class="mui-icon iconfont icon-qita"></span>-->
        <svg class="icon" aria-hidden="true">
          <use xlink:href="#icon-qingquwurenshouhuoji"></use>
        </svg>
        <div class="mui-media-body">情趣无人售货机</div></a></li>--%>
      <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><a href="/showsupplier?stype=12">
        <!--<span class="mui-icon iconfont icon-qita"></span>-->
        <svg class="icon" aria-hidden="true">
          <use xlink:href="#icon-qita"></use>
        </svg>
        <div class="mui-media-body">其他</div></a></li>
    </ul>
  </div>
  <!--
      轮播图片2
  -->
  <!--
      轮播图片1
  -->
  <%--<div id="slider2" class="mui-slider" >
    <div class="mui-slider-group mui-slider-loop">
      <!-- 额外增加的一个节点(循环轮播：第一个节点是最后一张轮播) -->
      <div class="mui-slider-item mui-slider-item-duplicate">
        <a href="#">
          <img src="/SupplierModule/img/banner2.jpg">
        </a>
      </div>
      <!-- 第一张 -->
      <div class="mui-slider-item">
        <a href="#">
          <img src="/SupplierModule/img/banner2.jpg">
        </a>
      </div>
      <!-- 第二张 -->
      <div class="mui-slider-item">
        <a href="#">
          <img src="/SupplierModule/img/banner2.jpg">
        </a>
      </div>
      <!-- 第三张 -->
      <div class="mui-slider-item">
        <a href="#">
          <img src="/SupplierModule/img/banner2.jpg">
        </a>
      </div>
      <!-- 额外增加的一个节点(循环轮播：最后一个节点是第一张轮播) -->
      <div class="mui-slider-item mui-slider-item-duplicate">
        <a href="#">
          <img src="/SupplierModule/img/banner2.jpg">
        </a>
      </div>
    </div>
    <div class="mui-slider-indicator">
      <div class="mui-indicator mui-active"></div>
      <div class="mui-indicator"></div>
      <div class="mui-indicator"></div>
    </div>
  </div>
  <script>
    var gallery = mui("#slider2");
    gallery.slider({
      interval:3000
    });
    function tab(url) {
      location.href = url + "?a=" + Math.random() * 1000;
    }
  </script>--%>

  <!--
      合作商家模块
  -->
  <div class="mui-table-view mui-table-view-cell" style="font-family: '微软雅黑';font-size: 16px;">
    <li class="mui-table-view-cell">
      <span style="color: rgb(255,160,0);">合作商家</span>
      <span class="mui-icon mui-icon-arrowright" style="color: rgb(255,160,0);"></span>
    </li>
    <div>
      <ul class="mui-table-view mui-grid-view">
        <li class="mui-table-view-cell mui-media mui-col-xs-6">
          <a href="#">
            <img class="mui-media-object" src="/SupplierModule/img/3.jpg">
            <div class="mui-media-body">史密斯净水机</div>
          </a>
        </li>
        <li class="mui-table-view-cell mui-media mui-col-xs-6">
          <a href="#">
            <img class="mui-media-object" src="/SupplierModule/img/3.jpg">
            <div class="mui-media-body">史密斯净水机</div>
          </a>
        </li>
        <li class="mui-table-view-cell mui-media mui-col-xs-6">
          <a href="#">
            <img class="mui-media-object" src="/SupplierModule/img/3.jpg">
            <div class="mui-media-body">史密斯净水机</div>
          </a>
        </li>
        <li class="mui-table-view-cell mui-media mui-col-xs-6">
          <a href="#">
            <img class="mui-media-object" src="/SupplierModule/img/3.jpg">
            <div class="mui-media-body">史密斯净水机</div>
          </a>
        </li>

      </ul>
    </div>
  </div>
  </body>

  </html>
