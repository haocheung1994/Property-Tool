<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<script type="text/javascript" src="lib/PIE_IE678.js"></script>
<![endif]-->
<link href="css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="css/H-ui.admin.css" rel="stylesheet"
	type="text/css" />
<link href="lib/icheck/icheck.css" rel="stylesheet"
	type="text/css" />
<link href="lib/Hui-iconfont/1.0.1/iconfont.css"

	rel="stylesheet" type="text/css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<script src="js/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="lib/My97DatePicker/WdatePicker.js"></script> 
<title>基本设置</title>

</head>
<body>
	<nav class="breadcrumb">
		<i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span>
		供应商类型 <span class="c-gray en">&gt;</span>  <a
			class="btn btn-success radius r mr-20"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="Hui-iconfont">&#xe68f;</i></a>
	</nav>
	<br><br><br><br>

	<div class="pd-20" style="width: 80%">
		<form id="myform" method="post" action="">
			<div class="row cl">
						<label class="form-label col-2">ID：</label>
						<div class="formControls col-10">
								 ${list.suptype}
							<input type="hidden" value="${list.suptype}" id="suptype">
						</div>
			</div><br>
				<div class="row cl">
						<label class="form-label col-2">类型名：</label>
						<div class="formControls col-10">
							<input type="text" id="suptypename"
								placeholder="联系方式" value="${list.suptypename}" class="input-text" style="width: 80%">
						</div>
			</div><br>
					<br><br>
				<div class="col-10 col-offset-2">
				
						<input onClick="add()" value="提交"
						class="btn btn-primary radius" type="submit">
						<%--<i class="Hui-iconfont">&#xe632;</i>--%>

					<button onClick="history.go(-1);" class="btn btn-default radius"
						type="button">&nbsp;&nbsp;返回&nbsp;&nbsp;</button>
				</div>
			</form></div>
	<script type="text/javascript">
		function add(){
			$.ajax({
				url:'/main/suptypeUpdate.html',
				type:'post',
				dataType:"text",
				data: {
					"suptype": $("#suptype").val(),
					"suptypename": $("#suptypename").val(),
					success: function () {

					}}
			})
			alert("成功！")
			window.location.href = document.referrer;

		}
		</script>


	
</body>
</html>