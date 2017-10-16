<%--
  Created by IntelliJ IDEA.
  User: lc
  Date: 2017/6/5
  Time: 17:08
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
  <link href="/RecruitModule/css/mui.poppicker.css" rel="stylesheet" />
  <link href="/RecruitModule/css/mui.picker.css" rel="stylesheet" />
  <link href="/RecruitModule/css/mui.dtpicker.css" rel="stylesheet" />
  <link rel="stylesheet" type="text/css" href="/RecruitModule/iconfont/iconfont.css"/>
</head>

<body>
<script src="/RecruitModule/js/mui.min.js"></script>
<script src="/RecruitModule/js/mui.dtpicker.js"></script>
<script src="/RecruitModule/js/mui.picker.js"></script>
<script src="/RecruitModule/js/mui.poppicker.js"></script>
<script src="/RecruitModule/js/jquery1.9.1.min.js"></script>
<script src="/RecruitModule/js/city.data-3.js"></script>

<script type="text/javascript">
  mui.init()
</script>
<script language="javascript">
  function SendForm ()
  {
    document.firmBasicForm.submit();

  }


</script>

<!--
    标题栏
-->




<link href="/RecruitModule/css/position_info.css" rel="stylesheet"/>
<header class="mui-bar mui-bar-nav" >
  <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
  <h1 class="mui-title">企业基本信息</h1>
  <h5 onclick="SendForm()" style="color: white;float: right;margin-top: 15px;" >下一步</h5></br>
</header>

<!--
    编辑内容
-->
<form action="/firmInfoSub" name="firmBasicForm" method="post"><br>
  <div class="mui-content"><br>

    <div class="mui-input-row"><br>
      <span class="icon-circle  icon iconfont icon-bianji" style="color: dodgerblue;"></span>
      <span><input type="text"  placeholder="企业名称" name="companyname" required style="border:0px;"></span>
    </div>

    <!--
        ===========================================================
    -->
    <div class="mui-input-row">
      <!--<label>联系电话</label>-->
      <span class="icon-circle  icon iconfont icon-bianji" style="color: dodgerblue;"></span>
      <span><input type="text" placeholder="企业电话" name="companytel" required style="border:0px;"></span>
    </div>
    <div class="mui-input-row" style="margin-bottom: 10px;">
      <!--<label>联系邮箱</label>-->
      <span class="icon-circle  icon iconfont icon-bianji" style="color: dodgerblue;"></span>
      <span><input type="text" placeholder="企业地址" name="companyaddr" required style="border:0px;"></span>
    </div>
    <!--
        ===========================================================
    -->
    <div class="mui-input-row" style="margin-bottom: 10px;">
      <!--<label>联系邮箱</label>-->
      <span class="icon-circle  icon iconfont icon-bianji" style="color: dodgerblue;"></span>
      <span><input type="text" placeholder="企业邮箱" name="companyemail"  required style="border:0px;"></span>
    </div>
    <div class="mui-input-row">
      <!--<label>一句话介绍</label>-->
      <span class="icon-circle  icon iconfont icon-bianji" style="color: dodgerblue;"></span>
      <span><input type="text" placeholder="企业简介" name="companyinf" required  style="border:0px;"></span>
    </div>
  </div>
  <input type="hidden" name="userid" value="${userId}" >
  <input type="hidden" name="openid" value="${oppen_id}">
</form>
</body>

</html>

