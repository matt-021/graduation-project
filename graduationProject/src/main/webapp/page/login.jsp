<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
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
<%--当账号或者密码错误时 显示提示框--%>
      <%
          String errorInfo =request.getParameter("fail");         // 获取错误属性
          if(errorInfo != null) {
      %>
      <script type="text/javascript" language="javascript">
          alert("<%=errorInfo%>");                                            // 弹出错误信息

          window.location='login.jsp' ;                            // 跳转到登录界面
      </script>
      <%
          }
      %>

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
<%--用户名不能为空 用onchange事件  --%>
      <script>
          function checkUser(obj) {
              //获取输入框输入的值
              var user = obj.value;
              // 如果输入框中的值为空，，并且让该输入框获得焦点 且提示文字说明不能为空
              var span = $("#s_username");

              if (!user) {
                  span.css("color","red");
                  span.html("不能为空哦");
                  obj.focus();

              }else
              {
                  span.html("")
              }

          }
      </script>
   
  </head>
  <body>



<%--导航栏  --%>
<%@include file="head.jsp"%>

<%--表单的路径两种写法
    1 ${ pageContext.request.contextPath }/login/loginSuccess  建议第一种方法
    2 ../login/loginSuccess  因为登入login.jsp页面在根目录下的page目录 固当访问到login页面时
                              加../   使其退回根目录，在请求对应的类或者方法 才能执行类中的方法

--%>
<form class="form-horizontal" action="${ pageContext.request.contextPath }/login/loginSuccess" method="post">
  <div class="form-group">
    <label for="name" class="col-sm-2 control-label">name</label>
    <div class="col-sm-7">
      <input type="text" class="form-control" id="name" name="name" onchange="checkUser(this)" >
        <span id="s_username"></span>
    </div>
  </div>
  <div class="form-group">
    <label for="password" class="col-sm-2 control-label">Password</label>
    <div class="col-sm-7">
      <input type="password" class="form-control" id="password" placeholder="Password" name="password" onblur="if(this.value.replace(/(^\s*)|(\s*$)/g,'')=='')alert('不能为空')" >
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <div class="checkbox">
        <label>
          <input type="checkbox"> Remember me
        </label>
      </div>
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-default" onclick="submit()">登入</button>
    </div>
  </div>
</form>

  <footer class="container-fluid">
     
       <div class="yejiao">
           厦门小林物联网科技股份有限公司 版权所有Copyright 2006-2030, All Rights Reserved 闽ICP备16007882
       </div>

   </footer>
  </body>
</html>
