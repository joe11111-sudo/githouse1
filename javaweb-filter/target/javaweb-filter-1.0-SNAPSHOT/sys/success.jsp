<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    Object userSession = request.getSession().getAttribute("USER_SESSION");
    if(userSession==null){
        response.sendRedirect("/Login.jsp");
    }
%>
<h1>主页</h1>
<p><a href="/servlet/login">注销</a> </p>
</body>
</html>
