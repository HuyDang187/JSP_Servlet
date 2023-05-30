<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/19/2023
  Time: 1:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Demo-JSTL</title>
</head>
<body>
    <c:set var="stuff" value="<%= new java.util.Date() %>" />
    Time on the server is ${stuff}
    <hr/>
    <%
        String[] cities = {"Mumbai","Singapore","Philadelphia"};
        pageContext.setAttribute("myCities",cities);
    %>
    <c:forEach var="tempCity" items="${myCities}" >
        ${tempCity} <br/>
    </c:forEach>

</body>
</html>
