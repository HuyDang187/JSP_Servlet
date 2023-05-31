<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/31/2023
  Time: 2:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<html>
<head>
    <title>Student Form</title>
    <style></style>
</head>
<body>
<h1>Student Form</h1>
<c:choose>
    <c:when test="${empty student.id}">
        <form method="POST" action="students?action=create" enctype="multipart/form-data">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name"/>
            <br/><br/>
            <label for="examScores">ExamScores:</label>
            <input type="text" id="examScores" name="examScores"/>
            <br/><br/>
            <label for="image">Avatar:</label>
            <input type="file" id="image" name="image">
            <br/><br/>
            <input type="submit" value="Create"/>
            <a class="button" href="students">Cancel</a>
        </form>
    </c:when>
    <c:otherwise>
        <form method="POST" action="students?action=update" enctype="multipart/form-data">
            <input type="hidden" id="id" name="id" value="${student.id}">
            <label for="name">Name :</label>
            <input type="text" id="name" name="name" value="${student.name}">
            <br/><br/>
            <label for="examScores">ExamScores :</label>
            <input type="text" id="examScores" name="examScores" value="${student.examScores}">
            <br/><br/>
            <label for="image">Avatar:</label>
            <input type="file" id="image" name="image">
            <br/><br/>
            <input type="submit" value="Update">
            <a class="button" href="students">Cancel</a>

        </form>
        <form method="POST" action="students?action=delete">
            <input type="hidden" name="id" value="${student.id}">
            <input class="button" type="submit" value="Delete">
        </form>
    </c:otherwise>
</c:choose>
</body>
</html>
