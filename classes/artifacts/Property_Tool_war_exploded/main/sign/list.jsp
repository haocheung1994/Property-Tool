<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,member-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<script type="text/javascript" src="lib/PIE_IE678.js"></script>
<![endif]-->

<link rel="stylesheet" href="css/person.css">
<link href="css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="css/H-ui.admin.css" rel="stylesheet" type="text/css" />
<link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet"
	type="text/css" />
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>意见反馈</title>
</head>
<body>
	<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
		网站流量统计 <a class="btn btn-success radius r mr-20"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="Hui-iconfont">&#xe68f;</i></a>
	</nav>
	<div class="pd-20">
		<div class="cl pd-5 bg-1 bk-gray mt-20" >
			<span class="l">

				网站流量数据(累计值)
			</span>
			
		</div>

		
		<div class="mt-20">
			<table
				class="table table-border table-bordered table-hover table-bg table-sort">
				<thead>
					<tr class="text-c">
						<th width="25px"><input type="checkbox" name="" value=""></th>
						<th width="50px">序号</th>
						<th width="15%">求职招聘模块</th>
						<th width="15%">“我要求职”</th>
						<th width="15%">“我要招聘”</th>
						<th width="10%">其他</th>
						<th width="20%">其他</th>
						<th width="15%">操作</th>
					</tr>
				</thead>
				<tbody>

						<tr class="text-c">
							<td><input type="checkbox" value="1" name=""></td>
							<td>${traffic.signid}</td>
							<td>${traffic.mark1}</td>
							<td>${traffic.mark2}</td>
							<td>${traffic.mark3}</td>
							<td>${traffic.mark4}</td>
							<td>${traffic.mark5}</td>
							<td>
							<a onclick="del()">清空数据</a>
						</td>
						</tr>


				</tbody>

			</table>
			<script type="text/javascript">
				function del(){
					var  b = confirm('清空不可恢复，是否继续？');
					if(!b){
						return ;
					}$.ajax({
						url:'cleartraffic.html',
						type:'post',
						data:'sup_id='+1,
						success:function(){

						}
					})
					alert("成功！");
					location.reload();}
				</script>
			<%--<div class="panel-foot text-center">
				<ul class="pagination">
					<li><a href="javascript:;">共${total}条</a></li>
				</ul>--%>
				<%--<ul class="pagination">
					<li><a href="javascript:;">当前第${currentPage}页</a></li>
				</ul>

				<ul class="pagination">
					<li><a href="javascript:;" onclick="fpage()">首页</a></li>
				</ul>
				<ul class="pagination">
					<li><a href="javascript:;" onclick="upPage()">上一页</a></li>
				</ul>

				<ul class="pagination">
					<li><a href="javascript:;" onclick="downPage()">下一页</a></li>
				</ul>
				<ul class="pagination">
					<li><a href="javascript:;" onclick="epage()">末页</a></li>
				</ul>--%>
				<%--<ul class="pagination" style="width:4%;">
					<li><input type="tel" class="input-text" id="seastr" > </li>
				</ul>
				<ul class="pagination">
					<li> <a href="javascript:;" onclick="spage()">go</a></li>
				</ul>--%>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
	<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
	<script type="text/javascript" src="lib/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="js/H-ui.js"></script>
	<script type="text/javascript" src="js/H-ui.admin.js"></script>
</body>
</html>