<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/24/2023
  Time: 5:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<html>
<head>
    <title>Product Form</title>
    <style></style>
</head>
<body>
<h1>Product Form</h1>
<c:choose>
    <c:when test="${empty product.id}">
        <form method="POST" action="products?action=create" enctype="multipart/form-data">
            <label for="productName">Name:</label>
            <input type="text" id="productName" name="productName"/>
            <br/><br/>
            <label for="price">Price:</label>
            <input type="text" id="price" name="price"/>
            <br/><br/>
            <label for="image">Image:</label>
            <input type="file" id="image" name="image">
            <br/><br/>
            <input type="submit" value="Create"/>
            <a class="button" href="products">Cancel</a>
        </form>
    </c:when>
    <c:otherwise>
        <form method="POST" action="products?action=update" enctype="multipart/form-data">
            <input type="hidden" id="id" name="id" value="${product.id}">
            <label for="productName">Name :</label>
            <input type="text" id="productName" name="productName" value="${product.productName}">
            <br/><br/>
            <label for="price">Price :</label>
            <input type="text" id="price" name="price" value="${product.price}">
            <br/><br/>
            <label for="image">Image:</label>
            <input type="file" id="image" name="image">
            <br/><br/>
            <input type="submit" value="Update">
            <a class="button" href="products">Cancel</a>

        </form>
        <form method="POST" action="products?action=delete">
            <input type="hidden" name="id" value="${product.id}">
            <input class="button" type="submit" value="Delete">
        </form>
    </c:otherwise>
</c:choose>
</body>
</html>
