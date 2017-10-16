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
<script type="text/javascript" src="lib/My97DatePicker/WdatePicker.js"></script> 
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>意见反馈</title>
</head>
<body>
	<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
		土地中标信息 <a class="btn btn-success radius r mr-20"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="Hui-iconfont">&#xe68f;</i></a>
	</nav><br>
	<div class="text-c">
				<%--<input type="text" value="${realname}"
					id="realname"  class="input-text"
					style="width: 50%;" placeholder="请输入微信昵称"> 
				<button type="button" onclick="search()"
					class="btn btn-success radius" id="b1" name="">
					<i class="Hui-iconfont">&#xe665;</i> 查询
				</button>--%>
				
			<%--<script type="text/javascript">
				function search() {
					var realname =$('#realname').val();
					
					window.location.href = 'userList.html?realname=' +realname;
				}
			</script>--%>
		<b>土地中标信息</b>
		</div>
	<div class="pd-20">
		<div class="mt-20">

			<table
				class="table table-border table-bordered table-hover table-bg table-sort">
				<thead>
					<tr class="text-c">
						<th width="20%">编号</th>
						<th width="10%">省市(区)</th>
						<th width="20%">土地位置</th>
						<th width="10%">交易状态</th>
						<th width="20%">竞得方</th>
						<th width="20px">总面积</th>
						<th width="20px">规划建筑面积</th>
						<th width="10px">操作</th>

						<%--<th width="20%">自提点</th>
						<th width="15%">会员卡时效</th>--%>
						<%--<th width="15%">操作</th>--%>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${placeInfo}" var="list">
						<tr class="text-c">
							<td>${list.bianhao}</td>
							<td>${list.region}/${list.place} </td>
							<td>${list.locationwz}</td>
							<td>${list.dealstate}</td>
							<td>${list.viejdf}</td>
							<td>${list.propalce}</td>
							<td>${list.consplace}</td>
							<td>
								<a href="javascript:;" onclick="del('${list.id}')">删除</a>
							</td>
							</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
			<div class="panel-foot text-center">
				<ul class="pagination">
					<li><a><c:out value="共 ${size} 条"></c:out> </a></li>
				</ul>
				<ul class="pagination">
					<li><a >当前第 <b>${ currentPage }</b> 页</a></li>
				</ul>

				<ul class="pagination">
					<li><a href="placeInfo.html?statu=1">首页</a></li>
				</ul>
				<c:if test="${currentPage>1}">
				<ul class="pagination">
					<li><a  href="placeInfo.html?statu=3">上一页</a></li>
				</ul>
				</c:if>
				<c:if test="${result<0}">
				<ul class="pagination">
					<li><a href="placeInfo.html?statu=2">下一页</a></li>
				</ul>
				</c:if>
				<ul class="pagination">
					<li><a href="placeInfo.html?statu=4">末页</a></li>
				</ul>

				<ul class="pagination" style="width:4%;">
					<li><input type="tel" class="input-text" id="seastr" > </li>
				</ul>
				<ul class="pagination">
					<li> <a href="javascript:;" onclick="spage()">go</a></li>
				</ul>

			</div><br>

			<br>
		</div>
	</div>
	<script type="text/javascript">
		function del(sup_id){
			var  b = confirm('确定删除？');
			if(!b){
				return ;
			}
			$.ajax({
				url:'/main/deletepalce.html',
				type:'post',
				data:'id='+sup_id,
				success:function(){

				}
			})
			alert("成功！");
			location.reload();
		}
	function spage() {
		var seastr =$('#seastr').val();
		window.location.href = 'placeInfo.html?jumppage=' + seastr+'&statu=0';
		return;
	}


	</script>
	
	<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
	<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
	<script type="text/javascript" src="lib/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="js/H-ui.js"></script>
	<script type="text/javascript" src="js/H-ui.admin.js"></script>
	<script type="text/javascript">
		$(function() {
			$('.table-sort').dataTable({
				"aaSorting" : [ [ 1, "desc" ] ],//默认第几个排序
				"bStateSave" : true,//状态保存
				"aoColumnDefs" : [
				//{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
				{
					"orderable" : false,
					"aTargets" : [ 0, 2, 4 ]
				} // 制定列不参与排序
				]
			});
			$('.table-sort tbody').on('click', 'tr', function() {
				if ($(this).hasClass('selected')) {
					$(this).removeClass('selected');
				} else {
					table.$('tr.selected').removeClass('selected');
					$(this).addClass('selected');
				}
			});
		});
	</script>
</body>
</html>