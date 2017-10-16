<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/26
  Time: 10:06
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
    document.basicForm.submit();

  }


</script>

<!--
    标题栏
-->




<link href="/RecruitModule/css/position_info.css" rel="stylesheet"/>
<header class="mui-bar mui-bar-nav" >
  <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
  <h1 class="mui-title">个人基本信息</h1>
  <h5 onclick="SendForm()" style="color: white;float: right;margin-top: 15px;" >下一步</h5></br>
</header>

<!--
    编辑内容
-->
<form action="/basicInfoSub" name="basicForm" method="post"><br>
  <div class="mui-content"><br>

    <div class="mui-input-row"><br>
      <span class="icon-circle  icon iconfont icon-bianji" style="color: dodgerblue;"></span>
      <span><input type="text"  placeholder="姓名" name="personname" style="border:0px;"></span>
    </div>

    <div class="mui-input-row">
      <span id = "nianfen" class="icon-circle  icon iconfont icon-bianji" style="color: dodgerblue;"></span>
      <span ><input type="text" id = "selected" name="birthtimeStr"   placeholder="出生年份" readonly  unselectable="on" style="border:0px;"></span>
    </div>

    <script>

      var nianfenPicker = new mui.DtPicker({
        type:'date',
        beginDate: new Date(1970,01,01),//设置开始日期
        endDate: new Date(2050,12,31),//设置结束日期
      });
      var nianfenButton = document.getElementById("selected");
      var nianfenResult = document.getElementById("selected");
      nianfenButton.addEventListener('tap',function(event){
        nianfenPicker.show(function(items){
          nianfenResult.value = items;
          /*console.log(nianfenPicker.innerText);*/
          console.log(items);
        });
      },false);
    </script>
    <!--<div class="mui-input-row" style="margin-bottom: 10px;">
        <div>
        <label id="nianfen" class="mui-table-view-cell"><a class="mui-icon mui-icon-left-nav mui-pull-left"></a></label>
        <span id="selected"><input type="text" placeholder="出生年份" style="border:0px;"></span>
        </div>
  </div>-->
    <div class="mui-input-row">
      <span id="sex" class="icon-circle  icon iconfont icon-bianji" style="color: dodgerblue;"></span>
      <span><input type="text" id ="selected_sex"  placeholder="性别" name="personsex" readonly  unselectable="on" style="border:0px; "></span>
    </div>
    <script>
      var sexButton = document.getElementById("selected_sex");
      var result_sex = document.getElementById("selected_sex");
      var sexPicker = new mui.PopPicker();
      sexPicker.setData([{
        value:"男",
        text:"男"
      },{
        value:"女",
        text:"女"
      }]);
      sexButton.addEventListener('tap',function(event){
        sexPicker.show(function(item){
          result_sex.value = item[0].text;
          /*console.log(nianfenPicker.innerText);*/
          console.log(item[0].text);
        });
      },false);
    </script>

    <!--
        ===========================================================
    -->
    <div class="mui-input-row" style="margin-bottom: 10px;">
      <!--   <label>工作年限</label>-->
      <span id="work_exp" class="icon-circle  icon iconfont icon-bianji" style="color: dodgerblue;"></span>
      <span id="selected_work_exp"><input type="text"  readonly  unselectable="on" placeholder="工作年限 应届生" name="workyear" style="border:0px;"></span>
    </div>
    <script>
      var workButton = document.getElementById("selected_work_exp");
      var result_work = document.getElementById("selected_work_exp");
      var work_expPicker = new mui.PopPicker();
      work_expPicker.setData([{
        value:"应届毕业生",
        text:"应届毕业生"
      },{
        value:"1年",
        text:"1年"
      },{
        value:"2年",
        text:"2年"
      },{
        value:"3年",
        text:"3年"
      },{
        value:"4年",
        text:"4年"
      },{
        value:"5年及以上",
        text:"5年及以上"
      }]);
      workButton.addEventListener('tap',function(event){
        work_expPicker.show(function(item){
          result_work.innerText = item[0].text;
          /*console.log(nianfenPicker.innerText);*/
          console.log(item[0].text);
        });
      },false);
    </script>
    <!--
        ===========================================================
    -->
    <div class="mui-input-row">
      <!--<label>联系电话</label>-->
      <span class="icon-circle  icon iconfont icon-bianji" style="color: dodgerblue;"></span>
      <span><input type="text" placeholder="手机号"  name="persontel" style="border:0px;"></span>
    </div>
    <div class="mui-input-row" style="margin-bottom: 10px;">
      <!--<label>联系邮箱</label>-->
      <span class="icon-circle  icon iconfont icon-bianji" style="color: dodgerblue;"></span>
      <span><input type="text" placeholder="邮箱"  name="personemail" style="border:0px;"></span>
    </div>
    <!--
        ===========================================================
    -->
    <div class="mui-input-row" style="margin-bottom: 10px;">
      <!--<label>联系邮箱</label>-->
      <ul class="mui-table-view mui-table-view-chevron">
        <li class="mui-table-view-cell">
          <a>
            <!--<span class="icon iconfont icon-dingdan" style="color: orangered;"></span>-->

             <span  style="font-size: 14px;color: #555555;font-family: '微软雅黑'">
               <input  required id="selected_add" placeholder="所在城市"  name="personcity" readonly  unselectable="on" style="border:0px; "></span>
				<%--<span id="add_select" style="font-size: 12px;color: #555555;padding-top: 3px;font-family: '微软雅黑'"
                      class="mui-pull-right mui-icon iconfont icon-arrowright"></span>--%>
          </a>
        </li>
      </ul>
    </div>
    <script>
      var addressPicker = new mui.PopPicker({layer: 2});
      addressPicker.setData(cityData3);
      var addressPickerButton = document.getElementById('selected_add');
      var addressResult = document.getElementById('selected_add');
      addressPickerButton.addEventListener('tap',function(event){
        addressPicker.show(function(items){
          /*					userPicker.pickers[0].setSelectedIndex(1);
           userPicker.pickers[1].setSelectedIndex(1);*/
          /*					userResult.innerText = JSON.stringify(items[0].children[1].text);*/
          addressResult.value = (items[1] || {}).text ;
          /*cityResult3.innerText = "你选择的城市是:" + (items[0] || {}).text + " " + (items[1] || {}).text + " " + (items[2] || {}).text;*/
          /*alert(userResult.innerText)*/
          console.log(addressResult.value);
        });
      },false);
    </script>
    <!--
        ===========================================================
    -->

    <div class="mui-input-row">
      <!--<label>一句话介绍</label>-->
      <span class="icon-circle  icon iconfont icon-bianji" style="color: dodgerblue;"></span>
      <span><input type="text" required name="otherinf" placeholder="一句话介绍" style="border:0px;"></span>
    </div>
  </div>
  <input type="hidden" name="userid" value="${userId}" >
  <input type="hidden" name="openid" value="${oppen_id}">
</form>
</body>

</html>
