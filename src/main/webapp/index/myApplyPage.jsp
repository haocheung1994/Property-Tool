<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lc
  Date: 2017/6/21
  Time: 14:18
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
<style>
  A:hover
  {
    text-decoration:none;
  }
  </style>
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

<!--
    标题栏
-->
<link href="/index/css/position_info.css" rel="stylesheet"/>
<header class="mui-bar mui-bar-nav" >
  <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
  <h1 class="mui-title">已投递职位</h1>
</header>
<!--
    数据列表
-->
<div class="mui-content" style="padding-bottom: 50px;">
  <link href="/index/css/font.css" rel="stylesheet" />


<c:forEach var="var" items="${myApplyList}" >

  <ul class="mui-table-view" style="margin-top: 10px; margin-left: 10px; margin-right: 10px;">
    <li class="mui-table-view-cell mui-media">

        <div id="divcss5">
          <img class="mui-media-object mui-pull-left" src="/index/img/test2.jpg">
        </div>
        <div class="mui-media-body">
          <span2>${var.salary}</span2>
          <p class="mui-ellipsis"><span1>${var.jobname}</span1></p>
          <p class="mui-ellipsis"><span3>${var.companyname}</span3></p>
          <span3 class="mui-active" style="margin-left: auto;">5-20</span3>
          <span4 class="mui-active" >
            <c:if test="${var.click > 0}">
            <svg class="icon" aria-hidden="true">
              <use xlink:href="#icon-yichakan"><span>已查看</span></use>
            </svg>
            </c:if>

            <c:if test="${var.click == 0}">
              <svg class="icon" aria-hidden="true">
                <use xlink:href="#icon-weichakan"><span>未查看</span></use>
              </svg>
            </c:if>


            <span onclick="deletefirm();">
            <svg class="icon" aria-hidden="true">
              <use xlink:href="#icon-shanchu"><span>删除</span></use>
            </svg>
            </span>
          </span4>
          <form id="form1" action="/deleteApply" method="post" >
            <input type="hidden" name="userid" value="${userId}">
            <input type="hidden" name="applyid" value="${var.jobapplyid}">
          </form>
        </div>
    </li>
  </ul>
</c:forEach>
  <script type="text/javascript" language="javascript">
    function deletefirm()
    {
      if(confirm('删除不可恢复，确定继续吗？'))
     {
       if(${loginUser.usertype != "个人"}){
         alert("企业用户不能投递");
         return false;
       }
       else{
         document.getElementById('form1').submit();
       }
     }
       return false;
    }
  </script>

</div>

</body>

</html>
