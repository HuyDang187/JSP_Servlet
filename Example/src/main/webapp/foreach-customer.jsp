<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/19/2023
  Time: 2:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="tagdemo.Customer" contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<%
    List<Customer> data = new ArrayList<>();
    data.add(new Customer("Dang","Huy",false));
    data.add(new Customer("Dang","A",false));
    data.add(new Customer("Dang","B",false));
    pageContext.setAttribute("myCustomers",data);
%>
<html>
<head>
    <title>Customer-Foreach</title>
</head>
<body>
   <table border="1">
       <tr>
           <th>First Name</th>
           <th>Last Name</th>
           <th>Gold Customer</th>
       </tr>
       <c:forEach var="tempCustomer" items="${myCustomers}">
           <tr>
               <th>${tempCustomer.firstName}</th>
               <th>${tempCustomer.lastName}</th>
               <th>${tempCustomer.goldCustomer}</th>
           </tr>
       </c:forEach>
   </table>
</body>
</html>
