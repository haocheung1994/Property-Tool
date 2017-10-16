<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/25
  Time: 19:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>搜索</title>
</head>
<body>
<form action="/searchJob" method="">
  <input type="text" placeholder="搜索职位/公司"  name="jobName" required >
  <input type="submit" value="搜索">
  <br>
  工作地点：<input type="text" placeholder="工作地点" name="workAddr" required >

</form>


</form>
</body>
</html>
