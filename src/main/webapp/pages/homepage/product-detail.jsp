<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

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

