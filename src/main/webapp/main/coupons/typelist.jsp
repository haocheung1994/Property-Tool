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
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
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
		供应商类型 <a class="btn btn-success radius r mr-20"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="Hui-iconfont">&#xe68f;</i></a>
	</nav>
	<div class="pd-20">
		<div class="cl pd-5 bg-1 bk-gray mt-20">
			<span class="l"> <a href="/main/typeAdd"
				class="btn btn-primary radius"> <i class="Hui-iconfont">&#xe600;</i>
					添加记录
			</a></span>
			
		</div>

		
		<div class="mt-20">
			<table
				class="table table-border table-bordered table-hover table-bg table-sort">
				<thead>
					<tr class="text-c">
						<th width="25px"><input type="checkbox" name="" value=""></th>
						<th width="50px">ID</th>
						<th width="80px">类型</th>
						<th width="80px">操作</th>
						</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${tsuptypes}" var="list"   >
						<tr class="text-c">
							<td><input type="checkbox" value="1" name=""></td>
							<td>${list.suptype}</td>
							<td>${list.suptypename}</td>
							<td>
								<a href="suptypeedit.html?suptype=${list.suptype}">编辑</a>&nbsp;&nbsp;
								<a href="javascript:;" onclick="del('${list.suptype}');">删除</a></td>
							<%--<a href="">编辑</a>&nbsp;&nbsp;
							<a href="javascript:;" onclick="del('${list.supplierid}')">删除</a>--%>
						</tr>
					</c:forEach>

				</tbody>

			</table>
			<div class="panel-foot text-center">
				<ul class="pagination">
					<li><a href="javascript:;">共${typesize}条</a></li>
				</ul>
				<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
				<script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
				<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
				<script type="text/javascript" src="lib/My97DatePicker/WdatePicker.js"></script>
				<script type="text/javascript" src="js/H-ui.js"></script>
				<script type="text/javascript" src="js/H-ui.admin.js"></script>
				<script type="text/javascript">
					function del(suptype){
							var  b = confirm('确定删除？');
							if(!b){
								return ;
							}
						$.ajax({
							url:'deletesuptype.html',
							type:'post',
							data:'suptype='+suptype,
							success:function(){
							}
						})
							alert("成功！");
							location.reload();
						}
				</script>
			</div>
		</div>
	</div>

</body>

</html>