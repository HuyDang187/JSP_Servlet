<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/15/2023
  Time: 2:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="login-demo.jsp">
    Username :<input type="text" name="username"/>
    <br/> Password :<input type="text" name="password"/>
    <br/><br/> <input type="submit" value="Login" /> <input type="reset" value="Reset"/>
</form>
<%
    String username = request.getParameter("username");
    String password =request.getParameter("password");
    Cookie theCookie = new Cookie("myapp.username",username);
    Cookie theCookiepass = new Cookie("myapp.password",password);
    theCookie.setMaxAge(60*60*24*365); // <---For one year
    theCookiepass.setMaxAge(60*60*24*365); // <---For one year

    //send cookie to browser
    response.addCookie(theCookie);
    response.addCookie(theCookiepass);
%>
</body>
</html>
