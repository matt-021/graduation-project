<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
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

<%--ajax实现  验证用户是否存在   保证用户名称的唯一性--%>

    <script>
      //在页面加载完成后
      $(function () {
        //给username绑定blur事件
        $("#name").blur(function () {
          //获取username文本输入框的值
          var username = $(this).val();
          //发送ajax请求
          //期望服务器响应回的数据格式：{"userExsit":true,"msg":"此用户名太受欢迎,请更换一个"}
          //                         {"userExsit":false,"msg":"用户名可用"}
          $.get("${pageContext.request.contextPath}/adduser/checkUserName",{username:username},function (data) {
            //判断userExsit键的值是否是true

            // alert(data);
            var span = $("#s_username");
            if(data.userExsit){
              //用户名存在
              span.css("color","red");
              span.html(data.msg);
            }else{
              //用户名不存在
              span.css("color","green");
              span.html(data.msg);
            }
          });

        });
      });

    </script>
   
  </head>
  <body>
<%--导入导航栏--%>
<%@include file="head.jsp"%>


<div class="container">
  <h3 align="center">添加用户</h3>
  <form action="${ pageContext.request.contextPath }/adduser/add" method="post">
    <div class="form-group">
      <label for="name">姓名：</label>
      <input type="text" class="form-control" id="name" name="name" placeholder="请输入姓名">
      <span id="s_username"></span>

    </div>
    <div class="form-group">
      <label for="password">密码：</label>
      <input type="text" class="form-control" id="password" name="password" placeholder="请输入密码">
    </div>

    <div class="form-group">
      <label>性别：</label>
      <input type="radio" name="age" value="男" checked="checked"/>小哥哥
      <input type="radio" name="age" value="女"/>仙女
      <input type="radio" name="age" value="人妖"/>人妖
    </div>



    <div class="form-group">
      <label for="address">地址：</label>
      <input type="text" class="form-control" id="address" name="address" placeholder="请输入地址">
    </div>


    <div class="form-group">
      <label for="email">Email：</label>
      <input type="text" class="form-control" id="email" name="email" placeholder="请输入邮箱地址"/>
    </div>
    <div class="form-group">
      <label for="telephone">电话：</label>
      <input type="text" class="form-control" id="telephone" name="telephone" placeholder="请输入电话">
    </div>
    <div class="form-group">
      <label for="telephone">终端数量</label>
      <input type="text" class="form-control" id="n" name="n" placeholder="请输入终端数量">
    </div>

    <div class="form-group" style="text-align: center">
      <input class="btn btn-primary" type="submit" value="提交" />
      <input class="btn btn-default" type="reset" value="重置" />

    </div>
  </form>
</div>

  </body>
</html>
