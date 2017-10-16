<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/26
  Time: 10:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>补全基本信息</title>
</head>
<body>
企业上传基本信息表单位置
<form action="/firmInfoSub" name="" id="">

  企业名称<input type="text" placeholder="企业名称" name="companyname" required >
  企业电话<input type="text" placeholder="企业电话" name="companytel" required >
  企业地址<input type="text" placeholder="企业地址" name="companyaddr" required >
  企业邮箱<input type="text" placeholder="企业邮箱" name="companyemail" required >
  企业简介<input type="text" placeholder="企业简介" name="companyinf" required >

  <input type="hidden" name="userid" value="${userId}" >
  <input type="hidden" name="openid" value="${oppen_id}">
  <input type="submit" value="完成">

</form>
</body>
</html>
