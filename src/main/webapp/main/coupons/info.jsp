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
		供应商 <span class="c-gray en">&gt;</span>  <a
			class="btn btn-success radius r mr-20"
			style="line-height: 1.6em; margin-top: 3px"
			href="javascript:location.replace(location.href);" title="刷新"><i
			class="Hui-iconfont">&#xe68f;</i></a>
	</nav>
	<br><br><br><br>

	<div class="pd-20" style="width: 80%">
		<form id="myform" method="post" action="">
			<input type="hidden" value="${list.supplierid}" id="supplierid">
			<div class="row cl">
						<label class="form-label col-2">名称：</label>
						<div class="formControls col-10">
							<input type="text" id="suppliername"
								placeholder="请填写名称" value="${list.suppliername}" class="input-text" style="width: 80%">
						</div>
			</div><br>
				<div class="row cl">
						<label class="form-label col-2">电话：</label>
						<div class="formControls col-10">
							<input type="text" id="suptel"
								placeholder="联系方式" value="${list.suptel}" class="input-text" style="width: 80%">
						</div>
			</div><br>
					<div class="row cl">
			
						<label class="form-label col-2">地址：</label>
						<div class="formControls col-10">
							<input type="text" id="supaddress"
								placeholder="地址" value="${list.supaddress}" class="input-text" style="width: 80%">
						</div>
			</div>
		<br>
		<div class="row cl">

			<label class="form-label col-2">城市：</label>
			<div class="formControls col-10">
				<input type="text" id="supcity"  placeholder="城市" value="${list.supcity}" class="input-text" style="width: 80%">
			</div>
		</div>

		<br>
		<div class="row cl">

			<label class="form-label col-2">入驻信息：</label>
			<div class="formControls col-10">
				<input type="text" id="policyinfo"
					   placeholder="入驻信息" value="${list.policyinfo}" class="input-text" style="width: 80%;">
			</div>
		</div>

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
		/*document.getElementById("myform").submit();*/
		$.ajax({
			url:'/main/supUpdate.html',
			type:'post',
			dataType:"text",
			data: {
				"supplierid": $("#supplierid").val(),
				"suppliername": $("#suppliername").val(),
				"policyinfo": $("#policyinfo").val(),
				"suptel": $("#suptel").val(),
				"supaddress": $("#supaddress").val(),
				"supcity": $("#supcity").val(),
				success: function () {

				}}
			})
		alert("成功！")
		window.location.href = document.referrer;

	}
	function upload() {

		var fp = document.getElementById("file").value;
		//为了避免转义反斜杠出问题，这里将对其进行转换

		var re = /(\\+)/g;
		var fn = fp.replace(re, "#");
		//对路径字符串进行剪切截取
		var one = fn.split("#");
		//获取数组中最后一个，即文件名
		var two = one[one.length - 1];
		//再对文件名进行截取，以取得后缀名
		var three = two.split(".");
		//获取截取的最后一个字符串，即为后缀名
		var last = three[three.length - 1];
		last = last.toLowerCase();

		if (last != 'png' && last != 'jpg' && last != 'gif'
				&& last != 'PNG' && last != 'JPG' && last != 'GIF') {
			alert("请上传png、jpg或者gif文件！");
			return;
		}
		$.ajaxFileUpload({
					url : 'upload.html', //需要链接到服务器地址  
					secureuri : false,
					fileElementId : "file", //文件选择框的id属性  
					dataType : 'text', //服务器返回的格式，可以是json  
					success : function(rs) //相当于java中try语句块的用法  
					{	
						if (rs != "") {
							$('#img').html("");
							$('#img').append("<img src='"+rs+"' width='100' height='100'>");
							$('#filepath').val(rs);
						} else {
							alert('失败');
							//document.getElementById("msg"+m[1]).value="失败"; 
						}
					},
					error : function(data, status, e) //相当于java中catch语句块的用法  
					{alert('失败');
						
					}
				});
	}

	</script>	
	
</body>
</html>