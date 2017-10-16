  <%--
    Created by IntelliJ IDEA.
    User: Administrator
    Date: 2017/5/24
    Time: 15:22
    To change this template use File | Settings | File Templates.
  --%>
  <%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <html>
  <head>
      <title>注册</title>
    <script type="text/javascript" src="/jquery.min.js"></script>
  </head>

  <body>

  <div align="center">
    <div align="center">注册</div>
    <a href="/index">首页</a>
  <form action="/register" name="" id="">
    手机号<input type="text" placeholder="手机号" name="usertel" required >
    密码<input type="text" placeholder="密码" name="userpwd" required >
    <div align="center">注册类型
    <input  type="radio" name="usertype" value="0" checked="checked" />我找工作
    <input  type="radio" name="usertype" value="1" />我要招人
     </div>
    <input type="submit" value="注册">

  </form>

</div>
  </body>
  </html>
