<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/25/2023
  Time: 3:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
             width: 200px;
             height: 200px;
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
    <h1>Product List</h1>
    <a class="button add-button" href="products?action=new">Add New Product</a>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Price</th>
            <th>Image</th>
            <th>Action</th>
        </tr>
        <c:forEach var="product" items="${productList}">
            <tr>
                <td>${product.id}</td>
                <td>${product.productName}</td>
                <td>${product.price}</td>
                <td><img src="${product.imageUrl}" alt="Product Image" class="image-container"> </td>
                <td>
                    <a class="button detail-button" href="products?action=details&id=${product.id}">Details</a>
                    <a class="button edit-button" href="products?action=edit&id=${product.id}">Edit</a>
                    <a class="button delete-button" href="products?action=delete&id=${product.id}"
                       onclick="return confirm('Are you sure you want to delete this product?')">Delete</a>
                </td>
        </c:forEach>
    </table>
</body>
</html>
