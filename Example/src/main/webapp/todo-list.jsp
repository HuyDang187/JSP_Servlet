<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/15/2023
  Time: 1:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<html>
<body>

<!-- Step 1: Create HTML form-->
<form action="todo-list.jsp">
    Add new item: <input type="text" name="theItem" />
    <input type="submit" value="Submit"/>
</form>
<!-- Step 2: Add item to "To Do" list-->
<%
    List<String> items = (List<String>) session.getAttribute("myToDoList");
    if (items == null){
        items = new ArrayList<String>();
        session.setAttribute("myToDoList",items);
    }
    String theItem = request.getParameter("theItem");
    if (theItem != null){
        items.add(theItem);
    }
%>

<hr>
<b>To List Items:</b><br/>
<ol>
    <%
        for (String temp : items){
            out.println("<li>"+temp+"</li>");
        }
    %>
</ol>

</body>
</html>
