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
<script type="text/javascript">
  mui.init()
</script>

<script language="javascript">
  function SendForm ()
  {
    document.recruitform.submit();
  }
</script>

<!--
    标题栏
-->

<link href="/RecruitModule/css/position_info.css" rel="stylesheet"/>
<header class="mui-bar mui-bar-nav" >
  <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
  <h1 class="mui-title">编辑职位</h1>
  <span id="" onclick="SendForm()" class="mui-icon iconfont icon-baocun mui-pull-right" style="color: white;"></span></br>
</header>

<!--
    编辑内容
-->
<div class="mui-content">
  <form action="/updaterecruit" name="recruitform" method="post">

    <input type="hidden" value="${myrecruit.recruitid}" name="recruitid" >

    <div class="mui-input-row" style="margin-top: 8px;">
      <span><input type="text" name="jobname" placeholder="职位" value="${myrecruit.jobname}" required style="border:0px;"></span>
    </div>
    <div class="mui-table-view mui-table-view-chevron" style="height: 60px;">
      <li class="mui-table-view-cell">
        <a class="mui-navigate">
          <!--<span id="work_city" class="icon-circle  icon iconfont icon-add2" style="color: dodgerblue;"></span>-->
          <span id="selected_work_city"><input type="text" name = "salary" value="${myrecruit.salary}" required placeholder="薪资水平" style="border:0px;"></span>
        </a>
      </li>
    </div>
    <div class="mui-table-view mui-table-view-chevron" style="height: 60px;">
      <li class="mui-table-view-cell">
        <a class="mui-navigate">
          <!--<span class="icon-circle  icon iconfont icon-add2" style="color: dodgerblue;"></span>-->
          <span><input type="text" name = "welfare" required placeholder="职位诱惑" value="${myrecruit.welfare}" style="border:0px;"></span>
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
            <span><input type="text" id ="selected_sex" required placeholder="工作经验要求" name="workreq" value="${myrecruit.workreq}" readonly  unselectable="on" style="border:0px; "></span>
          </div>
          <script>
            var sexButton = document.getElementById("selected_sex");
            var result_sex = document.getElementById("selected_sex");
            var sexPicker = new mui.PopPicker();
            sexPicker.setData([{
              value:"应届毕业生",
              text:"应届毕业生"
            },{
              value:"1年及以内",
              text:"1年及以内"
            },{
              value:"3年及以内",
              text:"3年及以内"
            },{
              value:"5年及以内",
              text:"5年及以内"
            },{
              value:"5年以上",
              text:"5年以上"
            }
            ]);
            sexButton.addEventListener('tap',function(event){
              sexPicker.show(function(item){
                result_sex.value = item[0].text;
                /*console.log(nianfenPicker.innerText);*/
                console.log(item[0].text);
              });
            },false);
          </script>
        </a>
      </li>
    </div>
    <div class="mui-table-view mui-table-view-chevron" style="height: 60px;">
      <li class="mui-table-view-cell">
        <a class="mui-navigate">
          <span id="gongzuo_city" class="icon-circle  icon iconfont icon-add2" style="color: dodgerblue;"></span>
          <span><input type="text" name = "workaddr" required  id="selected_gongzuo_city" value="${myrecruit.workaddr}"  readonly  unselectable="on" placeholder="工作地点" style="border:0px;"></span>
        </a>
      </li>
    </div>
    <script>
      var cityPicker = new mui.PopPicker({layer: 2});
      cityPicker.setData(cityData3);
      var cityPickerButton = document.getElementById('gongzuo_city');
      var cityResult = document.getElementById('selected_gongzuo_city');
      cityPickerButton.addEventListener('tap',function(event){
        cityPicker.show(function(items){
          /*					userPicker.pickers[0].setSelectedIndex(1);
           userPicker.pickers[1].setSelectedIndex(1);*/
          /*					userResult.innerText = JSON.stringify(items[0].children[1].text);*/
          cityResult.value = (items[1] || {}).text ;
          /*cityResult3.innerText = "你选择的城市是:" + (items[0] || {}).text + " " + (items[1] || {}).text + " " + (items[2] || {}).text;*/
          /*alert(userResult.innerText)*/
          console.log(cityResult.value);
        });
      },false);
    </script>
    <div class="mui-table-view mui-table-view-chevron" style="height: 60px;">
      <li class="mui-table-view-cell">
        <a class="mui-navigate">
          <span id="didian" class="icon-circle  icon iconfont icon-add2" style="color: dodgerblue;"></span>
          <span ><input type="text" id="select_didian" required name="worktype" placeholder="工作类型" value="${myrecruit.worktype}" readonly  unselectable="on" style="border:0px;"></span>
        </a>
      </li>
    </div>
    <script>
      var didianButton = document.getElementById("didian");
      var result_didian = document.getElementById("select_didian");
      var didianPicker = new mui.PopPicker();
      didianPicker.setData([{
        value:"1",
        text:"全职"
      },{
        value:"2",
        text:"兼职"
      },{
        value:"3",
        text:"实习"
      }]);
      didianButton.addEventListener('tap',function(event){
        didianPicker.show(function(item){
          result_didian.value = item[0].text;
          /*console.log(nianfenPicker.innerText);*/
          console.log(item[0].text);
        });
      },false);
    </script>
    <div class="mui-table-view mui-table-view-chevron" style="height: 60px;margin-bottom: 10px;">
      <li class="mui-table-view-cell">

        <a class="mui-navigate">
          <div class="mui-input-row">
            <span><input type="text" id ="selected_work" placeholder="教育经验要求" name="edureq" value="${myrecruit.edureq}" required readonly  unselectable="on" style="border:0px; "></span>
          </div>
          <script>
            var workButton = document.getElementById("selected_work");
            var result_work = document.getElementById("selected_work");
            var workPicker = new mui.PopPicker();
            workPicker.setData([{
              value:"本科",
              text:"本科"
            },{
              value:"高中及以下",
              text:"高中及以下"
            },{
              value:"硕士研究生",
              text:"硕士研究生"
            },{
              value:"博士研究生",
              text:"博士研究生"
            }
            ]);
            workButton.addEventListener('tap',function(event){
              workPicker.show(function(item){
                result_work.value = item[0].text;
                /*console.log(nianfenPicker.innerText);*/
                console.log(item[0].text);
              });
            },false);
          </script>
        </a>
      </li>
    </div>

  </form>

  <ul class="mui-table-view" style="margin-left: 10px;margin-right: 10px;margin-bottom: 10px;">
    <a href="/deleterecruit?recruitid=${myrecruit.recruitid}" onclick="return confirmAct();" >
      <button  class="mui-btn mui-btn-blue mui-btn-block">删除此招聘信息</button>
    </a>
  </ul>


  <script type="text/javascript" language="javascript">
    function confirmAct()
    {
      if(confirm('删除此招聘信息将无法恢复,\n确定删除吗?'))
      {
        return true;
      }
      return false;
    }
  </script>




</div>

</body>

</html>
