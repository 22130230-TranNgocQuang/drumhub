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

<form method="post" action="cart">
    <input type="hidden" name="action" value="addCart">
    <input type="hidden" name="productId" value="<%= product.getId() %>" readonly>

    <input type="number" name="quantity" value="1">

    <input type="hidden" name="price" value="<%= product.getPrice()%>">

    <button type="submit">Update Product</button>
</form>
<%--<c:if test="${not empty result}">--%>
<%--    <c:choose>--%>
<%--        <c:when test="${result}">--%>
<%--            <p style="color: green;">Thêm sản phẩm vào giỏ hàng thành công!</p>--%>
<%--        </c:when>--%>
<%--        <c:otherwise>--%>
<%--            <p style="color: red;">Thêm sản phẩm thất bại!</p>--%>
<%--        </c:otherwise>--%>
<%--    </c:choose>--%>
<%--</c:if>--%>

<%}%>
</body>
</html>
