
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/24
  Time: 16:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  <html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>登录</title>
  </head>
  <body>

  <div align="center">
    <c:if test="${userTel==null||userTel==''}">
      <b style="color: red">[未登录]</b>
    </c:if>
    <a href="/index">首页</a>
      <c:if test="${userTel != null}">
        <b style="color: red">欢迎您，${userTel}</b>
        <a href="<%=request.getContextPath()%>/userexit" >[退出]</a>
        <a href="<%=request.getContextPath()%>/resume" >[个人简历]</a>
      </c:if><br><br>

  <form action="/login" name="" id="">
    手机号<input type="text" placeholder="手机号" name="usertel" required >
    密码<input type="text" placeholder="密码" name="userpwd" required >
    <input type="submit" value="登录">



  </form>



</div>
  </body>
  </html>
