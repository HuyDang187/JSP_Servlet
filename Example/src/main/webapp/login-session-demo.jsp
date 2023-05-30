<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/15/2023
  Time: 4:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
  String name = request.getParameter("username");
  out.println("Welcome,"+name);
  session.setAttribute("user",name);
%>
<hr/>
<%
    String name1 = (String)session.getAttribute("user");
    out.println("Hello : "+name1);
%>
</body>
</html>
