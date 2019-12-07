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


    <script src="https://how2j.cn/study/js/chartjs/2.8.0/chart.min.js"></script>
   
  </head>
  <body>
<%--导入导航栏--%>
<%@include file="head.jsp"%>




<div style="margin:10px 100px" id="graph">
  <canvas id="myChart" ></canvas>
</div>
<script>
    //异步请求  获取终端数据
    var userId=${param.id};
    var userUid=${param.uid};
    //alert(userId);


    function getdata() {
    $.get("${pageContext.request.contextPath}/userdate/findHistoryData",{id:userId,uid:userUid},function (data) {
        $("#myChart").empty();//清空div的内容
        var temp=new Array();
        var humi=new Array();
        var time=new Array();
        for (var i = 0; i < data.length; i++) {
            var p = data[i];
            temp.push(p.temperature);
            humi.push(p.humidity);
            time.push(p.historyTime);
        }

        var ctx = document.getElementById('myChart').getContext('2d');
        var myChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels:time ,
                datasets: [
                    {
                        label: '温度',
                        data: temp,
                        borderColor:'blue',
                        backgroundColor:'skyBlue',
                        borderWidth: 1,
                        fill: false,

                    },
                    {
                        label: '湿度',
                        data: humi,
                        borderColor:'red',
                        backgroundColor:'pink',
                        borderWidth: 1,
                        fill: false,
                    },

                ]
            }
        });
    });

    }

  var ctx = document.getElementById('myChart').getContext('2d');
  var myChart = new Chart(ctx, {
    type: 'line',
    data: {
      labels: ['2019-11-14 12:50:22', '2019-11-14 12:50:22', '2019-11-14 12:50:22',
          '2019-11-14 12:50:22', '2019-11-14 12:50:22', '2019-11-14 12:50:22',
          '2019-11-14 12:50:22', '2019-11-14 12:50:22', '2019-11-14 12:50:22', '2019-11-14 12:50:22',
          '2019-11-14 12:50:22', '2019-11-14 12:50:22', '2019-11-14 12:50:22', '2019-11-14 12:50:22',
          '2019-11-14 12:50:22', '2019-11-14 12:50:22', '2019-11-14 12:50:22', '2019-11-14 12:50:22',
          '2019-11-14 12:50:22', '2019-11-14 12:50:22', '2019-11-14 12:50:22', '2019-11-14 12:50:22',
          '2019-11-14 12:50:22', '2019-11-14 12:50:22', '2019-11-14 12:50:22', '2019-11-14 12:50:22',
          '2019-11-14 12:50:22', '2019-11-14 12:50:22', '2019-11-14 12:50:22', '2019-11-14 12:50:22',
          '2019-11-14 12:50:22'],
      datasets: [
        {
          label: '温度',
          data: [12, 19, 3, 5, 0, 3,19, 3, 5, 0, 3, 19, 3, 5, 0, 3,19, 3, 5, 0, 3, 19, 3, 5, 0, 3,19, 3, 5, 0, 3],
          borderColor:'blue',
          backgroundColor:'skyBlue',
          borderWidth: 1,
          fill: false,

        },
        {
          label: '湿度',
          data: [11, 10, 4, 9, 15, 3,11, 13, 5, 10, 3, 19, 13, 5, 0, 3,24, 6, 5, 10, 13, 19, 13, 15, 10, 3,19, 3, 5, 10, 13],
          borderColor:'red',
          backgroundColor:'pink',
          borderWidth: 1,
          fill: false,
        },

      ]
    }
  });

    $(document).ready(function(){
        setInterval(getdata, 3000);
    });
</script>
  <footer class="container-fluid">
     
       <div class="yejiao" id="div3">
           厦门小林物联网科技股份有限公司 版权所有Copyright 2006-2030, All Rights Reserved 闽ICP备16007882
       </div>
    <script>
      $("#div3").click(function(){
        alert("success");
      });
    </script>

   </footer>
  </body>
</html>