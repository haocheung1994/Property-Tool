<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/6/2
  Time: 12:26
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
  <link rel="stylesheet" type="text/css" href="/RecruitModule/iconfont/iconfont.css"/>
  <link href="/RecruitModule/css/mui.poppicker.css" rel="stylesheet" />
  <link href="/RecruitModule/css/mui.picker.css" rel="stylesheet" />
  <link href="/RecruitModule/css/mui.dtpicker.css" rel="stylesheet" />
</head>

<body>
<script src="/RecruitModule/js/mui.min.js"></script>
<script src="/RecruitModule/js/mui.dtpicker.js"></script>
<script src="/RecruitModule/js/mui.picker.js"></script>
<script src="/RecruitModule/js/mui.poppicker.js"></script>
<script src="/RecruitModule/js/jquery1.9.1.min.js"></script>
<script src="/RecruitModule/js/city.data-3.js"></script>

<!--
    标题栏
-->

<link href="/RecruitModule/css/position_info.css" rel="stylesheet"/>
<header class="mui-bar mui-bar-nav" >
  <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
  <h1 class="mui-title">职位详情</h1>
</header>

<!--
    编辑内容
-->
<div class="mui-content">

  <div class="mui-input-row" style="margin-top: 10px;">
    <h4>&nbsp;&nbsp;职位：${myrecruit.jobname}</h4>
  </div>
  <div class="mui-table-view mui-table-view-chevron" style="height: 60px;margin-top: 10px">
    <li class="mui-table-view-cell">
      <a class="mui-navigate">
        <!--<span id="work_city" class="icon-circle  icon iconfont icon-add2" style="color: dodgerblue;"></span>-->
        <span id="selected_work_city">公司：${myrecruit.tfirmuserInAcc.companyname}</span>
      </a>
    </li>
  </div>
  <div class="mui-table-view mui-table-view-chevron" style="height: 60px;">
    <li class="mui-table-view-cell">
      <a class="mui-navigate">
        <!--<span class="icon-circle  icon iconfont icon-add2" style="color: dodgerblue;"></span>-->
        <span>薪水：${myrecruit.salary}</span>
      </a>
    </li>
  </div>



  <div class="mui-table-view mui-table-view-chevron" style="height: 60px;">
    <li class="mui-table-view-cell">
      <a class="mui-navigate">
        <!--<span class="icon-circle  icon iconfont icon-add2" style="color: dodgerblue;"></span>-->
        <span>职位诱惑：${myrecruit.welfare}</span>
      </a>
    </li>
  </div>

  <!--
      ===================================================================
  -->
  <div class="mui-table-view mui-table-view-chevron" style="height: 60px;">
    <li class="mui-table-view-cell">
      <a class="mui-navigate">
        <!--<span class="icon-circle  icon iconfont icon-add2" style="color: dodgerblue;"></span>-->
        <div class="mui-input-row">
          <span>工作经验：${myrecruit.workreq}</span>
        </div>
      </a>
    </li>
  </div>
  <div class="mui-table-view mui-table-view-chevron" style="height: 60px;">
    <li class="mui-table-view-cell">
      <a class="mui-navigate">
        <span>工作地点：${myrecruit.workaddr}</span>
      </a>
    </li>
  </div>

  <div class="mui-table-view mui-table-view-chevron" style="height: 60px;">
    <li class="mui-table-view-cell">
      <a class="mui-navigate">
        <span >工作类型：${myrecruit.worktype}</span>
      </a>
    </li>
  </div>

  <div class="mui-table-view mui-table-view-chevron" style="height: 60px;margin-bottom: 10px;">
    <li class="mui-table-view-cell">

      <a class="mui-navigate">
        <div class="mui-input-row">
          <span>学历要求：${myrecruit.edureq}</span>
        </div>

      </a>
    </li>
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
        <input type="submit" value="投递本职位申请" class="mui-btn mui-btn-blue mui-btn-block" >
      </a>
    </ul>
  </form>

  <script type="text/javascript" language="javascript">
    function confirmAct()
    {
      if(confirm('确定要投递职位申请吗？'))
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




</div>

</body>

</html>

