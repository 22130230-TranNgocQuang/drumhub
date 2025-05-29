<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Chỉnh sửa đơn hàng</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
<div class="container mt-5">
    <h2>Chỉnh sửa trạng thái đơn hàng</h2>
    <form method="post" action="${pageContext.request.contextPath}/dashboard/orders/edit">
        <input type="hidden" name="id" value="${order.id}" />

        <div class="mb-3">
            <label class="form-label">ID đơn hàng</label>
            <input type="text" class="form-control" value="${order.id}" disabled />
        </div>

        <div class="mb-3">
            <label class="form-label">User ID</label>
            <input type="text" class="form-control" value="${order.userId}" disabled />
        </div>

        <div class="mb-3">
            <label class="form-label">Ngày đặt hàng</label>
            <input type="text" class="form-control" value="${order.orderDate}" disabled />
        </div>

        <div class="mb-3">
            <label class="form-label">Tổng giá</label>
            <input type="text" class="form-control" value="${order.totalPrice}" disabled />
        </div>

        <div class="mb-3">
            <label class="form-label">Trạng thái</label>
            <select name="status" class="form-select" required>
                <option value="pending" <c:if test="${order.status == 'pending'}">selected</c:if>>Đang xử lý</option>
                <option value="completed" <c:if test="${order.status == 'completed'}">selected</c:if>>Hoàn tất</option>
                <option value="cancelled" <c:if test="${order.status == 'cancelled'}">selected</c:if>>Đã hủy</option>
            </select>
        </div>

        <button type="submit" class="btn btn-primary">Cập nhật</button>
        <a href="${pageContext.request.contextPath}/dashboard/orders" class="btn btn-secondary ms-2">Hủy</a>
    </form>
</div>

<!-- Bootstrap Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
