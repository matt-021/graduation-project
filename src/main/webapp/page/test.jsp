<%--
  Created by IntelliJ IDEA.
  User: 林志育
  Date: 2019/11/22
  Time: 20:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <meta charset="utf-8" />
</head>
<body>
<input type="button" value="生成" id="btnCreate" />
<script type="text/javascript">
    window.onload = function () {
        var jsonData = [
            { id: 1, name: "赵建宇", sex: "男", age: 19 },
            { id: 2, name: "张三", sex: "男", age: 20 },
            { id: 3, name: "李四", sex: "男", age: 21 },
            { id: 4, name: "王五", sex: "男", age: 22 },
            { id: 6, name: "赵六", sex: "男", age: 23 },
            { id: 7, name: "田七", sex: "男", age: 24 }];
        var tableObj = document.createElement('table');
        document.getElementById('btnCreate').onclick = function () {
            for (var i = 0; i < jsonData.length; i++) {
                var rowObj1 = tableObj.insertRow(-1);
                for (var key in jsonData[i]) {
                    var cellObj1 = rowObj1.insertCell(-1);

                    cellObj1.innerHTML = jsonData[i][key];
                }
            }
            document.body.appendChild(tableObj);
        };
    };
</script>
</body>
</html>
