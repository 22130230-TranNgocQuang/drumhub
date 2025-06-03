<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Chi tiết & Chỉnh sửa Đơn hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
<div class="container mt-5">
    <h2>Chi tiết đơn hàng #${order.id}</h2>

    <!-- Thông tin người đặt -->
    <h4 class="mt-4">Thông tin người đặt</h4>
    <form method="post" action="${pageContext.request.contextPath}/dashboard/order/detail">
        <input type="hidden" name="orderId" value="${order.id}" />

        <div class="mb-3">
            <label class="form-label">Họ tên</label>
            <input type="text" class="form-control" name="fullName" value="${user.fullName}" required />
        </div>
        <div class="mb-3">
            <label class="form-label">Email</label>
            <input type="email" class="form-control" name="email" value="${user.email}" required />
        </div>

        <!-- Trạng thái đơn hàng -->
        <h4 class="mt-4">Trạng thái đơn hàng</h4>
        <div class="mb-3">
            <label class="form-label">Trạng thái</label>
            <select name="status" class="form-select" required>
                <option value="pending" <c:if test="${order.status == 'pending'}">selected</c:if>>Đang xử lý</option>
                <option value="completed" <c:if test="${order.status == 'completed'}">selected</c:if>>Hoàn tất</option>
                <option value="cancelled" <c:if test="${order.status == 'cancelled'}">selected</c:if>>Đã hủy</option>
            </select>
        </div>

        <!-- Danh sách sản phẩm -->
        <h4 class="mt-4">Sản phẩm trong đơn hàng</h4>
        <c:forEach var="item" items="${items}">
            <div class="card mb-3">
                <div class="row g-0 align-items-center">
                    <div class="col-md-2">
                        <img src="${pageContext.request.contextPath}/images/products/${item.productImage}" alt="${item.productName}" width="100">
                        </div>
                    <div class="col-md-10">
                        <div class="card-body">
                            <h5 class="card-title">${item.productName}</h5>
                            <input type="hidden" name="cartId" value="${item.cartId}" />
                            <div class="row">
                                <div class="col-md-6 mb-2">
                                    <label>Số lượng</label>
                                    <input type="number" name="quantities" class="form-control" value="${item.quantity}" min="1" required />
                                </div>
                                <div class="col-md-6 mb-2">
                                    <label>Giá</label>
                                    <input type="number" name="prices" class="form-control" value="${item.price}" step="0.01" min="0" required />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>

        <button type="submit" class="btn btn-success">Cập nhật đơn hàng</button>
        <a href="${pageContext.request.contextPath}/dashboard/order" class="btn btn-secondary ms-2">Quay lại</a>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
