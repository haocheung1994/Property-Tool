<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%--
Created by IntelliJ IDEA.
User: Administrator
Date: 2017/5/25
Time: 9:52
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <meta charset="UTF-8">
    <title></title>
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <link href="/RecruitModule/css/mui.min.css" type="text/css" rel="stylesheet" />
    <link href="/RecruitModule/iconfont/iconfont.css" rel="stylesheet" />
    <link href="/RecruitModule/css/homepage.css" rel="stylesheet"/>
    <link href="/RecruitModule/css/mui.poppicker.css" rel="stylesheet" />
    <link href="/RecruitModule/css/mui.picker.css" rel="stylesheet" />

</head>

<script src="/RecruitModule/js/mui.min.js"></script>
<script src="/RecruitModule/js/mui.picker.js"></script>
<script src="/RecruitModule/js/mui.poppicker.js"></script>
<script src="/RecruitModule/js/jquery1.9.1.min.js"></script>
<script src="/RecruitModule/js/city.data-3.js"></script>
<script src="/RecruitModule/iconfont/iconfont.js"></script>
<script type="text/javascript">
    mui.init()
</script>
<link href="/RecruitModule/css/search.css" rel="stylesheet"/>
<header id="header1" class="mui-bar mui-bar-nav">
    <h1 class="mui-title" style="color: white">简历信息</h1>
</header>

<!--
    添加头像
-->

<!--
    ===============================================================================
-->

<!--
    基本信息
-->
<!--
    ===============================================================================
-->
<div class="mui-media-body" style="margin-top: 55px; margin-left: 10px;margin-bottom: 10px;">
    <p><span style="font-family: '微软雅黑'; font-size: 18px;">基本信息</span></p>
</div>
<!--
    ===============================================================================
-->
<ul class="mui-table-view" style="margin-top: 10px;">
    <div class="mui-content">
        <ul class="mui-table-view" style="margin-left: 10px;margin-right: 10px;margin-bottom: 10px;">
            <!--	<link href="css/font.css" rel="stylesheet" />-->
            <li class="mui-table-view-cell mui-media">

                <div class="mui-media-body">
            <!--  <span2>3.5千-4千</span2>-->
            <p class="mui-ellipsis" style="font-family: '微软雅黑';"><span>姓&nbsp;&nbsp;名 ：${BasicInfo.personname}</span></p>
            <p class="mui-ellipsis" style="font-family: '微软雅黑';"><span>性&nbsp;&nbsp;别 ：${BasicInfo.personsex}</span></p>
            <p class="mui-ellipsis" style="font-family: '微软雅黑';"><span>出生年月 ：${BasicInfo.birthtimeStr}</span></p>
            <p class="mui-ellipsis" style="font-family: '微软雅黑';"><span>毕业院校 ：${BasicInfo.schoolname}</span></p>
            <p class="mui-ellipsis" style="font-family: '微软雅黑';"><span>工作年限 ：${BasicInfo.workyear}</span></p>
            <p class="mui-ellipsis" style="font-family: '微软雅黑';"><span>所在城市 ：${BasicInfo.personcity}</span></p>
            <p class="mui-ellipsis" style="font-family: '微软雅黑';"><span>联系电话 ：<span id="hidtel" onclick="myFunction()" style="color: #00b7ee">已隐藏，点击显示</span><%--${BasicInfo.persontel}--%></span></p>
            <p class="mui-ellipsis" style="font-family: '微软雅黑';"><span>联系邮箱 ：${BasicInfo.personemail}</span></p>
            <p class="mui-ellipsis" style="font-family: '微软雅黑';"><span>一句话介绍 ：${BasicInfo.otherinf}</span></p>
                </div>

            </li>
        </ul>
</div>
</ul>
<script>
    function myFunction()
    {
        x=document.getElementById("hidtel");  // 找到元素
        x.innerHTML=${BasicInfo.persontel};    // 改变内容
    }
</script>
<!--
    工作经历
-->
<!--
    =============================================================================
-->
<c:if test="${worklog>0}">
<div class="mui-media-body" style="margin-top: 10px; margin-left: 10px;margin-bottom: 10px;">
  <p><span style="font-family: '微软雅黑'; font-size: 18px;">工作经历</span></p>
</div>

<!--
    =============================================================================
-->

<div class="mui-table-view" class="mui-media-body" style="margin-top: 10px; margin-left: 10px;margin-right: 10px;margin-bottom: 10px;">
    <ul class="mui-table-view" style="margin-top: 10px;">

       <c:forEach var="var" items="${workExpList}" >


           <li class="mui-table-view-cell mui-media">
                   <p class="mui-ellipsis" style="font-family: '微软雅黑';"><span>公司名称：${var.companyname}</span></p>
                   <p class="mui-ellipsis" style="font-family: '微软雅黑';"><span>你的职位：${var.jobname}</span></p>
               <c:if test="${var.starttime !=null}">
                   <p class="mui-ellipsis" style="font-family: '微软雅黑';"><span>入职时间：${var.starttimeStr}</span></p>
               </c:if>
               <c:if test="${var.endtime !=null}">
                   <p class="mui-ellipsis" style="font-family: '微软雅黑';"><span>离职时间：${var.endtimeStr}</span></p>
               </c:if>
                   <p class="mui-ellipsis" style="font-family: '微软雅黑';"><span>工作内容：${var.workduty}</span></p>

           </li>

       </c:forEach>

  </ul>
</div>
</c:if>
<!--
    教育经历
-->
<!--
    =============================================================================
-->
<c:if test="${edulog>0}">
<div class="mui-media-body" style="margin-top: 10px; margin-left: 10px;margin-bottom: 10px;">
  <p><span style="font-family: '微软雅黑'; font-size: 18px;">教育经历</span></p>
</div>

<!--
    =============================================================================
-->

<div class="mui-table-view" class="mui-media-body" style="margin-top: 10px; margin-left: 10px;margin-right: 10px;margin-bottom:100px;">


      <c:forEach var="var" items="${eduExpList}" >
          <li class="mui-table-view-cell mui-media">
                  <div class="mui-media-body" >
                      <c:if test="${var.graduationtime !=null}">
                      <p >${var.graduationtimeStr}</p>
                      </c:if>
                      <p>${var.eduschoolname}</p>
                      <p>${var.degree}-${var.edumajor}</p>
                  </div>


          </li>
      </c:forEach>

  </ul>
</div>
</c:if>

</div>
</body>

</html>