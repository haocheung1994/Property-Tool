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
基本信息表单位置

<form action="/basicInfoSub" name="" id="">
  真实姓名<input type="text" placeholder="真实姓名" name="personname" required >
  性别<input type="text" placeholder="性别" name="personsex" required >
  手机号<input type="text" placeholder="手机号" name="usertel" required >
  期望城市<input type="text" placeholder="期望城市" name="personcity" required >
  工作年限<input type="text" placeholder="工作年限" name="workyear" required >
  邮件<input type="text" placeholder="邮件" name="personemail" required >
  <input type="hidden" name="userid" value="${userId}" >
  <input type="hidden" name="openid" value="${oppen_id}">
  <input type="submit" value="完成">

</form>

</body>
</html>
