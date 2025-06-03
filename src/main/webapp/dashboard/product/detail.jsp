<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Chi tiết sản phẩm</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
            display: flex;
            justify-content: center;
            align-items: center;
            padding-top: 40px;
        }

        .container {
            width: 600px;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
        }

        .form-group {
            margin-bottom: 18px;
        }

        label {
            display: block;
            margin-bottom: 6px;
            font-weight: bold;
            color: #555;
        }

        input, select, textarea {
            width: 100%;
            padding: 10px;
            font-size: 15px;
            border-radius: 5px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        .product-image {
            display: block;
            margin: 15px auto;
            width: 400px;
            height: 400px;
            object-fit: cover;
            border-radius: 10px;
            border: 1px solid #ddd;
        }

        .buttons {
            text-align: center;
            margin-top: 25px;
        }

        .btn-save, .btn-back {
            padding: 10px 20px;
            font-size: 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn-save {
            background-color: #28a745;
            color: white;
            margin-right: 10px;
        }

        .btn-back {
            background-color: #6c757d;
            color: white;
        }

        .btn-save:hover {
            background-color: #218838;
        }

        .btn-back:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Chi tiết & Chỉnh sửa Sản phẩm</h2>

    <form action="${pageContext.request.contextPath}/dashboard/product" method="post">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="id" value="${product.id}">

        <div class="form-group">
            <label for="name">Tên sản phẩm</label>
            <input type="text" id="name" name="name" value="${product.name}" required>
        </div>

        <div class="form-group">
            <label>Ảnh hiện tại</label>
            <img src="${pageContext.request.contextPath}/assets/images/products/${product.image}"
                 class="product-image" alt="${product.name}">
        </div>

        <div class="form-group">
            <label for="image">Tên file ảnh mới (nếu muốn thay)</label>
            <input type="text" id="image" name="image" value="${product.image}">
        </div>

        <div class="form-group">
            <label for="price">Giá sản phẩm</label>
            <input type="number" id="price" name="price" value="${product.price}" required step="0.01">
        </div>

        <div class="form-group">
            <label for="categoryId">Danh mục</label>
            <select id="categoryId" name="categoryId" required>
                <c:forEach items="${categories}" var="cate">
                    <option value="${cate.id}" ${cate.id == product.categoryId ? 'selected' : ''}>
                            ${cate.name}
                    </option>
                </c:forEach>
            </select>
        </div>

        <div class="form-group">
            <label for="status">Trạng thái</label>
            <select name="status" id="status">
                <option value="true" ${product.status ? 'selected' : ''}>Hiển thị</option>
                <option value="false" ${!product.status ? 'selected' : ''}>Ẩn</option>
            </select>
        </div>

        <div class="buttons">
            <button type="submit" class="btn-save">Lưu thay đổi</button>
            <a href="${pageContext.request.contextPath}/dashboard/product" class="btn-back">Quay lại</a>
        </div>
    </form>
</div>

</body>
</html>
