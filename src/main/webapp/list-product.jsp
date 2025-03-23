<%@ page import="java.util.List" %>
<%@ page import="com.example.drumhub.dao.models.Product" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "f" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="products" method="get">
    <input type="hidden" name="action" value="search">
    Search: <input type="text" name="keyword">
    <input type="submit" value="Search">
</form>

<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Description</th>
        <th>Status</th>
        <th>Actions</th>
    </tr>
    <%
        List<Product> products = (List<Product>) request.getAttribute("products");
        for (Product p : products) {
    %>
    <tr>
        <td><%= p.getId() %>
        </td>
        <td><%= p.getName() %>
        </td>
        <td><%= p.getImage() %>
        </td>
        <td><%= p.isStatus() ? "Active" : "Inactive" %>
        </td>
        <td>
            <a href="products?action=edit&id=<%= p.getId() %>">Edit</a> |
            <a href="products?action=delete&id=<%= p.getId() %>" onclick="return confirm('Are you sure?')">Delete</a>
        </td>
    </tr>
    <% } %>
</table>

</body>
</html>
