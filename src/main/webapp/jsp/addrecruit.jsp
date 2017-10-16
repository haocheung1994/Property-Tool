<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/25
  Time: 16:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>发布招聘信息</title>
</head>
<body>
<h2>发布招聘信息</h2>
  <form action="/addrecruit" method="post" >
    工种：
    <select name="jobname">
      <option value="前台">前台</option>
      <option value="保安">保安</option>
      <option value="保洁">保洁</option>
      <option value="导购">导购</option>
    </select>
    <br><br>
    薪资水平：<input type="text" placeholder="工资水平，单位(元)"  name = "salary" required="" > 元<br><br>
    职位诱惑：<input type="text" placeholder="填写公司福利"  name = "welfare" required=""style="width: 500px ;height: 100px" ><br><br>
    职位描述：<input type="text" placeholder="填写职位的详细描述"  name = "jobdescribe" required="" style="width: 500px ;height: 100px" ><br><br>
    工作经验要求：<input type="radio" name="workreq" value="无经验" checked >无经验
                  <input type="radio" name="workreq" value="1年以内" >1年以内
                  <input type="radio" name="workreq" value="3年以内" >3年以内
                  <input type="radio" name="workreq" value="3年以上" >3年以上<br><br>
    工作地点：<input type="text" placeholder="工作地点"  name = "workaddr" ><br><br>
    工作类型：<input type="radio" name="worktype" value="全职" checked >全职
    <input type="radio" name="worktype" value="兼职" >兼职
    <input type="radio" name="worktype" value="实习" >实习<br><br>
    教育经验要求：
    <select name="edureq">
      <option value="本科">本科</option>
      <option value="高中及以下">高中及以下</option>
      <option value="硕士研究生">硕士研究生</option>
      <option value="博士研究生">博士研究生</option>
    </select><br><br>

    <input type="submit" value="提交">
  </form>
</body>
</html>
