<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/12/2023
  Time: 4:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>HomePage</title>
</head>
<body>
    <h3>Training Portal</h3>
    <!--read the favorite programming language cookie -->
    <%
        // the default ... if there are no cookies
        String favLang = "Java";

        //get the cookies from the browser request
        Cookie[] theCookies = request.getCookies();

        //find our favorite language cookie
        if (theCookies!=null){
            for (Cookie temCookie : theCookies){
                favLang = temCookie.getValue();
                break;
            }
        }
    %>
<!--now show a personalized page .. user the "favLang" variable -->
<!--show new books for this lang -->
<h4>New Books for <%=favLang%></h4>
<ul>
    <li>. . .</li>
    <li>. . .</li>
</ul>

    <h4>Latest News Report for <%=favLang%></h4>
    <ul>
        <li>. . .</li>
        <li>. . .</li>
    </ul>

    <h4>Hot Jobs for <%=favLang%></h4>
    <ul>
        <li>. . .</li>
        <li>. . .</li>
    </ul>
<hr>
<a href="cookies-personalize-form.html">Personalize this page</a>
</body>
</html>
