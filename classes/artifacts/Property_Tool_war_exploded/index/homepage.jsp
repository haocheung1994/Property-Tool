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
  <link href="/index/iconfont/iconfont.css" rel="stylesheet" />
  <link href="/RecruitModule/css/homepage.css" rel="stylesheet"/>
  <link href="/RecruitModule/css/mui.poppicker.css" rel="stylesheet" />
  <link href="/index/css/index1.cs" rel="stylesheet" />
  <link href="/RecruitModule/css/mui.picker.css" rel="stylesheet" />
  <link href="css/home.mui.min.css" rel="stylesheet" />
  <link href="css/index1.css" rel="stylesheet" />
  <script type="text/javascript" charset="utf-8">
    mui.init();
  </script>
</head>

<body onload="showvalf()">
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

  <title class="mui-title"  style="color: white;">物业稻草人</title>
  <a href="/index/citylist.html">
  <span id="dingwei"  class="mui-icon mui-icon-location"   style="color: white;">
  <span id="userResult" style="font-family: '微软雅黑'; font-size: 13px;">
    默认
    </span></span>
  </a>
<%--  <script type="text/javascript">
    // 百度地图API功能
    /*var map = new BMap.Map("userResult");*/
    /*var point = new BMap.Point(116.331398,39.897445);
     map.centerAndZoom(point,12);*/


    function myFun(result){
      var cityName = result.name;
      map.setCenter(cityName);
      userResult.innerText = cityName;
      /*alert("当前定位城市:"+cityName);*/

  /*    map.style.color="FFFFFF";*/
    }
    var myCity = new BMap.LocalCity();
    myCity.get(myFun);

  </script>--%>
  <script type="text/javascript">
    // 百度地图API功能
    //
    /*var point = new BMap.Point(116.331398,39.897445);
     map.centerAndZoom(point,12);*/

    function myFun(result){
      var cityName = result.name;
      /*map.setCenter(cityName);*/
      /*userResult.textContent = cityName;*/
      var userResult = document.getElementById("userResult");
      userResult.innerText = cityName;
      /*alert("当前定位城市:"+cityName);*/

    }

  </script>

  <script type="text/javascript">

/*    mui.plusReady(function () {
      var name = session.getAttribute("addrCity")
      alert("addr"+name);
      userResult.innerText = name;
      var flag = self.flag;
      if(flag == null){
        var myCity = new BMap.LocalCity();
        myCity.get(myFun);
      }
    })*/
    var thisURL = decodeURI(location.href);
    var  getval = thisURL.split('?')[1];
    var  showval = getval.split("=")[1];
   var flag;
    if(getval!=null){
   var  showval = getval.split('=')[1];
    flag = getval.split('=')[2];
}


    var  flag = getval.split("=")[2];
    //			alert(showval);
    //			alert(flag);
    function  showvalf(){
      userResult.innerText = showval;
      if(flag == null){
        var myCity = new BMap.LocalCity();
        myCity.get(myFun);
      }
    }


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
          <img src="/RecruitModule/img/03.jpg">
        </a>
      </div>
      <!-- 第一张 -->
      <div class="mui-slider-item">
        <a href="#">
          <img src="/RecruitModule/img/banner_new.png">
        </a>
      </div>
      <!-- 第二张 -->
      <div class="mui-slider-item">
        <a href="#">
          <img src="/RecruitModule/img/02.jpg">
        </a>
      </div>
      <!-- 第三张 -->
      <div class="mui-slider-item">
        <a href="#">
          <img src="/RecruitModule/img/03.jpg">
        </a>
      </div>

      <!-- 额外增加的一个节点(循环轮播：最后一个节点是第一张轮播) -->
      <div class="mui-slider-item mui-slider-item-duplicate">
        <a href="#">
          <img src="/RecruitModule/img/banner_new.png">
        </a>
      </div>
    </div>
    <div class="mui-slider-indicator">
      <div class="mui-indicator mui-active"></div>
      <div class="mui-indicator"></div>
      <div class="mui-indicator"></div>
    </div>
  </div>
<%--  <script>
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
  </script>--%>

  <!--
      功能模块图
  -->

  <div id="outer">
    <div id="inner">
      <a href="/placeModule">  <div class="contantbody">
        <div class="bodyleft">
          <div class="bodyleft-tudi">
            <div class="title1">土地中标信息</div>
            <div class="title2">物业项目早知道</div>
          </div></a>

      <a href="/supplierModule">
        <div class="bodyleft-shangjia">
            <div class="title1">创收天地</div>
            <div class="title2">汇集供应商信息</div>
          </div>
        </div></a>

        <div class="bodyright">
          <a href="/jobHomepage">
            <div class="bodyright-zhaopin">
            <div class="title1">求职招聘</div>
            <div class="title2">物业招聘 汇集于此</div>
          </div></a>

          <a href="/page/index.html">
          <div class="bodyright-down">
            <div class="bodyright-down-shangcheng">
              <div class="title">商城</div>
            </div>
          </a>

            <a href="https://www.vzan.com/f/s-952430">
              <div class="bodyright-down-luntan">
              <div>
                <div class="title">论坛</div>
              </div>
            </div></a>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<%-- <div &lt;%&ndash;class="tags"&ndash;%&gt; style="padding-bottom: 50px;">
    <table border="0" cellspacing="5" cellpadding="0">
      <tr>
        <td><a href="/placeModule"><i></i><img src="/index/img/tudiinfo.png" style="max-width:130%;"/></a></td>
        <td><a href="/jobHomepage">
          <i>
          <img src="/index/img/recruit.png" style="max-width:160%;margin-left: 30%;margin-right: 10px;"/>
          </i>
        </a>
        </td>
        <!--<td rowspan="2"><a href="topic/612.html"><i></i><img src="img/行业信息.png" /></a></td>-->
      </tr>
      <tr>
        <td><a href="/supplierModule"><img src="/index/img/hangye.png" style="max-width:120%;"/></a></td>
        <td colspan="2"><a href="/page/index.html"><img src="/index/img/sale.png" style="margin-left: 15%;max-width:97%;/"><i></i></a></td>
        <td><a href="https://www.vzan.com/f/s-952430"><i></i><img src="/index/img/luntan.png" style="max-width:100%;"/></a></td>
      </tr>
    </table>
  </div>--%>
</div></body>
  <!--
  底部菜单
  -->
  <jsp:include page="foot.jsp"></jsp:include>
</html>
