<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<div style="display: flex; gap:100px">
    <div>
        <p><strong>ID đơn hàng:</strong> ${order.id}</p>
        <p><strong>Tổng tiền:</strong> ${order.totalAmount}</p>
        <div class="mb-3">
            <label for="status" class="form-label"><strong>Trạng thái:</strong></label>
            <span id="status">
        <c:choose>
            <c:when test="${order.status == 0}">Chờ xử lý</c:when>
            <c:when test="${order.status == 1}">Hoàn thành</c:when>
            <c:when test="${order.status == 2}">Đã hủy</c:when>
            <c:otherwise>Không xác định</c:otherwise>
        </c:choose>
    </span>
        </div>

    </div>
    <div>
        <p><strong>Ngày đặt hàng:</strong> ${order.orderDate}</p>
        <p><strong>Ngày tạo đơn hàng:</strong> ${order.createdAt}</p>
        <p><strong>Ngày sửa đơn hàng:</strong> ${order.updatedAt}</p>
        <p><strong>Ngày xóa đơn hàng:</strong> ${order.deletedAt}</p>
    </div>
</div>
<h4>Danh sách sản phẩm</h4>
<table class="table table-bordered">
    <thead>
    <tr>
        <th>#</th>
        <th>Mã sản phẩm</th>
        <th>Số lượng</th>
        <th>Giá</th>
        <th>Thành tiền</th>
        <th>Thao tác</th>

    </tr>
    </thead>
    <tbody>
    <c:forEach var="item" items="${order.items}">
        <tr>
            <td>${item.id}</td>
            <td>${item.productId}</td>
            <td>${item.quantity}</td>
            <td>${item.price}</td>
            <td>${item.quantity * item.price}</td>
            <td>
                <form action="${pageContext.request.contextPath}/dashboard/orders/${order.id}/edit" method="GET"
                      style="display:inline;">
                    <button type="submit" class="btn btn-primary btn-sm">Sửa</button>
                </form>
                <form action="${pageContext.request.contextPath}/dashboard/orders/${order.id}" method="POST" style="display:inline;" onsubmit="return confirm('Bạn có chắc muốn xóa sản phẩm này không?');">
                    <input type="hidden" name="orderId" value="${order.id}">
                    <input type="hidden" name="productId" value="${item.productId}">
                    <button type="submit" class="btn btn-danger btn-sm">Xóa</button>
                </form>

            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
