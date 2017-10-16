<%--
  Created by IntelliJ IDEA.
  User: htt
  Date: 2017/5/27
  Time: 15:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<form action="/eduExpSub" name="" id="">
  学校名称<input type="text" placeholder="学校名称" name="eduschoolname" required >
  所学专业<input type="text" placeholder="所学专业" name="edumajor" required >
  毕业时间<input type="text" placeholder="毕业年份" name="graduationtime" required >
  学历<input type="text" placeholder="学历" name="degree" required >
  <input type="hidden" name="userid" value="${userId}" >
  <input type="submit" value="完成">
</form>
</body>
</html>
