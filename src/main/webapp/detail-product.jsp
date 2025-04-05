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

<div class="product-detail">
    <!-- Product Image -->
    <div class="product-image">
        <img src="<%= product.getImage() %>" alt="<%= product.getName() %>">
    </div>

    <!-- Product Info -->
    <div class="product-info">
        <h2><%= product.getName() %></h2>
        <p class="price">
            <fmt:formatNumber value="<%= product.getPrice() %>" type="currency" currencySymbol="₫"/>
        </p>

        <div class="description">
            <h4>Mô tả sản phẩm:</h4>
            <p><%= product.getCategoryId() %></p>
        </div>

        <!-- Quantity Input and Add to Cart Button -->
        <div class="quantity">
            <label for="quantity">Số lượng:</label>
            <input type="number" id="quantity" name="quantity" value="1" min="1" />
            <a href="cart?action=addCart&id=<%= product.getId() %>&quantity=<%= product.getPrice() %>"
               class="btn">Thêm vào giỏ hàng</a>
        </div>
    </div>
</div>

<!-- Update Product Form -->
<div class="form-container">
    <h3>Cập nhật sản phẩm</h3>
    <form method="post" action="cart">
        <input type="hidden" name="action" value="updateProduct">
        <input type="hidden" name="id" value="<%= product.getId() %>" />

        <label for="name">Tên sản phẩm:</label>
        <input type="text" id="name" name="name" value="<%= product.getName() %>" required />

        <label for="description">Mô tả:</label>
        <input type="text" id="description" name="description" value="<%= product.getCategoryId() %>" required />

        <label for="price">Giá:</label>
        <input type="number" id="price" name="price" value="<%= product.getPrice() %>" required />

        <label for="status">Trạng thái:</label>
        <select id="status" name="status">
            <option value="true" <%= product.isStatus() ? "selected" : "" %>>Kích hoạt</option>
            <option value="false" <%= !product.isStatus() ? "selected" : "" %>>Không kích hoạt</option>
        </select>

        <button type="submit" class="btn">Cập nhật sản phẩm</button>
    </form>
</div>

<% } else { %>
<p>Sản phẩm không tồn tại.</p>
<% } %>

</body>
</html>
