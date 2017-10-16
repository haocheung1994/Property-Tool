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
  <h1 class="mui-title" style="color: white">职位详情</h1>
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
          <span2 style="float:right;color: red">${myrecruit.salary}${recruit.companyid}</span2>
          <span1 class="mui-active">${myrecruit.jobname}</span1>

        <c:if test="${myrecruit.companyid != 8}">
          <p class="mui-ellipsis"><span3>${myrecruit.tfirmuserInAcc.companyname}</span3></p>
          </c:if>
          <c:if test="${myrecruit.companyid == 8}">
            <p class="mui-ellipsis"><span3>${myrecruit.companyname8}</span3></p>
          </c:if>
          <p class="mui-ellipsis"><span3 >${myrecruit.workreq} ${myrecruit.edureq}</span3></p>
          <p class="mui-ellipsis"><span4 class="mui-active" style="float:right" >${myrecruit.pubtimeStr}</span4></p>
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
      <a href="javascript:;">
        <div class="mui-media-body">
          <!--<span2>3.5千-4千</span2>-->
          <p class="mui-ellipsis"><span1>工作地址</span1></p></br>
          <!--<p class="mui-ellipsis"><span3>南京万科物业管理有限公司</span3></p>-->
          <a class="mui-tab-item">
            <span3 class="mui-icon iconfont icon-site"-></span3>
            ${myrecruit.workaddr}
          </a>
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
          <p class="mui-ellipsis"><span1>职位描述</span1></p></br>
          <!--<p class="mui-ellipsis"><span3>南京万科物业管理有限公司</span3></p>-->
            <div id="content">&nbsp;&nbsp;&nbsp;&nbsp;${myrecruit.jobdescribe}</div>

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



  <!--
      职位特点
  -->
  <ul class="mui-table-view" style="margin-left: 10px;margin-right: 10px;margin-bottom: 10px;">
    <link href="css/font.css" rel="stylesheet" />
    <li class="mui-table-view-cell mui-media">
      <a href="javascript:;">
        <div class="mui-media-body">
          <!--<span2>3.5千-4千</span2>-->
          <p class="mui-ellipsis"><span1>职位诱惑</span1></p></br>
          <p class="mui-ellipsis">
          &nbsp;${myrecruit.welfare}
          </p></br>
          <!--<p class="mui-ellipsis"><span3>南京万科物业管理有限公司</span3></p>-->
          <!--<a class="mui-tab-item">
          <span3 class="mui-icon iconfont icon-shangcheng" style="margin-left: auto;"></span3>
          <span3>徐州</span3>
          </a>
         <span4 class="mui-active" >5-17</span4>-->
        </div>
      </a>
    </li>
  </ul>
</div>
<form action="applyjob" method="post" >
  <input type="hidden" name="userId" value="${userId}">
  <input type="hidden" name="recruitId" value="${myrecruit.recruitid}">
  <input type="hidden" name="companyid" value="${myrecruit.companyid}">
  <input type="hidden" name="jobname" value="${myrecruit.jobname}">
  <input type="hidden" name="companyname" value="${myrecruit.tfirmuserInAcc.companyname}">
  <input type="hidden" name="salary" value="${myrecruit.salary}">
  <input type="hidden" name="addr" value="${myrecruit.workaddr}">
  <input type="hidden" name="firmuserid" value="${myrecruit.tfirmuserInAcc.userid}">

  <ul class="mui-table-view" style="margin-left: 10px;margin-right: 10px;margin-bottom: 10px;margin-top: 20px">
    <a href="" onclick="return confirmAct();" >
      <input type="submit" value="投递简历" class="mui-btn mui-btn-blue mui-btn-block" >
    </a>
  </ul>
</form>

<script type="text/javascript" language="javascript">
  function confirmAct()
  {
    if(confirm('确定要投递简历吗？'))
    {
      if(${loginUser.usertype != "个人"}){
        alert("企业用户不能投递");
        return false;
      }
      else{
        return true;
      }}
    return false;
  }
</script>

</body>

</html>
