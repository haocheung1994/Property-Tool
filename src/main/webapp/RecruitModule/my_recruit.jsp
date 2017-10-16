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
	<h1 class="mui-title">发布招聘</h1>
</header>


<!--
            数据列表
        -->
<div class="mui-content" style="padding-bottom: 50px;margin-top: 5px;">
	<c:forEach var="recruit" items="${recruitList}" >
	<div>
		<ul class="mui-table-view" style="margin-top: 10px; margin-left: 10px; margin-right: 10px;">
			<li>
				<p class="mui-icon iconfont icon-bianji mui-icon-left-nav mui-pull-right" style="font-family: '微软雅黑'; margin-right: 10px;margin-top: 10px;">
					<a href="/editRecruit?recruitid=${recruit.recruitid}">编辑</a></p>
			</li>
			<link href="css/font.css" rel="stylesheet" />
			<li class="mui-table-view-cell mui-media">
				<a href="javascript:;">
					<div id="divcss5">
						<img class="mui-media-object mui-pull-left" src="/RecruitModule/img/job.jpg">
					</div>
					<div class="mui-media-body">
						<span2>${recruit.salary}</span2>
						<p class="mui-ellipsis"><span1>${recruit.jobname}</span1></p>
						<p class="mui-ellipsis"><span3>${recruit.tfirmuserInAcc.companyname}</span3></p>
						<span3 class="mui-active" style="margin-left: auto;">${recruit.workaddr}</span3>
						<span4 class="mui-active" >${recruit.pubtimeStr}</span4>
					</div>
				</a>
			</li>
		</ul>
		</c:forEach>
	</div>



	<div style="margin-bottom: 20px;margin-top: 20px ">
		<a  href="/addRecruit">
			<ul class="mui-table-view" style="margin-left: 10px;margin-right: 10px;margin-bottom: 10px;">
				<input type="submit" class="mui-btn mui-btn-blue mui-btn-block" value="发布新职位">
			</ul>
		</a>
	</div>
</div>
<!--
  底部菜单
  -->
<div style="margin-top: 10px" class="mui-bar mui-bar-tab">
	<div class="mui-tab-item mui-active">
		<a class="mui-tab-item " id="shouye" >
			<span class="mui-icon iconfont icon-shouye-shouye"></span>
			<span class="mui-tab-label">首页</span>
		</a>
	</div>
	<script>
		var shouye = document.getElementById("shouye");
		shouye.addEventListener('tap',function(){
			location.href ='/recruitModule' ;
		})
	</script>

	<%--个人身份登录--%>
	<c:if test="${loginUser.usertype == '个人' }">
		<div class="mui-tab-item " >
			<a  class="mui-tab-item mui-active" id="jianli" >
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
		<div class="mui-tab-item " >
			<a  class="mui-tab-item mui-active " id="zhaoping" >
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