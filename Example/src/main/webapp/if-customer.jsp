<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/19/2023
  Time: 3:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="tagdemo.Customer"  contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%
    List<Customer> data = new ArrayList<>();
    data.add(new Customer("Dang","Huy",false));
    data.add(new Customer("Dang","A",false));
    data.add(new Customer("Dang","B",true));
    pageContext.setAttribute("myCustomers",data);
%>
<html>
<head>
    <title>Choose-Customer-demo</title>
    <style>
        table{
            border-collapse: collapse;
            border: 2px solid #eee;
            width: 100%;
            margin: 20px 0;
            font: 12px/20px sans-serif;
        }
        th,td{
            padding: 8px;
        }

        th{
            background-color: #eee;
            text-align: left;
            font-weight: bold;
        }
        td{
            background-color: #fff;
            text-align: center;
        }
        td.special{
            font-style: italic;
            color: #666;
        }
    </style>
</head>
<body>
<table border="1">
    <tr>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Gold Customer</th>
    </tr>
    <c:forEach var="temCustomer" items="${myCustomers}">
        <tr>
            <td>${temCustomer.firstName}</td>
            <td>${temCustomer.lastName}</td>
            <td>
                <c:if test="${temCustomer.goldCustomer}">
                    Special Discount
                </c:if>
                <c:if test="${not temCustomer.goldCustomer}">
                    -
                </c:if>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
