<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<style>
    body {
        background-color: #f8f9fa;
    }

    .order-container h5 {
        font-weight: bold;
        background-color: #F1F1F1;
    }

    .product-detail img {
        position: absolute;
        object-fit: cover;
        width: 30%;
        height: 100%;
    }

    .option button {
        width: 120px;
        height: 40px;
        margin-top: 10px;
        border: 1px solid #ddd;
    }


    @media (max-width: 768px) {
        .product-detail img {
            position: absolute;
            object-fit: cover;
            width: 30%;
            height: 100%;
        }

        .option button {
            width: 80px;
            height: 30px;
            border: 1px solid #ddd;
        }

    }

    .voucher-input input {
        width: 80%;
        height: 40px;
        margin-left: 0;
        border: none;
        border-radius: 0;
    }

    .voucher-input button {
        margin-left: 1px;
        width: 100px;
        height: 40px;
        background-color: #fd0;
        font-weight: bold;
        border: none;
    }

    .cart-item {
        border: 1px solid #dee2e6;
        border-radius: 8px;
        padding: 15px;
        margin-bottom: 15px;
    }

    .color-options select {
        min-width: 100px;
    }

    .form-select-sm {
        padding: 0.25rem 2rem 0.25rem 0.5rem;
        font-size: 0.875rem;
    }.cart-item {
    transition: all 0.3s ease;
}

.cart-item:hover {
    background-color: #f8f9fa;
}

.cart-item img {
    transition: transform 0.3s ease;
}

.cart-item:hover img {
    transform: scale(1.05);
}

.cart-item a:hover h5 {
    color: #0d6efd !important;
}

.cart-item img {
    border-radius: 8px;
    object-fit: cover;
    height: 100px;
}
</style>
<div class="container my-5" style="min-height: 70vh">
    <div class="row">
        <div class="col-12">
            <h5 class="mb-4">GIỎ HÀNG</h5>
            <div class="cart-container">
                <c:choose>
                    <c:when test="${empty cart.items}">
                        <div class="text-center py-5">
                            <h3>Giỏ hàng trống</h3>
                            <a href="${pageContext.request.contextPath}/products" class="btn btn-primary mt-3">
                                Tiếp tục mua sắm
                            </a>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="row">
                            <div class="col-md-8">
                                <c:forEach items="${cart.items}" var="item">
                                    <div class="cart-item" data-product-id="${item.product.id}" data-color="${item.color}">
                                        <div class="row align-items-center">
                                            <div class="col-2">
                                                <a href="${pageContext.request.contextPath}/product/${item.product.id}">
                                                    <img src="${pageContext.request.contextPath}/assets/images/data/${item.product.image}"
                                                         class="img-fluid" alt="${item.product.name}">
                                                </a>
                                            </div>
                                            <div class="col">
                                                <a href="${pageContext.request.contextPath}/product/${item.product.id}" 
                                                class="text-decoration-none">
                                                 <h5 class="text-dark">${item.product.name}</h5>
                                             </a>
                                                <div class="color-options mb-2">
                                                    <label class="me-2">Màu:</label>
                                                    <select class="form-select form-select-sm d-inline-block w-auto"
                                                            onchange="AjaxUtils.updateCartItemColor('${item.product.id}', '${item.color}', this.value)">
                                                        <!-- Thêm option Default nếu là thêm nhanh -->
                                                        <c:if test="${item.color eq 'Default'}">
                                                            <option value="Default" selected>Default (Chọn màu)</option>
                                                        </c:if>
                                                        <c:forEach items="${item.product.colors}" var="color">
                                                            <option value="${color.colorName}" ${item.color eq color.colorName ? 'selected' : ''}>
                                                                ${color.colorName}
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                    <c:if test="${item.color eq 'Default'}">
                                                        <small class="text-danger">* Vui lòng chọn màu sắc</small>
                                                    </c:if>
                                                </div>
                                                <p class="item-price" data-price="${item.product.salePrice}">
                                                    <c:choose>
                                                        <c:when test="${item.product.productSale != null}">
                                                            <span class="text-danger">
                                                                <fmt:formatNumber value="${item.product.salePrice}" type="currency" currencySymbol="₫"/>
                                                            </span>
                                                            <del class="text-muted ms-2">
                                                                <fmt:formatNumber value="${item.product.price}" type="currency" currencySymbol="₫"/>
                                                            </del>
                                                            <span class="badge bg-danger ms-2">
                                                                -<fmt:formatNumber value="${item.product.productSale.sale.discountPercentage}" 
                                                                                maxFractionDigits="0"/>%
                                                            </span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <fmt:formatNumber value="${item.product.price}" type="currency" currencySymbol="₫"/>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </p>
                                            </div>
                                            <div class="col-2">
                                                <div class="input-group" style="width: 120px;">
                                                    <button class="btn btn-outline-secondary" type="button" 
                                                            onclick="AjaxUtils.decreaseQuantity('${item.product.id}', '${item.color}')">
                                                        <i class="bi bi-dash"></i>
                                                    </button>
                                                    <input type="text" class="form-control text-center" 
                                                           value="${item.quantity}"
                                                           data-product-id="${item.product.id}" 
                                                           data-color="${item.color}"
                                                           readonly>
                                                    <button class="btn btn-outline-secondary" type="button"
                                                            onclick="AjaxUtils.increaseQuantity('${item.product.id}', '${item.color}')">
                                                        <i class="bi bi-plus"></i>
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="col-2">
                                                <p class="item-total">
                                                    <fmt:formatNumber value="${item.total}" type="currency" currencySymbol="₫"/>
                                                </p>
                                            </div>
                                            <div class="col-1">
                                                <button class="btn btn-danger btn-sm"
                                                        onclick="AjaxUtils.removeFromCart(${item.product.id}, '${item.color}')">
                                                    <i class="bi bi-trash"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="col-md-4">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title">Tổng tiền</h5>
                                        <p class="h3 cart-total">
                                            <fmt:formatNumber value="${cart.total}" type="currency" currencySymbol="₫"/>
                                        </p>
                                        <button class="btn btn-primary w-100 mt-3">Thanh toán</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</div>

<script>
    function updateQuantity(productId, quantity, color) {
        if (quantity < 1) return;

        fetch('/cart/update', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: `productId=${productId}&quantity=${quantity}&color=${color}`
        })
            .then(response => response.json())

            .then(data => {
                console.log(data);
                if (data.success) {
                    location.reload();
                }
            });
    }

    function removeItem(productId, color) {
        if (!confirm('Bạn có chắc muốn xóa sản phẩm này?')) return;

        fetch('/cart/remove', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: `productId=${productId}&color=${color}`
        })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    location.reload();
                }
            });
    }
</script>


