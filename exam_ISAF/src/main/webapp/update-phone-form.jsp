<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/19/2023
  Time: 5:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/5/2023
  Time: 2:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Update Phone</title>
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
  <h3>Update Phone</h3>
  <form action="PhoneControllerServlet" method="GET">
    <input type="hidden" name="command" value="UPDATE">
    <input type="hidden" name="phoneId" value="${THE_PHONE.phoneId}"/>

    <table>
      <tbody>
      <tr>
        <td><label>Phone Name:</label></td>
        <td><input type="text" name="name" value="${THE_PHONE.name}"> </td>
      </tr>
      <tr>
        <td><label>Price:</label></td>
        <td><input type="text" name="price" value="${THE_PHONE.price}"> </td>
      </tr>
      <tr>
        <td><label>description:</label></td>
        <td><input type="text" name="description" value="${THE_PHONE.description}"> </td>
      </tr>
      <tr>
        <td><label>Brand:</label></td>
        <td><input type="text" name="brandId" value="${THE_PHONE.brandId}"> </td>
      </tr>
      <tr>
        <td><label></label></td>
        <td><input type="submit" value="Save" class="save"> </td>
      </tr>
      </tbody>
    </table>
  </form>
  <div style="clear:both"></div>
  <p>
    <a href="PhoneControllerServlet">Back to List</a>
  </p>
</div>
</body>
</html>

