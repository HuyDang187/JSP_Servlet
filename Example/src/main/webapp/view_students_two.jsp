<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/24/2023
  Time: 3:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Student_Demo</title>
    <style>
        table, td, th {
            border: 1px solid;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
    </style>
</head>
<body>
    <h1>Student Table Demo</h1>
    <table>
        <tr>
            <th>ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Status</th>
        </tr>

            <c:forEach var="tempStudent" items="${student_list}">
                <tr>
                    <th>${tempStudent.id}</th>
                    <th>${tempStudent.firstName}</th>
                    <th>${tempStudent.lastName}</th>
                    <th><c:if test="${tempStudent.active}">
                        On
                    </c:if>
                        <c:if test="${not tempStudent.active}">
                            Off
                        </c:if>
                    </th>
                </tr>
            </c:forEach>


    </table>
</body>
</html>
