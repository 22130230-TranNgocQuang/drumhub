<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
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

<div class="container mt-5">
    <div class="row">
        <div class="col-md-3 mb-4">
            <div class="custom-box h-100 text-decoration-none">
                <div class="me-3 fs-1">
                    <i class="bi bi-credit-card"></i>
                </div>
                <div class="text-start">
                    <h5 class="fs-5 fw-medium">Trả góp</h5>
                    <p class="fs-6 text-muted mt-2">Mua hàng với lãi suất 0%</p>
                </div>
            </div>
        </div>

        <div class="col-md-3 mb-4">
            <div class="custom-box h-100 text-decoration-none">
                <div class="me-3 fs-1">
                    <i class="bi bi-truck"></i>
                </div>
                <div class="text-start">
                    <h5 class="fs-5 fw-medium">Vận chuyển</h5>
                    <p class="fs-6 text-muted mt-2">Chuyên nghiệp - Tốc độ</p>
                </div>
            </div>
        </div>

        <div class="col-md-3 mb-4">
            <div class="custom-box h-100 text-decoration-none">
                <div class="me-3 fs-1">
                    <i class="bi bi-shield-check"></i>
                </div>
                <div class="text-start">
                    <h5 class="fs-5 fw-medium">Bảo hành</h5>
                    <p class="fs-6 text-muted mt-2">Hiệu quả - Chất lượng</p>
                </div>
            </div>
        </div>

        <div class="col-md-3 mb-4">
            <div class="custom-box h-100 text-decoration-none">
                <div class="me-3 fs-1">
                    <i class="bi bi-shop"></i>
                </div>
                <div class="text-start">
                    <h5 class="fs-5 fw-medium">Đại lý</h5>
                    <p class="fs-6 text-muted mt-2">Trải rộng khắp Việt Nam</p>
                </div>
            </div>
        </div>

    </div>
</div>
<div class="container mt-5">
    <h2 class="text-start mb-4">SẢN PHẨM NỔI BẬT</h2>
    <div class="row row-cols-1 row-cols-md-3 g-4" id="featuredProducts">
        <c:forEach var="product" items="${featuredProducts}">
            <div class="col">
                <div class="card h-100">
                    <img src="/assets/images/data/${product.imageMain}" class="card-img-top" alt="${product.name}">
                    <div class="card-body d-flex flex-column">
                        <h5 class="card-title"><a href="/product/${product.id}"
                                                  class="text-decoration-none">${product.name}</a></h5>
                        <p class="card-text">${product.description}</p>
                        <fmt:setLocale value="vi_VN"/>
                        <p class="card-text">
                            <span style="text-decoration: line-through;">
                                <fmt:formatNumber value="${product.price}" type="currency"/>
                            </span>
                            <strong class="text-danger">
                                <fmt:formatNumber value="${product.salePrice}" type="currency"/>
                            </strong>
                        </p>

                        <a href="/product/${product.id}" class="btn btn-primary text-black mt-auto">Xem thêm</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<div class="container mt-5">
    <h2 class="text-start mb-4">DANH MỤC SẢN PHẨM</h2>
    <div class="row row-cols-1 row-cols-md-3 g-4" id="categories">
        <c:forEach var="category" items="${categories}">
            <div class="col">
                <div class="card h-100">
                    <img src="/assets/images/data/${category.image}" class="card-img-top" alt="${category.name}">
                    <div class="card-body">
                        <h5 class="card-title">${category.name}</h5>
                        <p class="card-text">${category.description}</p>
                        <a href="${pageContext.request.contextPath}/products" class="btn btn-primary text-black mt-auto">Xem thêm</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<div class="container mt-5">
    <h2 class="text-start mb-4">TIN TỨC - SỰ KIỆN</h2>
    <div class="row row-cols-1 row-cols-md-3 g-4" id="posts">
        <c:forEach var="post" items="${latestPosts}">
            <div class="col">
                <div class="card h-100">
                    <img src="/assets/images/data/${post.image}" class="card-img-top" alt="${post.title}">
                    <div class="card-body d-flex flex-column">
                        <h5 class="card-title">${post.title}</h5>
                        <p class="card-text">${post.content}</p>
                        <a href="${pageContext.request.contextPath}/posts" class="btn btn-primary mt-auto w-100 text-black">Xem chi
                            tiết</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<section id="about" class="py-5 bg-primary mt-5">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-md-6">
                <img src="../../assets/images/helpers/about.jpg" class="img-fluid rounded shadow" alt="About Us">
            </div>
            <div class="col-md-6">
                <h2 class="mb-4">VỀ CHÚNG TÔI</h2>
                <p>Drum Store tự hào là đơn vị hàng đầu trong lĩnh vực cung cấp nhạc cụ trống tại Việt Nam. Với
                    hơn
                    20 năm kinh nghiệm, chúng tôi cam kết mang đến những sản phẩm chất lượng nhất từ các thương
                    hiệu
                    uy tín trên thế giới.</p>
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
<script>
    const slides = [
        {src: "assets/images/banners/banner0.png", alt: "Slide 1"},
        {src: "assets/images/banners/banner1.png", alt: "Slide 2"},
        {src: "assets/images/banners/banner2.png", alt: "Slide 3"},
        {src: "assets/images/banners/banner3.png", alt: "Slide 4"},
        {src: "assets/images/banners/banner4.png", alt: "Slide 5"},
        {src: "assets/images/banners/banner5.png", alt: "Slide 6"},
        {src: "assets/images/banners/banner6.png", alt: "Slide 7"}
    ];
    const indicatorsContainer = document.getElementById('carouselIndicators');
    const itemsContainer = document.getElementById('carouselItems');

    slides.forEach((slide, index) => {
        const indicatorButton = document.createElement('button');
        indicatorButton.type = 'button';
        indicatorButton.classList.add('carousel-indicator');
        indicatorButton.setAttribute('data-bs-target', 'pages/posts/post-detail.htmlcarouselExampleIndicators');
        indicatorButton.setAttribute('data-bs-slide-to', index);
        indicatorButton.setAttribute('aria-label', `Slide \${index + 1}`);
        if (index === 0) indicatorButton.classList.add('active');
        indicatorsContainer.appendChild(indicatorButton);

        const slideItem = document.createElement('div');
        slideItem.classList.add('carousel-item');
        if (index === 0) slideItem.classList.add('active');

        const img = document.createElement('img');
        img.src = slide.src;
        img.classList.add('d-block', 'w-100');
        img.alt = slide.alt;
        slideItem.appendChild(img);

        itemsContainer.appendChild(slideItem);
    });
</script>
<script>
    window.onload = function () {
        let message = "<%= session.getAttribute("message") %>";
        if (message && message !== "null") {
            alert(message);
            <% session.removeAttribute("message"); %> // Xóa sau khi hiển thị
        }
    };
</script>
