  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%--
    Created by IntelliJ IDEA.
    User: Administrator
    Date: 2017/5/25
    Time: 9:52
    To change this template use File | Settings | File Templates.
  --%>
  <%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <html>
  <head>
      <title>我的招聘</title>
  </head>
  <body>
  <a href="/index">首页</a><br>
  <c:forEach var="recruit" items="${recruitList}" > <%--step="" begin="" end=""--%>
  ${recruit.jobname} ${recruit.salary}<br>
    ${recruit.tfirmuserInAcc.companyname} ${recruit.workaddr}
    <a href="/applylist?recruitid=${recruit.recruitid}"><div style="float: right"><button>查看投递状况</button></div></a>
    <div style="float: right">发布时间：${recruit.pubtime}</div>
    <br><hr>
  </c:forEach>
  </body>
  </html>
