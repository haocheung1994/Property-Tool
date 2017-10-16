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
<script src="/index/js/mui.min.js"></script>
<script type="text/javascript" src="/index/js/mui.js" ></script>
<script src="/index/iconfont/iconfont.js"></script>
<script type="text/javascript">
  mui.init()
</script>
<style type="text/css">
  .icon {
    width: 2em; height: 1em;
    vertical-align: -0.15em;
    fill: currentColor;
    overflow: hidden;
  }
</style>

<style>
  A:hover
  {
    text-decoration:none;
  }
</style>
<!--
    标题栏
-->
<link href="/index/css/position_info.css" rel="stylesheet"/>
<header class="mui-bar mui-bar-nav" >
  <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
  <h1 class="mui-title">简历列表</h1>
</header>
<!--
    数据列表
-->
<div class="mui-content" style="padding-bottom: 50px;">
  <link href="/index/css/font.css" rel="stylesheet" />


<c:forEach var="var" items="${tinduserList}" >
  <ul class="mui-table-view" style="margin-top: 10px; margin-left: 10px; margin-right: 10px;">
    <li class="mui-table-view-cell mui-media">
      <a href="/thisResume?personid=${var.personid}">
        <div id="divcss5">
          <img class="mui-media-object mui-pull-left" src="/index/img/test2.jpg">
        </div>
        <div class="mui-media-body">
         <p style="font-size: 16px;color: black"> &nbsp;${var.personname}</p>
          <p class="mui-ellipsis"><span3>
            <svg class="icon" aria-hidden="true">
              <use xlink:href="#icon-site"><span>${var.personcity}</span></use>
            </svg>
            &nbsp;&nbsp;
            <svg class="icon" aria-hidden="true">
              <c:if test="${var.personsex =='男'}">
              <use xlink:href="#icon-nan"><span>男</span></use>
              </c:if>
              <c:if test="${var.personsex =='女'}">
              <use xlink:href="#icon-nv"><span>女</span></use>
              </c:if>

            </svg>
           <%-- <svg class="icon" aria-hidden="true">
              <use xlink:href="#icon-xueli"><span>本科</span></use>
            </svg>--%>
            &nbsp;&nbsp;
            <svg class="icon" aria-hidden="true">
              <use xlink:href="#icon-xiugai"><span>${var.personemail}</span></use>
            </svg>
          </span3></p>
          <span3 class="mui-active" style="margin-left: auto;">${var.birthtimeStr}</span3>


        </div>
      </a>
    </li>
  </ul>
</c:forEach>

</div>

</body>
<jsp:include page="/index/foot1.jsp"></jsp:include>
</html>

