<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/31
  Time: 16:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-status-bar-style" content="black">
  <title>我的</title>
  <link rel="stylesheet" href="css/mui.min.css">
  <link rel="stylesheet" type="text/css" href="iconfont/iconfont.css"/>
  <link rel="stylesheet" type="text/css" href="css/person_center.css"/>
</head>

<body>
<!--
    标题栏
-->
<header class="mui-bar mui-bar-nav" style="font-family: '微软雅黑'; background-color: rgb(71,155,241);">
  <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left" style="color: white;"></a>
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

        <img class="mui-media-object mui-pull-left head-img" src="img/new.png">
        <div class="mui-media-body" style="padding-top: 6px; font-family: '微软雅黑';">
          公子张不二
          <p class='mui-ellipsis' style="margin-top: 10px; font-family: '微软雅黑'">一点懒散半疏狂</p>
        </div>
      </a>
    </li>
  </ul>
  <!--
      描述：头像、昵称
  -->

  <!--
      描述：我的订单 start
  -->
  <ul class="mui-table-view mui-table-view-chevron">
    <li class="mui-table-view-cell">
      <a href="myOrder.html" class="mui-navigate-right">
        <span class="icon iconfont icon-dingdan" style="color: orangered;"></span>
        <span style="font-size: 14px;color: #555555;font-family: '微软雅黑'">我的订单</span>
        <span style="font-size: 12px;color: #555555;padding-top: 3px;font-family: '微软雅黑'" class="mui-pull-right update">全部订单</span>
      </a>
    </li>
    <li class="mui-table-view-cell" style="padding: 5px 10px 0px 60px;">
      <div class="mui-row">
        <div class="mui-col-xs-3">
          <a href="myOrder.html">
            <span class="icon-status icon iconfont icon-daifukuan"></span><br />
            <span class="text" style="font-family: '微软雅黑'; font-size: 10px;">待付款</span>
          </a>
        </div>
        <div class="mui-col-xs-3">
          <a href="myOrder.html">
            <span class="icon-status icon iconfont icon-icon2"></span><br />
            <span class="text" style="font-family: '微软雅黑'; font-size: 10px;">待发货</span>
          </a>
        </div>
        <div class="mui-col-xs-3">
          <a href="myOrder.html">
            <span class="icon-status icon iconfont icon-daishouhuo"></span><br />
            <span class="text" style="font-family: '微软雅黑'; font-size: 10px;">待收货</span>
          </a>
        </div>
        <div class="mui-col-xs-3">
          <a href="myOrder.html">
            <span class="icon-status icon iconfont icon-daipingjia"></span><br />
            <span class="text" style="font-family: '微软雅黑'; font-size: 10px;">待评价</span>
          </a>
        </div>
      </div>
    </li>
  </ul>
  <!--
      描述：我的订单 end
  -->

  <!--
      描述：钱包、地址、团队 start
  -->
  <ul class="mui-table-view mui-table-view-chevron">
    <li class="mui-table-view-cell">
      <a class="mui-navigate-right">
        <span class="icon-circle  icon iconfont icon-jianli" style="color: dodgerblue;"></span>
        <span style="font-size: 14px;color: #555555;">我的简历</span>
        <!--<span style="font-size: 12px;color: red;padding-top: 3px;" class="mui-pull-right update">868元</span>-->
      </a>
    </li>
    <li class="mui-table-view-cell">
      <a class="mui-navigate-right">
        <span class="icon-circle  icon iconfont icon-site" style="color: dodgerblue;"></span>
        <span style="font-size: 14px;color: #555555;">我的地址</span>
        <!--						<span style="font-size: 12px;color: red;padding-top: 3px;" class="mui-pull-right update">100分</span>-->
      </a>
    </li>
    <li class="mui-table-view-cell">
      <a class="mui-navigate-right">
        <span class="icon-circle  icon iconfont icon-qianbao" style="color: dodgerblue;"></span>
        <span style="font-size: 14px;color: #555555;">我的钱包</span>
        <!--<span style="font-size: 12px;color: red;padding-top: 3px;" class="mui-pull-right update">100分</span>-->
      </a>
    </li>
  </ul>
  <!--
      描述：钱包、地址、团队 end
 -->

  <!--
   描述：地址管理 start
-->

  <!--			<ul class="mui-table-view mui-table-view-chevron">
                  <li class="mui-table-view-cell">
                      <a href="addressList.html" class="mui-navigate-right">
                          <span class="icon-circle  icon iconfont icon-dizhiguanli" style="color: #44C018;"></span>
                          <span style="font-size: 14px;color: #555555;">地址管理</span>
                      </a>
                  </li>
              </ul>-->
  <!--
      描述：地址管理 end
  -->

  <!--
      描述：分享朋友圈、我的二维码 start
  -->
  <!--			<ul class="mui-table-view mui-table-view-chevron">
                  <li class="mui-table-view-cell">
                      <a class="mui-navigate-right">
                          <span class="icon-circle  icon iconfont icon-xingzhuang7" style="color: #1ABC9C;"></span>
                          <span style="font-size: 14px;color: #555555;">分享朋友圈</span>
                          <span style="font-size: 12px;color: #2ECC71;padding-top: 3px;" class="mui-pull-right update">分享领取红包，可提现</span>
                      </a>
                  </li>
                  <li class="mui-table-view-cell">
                      <a class="mui-navigate-right">
                          <span class="icon-circle  icon iconfont icon-erweima" style="color: #F1C40F;"></span>
                          <span style="font-size: 14px;color: #555555;">我的二维码</span>
                          <span style="font-size: 12px;color: #2ECC71;padding-top: 3px;" class="mui-pull-right update">分享领取红包，可提现</span>
                      </a>
                  </li>
              </ul>-->
  <!--
      描述：分享朋友圈、我的二维码 end
  -->

  <!--
      描述：底部菜单 strat
  -->
  <nav class="mui-bar mui-bar-tab">
    <div class="mui-tab-item mui-active" onclick="tab('homepage.html')">
      <a class="mui-tab-item mui-active">
        <span class="mui-icon iconfont icon-shouye-shouye"></span>
        <span class="mui-tab-label">首页</span>
      </a>
    </div>
    <div class="mui-tab-item mui-active" onclick="tab('resume.html')">
      <a class="mui-tab-item">
        <span class="mui-icon iconfont icon-jianli"></span>
        <span class="mui-tab-label">简历</span>
      </a>
    </div>
    <div class="mui-tab-item mui-active" onclick="tab('position.html')">
      <a class="mui-tab-item">
        <span class="mui-icon iconfont icon-zhiwei"></span>
        <span class="mui-tab-label">职位</span>
      </a>
    </div>
    <div class="mui-tab-item mui-active" onclick="tab('market.html')">
      <a class="mui-tab-item">
        <span class="mui-icon iconfont icon-shangcheng"></span>
        <span class="mui-tab-label">商城</span>
      </a>
    </div>
    <div class="mui-tab-item mui-active" onclick="tab('order.html')">
      <a class="mui-tab-item">
        <span class="mui-icon iconfont icon-dingdan"></span>
        <span class="mui-tab-label">订单</span>
      </a>
    </div>
  </nav>
  <!--
      描述：底部菜单 end
  -->
</div>

</body>
<script type="text/javascript">
  function tab(url) {
    location.href = url + "?a=" + Math.random() * 1000;
  }
</script>
</html>
