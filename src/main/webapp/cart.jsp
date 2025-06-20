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
    </style>
</head>
<body>

<jsp:include page="header.jsp"/>

<main class="container my-4">
    <h2 class="mb-4">Giỏ hàng của bạn</h2>

    <c:choose>
        <c:when test="${empty cartItems}">
            <div class="alert alert-warning">Giỏ hàng của bạn đang trống.</div>
        </c:when>
        <c:otherwise>
            <form id="orderForm" method="POST" action="${pageContext.request.contextPath}/order">
                <input type="hidden" name="action" value="toOrderPage"/>
                <table class="table table-bordered align-middle text-center">
                    <thead class="table-light">
                    <tr>
                        <th></th>
                        <th>Hình ảnh</th>
                        <th>Tên sản phẩm</th>
                        <th>Giá</th>
                        <th>Số lượng</th>
                        <th>Tổng</th>
                        <th>Hành động</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="item" items="${cartItems}">
                        <tr>
                            <td><input type="checkbox" class="cart-checkbox" value="${item.id}" checked/></td>
                            <td style="width: 100px;">
                                <img src="${pageContext.request.contextPath}/assets/images/data/${item.product.image}"
                                     alt="${item.product.name}" class="img-fluid"/>
                            </td>
                            <td>${item.product.name}</td>
                            <td><fmt:formatNumber value="${item.price}" type="currency" currencySymbol="₫" maxFractionDigits="0"/></td>
                            <td>
                                <input type="number"
                                       class="form-control quantity-input"
                                       value="${item.quantity}"
                                       data-cart-id="${item.id}"
                                       min="1" />
                            </td>
                            <td><fmt:formatNumber value="${item.quantity * item.price}" type="currency" currencySymbol="₫" maxFractionDigits="0"/></td>
                            <td>
                                <button type="button" class="btn btn-outline-danger btn-sm"
                                        onclick="confirmDelete('${item.id}')">
                                    <i class="bi bi-trash"></i> Xóa
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

                <div class="d-flex justify-content-between">
                    <a href="/list-product" class="btn btn-outline-primary">
                        <i class="bi bi-arrow-left"></i> Tiếp tục mua sắm
                    </a>
                    <button class="btn btn-primary">
                        <i class="bi bi-bag-check"></i> Thanh toán
                    </button>
                </div>
            </form>
            <div id="orderSummary" class="mt-3 text-end">
                <strong>Tổng đơn hàng: </strong>
                <span id="totalPriceText" class="price-text">₫0</span>
            </div>

        </c:otherwise>
    </c:choose>
</main>

<jsp:include page="footer.jsp"/>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    const contextPath = '${pageContext.request.contextPath}';

    // Tính tổng đơn hàng được chọn
    function updateTotalPrice() {
        let total = 0;
        document.querySelectorAll('.cart-checkbox:checked').forEach(cb => {
            const row = cb.closest('tr');
            const priceText = row.querySelector('td:nth-child(4)').innerText;
            const quantityInput = row.querySelector('.quantity-input');
            const price = parseFloat(priceText.replace(/[₫,]/g, '')) || 0;
            const quantity = parseInt(quantityInput.value) || 1;
            total += price * quantity;
        });

        document.getElementById("totalPriceText").textContent = total.toLocaleString('vi-VN', {
            style: 'currency',
            currency: 'VND'
        });
    }

    // Xác nhận xoá sản phẩm
    function confirmDelete(cartId) {
        Swal.fire({
            title: 'Bạn chắc chắn?',
            text: "Bạn có muốn xóa sản phẩm này khỏi giỏ hàng?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#d33',
            cancelButtonColor: '#3085d6',
            confirmButtonText: 'Xóa',
            cancelButtonText: 'Hủy'
        }).then((result) => {
            if (result.isConfirmed) {
                const params = new URLSearchParams();
                params.append('action', 'remove');
                params.append('cartId', cartId);

                fetch(`${contextPath}/cart`, {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/x-www-form-urlencoded"
                    },
                    body: params
                }).then(res => {
                    if (res.ok) return res.text();
                    throw new Error(res.statusText);
                }).then(text => {
                    Swal.fire({
                        icon: 'success',
                        title: 'Đã xóa',
                        text: text,
                        showConfirmButton: false,
                        timer: 1200
                    }).then(() => location.reload());
                }).catch(error => {
                    Swal.fire('Lỗi', error.message, 'error');
                    console.error("Error:", error);
                });
            }
        });
    }

    // Khi trang tải xong
    window.addEventListener('load', () => {
        // Chọn tất cả checkbox sản phẩm
        const checkboxes = document.querySelectorAll('.cart-checkbox');
        checkboxes.forEach(cb => cb.checked = true);

        // Bắt sự kiện tick checkbox để tính lại tiền
        checkboxes.forEach(cb => cb.addEventListener('change', updateTotalPrice));

        // Cập nhật tổng tiền ban đầu
        updateTotalPrice();

        // Bắt sự kiện cập nhật số lượng
        document.querySelectorAll('.quantity-input').forEach(input => {
            input.addEventListener('change', function () {
                const cartId = this.getAttribute('data-cart-id');
                const quantity = parseInt(this.value);

                if (!cartId || isNaN(quantity)) {
                    Swal.fire('Lỗi', 'Thiếu thông tin để cập nhật.', 'error');
                    return;
                }

                if (quantity < 1) {
                    Swal.fire('Cảnh báo', 'Số lượng tối thiểu là 1.', 'warning');
                    this.value = 1;
                    return;
                }

                const params = new URLSearchParams();
                params.append('action', 'updateQuantity');
                params.append('cartId', cartId);
                params.append('quantity', quantity);

                fetch(`${contextPath}/cart`, {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/x-www-form-urlencoded"
                    },
                    body: params.toString()
                }).then(res => {
                    if (!res.ok) return res.text().then(text => { throw new Error(text); });
                    return res.text();
                }).then(() => {
                    Swal.fire({
                        icon: 'success',
                        title: 'Cập nhật thành công',
                        showConfirmButton: false,
                        timer: 1000
                    });
                    updateTotalPrice(); // Cập nhật lại tổng tiền ngay mà không reload
                }).catch(error => {
                    Swal.fire('Lỗi', error.message, 'error');
                });
            });
        });

        // Kiểm tra trước khi submit form
        document.getElementById("orderForm").addEventListener("submit", function (e) {
            const form = this;
            let anyChecked = false;

            document.querySelectorAll('input[name="selectedCartIds"]').forEach(el => el.remove());

            document.querySelectorAll('.cart-checkbox').forEach(cb => {
                if (cb.checked) {
                    anyChecked = true;
                    const hidden = document.createElement("input");
                    hidden.type = "hidden";
                    hidden.name = "selectedCartIds";
                    hidden.value = cb.value;
                    form.appendChild(hidden);
                }
            });

            if (!anyChecked) {
                e.preventDefault();
                Swal.fire('Cảnh báo', 'Vui lòng chọn ít nhất 1 sản phẩm để thanh toán.', 'warning');
            }
        });
    });
</script>

</body>
</html>
