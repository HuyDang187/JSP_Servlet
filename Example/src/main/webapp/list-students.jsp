<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/5/2023
  Time: 2:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Student Tracker App</title>
  <link type="text/css" rel="stylesheet" href="css/style.css">
  <link type="text/css" rel="stylesheet" href="css/add-student-style.css">
</head>
<body>
<div id="wrapper">
  <header id="header">
    <h1>CodeLean Academy</h1>
  </header>
</div>

<div id="container">
  <div id="content">
    <input type="button" value="Add Student" onclick="window.location.href='add-student-form.jsp';return false;" class="add-student-button">
    <table>
      <tr>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Email</th>
        <th>Action</th>
      </tr>
      <c:forEach var="tempStudent" items="${STUDENT_LIST}">
        <c:url var="tempLink" value="StudentControllerServlet">
          <c:param name="command" value="LOAD"/>
          <c:param name="studentId" value="${tempStudent.id}"/>
        </c:url>
        <c:url var="deleteLink" value="StudentControllerServlet">
          <c:param name="command" value="DELETE"/>
          <c:param name="studentId" value="${tempStudent.id}"/>
        </c:url>
        <tr>
          <td>${tempStudent.firstName}</td>
          <td>${tempStudent.lastName}</td>
          <td>${tempStudent.email}</td>
          <td>
            <a href="${tempLink}" class="update-link">Update</a>|
            <a href="${deleteLink}" class="delete-link" onclick="if (!(confirm('Are you sure you want to delete this student?'))) return false">Delete</a>
          </td>
        </tr>
      </c:forEach>
    </table>
  </div>

</div>

</body>
</html>
