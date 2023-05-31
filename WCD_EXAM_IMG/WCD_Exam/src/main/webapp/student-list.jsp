<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/31/2023
  Time: 2:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Product List</title>
    <style>
        .add-button {

            border: solid;
            background-color: green;
            font-style: initial;
            font-family: sans-serif;
            color: white;
            padding: 12px;
            margin-bottom: 0;
            display: inline-block;
            border-radius: 10px;
            text-decoration: none;

        }

        .button {
            border: solid;
            background-color: green;
            font-style: initial;
            font-family: sans-serif;
            color: white;
            display: inline-block;
            border-radius: 10px;
            text-decoration: none;
            padding: 10px;
        }
        .delete-button {
            background-color: red;
        }
        table{
            width: 100%;
            border-collapse: collapse;
        }
        tr{
            border-bottom: 1px solid grey;
        }
        th {
            text-align: left;
        }
        th,td{
            border-bottom: 1px solid grey;
            padding: 12px;
        }
        .image-container {
            width: 120px;
            height: 120px;
            border: 1px solid #ccc;
            border-radius: 5px;
            overflow: hidden;
        }
        .image-container img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

    </style>
</head>
<body>
<h1>Student List</h1>
<a class="button add-button" href="students?action=new">Add New Student</a>
<table>
    <tr>
        <th>ID</th>
        <th>Avatar</th>
        <th>Name</th>
        <th>ExamScores</th>
        <th>Action</th>
    </tr>
    <c:forEach var="student" items="${studentList}">
    <tr>
        <td>${student.id}</td>
        <td><img src="${student.imageUrl}" alt="Student Image" class="image-container"> </td>
        <td>${student.name}</td>
        <td>${student.examScores}</td>

        <td>
            <a class="button detail-button" href="students?action=details&id=${student.id}">Details</a>
            <a class="button edit-button" href="students?action=edit&id=${student.id}">Edit</a>
            <a class="button delete-button" href="students?action=delete&id=${student.id}"
               onclick="return confirm('Are you sure you want to delete this product?')">Delete</a>
        </td>
        </c:forEach>
</table>
</body>
</html>
