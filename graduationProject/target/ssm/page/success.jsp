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


<%--    bootstrap.css 和 boostrap.min.css 的区别就是：前者是未压缩的，后者是压缩过的。

一般情况下，未压缩的用于开发环境，如果程序出错方便调试。而压缩过的用生生产环境，大大减少网络数据传输量，便之更快更节约流量……

boostrap.min.css也是完整的库，只不过通过工具压缩，令相同的代码所占空间更小，从而提升web性能，减少宽带的压力--%>
    <!-- Bootstrap -->
    <link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="<%=basePath%>js/jquery-3.2.1.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="<%=basePath%>js/bootstrap.min.js"></script>


<%--   扣的组件--%>

    <link rel="stylesheet" href="<%=basePath%>css/style.css" type="text/css" media="all" />

    <link rel="stylesheet" href="<%=basePath%>css/percircle.css">




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
       function getdata() {
           $.get("${ pageContext.request.contextPath}/userdate/finddate" ,{uid:${userAndDate.get(0).id}},function(data) {

               $("#fatherDIV").empty();//清空div的内容


                   for (var i = 0; i < data.length; i++) {
                       //有几个就生成几个圆
                       var color=["dark","dark blue","dark pink","dark green"];
                       var n1=Math.floor(Math.random()*4);//生成0-3的整数      Math.floor();  //向下取整。
                       var p = data[i];//获取每一个json对象

                       var temperature1=parseInt(p.temperature);
                       var humidity1=parseInt(p.humidity);

                       var isNormal="正常";
                       //判断所取的数字是否符合正常值


                       $("#fatherDIV").append("<div class=\"w3ls-skills-grids\">\n" +
                           "                       <div id=\"div"+i+"\" class=\"c100 p60 "+color[n1]+" \" style=\"margin: 0 auto\">\n" +
                           "                           <span>"+isNormal+"</span>\n" +
                           "                           <div class=\"slice\" >\n" +
                           "                               <div class=\"bar\"></div>\n" +
                           "                               <div class=\"fill\"></div>\n" +
                           "                           </div>\n" +
                           "                       </div>\n" +
                           "                       <div class=\"w3ls-skills-info\">\n" +
                           "                           <h4>终端"+(i+1)+"</h4>\n" +
                           "                           <p> 温度为--"+p.temperature+"℃, 湿度为--"+p.humidity+"%rh.</p>\n" +
                           "                       </div>\n" +
                           "                   </div>");



                   }

               <%--    终端点击事件--%>
               //错误  始终是数组中最后一个值， 因为function() {} 并没有被立即解析，直到调用的时候才被解析，这时index已经是1了
               // for (var i = 0; i < data.length; i++) {
               //
               //
               //     $("#div" + i + "").click(function(){
               //         alert("#div" + i + "");
               // });
               // }

              //不能动态
               <%--$("#div0").click(function(){--%>
               <%--    window.location.href = "${pageContext.request.contextPath}/userdate/findhistory?id=30&uid=2";--%>
               <%--});--%>
               <%--$("#div1").click(function(){--%>
               <%--    window.location.href = "${pageContext.request.contextPath}/userdate/findhistory?id=31&uid=2";--%>
               <%--});--%>
               <%--$("#div2").click(function(){--%>
               <%--    alert(2);--%>
               <%--});--%>
               <%--$("#div3").click(function(){--%>
               <%--    alert(3);--%>
               <%--});--%>

               <%--    终端动态绑定点击事件--%>
               for (var i=0;i<data.length; i++){

                   $("#div"+i).bind("click", {index: i}, clickHandler);
               }

               function clickHandler(event) {
                   var i= event.data.index;
                   //由于js变量获取el表达式中的对象:不能直接获取,直接获取得到的是该对象的toString值。
                   <%--js中使用el表达式要加双引号或单引号:'${list}'--%>
                   var zhongduan="${userAndDate.get(1)}";
                   //查看了zhongduan字符串如下
                   // [Lin{id=30, temperature=29.0, humidity=20.0, time=2019-11-23 21:37:01.0, uid=2},
                   // Lin{id=31, temperature=27.5, humidity=30.0, time=2019-11-22 16:46:09.0, uid=2},
                   // Lin{id=32, temperature=28.5, humidity=40.0, time=2019-11-22 16:46:14.0, uid=2},
                   // Lin{id=38, temperature=29.0, humidity=55.0, time=2019-11-22 16:46:22.0, uid=2}]
                 // alert(zhongduan);
                   var fenge=zhongduan.split("},");// 分割字符串，并返回一个数组
                   //alert(fenge[i]);
                   //因为id的值已经为三位数  那么获取7位的非全数字字符串  可以用正则表达去掉非数字字符
                   var id=fenge[i].slice(8,16); //fenge[i]获取点击圆的字符串信息***，tem
                   // slice(8,14)截取字符串中的数字
                   //正则方式去掉非数字字符
                   var num = id.replace(/[^0-9]/ig,"");
                   //alert(num);

                   // slice() 第一个参数代表开始位置,第二个参数代表结束位置的下一个位置
                   //alert(id);
                   window.location.href = "${pageContext.request.contextPath}/userdate/findhistory?id="+num+"&uid=${userAndDate.get(0).id}";
               }





           });
       }
       $(document).ready(function(){
           setInterval(getdata, 3000);
       });

   </script>



</head>
<body>
<%@include file="head.jsp"%>


<div class="jarallax skills " id="skills" >
    <div class="container-fluid">
        <div class="wthree-about-info skills-about-info">
            <h3>hello！${userAndDate.get(0).name} </h3>
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
                       <div  class="c100 p60 <%=color1[n]%>" style="margin: 0 auto">
                           <span>正常</span>
                           <div class="slice" >
                               <div class="bar"></div>
                               <div class="fill"></div>
                           </div>
                       </div>
                       <div id="" class="w3ls-skills-info">
                           <h4>终端${s.count}</h4>
                           <p> 温度为--${lin1.temperature}℃, 湿度为--${lin1.humidity}%rh.</p>
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
