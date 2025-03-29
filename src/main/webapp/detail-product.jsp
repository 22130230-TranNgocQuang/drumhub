<%@ page import="com.example.drumhub.dao.models.Product" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Chi Tiết Sản Phẩm</title>
</head>
<body>
<%
    Product product = (Product) request.getAttribute("product");
    if (product != null) {
%>

<p><%= product.getId()%>
</p>
<p><%= product.getName()%>
</p>
<p><%= product.getPrice()%>
</p>
<img src="<%= product.getImage()%>" alt="">
<a href="cart?action=addCart&id=<%=product.getId()%>">Them vao gio hang</a>
<input type="number" name="quantity" value="1">

<form method="post" action="cart">
    <input type="hidden" name="action" value="addCart">
    <label for="id">Product ID:</label>
    <input type="text" id="id" name="id" value="<%= request.getParameter("id") %>" readonly>

    <label for="name">Product Name:</label>
    <input type="text" id="name" name="name" placeholder="Enter product name" required>

    <label for="description">Description:</label>
    <input type="text" id="description" name="description" placeholder="Enter description" required>

    <label for="status">Status:</label>
    <select id="status" name="status">
        <option value="true">Active</option>
        <option value="false">Inactive</option>
    </select>

    <button type="submit">Update Product</button>
</form>

<%}%>
</body>
</html>
