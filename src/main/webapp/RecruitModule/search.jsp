<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/31
  Time: 14:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <title></title>
  <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
  <link href="css/mui.min.css" rel="stylesheet" />
  <link href="css/mui.poppicker.css" rel="stylesheet" />
  <link href="css/mui.picker.css" rel="stylesheet" />
  <link href="css/mui.dtpicker.css" rel="stylesheet" />
  <link rel="stylesheet" type="text/css" href="iconfont/iconfont.css"/>
</head>

<body>
<script src="js/mui.min.js"></script>
<script src="js/mui.dtpicker.js"></script>
<script src="js/mui.picker.js"></script>
<script src="js/mui.poppicker.js"></script>
<script src="js/jquery1.9.1.min.js"></script>
<script src="js/city.data-3.js"></script>
<script type="text/javascript">
  mui.init()
</script>
<link href="css/position_info.css" rel="stylesheet"/>
<header class="mui-bar mui-bar-nav" >
  <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
  <h1 class="mui-title" ">搜索</h1>
</header>

<!--
    搜索框
-->
<div class="mui-content">
  <!--
      搜索框
  -->
  <div class="mtzrl_search new_style" style="padding:5px 5px;">
    <!--<ul id="search_box01">
        <li class="keyword_wrap">
            <div class="inp_search">
                <input id="area" type="hidden" name="area" value="" />
                <span class="select_area">地区</span>
            </div>
            <div class="input_box">
                <input class="inp_search" type="search" placeholder="输入关键字" name="keyword" id="keyword">
            </div>
        </li>
    </ul>-->
    <div id="search" class="mui-search mui-active">
      <input type="search" class="mui-input-clear" placeholder="搜索职位/公司">
    </div>

    <!--
        工作地点选择
    -->
    <div class="mui-table-view" class="mui-media-body">
      <ul class="mui-table-view">
        <li class="mui-table-view-cell mui-media">
          <div class="mui-media-body" >
            <span id="selecte_add"><p class="mui-icon iconfont icon-site mui-icon-left-nav mui-pull-left"></p></span>
            <span id="add_selected"><p type="hidden">工作地点(可选择家附近的职位)</p></span>
        </li>
      </ul>
    </div>
    <script>
      var addressPicker = new mui.PopPicker({layer: 2});
      addressPicker.setData(cityData3);
      var addressPickerButton = document.getElementById('selecte_add');
      var addressResult = document.getElementById('add_selected');
      addressPickerButton.addEventListener('tap',function(event){
        addressPicker.show(function(items){
          /*					userPicker.pickers[0].setSelectedIndex(1);
           userPicker.pickers[1].setSelectedIndex(1);*/
          /*					userResult.innerText = JSON.stringify(items[0].children[1].text);*/
          addressResult.innerText = (items[1] || {}).text ;
          /*cityResult3.innerText = "你选择的城市是:" + (items[0] || {}).text + " " + (items[1] || {}).text + " " + (items[2] || {}).text;*/
          /*alert(userResult.innerText)*/
          console.log(addressResult.innerText);
        });
      },false);
    </script>
  </div>

</div>


</body>

</html>