<%@ page import="java.util.List" %>
<%@ page import="com.lin.domain.User" %><%--
  Created by IntelliJ IDEA.
  User: 林志育
  Date: 2019/10/28
  Time: 20:07
  To change this template use File | Settings | File Templates.

--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>index
    </title>
    <%--    jsp路径和servlet路径是不一样的 <%=basePath%> 使页面跳转  css样式不会shixiao--%>
    <%--
    request.getSchema()可以返回当前页面使用的协议，http 或是 https;

    request.getServerName()可以返回当前页面所在的服务器的名字;

    request.getServerPort()可以返回当前页面所在的服务器使用的端口,就是80;

    request.getContextPath()可以返回当前页面所在的应用的名字;
    --%>
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



    <%--底部样式--%>
    <style>
        .yejiao{
            height: 40px;
            background-color: #000000;
            text-align: center;
            line-height:40px ;
            font-size: 8px;
        }

    </style>

</head>
<body>



<%--导航栏  --%>

<%@include file="head.jsp"%>


<!--用户信息显示-->
<div class="container">
    <h3 style="text-align: center">用户信息列表</h3>

    <div style="float: left;">
<%--查询表单--%>
        <form class="form-inline" action="" method="post">
            <div class="form-group">
                <label for="exampleInputName2">姓名</label>
                <input type="text" name="name" value="" id="exampleInputName2" >
            </div>
            <div class="form-group">
                <label for="exampleInputName3">籍贯</label>
                <input type="text" name="address" value="" class="form-control" id="exampleInputName3" >
            </div>

            <div class="form-group">
                <label for="exampleInputEmail2">邮箱</label>
                <input type="text" name="email" value="" class="form-control" id="exampleInputEmail2"  >
            </div>
            <button type="submit" class="btn btn-default">查询</button>
        </form>

    </div>

    <div style="float: right;margin: 5px;">

        <a class="btn btn-primary" href="${pageContext.request.contextPath}/adduser/addButton">添加用户</a>
        <a class="btn btn-primary" href="" id="delSelected">删除选中</a>

    </div>
<table class="table table-hover">
    <tr class="baige">
        <th><input type="checkbox" id="firstCb"></th>
        <th>编号</th>
        <th>姓名</th>
        <th>密码</th>
        <th>性别</th>
        <th>籍贯</th>
        <th>邮箱</th>
        <th>电话</th>
        <th>终端</th>
    </tr>
    <%--获取所有用户的集合userList--%>

    <c:forEach items="${requestScope.users}" var="user" varStatus="s">
        <tr>
            <td><input type="checkbox" name="uid" value="${user.id}"></td>
            <td> ${s.count}</td>
            <td>${user.name}</td>
            <td>${user.password}</td>
            <td>${user.age}</td>
            <td>${user.address}</td>
            <td>${user.email}</td>
            <td>${user.telephone}</td>
            <td>${user.n}</td>
            <td>
                <a class="btn btn-default btn-sm" href="${pageContext.request.contextPath}/updateuser/showUser?id=${user.id}">修改</a>&nbsp;
                <a class="btn btn-default btn-sm" href="${pageContext.request.contextPath}/deluser/deleteUser?id=${user.id}">删除</a></td>
<%--                <a class="btn btn-default btn-sm" href="javascript:deleteUser(${user.id});">删除</a></td>--%>
        </tr>

        </tr>

    </c:forEach>




</table>
    <%--    分页栏--%>

    <li>
        <a href="${pageContext.request.contextPath}/findUserByPageServlet?currentPage=${pb.currentPage + 1}&rows=5&name=${condition.name[0]}&address=${condition.address[0]}&email=${condition.email[0]}" aria-label="Next">
            <span aria-hidden="true">&raquo;</span>
        </a>
    </li>
    <span style="font-size: 25px;margin-left: 5px;">
                    共条记录，共页
                </span>

    <footer class="container-fluid">

    <div class="yejiao">
        厦门小林物联网科技股份有限公司 版权所有Copyright 2006-2030, All Rights Reserved 闽ICP备16007882
    </div>

</footer>
</body>
</html>