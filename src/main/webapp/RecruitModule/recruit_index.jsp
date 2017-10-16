<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%--
Created by IntelliJ IDEA.
User: Administrator
Date: 2017/5/25
Time: 9:52
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
	<link href="/RecruitModule/css/mui.min.css" type="text/css" rel="stylesheet" />
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
<script type="text/javascript">
	mui.init()
</script>
<link href="/RecruitModule/css/search.css" rel="stylesheet"/>
<header id="header1" class="mui-bar mui-bar-nav">
	<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left" style="color: white;"></a>
	<h1 class="mui-title">求职招聘</h1>
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
		<form action="/searchJob" method="post">
			<div id="search" class="mui-search mui-active">
				<input type="search" name="jobName" required class="mui-input-clear" placeholder="搜索职位/公司">
			</div>

			<!--
                工作地点选择
            -->

			<div class="mui-table-view" class="mui-media-body">
				<ul class="mui-table-view">
					<li class="mui-table-view-cell mui-media">
						<div class="mui-media-body" >
							<div style="margin-top:4px"></div>
							<p  class="mui-icon iconfont icon-site mui-icon-left-nav mui-pull-left"></p>
							<span id="selecte_add">

							<p type="hidden" id="add_selected" style="padding:0px; margin:0px;display: inline;font-size:17px;" >工作地点(选择家附近的职位)</p>
							</span>
							<input STYLE="float: right;height: 30px" type="button" onclick="NewFunc()" value="筛选">
							<input type="hidden"   id="input_selected" name="workAddr" required >

						</div>

					</li>
				</ul>
			</div>


			<%--	<p &lt;%&ndash;style="float: right" &ndash;%&gt;onclick="NewFunc()">筛选</p>--%>
			<script type="text/javascript">
				function NewFunc(){
					var inputResult = document.getElementById('input_selected');
					var site=inputResult.value;
					if (site=="null"){
						alert("未选择地址")
					}
					else {
						var url="site="+site;
						url=encodeURI(encodeURI(url));
						window.location = "/newHomePage?"+url;
					}

					/*self.location='site='+site;*/

					/*$.ajax({
					 type:"post",
					 dataType:"text",
					 url:"newHomePage",
					 data:{"site":$("#input_selected").val()},
					 success: function () {
					 location.href="/recruitPage"
					 }
					 });*/

				}

			</script>
			<script>
				var addressPicker = new mui.PopPicker({layer: 2});
				addressPicker.setData(cityData3);
				var addressPickerButton = document.getElementById('selecte_add');
				var addressResult = document.getElementById('add_selected');
				var inputResult = document.getElementById('input_selected');
				addressPickerButton.addEventListener('tap',function(event){
					addressPicker.show(function(items){
						/*					userPicker.pickers[0].setSelectedIndex(1);
						 userPicker.pickers[1].setSelectedIndex(1);*/
						/*					userResult.innerText = JSON.stringify(items[0].children[1].text);*/
						addressResult.innerText = (items[1] || {}).text ;
						inputResult.value = (items[1] || {}).text ;
						/*cityResult3.innerText = "你选择的城市是:" + (items[0] || {}).text + " " + (items[1] || {}).text + " " + (items[2] || {}).text;*/
						/*alert(userResult.innerText)*/
						console.log(addressResult.innerText);
					});
				},false);
			</script>


		</form>
	</div>
</div>
<!--
            数据列表
        -->




<div style="padding-bottom: 50px;margin-top: 5px;">
	<c:forEach var="recruit" items="${trecruitList}" >

		<ul class="mui-table-view" style="margin-top: 10px; margin-left: 10px; margin-right: 10px;">
			<link href="css/font.css" rel="stylesheet" />
			<li class="mui-table-view-cell mui-media">
				<c:if test="${loginUser.usertype!=null||loginUser.usertype!=''}">
				<a href="/applyInfo?recruitid=${recruit.recruitid}">
					</c:if>
					<c:if test="${loginUser.usertype==null||loginUser.usertype==''}">
					<a href="/chooserole2">
						</c:if>
						<div id="divcss5">
							<img class="mui-media-object mui-pull-left" src="/RecruitModule/img/job.jpg">
						</div>
						<div class="mui-media-body">
							<span3 class="mui-active"style="float:right;color: orangered;">${recruit.salary}</span3>
							<p class="mui-ellipsis" style="font-family: '微软雅黑';font-size: larger;color: black;">${recruit.jobname}</p>
							<p class="mui-ellipsis"><span3>${recruit.workaddr}</span3></p>
							<c:if test="${recruit.companyid == 8}">
								<p class="mui-ellipsis" style="float:right" >${recruit.pubtimeStr}</p>
								<p class="mui-ellipsis" style="margin-left: auto;">${recruit.companyname8}</p>
							</c:if>
							<c:if test="${recruit.companyid != 8}">
								<p  style="float:right" >${recruit.pubtimeStr}</p>
								<p class="mui-ellipsis" style="margin-left: auto;">${recruit.tfirmuserInAcc.companyname}</p>
							</c:if>
						</div>
					</a>
			</li>
		</ul>

	</c:forEach>

	<div align="center" id="but" style=" padding:10px 10px 10px 10px;" onclick="ShowM();">
		<input type="button" value="点击加载更多..." style="width: 100%;height: 45px;" >
	</div>

	<script type="text/javascript">
		function ShowM(){
			self.location='morestatic?num=0';
		}
	</script>
</div>

</div>





<!--
  底部菜单
  -->
<div class="mui-bar mui-bar-tab">
	<div class="mui-tab-item ">
		<a class="mui-tab-item mui-active" id="shouye" >
			<span class="mui-icon iconfont icon-shouye-shouye"></span>
			<span class="mui-tab-label">首页</span>
		</a>
	</div>
	<script>
		var shouye = document.getElementById("shouye");
		shouye.addEventListener('tap',function(){
			location.href ='#' ;
		})
	</script>

	<%--个人身份登录--%>
	<c:if test="${loginUser.usertype == '个人' }">
		<div class="mui-tab-item mui-active" >
			<a  class="mui-tab-item " id="jianli" >
				<span  class="mui-icon iconfont icon-jianli"></span>
				<span class="mui-tab-label">简历</span>
			</a>
		</div>
		<script>
			var jianli = document.getElementById("jianli");
			jianli.addEventListener('tap',function(){
				location.href = '/myResume?userid=${userId}';
			})
		</script>
	</c:if>

	<%--企业身份登录--%>
	<c:if test="${loginUser.usertype == '企业' }">
		<div class="mui-tab-item mui-active" >
			<a  class="mui-tab-item " id="zhaoping" >
				<span  class="mui-icon iconfont icon-fabu"></span>
				<span class="mui-tab-label">发布</span>
			</a>
		</div>
		<script>
			var zhaoping = document.getElementById("zhaoping");
			zhaoping.addEventListener('tap',function(){
				location.href = '/showapply?userid=${userId}';
			})
		</script>
	</c:if>




	<div class="mui-tab-item mui-active" >
		<a class="mui-tab-item " id="wo" >
			<span class="mui-icon iconfont icon-gerenzhongxin"></span>
			<span class="mui-tab-label">我</span>
		</a>
	</div>

	<script>
		var wo = document.getElementById("wo");
		wo.addEventListener('tap',function(){
			location.href = '/weixininfo';
		})
	</script>


</div>
</body>
</html>