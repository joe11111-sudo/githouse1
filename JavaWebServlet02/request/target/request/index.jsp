
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
</head>
<body>

<div style="text-align:center">

    <form action="${pageContext.request.contextPath}/login" method="post">
        用户名：<input type="text" name="username"><br>
        密码：<input type="password" name="password"><br>
        爱好：
        <input type="checkbox"name="hobbys" value="唱歌">唱歌
        <input type="checkbox"name="hobbys" value="代码">代码
        <input type="checkbox"name="hobbys" value="电影">电影
        <input type="checkbox"name="hobbys" value="电脑">电脑


        <input type="submit">
    </form>
</div>

</body>
</html>
