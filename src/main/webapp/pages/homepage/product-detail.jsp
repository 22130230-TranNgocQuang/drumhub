<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<style>
    .btn i {
    font-size: 1.1rem;
}

.input-group input[type="number"] {
    text-align: center;
}

.input-group input[type="number"]::-webkit-inner-spin-button,
.input-group input[type="number"]::-webkit-outer-spin-button {
    -webkit-appearance: none;
    margin: 0;
}

.btn-outline-danger:hover i {
    animation: heartBeat 1s;
}

@keyframes heartBeat {
    0% { transform: scale(1); }
    14% { transform: scale(1.3); }
    28% { transform: scale(1); }
    42% { transform: scale(1.3); }
    70% { transform: scale(1); }
}
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    .breadcrumb {
        display: flex;
        list-style: none;
        padding: 25px 0;
        margin: 0;
        font-size: 18px;


    }

    .breadcrumb li {
        display: flex;
        align-items: center;
    }

    .breadcrumb li + li::before {
        content: '›';
        margin: 0 8px;
        color: #333;
    }

    .breadcrumb a {
        text-decoration: none;
        color: #007bff;
    }

    .breadcrumb a:hover {
        text-decoration: underline;
    }

    .rating {
        color: #ffc107;
        margin-left: 8px;
    }

    .product-detail h2 {
        font-size: 28px;
        font-weight: bold;
    }

    .badge {
        padding: 5px 10px;
    }

    .image-thumbnails .thumbnail {
        padding: 5px 10px;
        border: 1px solid;
        cursor: pointer;
    }

    .color-swatch {
        display: inline-block;
        width: 20px;
        height: 20px;
        border-radius: 50%;
        border: 1px solid;
    }

    .contact-form .form-label {
        font-weight: bold;
    }

    .input-group .form-control {
        display: flex;
        flex: 1;
    }

    .button-group {
        padding-bottom: 10px;
        display: flex;
        gap: 15px;
        /* Tạo khoảng cách giữa các nút */
    }

    .btn {
        padding: 10px 20px;
        font-size: 16px;
        border: none;
        cursor: pointer;
        border-radius: 5px;
        /* Bo góc nút */
        font-weight: bold;
    }

    .add-to-cart {
        background-color: #f1f1f1;
        /* Màu nền xám nhạt */
        color: #333;
        /* Màu chữ xám đậm */
    }

    .add-to-cart:hover {
        background-color: #e0e0e0;
        /* Đổi màu khi hover */
    }

    .buy-now {
        background-color: #ed1c24;
        /* Màu đỏ tươi */
        color: #fff;
        /* Màu chữ trắng */
    }

    .buy-now:hover {
        background-color: #d0001b;
        /* Đổi màu khi hover */
    }

    .button-group .btn {
        flex: 1;
        padding: 10px;
    }

    .input-group .btn-light {
        background-color: orange;
    }

    .price_single {
        background-color: white;
        float: left;
        width: 100%;
        font-size: 18px;
        color: #ed1c24;
        margin-bottom: 10px;
        padding-top: 15px;
    }

    .text-danger {
        float: left;
        margin-bottom: 6px;
        font-size: 25px;
        color: #ed1c24;
        margin-right: 5px;
        min-height: 20px;
    }

    .text-danger .currency {
        font-size: 15px;
        color: #ed1c24;
    }

    .box_khuyen_mai {
        width: 100%;
        float: left;
        padding: 10px 15px 0px;
        border-bottom: dashed 1px black;
        border-left: dashed 1px black;
        border-right: dashed 1px black;
    }

    .box_khuyen_mai p {
        color: black;
    }

    .box_uu_diem {
        width: 100%;
        float: left;
        background: #34a105;
        color: #fff;
        text-align: left;
        padding: 5px 15px;
        border-bottom: dashed 1px #d7d7d7;
    }

    .tab-container {
        margin: 20px 0;
    }

    .tab-menu {
        display: flex;
        list-style: none;
        padding: 0;
        border-bottom: 2px solid #ddd;
    }

    .tab-item {
        padding: 10px 20px;
        cursor: pointer;
        font-weight: bold;
        color: #333;
        border-bottom: 2px solid transparent;
        transition: color 0.3s, border-bottom 0.3s;
    }

    .tab-item:hover {
        color: #007bff;
    }

    .tab-item.active {
        border-bottom: 2px solid #000;
        color: #000;
    }

    .tab-content {
        text-align: center;
        padding: 15px 0;
    }

    /* Kiểu cho ảnh nhỏ */
    .thumb-img {
        width: 100px;
        height: 100px;
        cursor: pointer;
        object-fit: cover;
    }

    /* Kiểu cho ảnh lớn */
    .main-img {
        width: 100%;
        height: 400px;
        object-fit: cover;
    }

    /* Đảm bảo ảnh nhỏ hiển thị chính xác khi hover */
    .thumbnail-container {
        display: flex;
        gap: 10px;
        margin-top: 20px;
    }

    .color-option {
        margin-right: 10px;
    }

    .color-option input[type="radio"] {
        display: none;
    }

    .color-option label {
        display: inline-block;
        padding: 5px 15px;
        border: 2px solid #ddd;
        border-radius: 20px;
        cursor: pointer;
        transition: all 0.3s;
    }

    .color-option input[type="radio"]:checked + label {
        border-color: #0d6efd;
        background-color: #0d6efd;
        color: white;
    } .product-info {
        padding: 20px;
        background: #fff;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }

    .product-price {
        font-size: 1.8rem;
        color: #dc3545;
        margin: 15px 0;
    }

    .product-price .original-price {
        font-size: 1.2rem;
        color: #6c757d;
        text-decoration: line-through;
        margin-left: 10px;
    }

    .product-price .discount-badge {
        background: #dc3545;
        color: white;
        padding: 4px 8px;
        border-radius: 4px;
        font-size: 0.9rem;
        margin-left: 10px;
    }

    .product-attributes {
        margin: 20px 0;
        padding: 15px;
        background: #f8f9fa;
        border-radius: 8px;
    }

    .product-attributes .attribute-item {
        display: flex;
        margin-bottom: 10px;
        padding: 8px 0;
        border-bottom: 1px solid #dee2e6;
    }

    .product-attributes .attribute-label {
        width: 150px;
        color: #6c757d;
        font-weight: 500;
    }

    .product-attributes .attribute-value {
        flex: 1;
        color: #212529;
    }

    .product-description {
        margin-top: 20px;
        line-height: 1.6;
    }

    .rating-stars {
        color: #ffc107;
        font-size: 1.2rem;
        margin-right: 10px;
    }

    .product-category {
        display: inline-block;
        padding: 4px 12px;
        background: #e9ecef;
        border-radius: 20px;
        color: #495057;
        font-size: 0.9rem;
        margin-right: 10px;
    }

    .price del {
        color: #6c757d;
        font-size: 0.9em;
    }

    .price .badge {
        font-size: 0.8em;
        padding: 0.4em 0.6em;
    }

    .text-danger {
        color: #dc3545 !important;
    }

</style>

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
                    <img src="${pageContext.request.contextPath}/assets/images/data/${product.image}"
                         class="img-fluid" id="mainImage" alt="${product.name}">
                </div>
                <div class="image-thumbnails d-flex">
                    <c:forEach items="${product.images}" var="image">
                        <div class="thumbnail mx-2">
                            <img src="${pageContext.request.contextPath}/assets/images/data/${image.image}"
                                 class="img-fluid thumb-img"
                                 data-large="${pageContext.request.contextPath}/assets/images/data/${image.image}"
                                 alt="${product.name}">
                        </div>
                    </c:forEach>
                </div>
            </div>

            <!-- Thông tin sản phẩm -->
            <div class="col-md-6">
                <h2>${product.name}</h2>
                <div class="d-flex align-items-center mb-3">
                    <span class="badge bg-primary">${product.category.name}</span>
                    <span class="badge bg-secondary ms-2">${product.averageRating}★</span>
                </div>

                <!-- Giá -->
                <div class="price mb-3">
                    <c:choose>
                        <c:when test="${product.productSale != null}">
                            <div class="d-flex align-items-center gap-2">
                                <h3 class="text-danger mb-0">
                                    <fmt:formatNumber value="${product.salePrice}" type="currency" currencySymbol="₫"/>
                                </h3>
                                <del class="text-muted fs-5">
                                    <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="₫"/>
                                </del>
                                <span class="badge bg-danger">
                                    -<fmt:formatNumber value="${product.productSale.sale.discountPercentage}" 
                                                    maxFractionDigits="0"/>%
                                </span>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <h3 class="text-danger">
                                <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="₫"/>
                            </h3>
                        </c:otherwise>
                    </c:choose>
                </div>

                <!-- Màu sắc -->
                <div class="colors mb-3">
                    <h5>Màu sắc:</h5>
                    <div class="d-flex gap-2">
                        <c:forEach items="${product.colors}" var="color">
                            <div class="color-option">
                                <input type="radio" name="color" value="${color.colorName}" id="color_${color.id}">
                                <label for="color_${color.id}">${color.colorName}</label>
                            </div>
                        </c:forEach>
                    </div>
                </div>

                <!-- Số lượng -->
                <div class="d-flex gap-2 mt-3">
                    <div class="input-group" style="width: 150px;">
                        <button class="btn btn-outline-secondary" type="button" onclick="decreaseQuantity()">
                            <i class="bi bi-dash"></i>
                        </button>
                        <input type="number" class="form-control text-center" id="quantityInput" value="1" min="1">
                        <button class="btn btn-outline-secondary" type="button" onclick="increaseQuantity()">
                            <i class="bi bi-plus"></i>
                        </button>
                    </div>

                    <button class="btn btn-primary d-flex align-items-center gap-2"
                            onclick="addToCart(${product.id}, getQuantity(), getSelectedColor())">
                        <i class="bi bi-cart-plus"></i>
                        <span>Thêm vào giỏ hàng</span>
                    </button>

                    <button class="btn btn-danger d-flex align-items-center gap-2"
                            onclick="buyNow(${product.id}, getQuantity(), getSelectedColor())">
                        <i class="bi bi-lightning-fill"></i>
                        <span>Mua ngay</span>
                    </button>

                    <button class="btn btn-outline-danger" onclick="toggleWishlist(${product.id})"
                            data-bs-toggle="tooltip" data-bs-placement="top" title="Thêm vào yêu thích">
                        <i class="bi bi-heart"></i>
                    </button>
                </div>

                <!-- Mô tả -->
                <div class="description mt-4">
                    <h5>Mô tả sản phẩm:</h5>
                    <p>${product.description}</p>
                </div>
            </div>
        </div>

        <!-- Sản phẩm liên quan -->
        <div class="related-products mt-5">
            <h3>Sản phẩm liên quan</h3>
            <div class="row">
                <c:forEach items="${relatedProducts}" var="relatedProduct">
                    <div class="col-md-3">
                        <div class="card">
                            <img src="${pageContext.request.contextPath}/assets/images/data/${relatedProduct.image}"
                                 class="card-img-top" alt="${relatedProduct.name}">
                            <div class="card-body">
                                <h5 class="card-title">${relatedProduct.name}</h5>
                                <p class="card-text text-danger">
                                    <fmt:formatNumber value="${relatedProduct.salePrice}" type="currency"
                                                      currencySymbol="₫"/>
                                </p>
                                <a href="${pageContext.request.contextPath}/product/${relatedProduct.id}"
                                   class="btn btn-primary">Xem chi tiết</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>

    <script>
        function getQuantity() {
            return parseInt(document.getElementById('quantityInput').value);
        }

      // Thay thế hàm getSelectedColor() hiện tại bằng:
function getSelectedColor() {
    const selectedColor = document.querySelector('input[name="color"]:checked');
    if (!selectedColor) {
        Swal.fire({
            title: 'Lỗi!',
            text: 'Vui lòng chọn màu sắc',
            icon: 'warning'
        });
        return null;
    }
    return selectedColor.value;
}

// Thêm hàm buyNow
function buyNow(productId, quantity, color) {
    if (!color) {
        return;
    }
    // Thêm vào giỏ hàng và chuyển đến trang thanh toán
    AjaxUtils.addToCart(productId, quantity, color).then(() => {
        window.location.href = '${pageContext.request.contextPath}/checkout';
    });
}

        function addToCart(productId, quantity, color) {
            AjaxUtils.addToCart(productId, quantity, color);
        }

        function increaseQuantity() {
            const input = document.getElementById('quantityInput');
            input.value = parseInt(input.value) + 1;
        }

        function decreaseQuantity() {
            const input = document.getElementById('quantityInput');
            const currentValue = parseInt(input.value);
            if (currentValue > 1) {
                input.value = currentValue - 1;
            }
        }

        // Xử lý ảnh thumbnail
        document.querySelectorAll('.thumb-img').forEach(thumb => {
            thumb.addEventListener('click', function() {
                document.getElementById('mainImage').src = this.getAttribute('data-large');
            });
        });
    </script>
</main>

