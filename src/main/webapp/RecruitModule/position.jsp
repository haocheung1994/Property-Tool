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
			<link href="/RecruitModule/iconfont/iconfont.css" type="text/css" rel="stylesheet" />
			<script src="/RecruitModule/js/jquery1.9.1.min.js"></script>
		</head>

		<body>
			<script src="/RecruitModule/js/mui.min.js"></script>
			<script type="text/javascript">
				mui.init()
			</script>

			<!--
				搜索框
			-->
			<div id="search" class="mui-search mui-active" style="background-color: rgb(71,155,241);">
				<input type="search" class="mui-input-clear" placeholder="搜索职位/公司">
			</div>
			<!--
				数据列表
			-->
			<div class="mui-content" style="padding-bottom: 50px;">
				<c:forEach var="recruit" items="${trecruitList}" >
			<ul class="mui-table-view" style="margin-top: 10px; margin-left: 10px; margin-right: 10px;">
				<link href="css/font.css" rel="stylesheet" />
				<li class="mui-table-view-cell mui-media">
					<a href="javascript:;">
						<div id="divcss5">
							<img class="mui-media-object mui-pull-left" src="img/test2.jpg">
						</div>
						<div class="mui-media-body">
						   <span2>${recruit.salary}</span2>
							<p class="mui-ellipsis"><span1>${recruit.jobname}</span1></p>
							<p class="mui-ellipsis"><span3>${recruit.tfirmuserInAcc.companyname}</span3></p>
							<span3 class="mui-active" style="margin-left: auto;">${recruit.workaddr}</span3>
							<span4 class="mui-active" >${recruit.pubtime}</span4>
						</div>
					</a>
				</li>
				</ul>
				</c:forEach>
			</div>


			<!--
              底部菜单
              -->
			<div class="mui-bar mui-bar-tab">
				<div class="mui-tab-item mui-active">
					<a class="mui-tab-item ">
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

				<div class="mui-tab-item " >
					<a class="mui-tab-item mui-active">
						<span id="zhiwei"class="mui-icon iconfont icon-zhiwei"></span>
						<span class="mui-tab-label">职位</span>
					</a>
				</div>
				<script>
					var zhiwei = document.getElementById("zhiwei");
					zhiwei.addEventListener('tap',function(){
						location.href = '/recruit';
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