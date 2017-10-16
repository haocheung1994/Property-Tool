<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/31
  Time: 16:52
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
<script type="text/javascript">
  mui.init()
</script>

<!--
    标题栏
-->
<link href="/RecruitModule/css/position_info.css" rel="stylesheet"/>
<header class="mui-bar mui-bar-nav" >
  <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
  <h1 class="mui-title">添加工作经历</h1>
  <span id="dingwei" class="mui-icon iconfont icon-baocun mui-pull-right" style="color: white;" onclick="workExpFormSub()"></span></br>
</header>
<script>
  function workExpFormSub()
  {
    if(CheckPost())
    {
      document.workExpForm.submit();
    }
  }
  function CheckPost ()
  {
    //校验表单内容
    return true;

  }

</script>
<!--
    编辑内容
-->
<form action="/workExpSub" name="workExpForm"  id=""  method="post"><br>
  <div class="mui-content" style="margin-top: 10px;">
    <div class="mui-input-row"><br>
      <span class="icon-circle  icon iconfont icon-bianji" style="color: dodgerblue;"></span>
      <span ><input type="text" placeholder="公司名称" name="companyname" required style="border:0px;"></span>
    </div>

    <div class="mui-input-row">
      <span class="icon-circle  icon iconfont icon-bianji" style="color: dodgerblue;"></span>
      <span ><input type="text" placeholder="你的职位" name="jobname" required style="border:0px;"></span>
    </div>

    <div class="mui-input-row">
      <span id="ruzhi_time" class="icon-circle  icon iconfont icon-bianji" style="color: dodgerblue;"></span>
      <span ><input type="text" name="starttime" id="selected_rutime" required placeholder="入职时间" style="border:0px;"></span>
    </div>
    <script>
      var ruzhiPicker = new mui.DtPicker({
        type:'date',
        beginDate: new Date(1970,01,01),//设置开始日期
        endDate: new Date(2050,12,31),//设置结束日期
      });
      var ruzhiButton = document.getElementById("selected_rutime");
      var ruzhiResult = document.getElementById("selected_rutime");
      ruzhiButton.addEventListener('tap',function(event){
        ruzhiPicker.show(function(items){
          ruzhiResult.value = items;
          /*console.log(nianfenPicker.innerText);*/
          console.log(items);
        });
      },false);
    </script>

    <div class="mui-input-row">
      <span id="lizhi_time"class="icon-circle  icon iconfont icon-bianji" style="color: dodgerblue;"></span>
      <span ><input type="text" name="endtime" id="selected_litime" required placeholder="离职时间" style="border:0px;"></span>
    </div>

    <script>
      var lizhiPicker = new mui.DtPicker({
        type:'date',
        beginDate: new Date(1970,01,01),//设置开始日期
        endDate: new Date(2050,12,31),//设置结束日期
      });
      var lizhiButton = document.getElementById("selected_litime");
      var lizhiResult = document.getElementById("selected_litime");
      lizhiButton.addEventListener('tap',function(event){
        lizhiPicker.show(function(items){
          lizhiResult.value= items;
          /*console.log(nianfenPicker.innerText);*/
          console.log(items);
        });
      },false);
    </script>

    <div class="mui-input-row">
      <span class="icon-circle  icon iconfont icon-bianji" style="color: dodgerblue;"></span>
      <span ><input type="text" placeholder="工作内容" name="workduty" required style="border:0px;"></span>
    </div>
    <input type="hidden" name="userid" value="${userId}" >
  </div>
</form>
</body>

</html>
