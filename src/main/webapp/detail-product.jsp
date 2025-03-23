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

<%}%>
</body>
</html>
