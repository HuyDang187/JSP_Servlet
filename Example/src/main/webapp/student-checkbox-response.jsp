<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/12/2023
  Time: 3:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Student Confirmation Title</title>
</head>
<body>
    The student is confirmed: ${param.firstName} ${param.lastName}
    <br/><br/>
    Favorite Programming Languages: <br/>
<ul>
    <%
        String[] langs = request.getParameterValues("favoriteLanguage");
        for (String tempLang : langs) {
            out.println("<li>"+ tempLang + "</li>");
        }
    %>
</ul>
</body>
</html>
