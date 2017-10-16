<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  <link href="/RecruitModule/css/mui.min.css" rel="stylesheet" />
  <link href="/RecruitModule/iconfont/iconfont.css" rel="stylesheet" />
</head>

<body>
<script src="/RecruitModule/js/mui.min.js"></script>
<script type="text/javascript">
  mui.init()
</script>
<!--
    标题栏
-->
<link href="/RecruitModule/css/position_info.css" rel="stylesheet"/>
<header class="mui-bar mui-bar-nav" >
  <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
  <h1 class="mui-title" style="color: white">公司详情</h1>
  <a id="info" class="mui-icon iconfont icon-caidan mui-pull-right" style="color: white;"></a>
</header>
<!--
    招聘岗位
-->
<div class="mui-content">
  <ul class="mui-table-view" style="margin-left: 10px;margin-right: 10px;margin-bottom: 10px;">
    <link href="css/font.css" rel="stylesheet" />
    <li class="mui-table-view-cell mui-media">
      <a href="javascript:;">
        <div class="mui-media-body">
          <span1 class="mui-active">${tfirmuser.companyname}</span1>
        </div>
      </a>
    </li>
  </ul>
  <!--
      工作地点
  -->
  <ul class="mui-table-view" style="margin-left: 10px;margin-right: 10px;margin-bottom: 10px;">
    <link href="css/font.css" rel="stylesheet" />
    <li class="mui-table-view-cell mui-media">

        <div class="mui-media-body">
          <!--<span2>3.5千-4千</span2>-->
          <p class="mui-ellipsis"><span1>公司地址</span1></p></br>
          <!--<p class="mui-ellipsis"><span3>南京万科物业管理有限公司</span3></p>-->
          <a class="mui-tab-item">
            <span3 class="mui-icon iconfont icon-site"-></span3>
            ${tfirmuser.companyaddr}
          </a>
         <%-- <a href="position_details.html" class="mui-icon mui-icon-arrowright mui-pull-right" style="color: #000000;"></a>--%>
          <!--  <span4 class="mui-active" >5-17</span4>-->
        </div>

    </li>
  </ul>

  <ul class="mui-table-view" style="margin-left: 10px;margin-right: 10px;margin-bottom: 10px;">
    <link href="css/font.css" rel="stylesheet" />
    <li class="mui-table-view-cell mui-media">
      <a href="javascript:;">
        <div class="mui-media-body">
          <!--<span2>3.5千-4千</span2>-->
          <p class="mui-ellipsis"><span1>联系方式</span1></p><br>
          <!--<p class="mui-ellipsis"><span3>南京万科物业管理有限公司</span3></p>-->
          <div style="margin-left: 5px;">
            <span>电话号码:${tfirmuser.companytel}</span><br>
            <span>电子邮箱:${tfirmuser.companyemail}</span>>
        </div>
          <%-- <a href="position_details.html" class="mui-icon mui-icon-arrowright mui-pull-right" style="color: #000000;"></a>--%>
          <!--  <span4 class="mui-active" >5-17</span4>-->
        </div>
      </a>
    </li>
  </ul>
  <!--
      职位描述
  -->


  <ul class="mui-table-view" style="margin-left: 10px;margin-right: 10px;margin-bottom: 10px;">
    <link href="css/font.css" rel="stylesheet" />
    <li class="mui-table-view-cell mui-media">

        <div class="mui-media-body">
          <!--<span2>3.5千-4千</span2>-->
          <p class="mui-ellipsis"><span1>公司详细信息</span1></p><br>

          <!--<p class="mui-ellipsis"><span3>南京万科物业管理有限公司</span3></p>-->
            <div id="content">&nbsp;&nbsp;&nbsp;&nbsp;${tfirmuser.companyinf}</div>

          <%-- <a href="position_details.html" class="mui-icon mui-icon-arrowright mui-pull-right" style="color: #000000;"></a>--%>
          <!--  <span4 class="mui-active" >5-17</span4>-->
        </div>
       <div id="zhankai" style="text-align: center;">
           <a  class="mui-icon-navigate mui-icon iconfont icon-tubiao10"></a>
         </div>
    </li>
  </ul>



  <script>
    window.onload = function init(){
      var len = 60;      //默认显示字数
      var ctn = document.getElementById("content");  //获取div对象
      var content = ctn.innerHTML;                   //获取div里的内容

      //alert(content);
      var span = document.createElement("span");     //创建<span>元素
      var a = document.getElementById("zhankai");           //创建<a>元素
      span.innerHTML = content.substring(0,len);     //span里的内容为content的前len个字符


      a.onclick = function(){
        span.innerHTML = content;
        a.style.display = "none";

      }
      // 设置div内容为空，span元素 a元素加入到div中
      ctn.innerHTML = "";
      ctn.appendChild(span);
      ctn.appendChild(a);
    }
  </script>


</div>


</body>

</html>
