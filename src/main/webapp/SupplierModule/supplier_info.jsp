<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lc
  Date: 2017/6/7
  Time: 16:41
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


</head>

<body>
<script src="/SupplierModule/js/mui.min.js"></script>
<script type="text/javascript">
  mui.init()
</script>

<!--
    标题栏
-->
<header class="mui-bar mui-bar-nav" style="font-family: '微软雅黑'; background-color: rgb(71,155,241);">
  <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left" style="color: white;"></a>
  <h1 class="mui-title" style="color: white;">供应商详情</h1>
</header>

<div class="mui-content">
  <!--
      描述：头像、昵称、账号 start
  -->
  <ul class="mui-table-view mui-table-view-chevron" style="background-color: rgb(71,155,241);">
    <li class="mui-table-view-cell mui-media">
      <!--<a href="myInfo.html" class="mui-navigate-right">-->
      <a>

        <img class="mui-media-object mui-pull-left head-img" src="/SupplierModule/img/index.jpg">
        <div class="mui-media-body" style="padding-top: 6px; font-family: '微软雅黑';color: white;">
          ${supplier.suppliername}
          <p class='mui-ellipsis' style="font-family: '微软雅黑';color: white;">
            人气 ：${supplier.clicknum}</p>
        </div>
      </a>
    </li>
  </ul>
  <!--
      描述：头像、昵称
 -->
  <!--
      基本信息
  -->
  <div>
    <ul class="mui-table-view mui-table-view-chevron">
      <li class="mui-table-view-cell">
        <span class="icon-circle  icon iconfont icon-jibenxinxi1" style="color: dodgerblue;"></span>
        <span style="font-family:'微软雅黑';font-size: 14px;color: #555555;">基本信息：</span>
      </li>
    </ul>
    <!--
        ===================================================================
    -->
    <ul class="mui-table-view">
      <li class="mui-table-view-cell">
        <span class="icon-circle  icon iconfont icon-chengshi" style="color: dodgerblue;"></span>
        <span style="font-family:'微软雅黑';font-size: 12px;color: #555555;">城市：${supplier.supcity}</span></br>
        <span class="icon-circle  icon iconfont icon-dizhi" style="color: dodgerblue;"></span>
        <span style="font-family:'微软雅黑';font-size: 12px;color: #555555;">地址：${supplier.supaddress}</span></br>
        <span id="telephone" class="icon-circle  icon iconfont icon-dianhua" style="color: dodgerblue;"></span>
        <span style="font-family:'微软雅黑';font-size: 12px;color: #555555;">电话：<span id="phone_number">${supplier.suptel}</span></span>
      </li>
    </ul>
    <!--
        =================================================================
    -->
    <script>
      document.getElementById("telephone").addEventListener('tap',function(){
        var btnArray=['拨打','取消'];
        var phone=document.getElementById("phone_number").innerHTML;
        mui.confirm('是否拨打'+phone+'?','提示',btnArray,function(e){
          if(e.index == 0){
            plus.device.dial(phone,false);
          }
        });
      });
    </script>
  </div>

  <!--
      详细信息
  -->
  <div style="margin-top: 10px;">
    <ul class="mui-table-view">
      <li class="mui-table-view-cell">
        <span class="icon-circle  icon iconfont icon-jibenxinxi1" style="color: dodgerblue;"></span>
        <span style="font-family:'微软雅黑';font-size: 12px;color: #555555;">详细信息</span>
      </li>
      <p >
      <li class="mui-table-view-cell" style="font-family: '微软雅黑'; font-size: 12px;">
      ${supplier.policyinfo}
      </li>
      </p>
    </ul>
  </div>
  <!--
      同类商家
  -->
  <div>
    <ul class="mui-table-view mui-table-view-chevron">
      <li class="mui-table-view-cell">
        <span class="icon-circle  icon iconfont icon-shandian" style="color: rgb(251,35,40);"></span>
        <span style="font-family:'微软雅黑';font-size: 14px;color: #555555;">同类商家</span>
      </li>
    </ul>
    <!--
        =============================同类商家列表==============================
    -->
    <ul class="mui-table-view">



<c:forEach var="var" items="${similiarlist}" step="1" begin="0" end="4" >
      <li class="mui-table-view-cell mui-media">
        <a href="/supplier?supplierid=${var.supplierid}&suptype=${var.suptype}">
          <img class="mui-media-object mui-pull-left" src="/SupplierModule/img/1.jpg">
          <div class="mui-media-body" style="font-family: '微软雅黑';">
              ${var.suppliername}
            <p class="mui-ellipsis" style="font-family: '微软雅黑';font-size: 12px; margin-top: 5px;">${var.supcity}</p>
            <p class="mui-ellipsis"> <span class="mui-icon iconfont icon-dizhi1" style="margin-top: 5px;color: rgb(249,204,13);"></span>
			                	<span style="font-family: '微软雅黑'; font-size: 12px;">
                                    ${var.supaddress}</span></p>
          </div>
        </a>
      </li>
</c:forEach>




    </ul>
  </div>
  <!--
      =======================================================================
  -->
</div>
</body>

</html>
