<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/31
  Time: 16:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
  <h1 class="mui-title">编辑教育经历</h1>
  <span id="dingwei" class="mui-icon iconfont icon-baocun mui-pull-right" style="color: white;" onclick="eduExpFormSub()"></span></br>
</header>
<script>
  function eduExpFormSub()
  {
    if(CheckPost())
    {
      document.eduExpForm.submit();
    }
  }
  function CheckPost ()
  {
    //校验表单内容
    /*var graduate_time= document.getElementById("selected_graduate_time").value;
     alert("graduate_time"+graduate_time);
     var education= document.getElementById("selected_education").value;
     alert("education"+education);*/
    return true;

  }

</script>
<!--
    编辑内容
-->
<form action="/eduExpSub" name="eduExpForm"  id=""  method="post">
  <div class="mui-content" style="margin-top: 10px;">
    <div class="mui-input-row"><br><br>
      <span class="icon-circle  icon iconfont icon-bianji" style="color: dodgerblue;"></span>
      <span ><input type="text" name="eduschoolname" placeholder="学校名称" style="border:0px;"></span>
    </div>

    <div class="mui-input-row">
      <span class="icon-circle  icon iconfont icon-bianji" style="color: dodgerblue;"></span>
      <span ><input type="text" name="edumajor" placeholder="所学专业" style="border:0px;"></span>
    </div>

    <div class="mui-input-row">
      <span id="graduate_time" class="icon-circle  icon iconfont icon-bianji" style="color: dodgerblue;"></span>
      <span ><input type="text" name="graduationtime" id="selected_graduate_time" placeholder="毕业年月" style="border:0px;"></span>
    </div>
    <script>
      var gradutePicker = new mui.DtPicker({
        type:'date',
        beginDate: new Date(1970,01,01),//设置开始日期
        endDate: new Date(2050,12,31),//设置结束日期
      });
      var graduteButton = document.getElementById("selected_graduate_time");
      var graduteResult = document.getElementById("selected_graduate_time");
      graduteButton.addEventListener('tap',function(event){
        gradutePicker.show(function(items){
          graduteResult.value = items;
          /*console.log(nianfenPicker.innerText);*/
          console.log(items);
        });
      },false);
    </script>

    <div class="mui-input-row">
      <span id="education"class="icon-circle  icon iconfont icon-bianji" style="color: dodgerblue;"></span>
      <span ><input type="text" name="degree" id="selected_education" placeholder="学历" style="border:0px;"></span>
    </div>

    <input type="hidden" name="userid" value="${userId}" >
    <script>
      var educationButton = document.getElementById("selected_education");
      var result_education = document.getElementById("selected_education");
      var educationPicker = new mui.PopPicker();
      educationPicker.setData([{
        value:"1",
        text:"本科"
      },{
        value:"2",
        text:"大专及以下"
      },{
        value:"3",
        text:"硕士"
      },{
        value:"4",
        text:"博士"
      },{
        value:"5",
        text:"其他"
      }]);
      educationButton.addEventListener('tap',function(event){
        educationPicker.show(function(item){
          result_education.value = item[0].text;
          /*console.log(nianfenPicker.innerText);*/
          console.log(item[0].text);
        });
      },false);
    </script>
  </div>
</form>
</body>

</html>
