<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>add
    </title>

      <%
          String path = request.getContextPath();
          String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
      %>

      <!-- Bootstrap -->
      <link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">
      <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
      <script src="<%=basePath%>js/jquery-3.2.1.min.js"></script>
      <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
      <script src="<%=basePath%>js/bootstrap.min.js"></script>


   
  </head>
  <body>
<%--导入导航栏--%>
<%@include file="head.jsp"%>


<div class="container">
  <h3 align="center">修改用户</h3>
  <form action="${pageContext.request.contextPath}/updateuser/update" method="post">
    <div class="form-group">
      <label for="name">姓名：</label>
<%--      隐藏域的提交 --%>
      <input type="hidden" name="id" value="${user.id}">
      <input type="text" class="form-control" id="name" name="name"  value="${user.name}" placeholder="请输入姓名">
    </div>
    <div class="form-group">
      <label for="password">密码：</label>
      <input type="text" class="form-control" id="password" name="password" value="${user.password}" placeholder="请输入密码">
    </div>

    <div class="form-group">
      <label>性别：</label>
      <c:if test="${user.age==\"男\"}">
        <input type="radio" name="age" value="男" checked="checked"/>男
        <input type="radio" name="age" value="女"/>女
        <input type="radio" name="age" value="人妖"/>人妖
      </c:if>
      <c:if test="${user.age==\"女\"}">
        <input type="radio" name="age" value="男" />男
        <input type="radio" name="age" value="女" checked="checked"/>女
        <input type="radio" name="age" value="人妖"/>人妖
      </c:if>
      <c:if test="${user.age==\"人妖\"}">
        <input type="radio" name="age" value="男" />男
        <input type="radio" name="age" value="女"/>女
        <input type="radio" name="age" value="人妖" checked="checked"/>人妖
      </c:if>

    </div>



    <div class="form-group">
      <label for="address">地址：</label>
      <input type="text" class="form-control" id="address" name="address" value="${user.address}" placeholder="请输入地址">
    </div>


    <div class="form-group">
      <label for="email">Email：</label>
      <input type="text" class="form-control" id="email" name="email" value="${user.email}" placeholder="请输入邮箱地址"/>
    </div>
    <div class="form-group">
      <label for="telephone">电话：</label>
      <input type="text" class="form-control" id="telephone" name="telephone" value="${user.telephone}" placeholder="请输入电话">
  </div>
      <div class="form-group">
          <label for="telephone">终端数量：</label>
          <input type="text" class="form-control" id="n" name="n" value="${user.n}" placeholder="请输入终端数量">
      </div>

    <div class="form-group" style="text-align: center">
      <input class="btn btn-primary" type="submit" value="提交" />
      <input class="btn btn-default" type="reset" value="重置" />

    </div>
  </form>
</div>

  </body>
</html>