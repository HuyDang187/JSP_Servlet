<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/19/2023
  Time: 4:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Phone</title>
    <link type="text/css" rel="stylesheet" href="css/style.css">
    <link type="text/css" rel="stylesheet" href="css/add-student-style.css">
</head>
<body>
<div id="wrapper">
    <div id="header">
        <h2>Phone</h2>

    </div>
</div>
<div id="container">
    <h3>Add Student</h3>
    <form action="PhoneControllerServlet" method="GET">
        <input type="hidden" name="command" value="ADD">

        <table>
            <tr>
                <td><label>Phone Name :</label></td>
                <td><input type="text" name="name"></td>
            </tr>
            <tr>
                <td><label>Price:</label></td>
                <td><input type="text" name="price"></td>
            </tr>
            <tr>
                <td><label> Description:</label></td>
                <td><input type="text" name="description"></td>
            </tr>
            <tr>
                <td><label> BrandId:</label></td>
                <td><input type="text" name="brandId"></td>
            </tr>
            <tr>
                <td><label></label></td>
                <td><input type="submit" value="Save" class="save"></td>
            </tr>
        </table>
    </form>
    <div style="clear:both;"></div>
    <p>
        <a href="PhoneControllerServlet">Back to List</a>
    </p>
</div>
</body>
</html>
