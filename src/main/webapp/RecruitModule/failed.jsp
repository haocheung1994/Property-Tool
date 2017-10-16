<%--
  Created by IntelliJ IDEA.
  User: lc
  Date: 2017/6/24
  Time: 15:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>失败</title>
  <script language="javascript">
    var secs = 3; //倒计时的秒数
    var URL ;
    function Load(url){
      URL = url;
      for(var i=secs;i>=0;i--)
      {
        window.setTimeout('doUpdate(' + i + ')', (secs-i) * 1000);
      }
    }
    function doUpdate(num)
    {
      document.getElementById('ShowDiv').innerHTML = '将在'+num+'秒后自动跳转到首页' ;
      if(num == 0) { window.location = URL; }
    }
  </script>
</head>
<body onload="Load('/recruitModule')">
<div>
  <div align="center"style="margin-top: 20%">
<div align="center">

  <img src="/RecruitModule/images/failed.png"style="max-width:50%;"></div>
<div style="color: #4d525d;font-size: 20px" >您的投递已经发出了，请勿重复申请哦！<br>

    <div id="ShowDiv"></div>
  </div>
</div>
</div>

</body>
</html>
