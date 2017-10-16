<%--
  Created by IntelliJ IDEA.
  User: htt
  Date: 2017/5/27
  Time: 11:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<form action="/workExpSub" name="" id="">
  公司名称<input type="text" placeholder="公司名称" name="companyname" required >
  职位名称<input type="text" placeholder="职位名称" name="jobname" required >
  入职时间<input type="text" placeholder="入职时间" name="starttime" required >
  离职时间<input type="text" placeholder="离职时间" name="endtime" required >
  工作内容<input type="text" placeholder="工作内容" name="workduty" required >
  <input type="hidden" name="userid" value="${userId}" >
  <input type="submit" value="完成">
</form>
</body>
</html>
