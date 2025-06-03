<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách sản phẩm</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">

    <style>
        :root {
            --drumhub-primary: #FFD700; /* Màu vàng chính */
            --drumhub-secondary: #FFFACD; /* Màu vàng nhạt */
            --drumhub-dark: #FFA500; /* Màu cam vàng đậm */
            --drumhub-accent: #FF6347; /* Màu phụ tomato */
        }

        /* Nền header/footer */
        .navbar, .footer {
            background-color: var(--drumhub-primary) !important;
        }

        main {
            padding-top: 150px;
        }

        /* Nút chính */
        .btn-primary {
            background-color: var(--drumhub-dark);
            border-color: var(--drumhub-dark);
        }

        .btn-primary:hover {
            background-color: #FF8C00;
            border-color: #FF8C00;
        }

        /* Card sản phẩm */
        .card {
            border: 1px solid var(--drumhub-secondary);
            transition: all 0.3s ease;
        }

        .card:hover {
            box-shadow: 0 5px 15px rgba(255, 215, 0, 0.3);
            transform: translateY(-5px);
        }

        /* Badge trạng thái */
        .bg-success {
            background-color: #28a745 !important; /* Giữ màu xanh cho trạng thái còn hàng */
        }

        .bg-secondary {
            background-color: #6c757d !important; /* Giữ màu xám cho hết hàng */
        }

        /* Giá sản phẩm */
        .price-text {
            color: var(--drumhub-dark);
            font-weight: bold;
        }

        /* Hiệu ứng hover nút */
        .btn-outline-primary {
            color: var(--drumhub-dark);
            border-color: var(--drumhub-dark);
        }

        .btn-outline-primary:hover {
            background-color: var(--drumhub-primary);
        }
    </style>
</head>
<body>

<jsp:include page="header.jsp"/>

<main class="container my-4">
    <div class="container mt-3">
        <h2 class="mb-4">Thanh Toán Nhanh</h2>
        <c:if test="${empty buyNowItem}">
            <div class="alert alert-warning">Không tìm thấy sản phẩm mua ngay!</div>
        </c:if>
        <c:if test="${not empty buyNowItem}">
            <div class="row">
                <div class="col-md-6">
                    <ul class="list-group mb-4">
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            <div class="d-flex align-items-center">
                                <img src="${pageContext.request.contextPath}/assets/images/data/${buyNowItem.product.image}"
                                     alt="${buyNowItem.product.name}" class="me-3"
                                     style="width: 60px; height: 60px; object-fit: cover; border-radius: 5px;">
                                <div>
                                    <h5 class="mb-1">${buyNowItem.product.name}</h5>
                                    <p class="mb-0">Số lượng: ${buyNowItem.quantity}</p>
                                </div>
                            </div>
                            <span class="fw-bold">
                            <fmt:formatNumber value="${buyNowItem.product.price * buyNowItem.quantity}" type="currency"
                                              currencySymbol="₫" maxFractionDigits="0"/>
                        </span>
                        </li>
                    </ul>
                </div>
                <div class="col-md-6">
                    <h4>Thông Tin Thanh Toán</h4>
                    <form method="post" action="${pageContext.request.contextPath}/checkout">
                        <input type="hidden" name="buynow" value="1"/>
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
                        <div class="d-flex justify-content-between align-items-center">
                            <h5>Tổng Tiền:
                                <fmt:formatNumber value="${buyNowItem.product.price * buyNowItem.quantity}"
                                                  type="currency" currencySymbol="₫" maxFractionDigits="0"/>
                            </h5>
                            <button type="submit" class="btn btn-success">Xác Nhận Đơn Hàng</button>
                        </div>
                    </form>
                </div>
            </div>
        </c:if>
    </div>
</main>

<jsp:include page="footer.jsp"/>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.getElementById("checkoutForm")?.addEventListener('submit', function (e) {
        e.preventDefault();
        let form = this;
        let submitButton = form.querySelector("button[type='submit']");
        submitButton.disabled = true;

        let formData = new FormData(form);

        formData.set("buynow", "1");

        fetch(form.action, {
            method: "POST",
            body: formData
        })
            .then(res => res.json())
            .then(data => {
                if (data.success) {
                    alert(data.message || "Đặt hàng thành công!");
                    window.location.href = "${pageContext.request.contextPath}/home";
                } else {
                    alert(data.message || "Có lỗi xảy ra. Vui lòng thử lại!");
                    submitButton.disabled = false;
                }
            })
            .catch(() => {
                alert("Đã xảy ra lỗi hệ thống!");
                submitButton.disabled = false;
            });
    });
</script>
</body>
</html>