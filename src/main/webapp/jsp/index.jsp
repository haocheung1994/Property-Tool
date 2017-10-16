<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>首页</title>
    <style>
        A {text-decoration: NONE}
    </style>
</head>
<body class="backgdcolor" onload="checkForm()">
<div align="center">
    <div align="center">
        <img src="/index/img/wel.png">
        <h2>服务已启用!</h2>

    </div>
    <%--<input type="hidden" name="message" value="<%=request.getAttribute("message") %>">

    <script type="text/JavaScript">
        function checkForm(){
            var flag=true;
            var message=form1.message.value;
            if(message!='null'){
                alert(message);
                flag=false;
            }
            return flag;
        }

    </script>--%>

    <%--<a href="/goregister">注册</a>
    <a href="/gologin">登录</a>--%>
    <br><br>

<%--    <a href="/indexpage">ceshi</a><br><br>--%>



</div>
</body>
</html>