<%@ page import="java.util.Random" %><%--
  Created by IntelliJ IDEA.
  User: 林志育
  Date: 2019/10/22
  Time: 20:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>用户登入</title>

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


<%--   扣的组件--%>
    <!-- bootstrap-css -->
    <link href="<%=basePath%>css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <!--// bootstrap-css -->
    <!-- css -->
    <link rel="stylesheet" href="<%=basePath%>css/style.css" type="text/css" media="all" />
    <!--// css -->
    <link rel="stylesheet" href="<%=basePath%>css/owl.carousel.css" type="text/css" media="all">
    <link href="<%=basePath%>css/owl.theme.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="<%=basePath%>css/cm-overlay.css" />
    <link href="<%=basePath%>css/imagehover.css" rel="stylesheet" media="all">
    <link rel="stylesheet" href="<%=basePath%>css/percircle.css">
    <!-- font-awesome icons -->
    <link href="<%=basePath%>css/font-awesome.css" rel="stylesheet">
    <!-- //font-awesome icons -->
    <!-- font -->
    <link href='http://fonts.googleapis.com/css?family=Raleway:400,100,100italic,200,200italic,300,300italic,400italic,500,500italic,600,600italic,700,700italic,800,800italic,900,900italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700italic,700,400italic,300italic,300' rel='stylesheet' type='text/css'>
    <!-- //font -->
    <script src="<%=basePath%>js/jquery-1.11.1.min.js"></script>
    <script src="<%=basePath%>js/bootstrap.js"></script>
    <!-- menu -->
    <link rel="stylesheet" href="<%=basePath%>css/main.css">
    <script type="text/javascript" src="<%=basePath%>js/main.js"></script>
    <!-- //menu -->
    <script src="<%=basePath%>js/owl.carousel.js"></script>

    <script src="<%=basePath%>js/jarallax.js"></script>
    <script src="<%=basePath%>js/SmoothScroll.min.js"></script>


    <%--底部样式--%>
    <style>
        .yejiao{
            height: 40px;

            text-align: center;
            line-height:200px ;
            font-size: 8px;
        }

    </style>


    <%--实时获取数据库的数据  使用Ajax技术--%>
   <script>
       function getnums() {
           $.get("${ pageContext.request.contextPath}/userdate/finddate" ,{id:${userAndDate.get(0).id}},function(data) {

               $("#fatherDIV").empty();//清空div的内容


                   for (var i = 0; i < data.length; i++) {
                       //有几个就生成几个圆
                       var color=["dark","dark blue","dark pink","dark green"];
                       var n1=Math.floor(Math.random()*4);//生成0-3的整数      Math.floor();  //向下取整。
                       var p = data[i];//获取每一个json对象
                       $("#fatherDIV").append("<div class=\"w3ls-skills-grids\">\n" +
                           "                       <div id=\"lightcircle\" class=\"c100 p60 "+color[n1]+" \">\n" +
                           "                           <span>正常</span>\n" +
                           "                           <div class=\"slice\">\n" +
                           "                               <div class=\"bar\"></div>\n" +
                           "                               <div class=\"fill\"></div>\n" +
                           "                           </div>\n" +
                           "                       </div>\n" +
                           "                       <div class=\"w3ls-skills-info\">\n" +
                           "                           <h4>终端"+(i+1)+"</h4>\n" +
                           "                           <p> 温度为------"+p.temperature+"℃, 湿度为------"+p.humidity+"%rh.</p>\n" +
                           "                       </div>\n" +
                           "                   </div>")



                   }


               // var span = $("#shuju");
               // span.css("color","red")
               // span.html(data[0])
               // var tableObj = document.createElement('table');
               // for (var i = 0; i < data.length; i++) {
               //     var rowObj1 = tableObj.insertRow(-1);
               //     for (var key in data[i]) {
               //         var cellObj1 = rowObj1.insertCell(-1);
               //
               //         cellObj1.innerHTML = data[i][key];
               //     }
               // }
               // document.body.appendChild(tableObj);
               //

           });
       }
       $(document).ready(function(){
           setInterval(getnums, 3000);
       });
   </script>


</head>
<body>
<%@include file="head.jsp"%>


<div class="jarallax skills " id="skills" >
    <div class="container-fluid">
        <div class="wthree-about-info skills-about-info">
            <h3>hello！${userAndDate.get(0).name} 欢迎you</h3>
            <p></p>
        </div>
        <div class="products-w3ls-row" >
            <div class="dark-area" id="fatherDIV">


               <c:forEach items="${requestScope.userAndDate.get(1)}" var="lin1" varStatus="s" >
                   <% String[] color1={"dark","dark blue","dark pink","dark green"};
                       Random random=new Random();
                       int n=random.nextInt(4);
                   %>
                   <div class="w3ls-skills-grids">
                       <div id="lightcircle" class="c100 p60 <%=color1[n]%> ">
                           <span>正常</span>
                           <div class="slice">
                               <div class="bar"></div>
                               <div class="fill"></div>
                           </div>
                       </div>
                       <div id="" class="w3ls-skills-info">
                           <h4>终端${s.count}</h4>
                           <p> 温度为------${lin1.temperature}℃, 湿度为------${lin1.humidity  }%rh.</p>
                       </div>
                   </div>
               </c:forEach>




            </div>
        </div>
    </div>
</div>


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

<footer class="container-fluid">

    <div class="yejiao">
        厦门小林物联网科技股份有限公司 版权所有Copyright 2006-2030, All Rights Reserved 闽ICP备16007882
    </div>

</footer>
<%--    <div style="float: right">--%>
<%--        <button type="button" value="切换效果" name="qiehuan">切换效果</button>--%>
<%--    </div>--%>
<%--    <div >--%>
<%--        <span id="shuju"></span>--%>
<%--    </div>--%>

</body>


</html>
