<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/27
  Time: 15:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>所有申请</title>
</head>
<body>
<c:forEach var="var" items="${itemapplylist}" > <%--step="" begin="" end=""--%>
  姓名：${var.tinduserInAcc.personname} 性别：${var.tinduserInAcc.personsex}<br>
  期望城市：${var.tinduserInAcc.personcity} 期望工资：${var.tinduserInAcc.expectsalary}
  <a href=""><div style="float: right"><button>查看简历</button></div></a>
  <div style="float: right">投递时间：${var.applytime}</div>
  personid:${var.tinduserInAcc.personid}
  <br><hr>
</c:forEach>
</body>
</html>
