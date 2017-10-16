<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/31
  Time: 16:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title></title>
		<script src="/PlaceModule/js/mui.min.js"></script>
	<!-- 	<link href="css/iconfont.css" rel="stylesheet" /> -->
		<script src="/PlaceModule/js/jquery1.9.1.min.js"></script>
		<link href="/PlaceModule/css/mui.min.css" rel="stylesheet" />
		<script type="text/javascript" charset="utf-8">
			mui.init();
		</script>
	</head>

	<body>
		<header class="mui-bar mui-bar-nav" style="background-color: rgb(71,155,241);">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left" style="color: white;"></a>
			<h1 class="mui-title" style="color: white;">土地列表</h1>
		</header>
		<div class="mui-content">
			<div style="padding: 10px 10px;">
				<div id="segmentedControl" class="mui-segmented-control mui-segmented-control-inverted ">
					<a id="quyu" class="mui-control-item" href="#item1">
						区域
					</a>
					<a id="yongtu" class="mui-control-item" href="#item2">
						用途
					</a>
				</div>
			</div>
			<div id="item1" class="mui-control-content">
				<ul class="mui-table-view">
					<c:forEach var="citycode" items="${citycode}" >
					<li class="mui-table-view-cell" value="${citycode.id}">
						${citycode.cname}
					</li>
					</c:forEach>
				</ul>
			</div>
			<div id="item2" class="mui-control-content">
				<ul class="mui-table-view">
					<li class="mui-table-view-cell"  value="1" >
						住宅用地
					</li>
					<li class="mui-table-view-cell"  value="2">
						商业用地
					</li>
				</ul>
			</div>
			
			<div class="mui-scroll" style="position: absolute;">
				<ul id="ul1" class="mui-table-view">
					<c:forEach items="${placelist}" var="p">
					<a style="color: black;" href="/placeDetais?id=${p.id}">
						<li id="list" class="mui-table-view-cell">
							<h4>${p.locationwz }</h4>
							<h6 style="float: left;">${p.totalarea}</h6>
							<c:if test="${p.ptext==1}">
							<h6 style="float: left;margin-left: 20%;">住宅用地</h6>
							</c:if>
							<c:if test="${p.ptext==2}">
							<h6 style="float: left;margin-left: 20%;">商业用地</h6>
							</c:if>
							<h6 style="float: left;padding-left: 20%;">${p.tosellxs}</h6><br/>
							<h6>${p.region}省>${p.place}市</h6>
							<table style="border:1px solid red;margin-left: 0%;float:left;">
								<tr>
									<th>
										<h6 style="color: red;">${p.dealstate}</h6>
									</th>
								</tr>
							</table>
							<h6 style="color:red;margin-left: 60%">推出：${p.jzrqtime}</h6>
						</li>
					</a>
					</c:forEach>
				</ul>
			</div>
		</div>
		<script type="text/javascript" charset="utf-8">
			$(function() {
				$("#quyu").click(function() {
					$(this).text($("#item1").is(":hidden") ? "区域" : "区域");
					$("#item1").toggle();
					$("#item2").hide();
				});
			});
			$(function() {
				$("#yongtu").click(function() {
					$(this).text($("#item2").is(":hidden") ? "用途" : "用途");
					$("#item1").hide();
					$("#item2").toggle();
				});
			});
		</script>

		<script type="text/javascript">
			var num = $("#ul1").children("li");
			for(var i = 0, len = num.length; i < len; i++) {
				var li = document.createElement('li');
				li.id = i;
				li.className = 'mui-table-view-cell';
				li.innerHTML = '<a class="mui-navigate-right">' + num[i].ADDRESS + '</a>';
				table.appendChild(li);

			}

			mui('#list').on('tap', 'li', function() {
				alert(123);
				mui.toast(this.id);
				var log = num[this.id];
				mui.openWindow({
					url: 'tudiDetails.html',
					id: 'tudiDetails',
					extras: {
						log: log
					}
				});
			});
		</script>

		<script type="text/javascript">
			mui.init();
			mui.plusReady(function() {
				document.getElementById(ul1).addEventListener('tap',
					function() {
						var li = this.querySelector('li');
						mui.toast(li.innerHTML.toString());
					}
				);
			});
			//数据交互
			$(function(){
				/* var a= $("#item2 li").length; */
				$("#item2 li").click(function(){
					$.ajax({
						url:"/placeModule",
						type:"post",
						data:"ptext="+$(this).val(),
						async:false,
						success:function(data){
							$(document.body).html(data); 
						}
					})
				});
			})


			$(function(){
				/* var a= $("#item2 li").length; */
				$("#item1 li").click(function(){
					$.ajax({
						url:"/placeModule",
						type:"post",
						data:"place="+$(this).val(),
						async:false,
						success:function(data){
							$(document.body).html(data);
						}
					})
				});
			})


		</script>

	</body>

</html>
