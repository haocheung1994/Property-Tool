<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/31
  Time: 16:31
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
  <link href="/RecruitModule/css/homepage.css" rel="stylesheet"/>
  <link href="/RecruitModule/css/mui.poppicker.css" rel="stylesheet" />
  <link href="/RecruitModule/css/mui.picker.css" rel="stylesheet" />

</head>

<body>
<script src="/RecruitModule/js/mui.min.js"></script>
<script src="/RecruitModule/js/mui.picker.js"></script>
<script src="/RecruitModule/js/mui.poppicker.js"></script>
<script src="/RecruitModule/js/jquery1.9.1.min.js"></script>
<script src="/RecruitModule/js/city.data-3.js"></script>
<script src="/RecruitModule/iconfont/iconfont.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=vwiW7g0R9rv1Xg43n8avde8is4uqDRZn"></script>

<script type="text/javascript">
  mui.init()
</script>
<header id="property_title" class="mui-bar mui-bar-nav" style="background-color: rgb(71,155,241);">
  <a id="info" class="mui-icon iconfont icon-gerenzhongxin mui-pull-right" style="color: white;"></a>
  <title class="mui-title">物业稻草人</title>
  </a>
  <span id="dingwei" class="mui-icon iconfont icon-site mui-pull-left" style="color: white;"></span></br>
  <span id="userResult" style="font-family: '微软雅黑'; font-size: 10px; color: white">默认</span>
  </a>
  <script type="text/javascript">
    // 百度地图API功能
    var map = new BMap.Map("userResult");
    /*var point = new BMap.Point(116.331398,39.897445);
     map.centerAndZoom(point,12);*/

    function myFun(result){
      var cityName = result.name;
      map.setCenter(cityName);
      userResult.innerText = cityName;
      /*alert("当前定位城市:"+cityName);*/
    }
    var myCity = new BMap.LocalCity();
    myCity.get(myFun);
  </script>

</header>

<div class="mui-content">
  <!--
      轮播图片
  -->

  <div id="slider" class="mui-slider" >
    <div class="mui-slider-group mui-slider-loop">
      <!-- 额外增加的一个节点(循环轮播：第一个节点是最后一张轮播) -->
      <div class="mui-slider-item mui-slider-item-duplicate">
        <a href="#">
          <img src="/RecruitModule/img/slider3.jpg">
        </a>
      </div>
      <!-- 第一张 -->
      <div class="mui-slider-item">
        <a href="#">
          <img src="/RecruitModule/img/slider1.jpg">
        </a>
      </div>
      <!-- 第二张 -->
      <div class="mui-slider-item">
        <a href="#">
          <img src="/RecruitModule/img/slider2.jpg">
        </a>
      </div>
      <!-- 第三张 -->
      <div class="mui-slider-item">
        <a href="#">
          <img src="/RecruitModule/img/slider3.jpg">
        </a>
      </div>
      <!-- 额外增加的一个节点(循环轮播：最后一个节点是第一张轮播) -->
      <div class="mui-slider-item mui-slider-item-duplicate">
        <a href="#">
          <img src="/RecruitModule/img/slider1.jpg">
        </a>
      </div>
    </div>
    <div class="mui-slider-indicator">
      <div class="mui-indicator mui-active"></div>
      <div class="mui-indicator"></div>
      <div class="mui-indicator"></div>
    </div>
  </div>
  <script>
    var userPicker = new mui.PopPicker({layer: 2});
    userPicker.setData(cityData3);
    var showUserPickerButton = document.getElementById('dingwei');
    var userResult = document.getElementById('userResult');
    showUserPickerButton.addEventListener('tap',function(event){
      userPicker.show(function(items){
        /*					userPicker.pickers[0].setSelectedIndex(1);
         userPicker.pickers[1].setSelectedIndex(1);*/
        /*					userResult.innerText = JSON.stringify(items[0].children[1].text);*/
        userResult.innerText = (items[1] || {}).text ;
        /*cityResult3.innerText = "你选择的城市是:" + (items[0] || {}).text + " " + (items[1] || {}).text + " " + (items[2] || {}).text;*/
        /*alert(userResult.innerText)*/
        console.log(userResult.innerText);
      });
    },false);
  </script>

  <!--
      功能模块图
  -->
  <div class="tags" style="padding-bottom: 50px;">
    <table border="0" cellspacing="5" cellpadding="0">
      <tr>
        <td colspan="2"><a href="tudi.html"><i></i><img src="/RecruitModule/img/土地信息.png" style="max-width:100%;"/></a></td>
        <td><a href="zhaopin.html"><i></i><img src="/RecruitModule/img/招聘.png" style="max-width:200%;"/></a></td>
        <!--<td rowspan="2"><a href="topic/612.html"><i></i><img src="img/行业信息.png" /></a></td>-->
      </tr>
      <tr>
        <td><a href="hangye.html"><img src="/RecruitModule/img/行业信息.png" style="max-width:100%;"/></a></td>
        <td colspan="2"><a href="market.html"><img src="/RecruitModule/img/商城.png" style="max-width:100%;/"><i></i></a></td>
        <td><a href="luntan.html"><i></i><img src="/RecruitModule/img/论坛.png" style="max-width:100%;"/></a></td>
      </tr>
    </table>
  </div>

  <!--
  底部菜单
  -->
  <div class="mui-bar mui-bar-tab">
    <div class="mui-tab-item ">
      <a class="mui-tab-item mui-active">
        <span id="shouye"class="mui-icon iconfont icon-shouye-shouye"></span>
        <span class="mui-tab-label">首页</span>
      </a>
    </div>
    <script>
      var shouye = document.getElementById("shouye");
      shouye.addEventListener('tap',function(){
        location.href ='/homepage' ;
      })
    </script>


 <div class="mui-tab-item mui-active" >
    <a  class="mui-tab-item " >
        <span id="jianli" class="mui-icon iconfont icon-jianli"></span>
        <span class="mui-tab-label">简历</span>
    </a>
 </div>
    <script>
      var jianli = document.getElementById("jianli");
      jianli.addEventListener('tap',function(){
        location.href = '/myResume?userid=${userId}';
      })
    </script>

    <div class="mui-tab-item mui-active" >
      <a class="mui-tab-item">
        <span id="zhiwei"class="mui-icon iconfont icon-zhiwei"></span>
        <span class="mui-tab-label">职位</span>
      </a>
    </div>
    <script>
      var zhiwei = document.getElementById("zhiwei");
      zhiwei.addEventListener('tap',function(){
        location.href = '';
      })
    </script>
    <div class="mui-tab-item mui-active">
      <a class="mui-tab-item">
        <span id="shangcheng"class="mui-icon iconfont icon-shangcheng"></span>
        <span class="mui-tab-label">商城</span>
      </a>
    </div>
    <script>
      var shangcheng = document.getElementById("shangcheng");
      shangcheng.addEventListener('tap',function(){
        location.href = '';
      })


    </script>
    <div class="mui-tab-item mui-active" onclick="tab('order.html')">
      <a class="mui-tab-item">
        <span class="mui-icon iconfont icon-dingdan"></span>
        <span class="mui-tab-label">订单</span>
      </a>
    </div>
  </div>
</div>

</body>
<script type="text/javascript" src="js/mui.js" ></script>
<script>
  var gallery = mui("#slider");
  gallery.slider({
    interval:3000
  });
  function tab(url) {
    location.href = url;
  }

</script>
</html>
