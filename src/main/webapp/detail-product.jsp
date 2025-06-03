<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${product.name} | DrumHub</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <!-- SweetAlert2 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <style>
        /* Giữ nguyên các style từ bản trước */
        :root {
            --drumhub-primary: #FFD700;
            --drumhub-secondary: #FFFACD;
            --drumhub-dark: #FFA500;
            --drumhub-accent: #FF6347;
        }

        /* Nền header/footer */
        .navbar, .footer {
            background-color: var(--drumhub-primary) !important;
        }

        main {
            padding-top: 150px; /* Điều chỉnh phù hợp với chiều cao thanh menu */
        }


        .btn i {
            font-size: 1.1rem;
        }

        .input-group input[type="number"] {
            text-align: center;
        }

        .main-img {
            width: 100%;
            height: 400px;
            object-fit: contain;
            border: 1px solid #eee;
            border-radius: 8px;
        }

        .thumb-img {
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: 5px;
            cursor: pointer;
        }

        .thumb-img:hover {
            border: 2px solid var(--drumhub-dark);
        }

        .btn-primary {
            background-color: var(--drumhub-dark);
            border-color: var(--drumhub-dark);
        }

        .btn-primary:hover {
            background-color: #FF8C00;
            border-color: #FF8C00;
        }

        .text-danger {
            color: #dc3545 !important;
        }

        /* Thêm các style khác nếu cần */
    </style>
</head>
<body>
<!-- Header -->
<jsp:include page="header.jsp"/>

<main style="margin-top: 50px;">
    <div class="container">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/">Trang chủ</a></li>
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/products">Sản phẩm</a></li>
                <li class="breadcrumb-item active">${product.name}</li>
            </ol>
        </nav>

        <div class="row">
            <!-- Ảnh sản phẩm -->
            <div class="col-md-6">
                <div class="main-image mb-3">
                    <img src="${pageContext.request.contextPath}/assets/images/products/${product.image}"
                         class="img-fluid main-img" id="mainImage" alt="${product.name}">
                </div>
                <div class="image-thumbnails d-flex flex-wrap gap-2">
                    <!-- Ảnh chính cũng là 1 thumbnail -->
                    <div class="thumbnail">
                        <img src="${pageContext.request.contextPath}/assets/images/products/${product.image}"
                             class="img-fluid thumb-img"
                             onclick="changeMainImage('${pageContext.request.contextPath}/assets/images/products/${product.image}')"
                             alt="${product.name}">
                    </div>
                    <!-- Các ảnh phụ -->
                    <c:forEach items="${productImages}" var="image">
                        <div class="thumbnail">
                            <img src="${pageContext.request.contextPath}/assets/images/products/${image.image}"
                                 class="img-fluid thumb-img"
                                 onclick="changeMainImage('${pageContext.request.contextPath}/assets/images/products/${image.image}')"
                                 alt="${product.name}">
                        </div>
                    </c:forEach>
                </div>
            </div>

            <!-- Thông tin sản phẩm -->
            <div class="col-md-6">
                <h2>${product.name}</h2>
                <div class="d-flex align-items-center mb-3">
                    <span class="badge bg-primary">${category.name}</span>
                    <span class="badge ${product.status ? 'bg-success' : 'bg-secondary'} ms-2">
                        ${product.status ? 'Còn hàng' : 'Hết hàng'}
                    </span>
                </div>

                <!-- Giá -->
                <div class="price mb-4">
                    <h3 class="text-danger">
                        <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="₫"/>
                    </h3>
                </div>
                <input type="hidden" name="price" value="${product.price}">

                <!-- Số lượng -->
                <div class="mb-4">
                    <h5>Số lượng:</h5>
                    <div class="d-flex align-items-center gap-3">
                        <div class="input-group" style="width: 150px;">
                            <button class="btn btn-outline-secondary" type="button" onclick="decreaseQuantity()">
                                <i class="bi bi-dash"></i>
                            </button>
                            <input type="number" class="form-control text-center" id="quantityInput" name="quantity"
                                   value="1" min="1">
                            <button class="btn btn-outline-secondary" type="button" onclick="increaseQuantity()">
                                <i class="bi bi-plus"></i>
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Nút hành động -->
                <div class="d-flex gap-3 mb-4">
                    <button class="btn btn-primary flex-grow-1 d-flex align-items-center justify-content-center gap-2"
                            onclick="addToCart(${product.id}, getQuantity())">
                        <i class="bi bi-cart-plus"></i>
                        <span>Thêm vào giỏ hàng</span>
                    </button>

                    <button class="btn btn-danger flex-grow-1 d-flex align-items-center justify-content-center gap-2"
                            onclick="buyNow(${product.id}, getQuantity())">
                        <i class="bi bi-lightning-fill"></i>
                        Mua ngay
                    </button>
                </div>

            </div>
        </div>

        <!-- Sản phẩm liên quan (nếu có) -->
        <c:if test="${not empty relatedProducts}">
            <div class="related-products mt-5">
                <h3 class="mb-4">Sản phẩm liên quan</h3>
                <div class="row">
                    <c:forEach items="${relatedProducts}" var="relatedProduct">
                        <div class="col-md-3 mb-4">
                            <div class="card h-100">
                                <img src="${pageContext.request.contextPath}/assets/images/products/${relatedProduct.image}"
                                     class="card-img-top" alt="${relatedProduct.name}"
                                     style="height: 200px; object-fit: contain;">
                                <div class="card-body">
                                    <h5 class="card-title">${relatedProduct.name}</h5>
                                    <p class="card-text text-danger mb-2">
                                        <fmt:formatNumber value="${relatedProduct.price}" type="currency"
                                                          currencySymbol="₫"/>
                                    </p>
                                    <a href="${pageContext.request.contextPath}/list-product/${relatedProduct.id}"
                                       class="btn btn-primary w-100">Xem chi tiết</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </c:if>
    </div>
</main>

<!-- Footer -->
<jsp:include page="footer.jsp"/>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
    // Thay đổi ảnh chính khi click ảnh nhỏ
    function changeMainImage(newSrc) {
        document.getElementById('mainImage').src = newSrc;
    }

    // Xử lý số lượng
    function getQuantity() {
        return parseInt(document.getElementById('quantityInput').value);
    }

    function increaseQuantity() {
        const input = document.getElementById('quantityInput');
        input.value = parseInt(input.value) + 1;
    }

    function decreaseQuantity() {
        const input = document.getElementById('quantityInput');
        if (input.value > 1) {
            input.value = parseInt(input.value) - 1;
        }
    }

    //Thêm vào giỏ hàng
    function addToCart(productId, quantity) {
        fetch('${pageContext.request.contextPath}/cart', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: new URLSearchParams({
                action: 'addCart',
                productId: productId,
                quantity: quantity,
                price: document.querySelector('[name="price"]').value
            })
        })

            .then(response => {
                if (response.ok) {
                    Swal.fire({
                        icon: 'success',
                        title: 'Đã thêm vào giỏ hàng',
                        showConfirmButton: false,
                        timer: 1500
                    });
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Thêm thất bại',
                        showConfirmButton: true,
                    });
                }
            })
            .catch(error => {
                console.error('Lỗi khi thêm vào giỏ hàng', error);
                Swal.fire({
                    icon: 'error',
                    title: 'Lỗi hệ thống',
                    text: 'Không thể thêm sản phẩm vào giỏ hàng',
                    showCancelButton: true
                });
            });
    }

    // Mua ngay
    function buyNow(productId, quantity) {
        const price = document.querySelector('[name="price"]').value;
        const contextPath = '${pageContext.request.contextPath}';

        fetch(contextPath + '/cart', {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: new URLSearchParams({
                action: 'buyNow',
                productId: productId,
                quantity: quantity,
                price: price
            })
        })
            .then(response => {
                if (response.ok) {
                    window.location.href = contextPath + '/checkout';
                } else {
                    alert('Lỗi khi mua ngay!');
                }
            });
    }

    // Khởi tạo tooltip
    document.addEventListener('DOMContentLoaded', function () {
        const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
        tooltipTriggerList.map(function (tooltipTriggerEl) {
            return new bootstrap.Tooltip(tooltipTriggerEl);
        });
    });
</script>
</body>
</html>