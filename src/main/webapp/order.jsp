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
                    <form id="orderForm" method="post" action="${pageContext.request.contextPath}/order">
                    <input type="hidden" name="action" value="confirmOrder" />
                        <c:forEach var="item" items="${cartItems}">
                            <input type="hidden" name="selectedCartIds" value="${item.id}" />
                        </c:forEach>
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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- JavaScript gọi API qua servlet trung gian -->
<script>
    const contextPath = "${pageContext.request.contextPath}";
    const provinceSelect = document.getElementById("province");
    const districtSelect = document.getElementById("district");
    const wardSelect = document.getElementById("ward");

    function appendOption(selectEl, value, text) {
        const cleanedValue = String(value).match(/\d+/)?.[0] || '';
        const option = document.createElement("option");
        option.value = cleanedValue;
        option.textContent = text;
        selectEl.appendChild(option);
    }

    // === 1. Load danh sách tỉnh ===
    fetch(`${contextPath}/address-proxy?type=province`)
        .then(res => res.json())
        .then(data => {
            console.log("[DEBUG] Dữ liệu tỉnh:", data);
            provinceSelect.innerHTML = "<option value=''>-- Chọn tỉnh --</option>";
            data.forEach(province => {
                console.log("[DEBUG] province.code =", province.code);
                appendOption(provinceSelect, province.code, province.name);
            });
        })
        .catch(err => {
            console.error("Lỗi khi tải tỉnh:", err);
        });

    // === 2. Khi chọn tỉnh → load huyện ===
    provinceSelect.addEventListener("change", () => {
        const selectedIndex = provinceSelect.selectedIndex;
        const rawValue = provinceSelect.value;

        console.log("%c[DEBUG] Chọn tỉnh: selectedIndex =", "color: orange", selectedIndex);
        console.log("%c[DEBUG] provinceSelect.value =", "color: orange", rawValue);

        if (rawValue.startsWith(":")) {
            console.error("VALUE SAI: Bị gán ':' vào value → Có JS khác phá!");
            console.trace();
        }

        const provinceCode = rawValue.replace(/[^\d]/g, '');
        console.log("%c[DEBUG] provinceCode sau khi làm sạch =", "color: limegreen", provinceCode);

        if (!provinceCode || isNaN(provinceCode)) {
            console.error("provinceCode không hợp lệ → huỷ fetch!");
            return;
        }

        districtSelect.innerHTML = "<option value=''>-- Chọn huyện --</option>";
        wardSelect.innerHTML = "<option value=''>-- Chọn xã --</option>";

        // ✅ Dùng URL object để build chuẩn không bị lỗi
        const url = new URL(`${contextPath}/address-proxy`, window.location.origin);
        url.searchParams.set("type", "district");
        url.searchParams.set("id", provinceCode);
        console.log("%c[DEBUG] URL fetch huyện:", "color: cyan", url.toString());

        fetch(url)
            .then(res => res.json())
            .then(data => {
                console.log("[DEBUG] Dữ liệu huyện:", data);
                if (!Array.isArray(data.districts)) {
                    console.error("Không có danh sách huyện:", data);
                    return;
                }
                data.districts.forEach(district => {
                    appendOption(districtSelect, district.code, district.name);
                });
            })
            .catch(err => {
                console.error("Lỗi khi tải huyện:", err);
            });
    });

    // === 3. Khi chọn huyện → load xã ===
    districtSelect.addEventListener("change", () => {
        const rawDistrict = districtSelect.value;
        const districtCode = rawDistrict.replace(/[^\d]/g, '');
        console.log("%c[DEBUG] districtCode =", "color: limegreen", districtCode);

        if (!districtCode || isNaN(districtCode)) {
            console.warn("⚠Mã huyện không hợp lệ.");
            return;
        }

        wardSelect.innerHTML = "<option value=''>-- Chọn xã --</option>";

        // ✅ Dùng URL object để build URL tránh lỗi
        const url = new URL(`${contextPath}/address-proxy`, window.location.origin);
        url.searchParams.set("type", "ward");
        url.searchParams.set("id", districtCode);
        console.log("%c[DEBUG] URL fetch xã:", "color: cyan", url.toString());

        fetch(url)
            .then(res => res.json())
            .then(data => {
                console.log("[DEBUG] Dữ liệu xã:", data);
                if (!Array.isArray(data.wards)) {
                    console.error("Không có danh sách xã:", data);
                    return;
                }
                data.wards.forEach(ward => {
                    appendOption(wardSelect, ward.code, ward.name);
                });
            })
            .catch(err => {
                console.error("Lỗi khi tải xã:", err);
            });
    });


    document.getElementById("orderForm").addEventListener("submit", function (e) {
        e.preventDefault(); // Ngăn form gửi mặc định

        const form = e.target;
        const formData = new FormData(form);

        const params = new URLSearchParams();
        for (const [key, value] of formData.entries()) {
            params.append(key, value);
        }

        const actionURL = form.getAttribute("action") || form.action;

        fetch(actionURL, {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            body: params.toString()
        }).then(res => res.json())
            .then(data => {
                if (data.status === "success" && data.redirect) {
                    window.location.href = data.redirect;
                } else {
                    Swal.fire("Lỗi", data.message || "Không thể xử lý đơn hàng", "error");
                }
            }).catch(err => {
            console.error(err);
            Swal.fire("Lỗi", "Đã xảy ra lỗi kết nối", "error");
        });
    });
</script>

</body>
</html>
