    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
    <%--
      Created by IntelliJ IDEA.
      User: Administrator
      Date: 2017/5/31
      Time: 14:33
      To change this template use File | Settings | File Templates.
    --%>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!doctype html>
    <!doctype html>
    <html>

    <head>
      <meta charset="UTF-8">
      <title></title>
      <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
      <link href="/RecruitModule/css/mui.min.css" rel="stylesheet" />
      <link href="/RecruitModule/iconfont/iconfont.css" rel="stylesheet" />
    </head>

    <body>
    <script src="/RecruitModule/js/mui.min.js"></script>
    <script type="text/javascript">
      mui.init()
    </script>

    <!--
        标题栏
    -->
   <%-- <link href="/RecruitModule/css/position_info.css" rel="stylesheet"/>--%>
    <header class="mui-bar mui-bar-nav" >
      <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
      <h1 class="mui-title">简历详情</h1>
    </header>

    <!--
        添加头像
    -->
    <!--
        基本信息
    -->
    <!--
        ===============================================================================
    -->
    <div class="mui-content" style="margin-top: 10px; margin-left: 10px;margin-bottom: 10px;">
      <p><span style="font-family: '微软雅黑'; font-size: 18px;">添加头像</span></p>

    <!--
        ===============================================================================
    -->
    <div class="mui-table-view" style="margin-top: 10px; margin-left: 10px;margin-bottom: 10px;margin-right: 10px;">
      <ul class="mui-table-view">
        <li class="mui-table-view-cell mui-media">
          <a href="javascript:;">
            <%--<p class="mui-icon iconfont icon-bianji mui-icon-left-nav mui-pull-right" style="font-family: '微软雅黑';">编辑</p>--%>
            <img class="mui-media-object" src="${wechatUserInfo.headimgurl}" >
           <%-- <p class="mui-media-object" style="font-family: '微软雅黑';">点击更换</p>--%>
          </a>
        </li>
      </ul>
    </div>
    <!--
        基本信息
    -->
    <!--
        ===============================================================================
    -->
    <div class="mui-media-body" style="margin-top: 10px; margin-left: 10px;margin-bottom: 10px;">
      <p><span style="font-family: '微软雅黑'; font-size: 18px;">基本信息</span></p>
    </div>
    <!--
        ===============================================================================
    -->
    <div class="mui-table-view" style="margin-top: 10px;">
      <div class="mui-content">
        <ul class="mui-table-view" style="margin-left: 10px;margin-right: 10px;margin-bottom: 10px;">
          <!--	<link href="css/font.css" rel="stylesheet" />-->
          <li class="mui-table-view-cell mui-media">

              <div class="mui-media-body">
                <!--  <span2>3.5千-4千</span2>-->
                <p class="mui-icon iconfont icon-bianji mui-icon-left-nav mui-pull-right" style="font-family: '微软雅黑';"><a href="/editinfo">编辑</a></p>
                <p class="mui-ellipsis" style="font-family: '微软雅黑';"><span>姓&nbsp;&nbsp;名 ：${BasicInfo.personname}</span></p>
                <p class="mui-ellipsis" style="font-family: '微软雅黑';"><span>性&nbsp;&nbsp;别 ：${BasicInfo.personsex}</span></p>
                <p class="mui-ellipsis" style="font-family: '微软雅黑';"><span>出生年月 ：${BasicInfo.birthtime}</span></p>
                <p class="mui-ellipsis" style="font-family: '微软雅黑';"><span>毕业院校 ：${BasicInfo.schoolname}</span></p>
                <p class="mui-ellipsis" style="font-family: '微软雅黑';"><span>工作年限 ：${BasicInfo.workyear}</span></p>
                <p class="mui-ellipsis" style="font-family: '微软雅黑';"><span>所在城市 ：${BasicInfo.personcity}</span></p>
                <p class="mui-ellipsis" style="font-family: '微软雅黑';"><span>联系电话 ：${BasicInfo.persontel}</span></p>
                <p class="mui-ellipsis" style="font-family: '微软雅黑';"><span>联系邮箱 ：${BasicInfo.personemail}</span></p>
                <p class="mui-ellipsis" style="font-family: '微软雅黑';"><span>一句话介绍 ：${BasicInfo.otherinf}</span></p>
              </div>

          </li>
        </ul>
    </div>


    <!--
        工作经历
    -->
    <!--
        =============================================================================
    -->
    <div class="mui-media-body" style="margin-top: 10px; margin-left: 10px;margin-bottom: 10px;">
      <p><span style="font-family: '微软雅黑'; font-size: 18px;">工作经历</span></p>
    </div>
    <!--
        =============================================================================
    -->
        <script>
            function editWorkExpSub(workexpid)
            {
                if(CheckPost())
                {
                    document.getElementById("editWork_"+workexpid).submit();
                }
            }
            function CheckPost ()
            {
                return true;

            }
        </script>
    <div class="mui-table-view" class="mui-media-body" style="margin-top: 10px; margin-left: 10px;margin-right: 10px;margin-bottom: 10px;">
       <ul class="mui-table-view" style="margin-top: 10px;">
           <c:forEach var="var" items="${workExpList}" >
               <li class="mui-table-view-cell mui-media">
                   <form action="/editWorkExp" name="editWorkExp"  id="editWork_${var.workexpid}"  method="post">
                       <p class="mui-icon iconfont icon-bianji mui-icon-left-nav mui-pull-right" style="font-family: '微软雅黑';"><a onclick="editWorkExpSub(${var.workexpid})">编辑</a></p>
                       <p class="mui-ellipsis" style="font-family: '微软雅黑';"><span>公司名称：${var.companyname}</span></p>
                       <p class="mui-ellipsis" style="font-family: '微软雅黑';"><span>你的职位：${var.jobname}</span></p>
                       <p class="mui-ellipsis" style="font-family: '微软雅黑';"><span>入职时间：${var.starttimeStr}</span></p>
                       <p class="mui-ellipsis" style="font-family: '微软雅黑';"><span>离职时间：${var.endtimeStr}</span></p>
                       <p class="mui-ellipsis" style="font-family: '微软雅黑';"><span>工作内容：${var.workduty}</span></p>
                       <input type="hidden" name="workexpid" value="${var.workexpid}" >
                       <input type="hidden" name="companyname" value="${var.companyname}" >
                       <input type="hidden" name="jobname" value="${var.jobname}" >
                       <input type="hidden" name="starttime" value="${var.starttime}">
                       <input type="hidden" name="endtime" value="${var.endtime}" >
                       <input type="hidden" name="workduty" value="${var.workduty}">
                   </form>
               </li>
           </c:forEach>


        <li class="mui-table-view-cell mui-media">
          <div class="mui-media-body" style="height: 40px;">
            <p class="icon iconfont icon-add2" style="vertical-align: middle;text-align:center;"><a href="/addworkexp">添加工作经历</a></p>
            <p style="vertical-align: middle;text-align:center;font-family: '微软雅黑';font-size: 12px;">请从最近一份工作说起</p>
          </div>
         </li>
      </ul>
    </div>
    </div>
    <!--
        教育经历
    -->
    <!--
        =============================================================================
    -->

    <div class="mui-media-body" style="margin-top: 10px; margin-left: 10px;margin-bottom: 10px;">
      <p><span style="font-family: '微软雅黑'; font-size: 18px;">教育经历</span></p>
    </div>
    <!--
        =============================================================================
    -->
        <script>
            function editEduExpSub(eduexpid)
            {
                if(CheckPost())
                {
                    document.getElementById("editEdu_"+eduexpid).submit();
                }
            }
            function CheckPost ()
            {
                return true;

            }
        </script>
    <div class="mui-table-view" class="mui-media-body" style="margin-top: 10px; margin-left: 10px;margin-right: 10px;margin-bottom: 10px;">
      <ul class="mui-table-view" style="margin-top: 10px;">
          <c:forEach var="var" items="${eduExpList}" >
              <li class="mui-table-view-cell mui-media">
                  <form action="/editEduExp" name="editEduExp"  id="editEdu_${var.eduexpid}">
                      <div class="mui-media-body" >
                          <p class="mui-icon iconfont icon-bianji mui-icon-left-nav mui-pull-right" style="font-family: '微软雅黑';">
                              <a onclick="editEduExpSub(${var.eduexpid})">编辑</a>
                          </p>
                          <p >${var.graduationtimeStr}</p>
                          <p>${var.eduschoolname}</p>
                          <p>${var.degree}-${var.edumajor}</p>
                      </div>
                      <input type="hidden" name="eduexpid" value="${var.eduexpid}" >
                      <input type="hidden" name="graduationtime" value="${var.graduationtime}" >
                      <input type="hidden" name="eduschoolname" value="${var.eduschoolname}" >
                      <input type="hidden" name="degree" value="${var.degree}" >
                      <input type="hidden" name="edumajor" value="${var.edumajor}" >
                  </form>
              </li>
          </c:forEach>
          <li class="mui-table-view-cell mui-media">
              <div class="mui-media-body" style="height: 40px;">
                  <p class="icon iconfont icon-add2" style="vertical-align: middle;text-align:center;"><a href="/addEduExp">添加教育经历</a></p>
                  <p style="vertical-align: middle;text-align:center;font-family: '微软雅黑';font-size: 12px;">请从最高学历说起</p>
              </div>
          </li>
      </ul>
    </div>

        <!--
          底部菜单
          -->
        <div class="mui-bar mui-bar-tab">
            <div class="mui-tab-item mui-active">
                <a class="mui-tab-item " id="shouye" >
                    <span class="mui-icon iconfont icon-shouye-shouye"></span>
                    <span class="mui-tab-label">首页</span>
                </a>
            </div>
            <script>
                var shouye = document.getElementById("shouye");
                shouye.addEventListener('tap',function(){
                    location.href ='#' ;
                })
            </script>

            <%--个人身份登录--%>
            <c:if test="${loginUser.usertype == '个人' }">
                <div class="mui-tab-item " >
                    <a  class="mui-tab-item mui-active" id="jianli" >
                        <span  class="mui-icon iconfont icon-jianli"></span>
                        <span class="mui-tab-label">简历</span>
                    </a>
                </div>
                <script>
                    var jianli = document.getElementById("jianli");
                    jianli.addEventListener('tap',function(){
                        location.href = '/myResume?userid=${userId}';
                    })
                </script>
            </c:if>

            <%--企业身份登录--%>
            <c:if test="${loginUser.usertype == '企业' }">
                <div class="mui-tab-item " >
                    <a  class="mui-tab-item mui-active" id="zhaoping" >
                        <span  class="mui-icon iconfont icon-fabu"></span>
                        <span class="mui-tab-label">发布</span>
                    </a>
                </div>
                <script>
                    var zhaoping = document.getElementById("zhaoping");
                    zhaoping.addEventListener('tap',function(){
                        location.href = '/showapply?userid=${userId}';
                    })
                </script>
            </c:if>




            <div class="mui-tab-item mui-active" >
                <a class="mui-tab-item " id="wo" >
                    <span class="mui-icon iconfont icon-gerenzhongxin"></span>
                    <span class="mui-tab-label">我</span>
                </a>
            </div>
            <script>
                var wo = document.getElementById("wo");
                wo.addEventListener('tap',function(){
                    location.href = '/weixininfo';
                })
            </script>


        </div>
    </div>
    </body>

    </html>