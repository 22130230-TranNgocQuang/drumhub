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
            --drumhub-primary: #FFD700;  /* Màu vàng chính */
            --drumhub-secondary: #FFFACD; /* Màu vàng nhạt */
            --drumhub-dark: #FFA500;     /* Màu cam vàng đậm */
            --drumhub-accent: #FF6347;   /* Màu phụ tomato */
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

        /* Style cho hộp gợi ý tìm kiếm */
        #suggestions {
            position: absolute;
            background-color: white;
            border: 1px solid #ccc;
            max-height: 200px;
            overflow-y: auto;
            width: 100%;
            z-index: 1000;
        }
        #suggestions div {
            padding: 8px;
            cursor: pointer;
        }
        #suggestions div:hover {
            background-color: #f0f0f0;
        }

        /* Container cho input + suggestions */
        .search-wrapper {
            position: relative;
        }
    </style>
</head>
<body>
<!-- Header -->
<jsp:include page="header.jsp"/>

<main class="container my-4">
    <div class="row">
        <div class="col-md-3">
            <!-- Filter Sidebar -->
            <div class="card mb-4" >

                <div class="card-header text-white" style="background-color: var(--drumhub-primary);" >
                    <h5 class="mb-0" style="background-color: var(--drumhub-primary);">Bộ lọc tìm kiếm</h5>
                </div>
                <div class="card-body">
                    <form action="${pageContext.request.contextPath}/list-product.jsp" method="get">
                        <!-- Search Input with autocomplete -->
                        <div class="mb-3 search-wrapper">
                            <label for="search" class="form-label">Tìm kiếm</label>
                            <input type="text" class="form-control" id="search" name="search"
                                   value="${param.search}" placeholder="Nhập tên sản phẩm..." autocomplete="off">
                            <div id="suggestions"></div>
                        </div>

                        <!-- Category Filter -->
                        <div class="mb-3">
                            <label for="category" class="form-label">Danh mục</label>
                            <select class="form-select" id="category" name="category">
                                <option value="">Tất cả</option>
                                <c:forEach items="${categories}" var="category">
                                    <option value="${category.id}"
                                        ${param.category eq category.id.toString() ? 'selected' : ''}>
                                            ${category.name}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>

                        <button type="submit" class="btn btn-primary w-100">Áp dụng</button>
                        <a href="#" class="btn btn-outline-secondary w-100 mt-2">Xóa bộ lọc</a>
                    </form>
                </div>
            </div>
        </div>

        <div class="col-md-9">
            <!-- Product List -->
            <div class="row">
                <c:choose>
                    <c:when test="${not empty products && products.size() > 0}">
                        <c:forEach items="${products}" var="product">
                            <div class="col-md-4 mb-4">
                                <div class="card h-100">
                                    <div class="card-img-container">
                                        <img src="${pageContext.request.contextPath}/assets/images/products/${product.image}"
                                             class="card-img-top" alt="${product.name}">
                                    </div>
                                    <div class="card-body">
                                        <h5 class="card-title">${product.name}</h5>
                                        <div class="d-flex justify-content-between align-items-center mb-2">
                                                <span class="price-text">
                                                    <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="₫" maxFractionDigits="0"/>
                                                </span>
                                            <span class="badge ${product.status ? 'bg-success' : 'bg-secondary'}">
                                                    ${product.status ? 'Còn hàng' : 'Hết hàng'}
                                            </span>
                                        </div>
                                    </div>
                                    <div class="card-footer bg-white">
                                        <div class="d-flex justify-content-between">
                                            <a href="${pageContext.request.contextPath}/list-product/${product.id}?action=detail"
                                               class="btn btn-sm btn-outline-primary">
                                                <i class="bi bi-eye"></i> Xem chi tiết
                                            </a>
                                            <button class="btn btn-sm btn-outline-success"
                                                    onclick="addToCart(${product.id}, ${product.price})">
                                                <i class="bi bi-cart-plus"></i> Thêm giỏ
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <div class="col-12 text-center py-5">
                            <i class="bi bi-exclamation-circle display-4 text-muted"></i>
                            <h3 class="mt-3">Không tìm thấy sản phẩm</h3>
                            <p class="text-muted">Vui lòng thử lại với bộ lọc khác</p>
                            <a href="${pageContext.request.contextPath}/list-product" class="btn btn-primary">
                                <i class="bi bi-arrow-left"></i> Xem tất cả
                            </a>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>

            <!-- Pagination -->
            <c:if test="${totalPages > 1}">
                <nav aria-label="Page navigation">
                    <ul class="pagination justify-content-center">
                        <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                            <a class="page-link" href="?page=${currentPage - 1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>

                        <c:forEach begin="1" end="${totalPages}" var="i">
                            <li class="page-item ${currentPage == i ? 'active' : ''}">
                                <a class="page-link" href="?page=${i}">${i}</a>
                            </li>
                        </c:forEach>

                        <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                            <a class="page-link" href="?page=${currentPage + 1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </c:if>
        </div>
    </div>
</main>

<!-- Footer -->
<jsp:include page="footer.jsp"/>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
    const contextPath = '${pageContext.request.contextPath}';

    function addToCart(productId, price) {
        const formData = new URLSearchParams();
        formData.append("action", "addCart");
        formData.append("productId", productId);
        formData.append("quantity", 1);
        formData.append("price", price);

        fetch(`${contextPath}/cart`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: formData.toString()
        })
            .then(response => {
                console.log("HTTP status:", response.status);
                if (response.ok) return response.text();
                return response.text().then(text => { throw new Error(text); });
            })
            .then(responseText => {
                console.log("Server response:", responseText);
                Swal.fire({
                    icon: 'success',
                    title: 'Thêm vào giỏ hàng thành công!',
                    text: responseText || 'Sản phẩm đã được thêm vào giỏ.',
                    showConfirmButton: false,
                    timer: 1500
                });
            })
            .catch(error => {
                console.error("Add to cart failed:", error);
                Swal.fire({
                    icon: 'error',
                    title: 'Không thể thêm vào giỏ hàng',
                    text: error.message || 'Đã xảy ra lỗi không xác định.',
                });
            });
    }
</script>

<script>
    // Tự động gợi ý tìm kiếm
    document.addEventListener('DOMContentLoaded', function () {
        const searchInput = document.getElementById('search');
        const suggestionsBox = document.getElementById('suggestions');

        searchInput.addEventListener('input', function () {
            const query = this.value.trim();
            if (query.length === 0) {
                suggestionsBox.innerHTML = '';
                return;
            }
            fetch('${pageContext.request.contextPath}/search-suggestions?query=' + encodeURIComponent(query))
                .then(res => res.json())
                .then(data => {
                    suggestionsBox.innerHTML = '';
                    data.forEach(product => {
                        const div = document.createElement('div');
                        div.textContent = product.name;
                        div.addEventListener('click', () => {
                            searchInput.value = product.name;
                            suggestionsBox.innerHTML = '';
                        });
                        suggestionsBox.appendChild(div);
                    });
                })
                .catch(err => {
                    console.error('Lỗi khi lấy gợi ý tìm kiếm:', err);
                });
        });

        // Ẩn suggestions khi click ra ngoài
        document.addEventListener('click', function (e) {
            if (!e.target.closest('.search-wrapper')) {
                suggestionsBox.innerHTML = '';
            }
        });
    });
</script>

</body>
</html>
