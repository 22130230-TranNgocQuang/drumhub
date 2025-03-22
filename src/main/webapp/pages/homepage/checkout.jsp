<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<div class="container mt-5">
    <h2 class="text-start mb-4">Thanh Toán</h2>

    <!-- Thông báo kết quả -->
    <div id="successMessage" class="alert d-none"></div>

    <div class="row">
        <!-- Giỏ hàng -->
        <div class="col-md-6">
            <h4>Giỏ Hàng</h4>
            <c:choose>
                <c:when test="${empty cart.items}">
                    <p>Giỏ hàng của bạn đang trống!</p>
                </c:when>
                <c:otherwise>
                    <ul class="list-group mb-4">
                        <c:forEach var="item" items="${cart.items}">
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                <div class="d-flex align-items-center">
                                    <img src="${pageContext.request.contextPath}/assets/images/data/${item.product.image}"
                                         alt="${item.product.name}" class="me-3"
                                         style="width: 60px; height: 60px; object-fit: cover; border-radius: 5px;">
                                    <div>
                                        <h5 class="mb-1">${item.product.name}</h5>
                                        <p class="mb-0">Số lượng: ${item.quantity}</p>
                                    </div>
                                </div>
                                <span class="fw-bold">
                                    <fmt:formatNumber value="${item.product.salePrice * item.quantity}" type="currency" currencySymbol="₫"/>
                                </span>
                            </li>
                        </c:forEach>
                    </ul>
                </c:otherwise>
            </c:choose>
        </div>

        <!-- Thông tin thanh toán -->
        <div class="col-md-6">
            <h4>Thông Tin Thanh Toán</h4>
            <form id="checkoutForm" action="${pageContext.request.contextPath}/checkout" method="post">
                <div class="mb-3">
                    <label for="fullName" class="form-label">Họ và Tên</label>
                    <input type="text" id="fullName" name="fullName" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label for="address" class="form-label">Địa Chỉ</label>
                    <input type="text" id="address" name="address" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label for="phone" class="form-label">Số Điện Thoại</label>
                    <input type="text" id="phone" name="phone" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label for="paymentMethod" class="form-label">Phương Thức Thanh Toán</label>
                    <select id="paymentMethod" name="paymentMethod" class="form-select" required>
                        <option value="cod">Thanh toán khi nhận hàng (COD)</option>
                        <option value="credit">Thẻ tín dụng/Ghi nợ</option>
                        <option value="momo">Ví MoMo</option>
                    </select>
                </div>

                <c:if test="${not empty cart.items}">
                    <div class="d-flex justify-content-between align-items-center">
                        <h5>Tổng Tiền:
                            <fmt:formatNumber value="${cart.total}" type="currency" currencySymbol="₫"/>
                        </h5>
                        <button type="submit" class="btn btn-success">Xác Nhận Đơn Hàng</button>
                    </div>
                </c:if>
            </form>
        </div>
    </div>
</div>

<script>
    document.querySelector("form").onsubmit = function (e) {
        e.preventDefault(); // Chặn submit mặc định

        let form = this;
        let submitButton = form.querySelector("button[type='submit']");

        submitButton.disabled = true; // Vô hiệu hóa nút để tránh spam

        fetch(form.action, {
            method: "POST",
            body: new FormData(form)
        })
            .then(response => response.json()) // Chắc chắn xử lý JSON
            .then(data => {
                if (data.success) {
                    alert(data.message); // Hiển thị thông báo đặt hàng thành công
                    window.location.href = "/home"; // Chuyển hướng sau khi nhấn OK
                } else {
                    alert("Có lỗi xảy ra. Vui lòng thử lại!");
                    submitButton.disabled = false; // Bật lại nút nếu có lỗi
                }
            })
            .catch(error => {
                console.error("Lỗi khi đặt hàng:", error);
                alert("Đã xảy ra lỗi. Vui lòng thử lại.");
                submitButton.disabled = false;
            });
    };

</script>
