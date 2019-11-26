<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<%--导入导航栏--%>
<%@include file="page/head.jsp"%>


<!--轮播图-->
<div id="carousel-example-generic" class="carousel slide container-fluid" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src="img/首页2.jpg" alt="...">
    
    </div>
    <div class="item">
      <img src="img/首页4.jpg" alt="...">
   
        </div>
    <div class="item">
      <img src="img/首页3.jpg" alt="...">
      
    </div>
    
  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
  <footer class="container-fluid">
     
       <div class="yejiao">
           厦门小林物联网科技股份有限公司 版权所有Copyright 2006-2030, All Rights Reserved 闽ICP备16007882
       </div>

   </footer>
  </body>
</html>