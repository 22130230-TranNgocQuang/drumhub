<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giỏ hàng | DrumHub</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">

    <style>
        :root {
            --drumhub-primary: #FFD700;
            --drumhub-secondary: #FFFACD;
            --drumhub-dark: #FFA500;
            --drumhub-accent: #FF6347;
        }

        .navbar, .footer {
            background-color: var(--drumhub-primary) !important;
        }

        main {
            padding-top: 150px;
        }

        .btn-primary {
            background-color: var(--drumhub-dark);
            border-color: var(--drumhub-dark);
        }

        .btn-primary:hover {
            background-color: #FF8C00;
            border-color: #FF8C00;
        }

        .card {
            border: 1px solid var(--drumhub-secondary);
            transition: all 0.3s ease;
        }

        .card:hover {
            box-shadow: 0 5px 15px rgba(255, 215, 0, 0.3);
            transform: translateY(-5px);
        }

        .price-text {
            color: var(--drumhub-dark);
            font-weight: bold;
        }

        .btn-outline-primary {
            color: var(--drumhub-dark);
            border-color: var(--drumhub-dark);
        }

        .btn-outline-primary:hover {
            background-color: var(--drumhub-primary);
        }

        #province, #district, #ward {
            color: #000 !important;
            background-color: #fff !important;
        }

    </style>
</head>
<body>

<jsp:include page="header.jsp"/>

<main class="container my-4">
    <div class="container mt-3">
        <h2 class="mb-4">Thanh Toán Giỏ Hàng</h2>

        <c:if test="${empty cartItems}">
            <div class="alert alert-warning">Không có sản phẩm nào được chọn để thanh toán!</div>
        </c:if>

        <c:if test="${not empty cartItems}">
            <div class="row">
                <div class="col-md-6">
                    <ul class="list-group mb-4">
                        <c:set var="total" value="0"/>
                        <c:forEach var="item" items="${cartItems}">
                            <c:set var="itemTotal" value="${item.quantity * item.price}"/>
                            <c:set var="total" value="${total + itemTotal}"/>
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                <div class="d-flex align-items-center">
                                    <img src="${pageContext.request.contextPath}/assets/images/data/${item.product.image}"
                                         alt="${item.product.name}" class="me-3"
                                         style="width: 60px; height: 60px; object-fit: cover; border-radius: 5px;">
                                    <div>
                                        <h6 class="mb-1">${item.product.name}</h6>
                                        <small>Số lượng: ${item.quantity}</small>
                                    </div>
                                </div>
                                <span class="fw-bold">
                                    <fmt:formatNumber value="${itemTotal}" type="currency" currencySymbol="₫"
                                                      maxFractionDigits="0"/>
                                </span>
                            </li>
                        </c:forEach>
                    </ul>
                </div>

                <div class="col-md-6">
                    <h4>Thông Tin Thanh Toán</h4>
                    <form method="post" action="${pageContext.request.contextPath}/order">
                        <div class="mb-3">
                            <label for="fullName" class="form-label">Họ và Tên</label>
                            <input type="text" id="fullName" name="fullName" class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Tỉnh / Thành phố</label>
                            <select id="province" name="province" class="form-select" required>
                                <option value="">-- Chọn tỉnh --</option>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Quận / Huyện</label>
                            <select id="district" name="district" class="form-select" required>
                                <option value="">-- Chọn huyện --</option>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Phường / Xã</label>
                            <select id="ward" name="ward" class="form-select" required>
                                <option value="">-- Chọn xã --</option>
                            </select>
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
                            <h5>
                                Tổng Tiền:
                                <fmt:formatNumber value="${total}" type="currency" currencySymbol="₫"
                                                  maxFractionDigits="0"/>
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

<!-- JavaScript gọi API ViettelPost qua servlet trung gian -->
<script>
    const contextPath = "${pageContext.request.contextPath}";
    const provinceSelect = document.getElementById("province");
    const districtSelect = document.getElementById("district");
    const wardSelect = document.getElementById("ward");

    // Hàm tạo option
    function appendOption(selectEl, value, text) {
        const option = document.createElement("option");
        option.value = value;
        option.textContent = text;
        selectEl.appendChild(option);
    }

    // Load danh sách tỉnh
    fetch(`${contextPath}/api/viettel-address?type=province`)
        .then(res => res.json())
        .then(data => {
            console.log("[DEBUG] Provinces:", data);
            data.forEach(p => {
                appendOption(provinceSelect, p.PROVINCE_ID, p.PROVINCE_NAME);
            });
        }).catch(err => {
        console.error("Lỗi khi tải tỉnh:", err);
    });

    // Khi chọn tỉnh → load huyện
    provinceSelect.addEventListener("change", () => {
        const provinceId = provinceSelect.value;
        console.log("[DEBUG] Đã chọn tỉnh ID:", provinceId);

        districtSelect.innerHTML = "<option value=''>-- Chọn huyện --</option>";
        wardSelect.innerHTML = "<option value=''>-- Chọn xã --</option>";

        if (provinceId) {
            fetch(`${contextPath}/api/viettel-address?type=district&id=${provinceId}`)
                .then(res => res.json())
                .then(data => {
                    console.log("[DEBUG] Huyện:", data);
                    if (!Array.isArray(data)) throw new Error("Kết quả không phải mảng");
                    data.forEach(d => {
                        const option = document.createElement("option");
                        option.value = d.DISTRICT_ID;
                        option.textContent = d.DISTRICT_NAME;
                        districtSelect.appendChild(option);
                    });
                })
                .catch(err => {
                    console.error("Lỗi khi tải huyện:", err);
                });
        }
    });

    // Khi chọn huyện → load xã
    districtSelect.addEventListener("change", () => {
        const districtId = districtSelect.value;
        console.log("[DEBUG] Đã chọn huyện ID:", districtId);
        wardSelect.innerHTML = "<option value=''>-- Chọn xã --</option>";

        if (districtId) {
            fetch(`${contextPath}/api/viettel-address?type=ward&id=${districtId}`)
                .then(res => res.json())
                .then(data => {
                    console.log("[DEBUG] Xã:", data);
                    data.forEach(w => {
                        appendOption(wardSelect, w.WARD_ID, w.WARD_NAME);
                    });
                }).catch(err => {
                console.error("Lỗi khi tải xã:", err);
            });
        }
    });
</script>
</body>
</html>
