<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/31/2023
  Time: 2:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Student Detail</title>
</head>
<body>
<h1>Student detail</h1>
<form>
    <p>Student ID : ${student.id}</p>
    <p>Name : ${student.name}</p>
    <p>Exam Score : ${student.examScores}</p>
    <img src="${student.imageUrl}" alt="Image Student">
</form>
</body>
</html>
