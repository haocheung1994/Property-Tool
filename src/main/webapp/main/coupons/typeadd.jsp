<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		供应商类型 <span class="c-gray en">&gt;</span>添加供应商类型<span class="c-gray en">&gt;</span>
	</nav>
	<br><br><br><br>
	<br class="pd-20" style="width: 80%">
			
			<div class="row cl"style="margin-left: 50px">

				<form action="/main/addsuptype.html" method="post" id="myForm">
						<div class="formControls col-10">
							新供应商类型：&nbsp;&nbsp;&nbsp;
							<input type="text" name="suptypename"placeholder="填写新的供应商类型" value="" class="input-text" style="width: 80%">

						</div>
			</div><br>

				<div class="col-10 col-offset-2">

						<button onClick="submitForm()" id="butt"
						class="btn btn-primary radius" type="button">
						<i class="Hui-iconfont">&#xe632;</i> 添加
					</button>
					<button onClick="history.go(-1);" class="btn btn-default radius"
						type="button">&nbsp;&nbsp;返回&nbsp;&nbsp;</button>
				</div>
			</div>
	<script type="text/javascript">
		function validate() {
			if (confirm("确认提交?")) {
				return true;
			} else {
				return false;
			}
		}

		function submitForm() {
			if (validate()) {
				document.getElementById("myForm").submit();
				alert("已插入");
			}
		}
	</script>	
	
</body>
</html>