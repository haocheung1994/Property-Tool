  <%--
    Created by IntelliJ IDEA.
    User: Administrator
    Date: 2017/5/27
    Time: 9:51
    To change this template use File | Settings | File Templates.
  --%>
  <%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <html>
  <head>
      <title>职务详情页</title>
  </head>
  <body>
  <b>工作名称：</b>${trecruit.jobname}  <br>
  <b>工资：</b>${trecruit.salary}/月<br>
  <b>工作类型：</b>${trecruit.worktype} <br>
  <b>职位诱惑：</b>${trecruit.welfare}  <br>
  <b>工作地址：</b>${trecruit.workaddr} <br>
  <b>学历要求：</b>${trecruit.edureq}<br>
  <b>工作经验要求：</b>${trecruit.workreq} <br>
  <b>工作描述：</b>${trecruit.jobdescribe}<br>
  <b>发布时间：</b>${trecruit.pubtime}</b><br>
  <form action="/applyjob" method="post">
    <input type="submit" value="立即申请(需个人登录)">
    <input type="hidden" value="${userId}" name="userId">
    <input type="hidden" value="${trecruit.companyid}" name="companyid">
    <input type="hidden" value="${trecruit.recruitid}" name="recruitId">
  </form>
  </body>
  </html>