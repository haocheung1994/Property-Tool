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
		<link href="/PlaceModule/css/mui.min.css" rel="stylesheet" />
	<!-- 	<link rel="stylesheet" type="text/css" href="../css/app.css" /> -->
	</head>

	<body>
		<header class="mui-bar mui-bar-nav" style="background-color: rgb(71,155,241);">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left" style="color: white;"></a>
			<h1 class="mui-title" style="color: white;">土地详情</h1>
		</header>
		<div class="mui-content">
			<div class="mui-card">
				<div class="mui-card-content">
					<div class="mui-card-content-inner">
						<h4>${placeinfo.bianhao}</h4>
						<h6>${placeinfo.region}省>${placeinfo.place}市</h6>
						<h6 style="float:left;">${placeinfo.locationwz}</h6>
						<table style="border:1px solid red;margin-left: 80%;">
							<tr>
								<th>
									<h6 style="color: red;">${placeinfo.dealstate}</h6></th>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class="mui-card">
				<div class="mui-card-content">
					<div class="mui-card-content-inner">
						<h5>土地基本信息</h5><br />
						<h6>总面积：${placeinfo.totalarea}</h6>
						<h6>建设用地面积：${placeinfo.consplace }</h6>
						<h6>规划建筑面积：${placeinfo.propalce }</h6>
						<h6>容积率：${placeinfo.plotratiolv }</h6>
						<h6>建筑密度：${placeinfo.buildmd }</h6>
						<h6>商业比例：${placeinfo.businesslv }</h6>
						<h6>出让年限：${placeinfo.tosellnx }</h6>
						<h6>位置：${placeinfo.locationwz }</h6>
						<h6>四至：${placeinfo.placess }</h6>
						<h6>规划用途：${placeinfo.planyt }</h6>
					</div>
				</div>
			</div>
			<div class="mui-card">
				<div class="mui-card-content">
					<div class="mui-card-content-inner">
						<h5>土地交易信息</h5><br />
						<h6>竞得方：${placeinfo.viejdf }</h6>
						<h6>交易状况：${placeinfo.dealstate }</h6>
						<h6>最小加价幅度：${placeinfo.zxjjfdmoney }</h6>
						<h6>起始日期：${placeinfo.qsritime }</h6>
						<h6>截止日期：${placeinfo.jzrqtime }</h6>
						<h6>成交日期：${placeinfo.cjrqtime }</h6>
						<h6>起始价：${placeinfo.qsjmoney }</h6>
						<h6>成交价：${placeinfo.cjjmoney }</h6>
						<h6>资讯电话：${placeinfo.zxdhphone }</h6>
					</div>
				</div>
			</div>
		</div>
		<script src="js/mui.min.js"></script>
		<script type="text/javascript">
			mui.init()
		</script>
	</body>

</html>
