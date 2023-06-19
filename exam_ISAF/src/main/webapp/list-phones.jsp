<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/19/2023
  Time: 3:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        <h1>PHONE</h1>
    </header>
</div>

<div id="container">
    <div id="content">
        <input type="button" value="Add Student" onclick="window.location.href='add-phone-form.jsp';return false;" class="add-student-button">
        <table>
            <tr>
                <th>Id</th>
                <th>Product Name</th>
                <th>Price</th>
                <th>Brand</th>
                <th>Description</th>
                <th>Action</th>
            </tr>
            <c:forEach var="tempPhone" items="${PHONE_LIST}">
                <c:url var="tempLink" value="PhoneControllerServlet">
                    <c:param name="command" value="LOAD"/>
                    <c:param name="phoneId" value="${tempPhone.phoneId}"/>
                </c:url>
                <c:url var="deleteLink" value="PhoneControllerServlet">
                    <c:param name="command" value="DELETE"/>
                    <c:param name="phoneId" value="${tempPhone.phoneId}"/>
                </c:url>
                <tr>
                    <td>${tempPhone.phoneId}</td>
                    <td>${tempPhone.name}</td>
                    <td>${tempPhone.price}</td>
                    <td>${tempPhone.brandId}</td>
                    <td>${tempPhone.description}</td>
                    <td>
                        <a href="${tempLink}" class="update-link">Update</a>|
                        <a href="${deleteLink}" class="delete-link" onclick="if (!(confirm('Are you sure you want to delete this Phone?'))) return false">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>

</div>

</body>
</html>
