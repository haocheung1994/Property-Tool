<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lc
  Date: 2017/6/7
  Time: 17:15
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
  <h1 class="mui-title" style="color: white;">供应商</h1>
</header>

<!--
    供应商列表
-->
<div class="mui-content">

  <c:if test="${ null == supplierlist || supplierlist.size() ==0}"  >
    <p style="margin-top: 30px;font-size: larger" align="center">
      暂无入驻记录....
    </p>
  </c:if>

  <ul class="mui-table-view">
    <c:forEach var="var" items="${supplierlist}" >



    <li class="mui-table-view-cell mui-media">
      <a href="/supplier?supplierid=${var.supplierid}&suptype=${var.suptype}">
        <img class="mui-media-object mui-pull-left" src="/SupplierModule/img/index.jpg">
        <div class="mui-media-body" style="font-family: '微软雅黑';">
          ${var.suppliername}
          <p class="mui-ellipsis" style="margin-top: 10px;">${var.supcity}</p>
          <p class="mui-ellipsis" style="margin-top: 10px;"><span class="icon-circle  icon iconfont icon-site" style="color: dodgerblue;"></span>
            <span>${var.supaddress}</span></p>
        </div>
      </a>
    </li>



    </c:forEach>
  </ul>
</div>
</body>

</html>
