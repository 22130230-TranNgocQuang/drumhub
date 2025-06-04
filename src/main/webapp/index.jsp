<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Trang chủ Drum Store</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
  <!-- Bootstrap Icons -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" />

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
    #main-content {
      padding-top: 50px; /* Điều chỉnh giá trị này theo chiều cao của navbar */
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
      background-color: var(--bs-primary);
    }

    /* Button styling */
    .btn-primary {
      background-color: var(--drumhub-dark);
      border-color: var(--drumhub-dark);
      color: #000;
    }

    .btn-primary:hover {
      background-color: #FF8C00;
      border-color: #FF8C00;
      color: #000;
    }

    .btn-outline-primary {
      color: var(--drumhub-dark);
      border-color: var(--drumhub-dark);
    }

    .btn-outline-primary:hover {
      background-color: var(--bs-primary);
      color: #000;
    }

    .nav-link:hover {
      color: var(--drumhub-dark) !important;
    }
    .nav-link {
      color: #000 !important;
      font-weight: 500;
    }

    /* Sửa lỗi bị đè phần tử */
    .row {
      margin-top: 20px;
    }
    .card-body {
      display: flex;
      flex-direction: column;
      justify-content: space-between;
    }
    .custom-box {
      background-color: var(--drumhub-secondary);
      border-radius: 5px;
      padding: 20px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      transition: all 0.3s ease;
    }
    .custom-box:hover {
      box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
    }
  </style>
</head>
<body>

<!-- Header -->
<jsp:include page="header.jsp" />

<div id="main-content" class="container mt-5">
  <!-- Carousel -->
  <div id="carouselExampleIndicators" class="carousel slide">
    <div class="carousel-indicators" id="carouselIndicators"></div>
    <div class="carousel-inner" id="carouselItems"></div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
            data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
            data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </button>
  </div>

  <!-- Thông tin dịch vụ -->
  <div class="container mt-5">
    <div class="row">
      <div class="col-md-3 mb-4">
        <div class="custom-box h-100 text-decoration-none">
          <div class="me-3 fs-1"><i class="bi bi-credit-card"></i></div>
          <div class="text-start">
            <h5 class="fs-5 fw-medium">Trả góp</h5>
            <p class="fs-6 text-muted mt-2">Mua hàng với lãi suất 0%</p>
          </div>
        </div>
      </div>
      <div class="col-md-3 mb-4">
        <div class="custom-box h-100 text-decoration-none">
          <div class="me-3 fs-1"><i class="bi bi-truck"></i></div>
          <div class="text-start">
            <h5 class="fs-5 fw-medium">Vận chuyển</h5>
            <p class="fs-6 text-muted mt-2">Chuyên nghiệp - Tốc độ</p>
          </div>
        </div>
      </div>
      <div class="col-md-3 mb-4">
        <div class="custom-box h-100 text-decoration-none">
          <div class="me-3 fs-1"><i class="bi bi-shield-check"></i></div>
          <div class="text-start">
            <h5 class="fs-5 fw-medium">Bảo hành</h5>
            <p class="fs-6 text-muted mt-2">Hiệu quả - Chất lượng</p>
          </div>
        </div>
      </div>
      <div class="col-md-3 mb-4">
        <div class="custom-box h-100 text-decoration-none">
          <div class="me-3 fs-1"><i class="bi bi-shop"></i></div>
          <div class="text-start">
            <h5 class="fs-5 fw-medium">Đại lý</h5>
            <p class="fs-6 text-muted mt-2">Trải rộng khắp Việt Nam</p>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Sản phẩm nổi bật -->
  <section class="product-section mt-5">
    <h2>Sản phẩm nổi bật</h2>
    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 g-4 mt-3">
      <c:forEach var="product" items="${products}" varStatus="loop">
        <c:if test="${loop.index < 12}">
          <!-- Hiển thị sản phẩm -->
          <div class="col-md-4 mb-4">
            <div class="card h-100">
              <img src="${pageContext.request.contextPath}/assets/images/products/${product.image}" class="card-img-top" alt="${product.name}">
              <div class="card-body">
                <h5 class="card-title">${product.name}</h5>
                <p class="price-text">
                  <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="₫"/>
                </p>
                <span class="badge ${product.status ? 'bg-success' : 'bg-secondary'}">
                    ${product.status ? 'Còn hàng' : 'Hết hàng'}
                </span>
              </div>
              <div class="card-footer bg-white">
                <div class="d-flex justify-content-between">
                  <a href="${pageContext.request.contextPath}/list-product/${product.id}?action=detail"
                     class="btn btn-sm btn-outline-primary">
                    <i class="bi bi-eye"></i> Xem chi tiết
                  </a>
                  <button class="btn btn-sm btn-outline-success"
                          onclick="addToCart(${product.id})">
                    <i class="bi bi-cart-plus"></i> Thêm giỏ
                  </button>
                </div>
              </div>
            </div>
          </div>
        </c:if>
      </c:forEach>

    </div>
    <div class="text-center mt-4">
      <a href="/list-product" class="btn btn-primary btn-lg">Xem thêm</a>
    </div>
  </section>

  <!-- About Us Section -->
  <section id="about" class="py-5 bg-warning mt-5">
    <div class="container">
      <div class="row align-items-center">
        <div class="col-md-6">
          <img src="../../assets/images/helpers/about.jpg" class="img-fluid rounded shadow" alt="About Us" />
        </div>
        <div class="col-md-6">
          <h2 class="mb-4">VỀ CHÚNG TÔI</h2>
          <p>
            Drum Store tự hào là đơn vị hàng đầu trong lĩnh vực cung cấp nhạc cụ trống tại Việt Nam. Với hơn
            20 năm kinh nghiệm, chúng tôi cam kết mang đến những sản phẩm chất lượng nhất từ các thương hiệu
            uy tín trên thế giới.
          </p>
          <ul class="list-unstyled">
            <li class="mb-2">✓ 100% sản phẩm chính hãng</li>
            <li class="mb-2">✓ Đội ngũ tư vấn chuyên nghiệp</li>
            <li class="mb-2">✓ Chế độ bảo hành tốt nhất</li>
            <li class="mb-2">✓ Giao hàng toàn quốc</li>
          </ul>
        </div>
      </div>
    </div>
  </section>
</div>

<!-- Footer -->
<jsp:include page="footer.jsp" />

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
