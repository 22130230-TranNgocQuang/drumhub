<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <title>Admin Dashboard - Thêm sản phẩm mới</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f8f9fa;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 2rem;
        }

        h2 {
            margin-bottom: 2rem;
        }

        .form-card {
            width: 100%;
            max-width: 600px;
            background: white;
            padding: 2rem;
            border-radius: 0.5rem;
            box-shadow: 0 0 15px rgb(0 0 0 / 0.1);
        }
    </style>
</head>

<body>
<h2 class="text-center">Thêm sản phẩm mới</h2>

<form method="post" action="${pageContext.request.contextPath}/dashboard/product" enctype="multipart/form-data" class="form-card">
    <input type="hidden" name="action" value="create" />

    <div class="mb-3">
        <label for="name" class="form-label">Tên sản phẩm</label>
        <input type="text" class="form-control" id="name" name="name" required />
    </div>

    <div class="mb-3">
        <label for="image" class="form-label">Chọn ảnh sản phẩm</label>
        <input type="file" class="form-control" id="image" name="image" accept="image/*" required />
    </div>

    <div class="mb-3">
        <label for="price" class="form-label">Giá</label>
        <input type="number" class="form-control" id="price" name="price" step="0.01" required />
    </div>

    <div class="mb-3">
        <label for="status" class="form-label">Trạng thái</label>
        <select class="form-select" id="status" name="status" required>
            <option value="true">Hiển thị</option>
            <option value="false">Ẩn</option>
        </select>
    </div>

    <div class="mb-4">
        <label for="categoryId" class="form-label">Danh mục</label>
        <select class="form-select" id="categoryId" name="categoryId" required>
            <c:forEach var="cat" items="${categories}">
                <option value="${cat.id}">${cat.name}</option>
            </c:forEach>
        </select>
    </div>

    <div class="d-flex justify-content-center gap-3">
        <button type="submit" class="btn btn-primary px-4">Thêm sản phẩm</button>
        <a href="${pageContext.request.contextPath}/dashboard/product" class="btn btn-secondary px-4">Hủy</a>
    </div>
</form>
</body>
</html>
