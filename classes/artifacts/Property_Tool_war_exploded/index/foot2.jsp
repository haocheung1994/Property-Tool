<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lc
  Date: 2017/6/26
  Time: 15:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>

<link href="/index/css/home.mui.min.css" rel="stylesheet" />
<link href="/index/css/index1.css" rel="stylesheet" />

<script type="text/javascript" src="/index/js/mui.js" ></script>
<script src="/index/iconfont/iconfont.js"></script>
<div class="mui-bar mui-bar-tab" >
  <div class="mui-tab-item mui-active">
    <a class="mui-tab-item "id="shouye">
      <span class="mui-icon mui-icon-home"></span>
      <span class="mui-tab-label">首页</span>
    </a>
  </div>
  <script>
    var shouye = document.getElementById("shouye");
    shouye.addEventListener('tap',function(){
      location.href ='/indexpage' ;
    })
  </script>

  <c:if test="${loginUser.usertype =='个人'}">
  <div class="mui-tab-item mui-active" >
    <a  class="mui-tab-item " id="jianli">
      <span class="mui-icon mui-icon-jianli"></span>
      <span class="mui-tab-label">简历</span>
    </a>
  </div>
  <script>
    var jianli = document.getElementById("jianli");
    jianli.addEventListener('tap',function(){
      if(${userId==null}){location.href = '/error';}
      else{
        location.href = '/myResume?userid=${userId}';
      }
    })
  </script>
  </c:if>
  <c:if test="${loginUser.usertype =='企业'}">
    <div class="mui-tab-item mui-active" >
      <a  class="mui-tab-item " id="jianli">
        <span class="mui-icon mui-icon-jianli"></span>
        <span class="mui-tab-label">简历</span>
      </a>
    </div>
    <script>
      var jianli = document.getElementById("jianli");
      jianli.addEventListener('tap',function(){
        if(${userId==null}){location.href = '/error';}
        else{
          location.href = '/jumpallresume';
        }
      })
    </script>
  </c:if>
  <c:if test="${loginUser.usertype ==''||loginUser.usertype == null}">
    <div class="mui-tab-item mui-activ" >
      <a  class="mui-tab-item e" id="jianli">
        <span class="mui-icon mui-icon-jianli"></span>
        <span class="mui-tab-label">简历</span>
      </a>
    </div>
    <script>
      var jianli = document.getElementById("jianli");
      jianli.addEventListener('tap',function(){
          location.href = '/unserve';
      })
    </script>
  </c:if>

  <div class="mui-tab-item " >
    <a class="mui-tab-item mui-active"id="zhiwei">
      <span class="mui-icon mui-icon-email"></span>
      <span class="mui-tab-label">职位</span>
    </a>
  </div>
  <script>
    var zhiwei = document.getElementById("zhiwei");
    zhiwei.addEventListener('tap',function(){
      location.href = '/positionManage';
    })
  </script>
  <div class="mui-tab-item mui-active">
    <a class="mui-tab-item" id="dingdan">
      <span class="mui-icon mui-icon-dingdan"></span>
      <span class="mui-tab-label">订单</span>
    </a>
  </div>
  <script>
    var shangcheng = document.getElementById("dingdan");
    shangcheng.addEventListener('tap',function(){
      location.href = '/page/orderList.html';
    })

  </script>

  <div  class="mui-tab-item mui-active">
    <a class="mui-tab-item"id="wo">
      <span class="mui-icon mui-icon-wode"></span>
      <span class="mui-tab-label">我的</span>
    </a>
  </div>
  <script>
    var shangcheng = document.getElementById("wo");
    shangcheng.addEventListener('tap',function(){
      location.href = '/pcenter';
    })

  </script>

</div>
</div>

</body>
<script type="text/javascript" src="../RecruitModule/js/mui.js" ></script>
<script>
  var gallery = mui("#slider");
  gallery.slider({
    interval:3000
  });
  function tab(url) {
    location.href = url;
  }

</script>
</body>
</html>
