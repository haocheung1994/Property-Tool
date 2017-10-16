<%--
  Created by IntelliJ IDEA.
  User: LC
  Date: 2017/5/24
  Time: 15:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title></title>
</head>
<body style="text-align: center;margin: 0 auto">
<div>头像：<img src="${headimgurl}"></div>
<div>微信openid：${openid}</div>
<div>昵称：${nickname}</div>
<div>所在地：${country}${province}${city}</div>
<div>性别：${sex}</div>
</body>
</html>
