<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<header>
    <div class="fixed-top d-none d-lg-block">
        <img src="${pageContext.request.contextPath}/assets/images/banners/banner_header.png"
             alt="Tháng Tri Ân Săn Sale"
             class="img-fluid w-100 banner-header">
        <nav class="navbar navbar-expand-lg navbar-light bg-primary">
            <div class="container">
                <a class="navbar-brand" href="${pageContext.request.contextPath}/home">
                    <img src="${pageContext.request.contextPath}/assets/images/logos/logo.png" alt="Logo"
                         style="height: 60px;width: auto">
                </a>
                <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false"
                        aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <form class="search-form d-lg-none">
                        <input class="form-control" type="search" placeholder="Tìm kiếm" aria-label="Search">
                        <button class="btn btn-dark" type="submit">Tìm</button>
                    </form>
                    <div class="navbar-nav mx-auto fw-bold">
                        <a class="nav-link" href="${pageContext.request.contextPath}/home">TRANG CHỦ</a>
                        <a class="nav-link" href="${pageContext.request.contextPath}/about">GIỚI THIỆU</a>
                        <a class="nav-link" href="${pageContext.request.contextPath}/list-product">SẢN PHẨM</a>
                        <a class="nav-link" href="${pageContext.request.contextPath}/posts">TIN TỨC</a>
                        <a class="nav-link" href="${pageContext.request.contextPath}/contact">LIÊN HỆ</a>
                    </div>
                    <div class="action-buttons d-lg-none">
                        <div class="account-button-container">
                            <div class="d-flex align-items-center">
                                <c:set var="itemCount" value="${sessionScope.cart != null ? sessionScope.cart.size() : 0}" />
                                <a href="${pageContext.request.contextPath}/cart"
                                   class="btn btn-light position-relative me-2">
                                    <i class="bi bi-cart3"></i>
                                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger cartCount"
                                          style="display: ${itemCount > 0 ? 'block' : 'none'}">
                                        ${itemCount}
                                    </span>
                                </a>
                            </div>
                        </div>

                        <div class="account-button-container dropdown">
                            <button class="btn btn-light w-100" type="button" data-bs-toggle="dropdown"
                                    aria-expanded="false">
                                <i class="bi bi-person-circle"></i>
                            </button>
                            <ul class="dropdown-menu mobile-dropdown-menu">
                                <c:choose>
                                    <c:when test="${empty sessionScope.user}">
                                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/login">Đăng nhập</a></li>
                                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/register">Đăng ký</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/account/my-account">Tài khoản của tôi</a></li>
                                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/account/orders">Đơn hàng</a></li>
                                        <li><hr class="dropdown-divider"></li>
                                        <li>
                                            <form id="logoutFormUser" action="${pageContext.request.contextPath}/logout" method="POST" class="dropdown-item p-0">
                                                <button type="button" onclick="return logout()"
                                                        class="btn btn-link text-danger text-decoration-none w-100 text-start px-3">
                                                    <i class="bi bi-box-arrow-right me-2"></i>Đăng xuất
                                                </button>
                                            </form>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </ul>
                        </div>
                    </div>
                    <!-- Desktop search form -->
                    <form class="d-none d-lg-flex mt-lg-0 me-3">
                        <input class="form-control me-2" type="search" placeholder="Tìm kiếm" aria-label="Search">
                        <button class="btn btn-dark" type="submit">Tìm</button>
                    </form>
                    <!-- Desktop action buttons -->
                    <div class="d-none d-lg-flex align-items-center">
                        <c:set var="itemCount" value="${sessionScope.cart != null ? sessionScope.cart.size() : 0}" />
                        <a href="${pageContext.request.contextPath}/cart" class="btn btn-light me-3 position-relative">
                            <i class="bi bi-cart-fill"></i>
                            <c:if test="${itemCount > 0}">
                                <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger cartCount">
                                        ${itemCount}
                                </span>
                            </c:if>
                        </a>
                        <!-- Account dropdown for desktop -->
                        <div class="dropdown">
                            <button class="btn btn-light dropdown-toggle" type="button" id="desktopAccountDropdown"
                                    data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="bi bi-person-circle"></i>
                            </button>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="desktopAccountDropdown">
                                <c:choose>
                                    <c:when test="${empty sessionScope.user}">
                                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/login">Đăng nhập</a></li>
                                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/register">Đăng ký</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/account/my-account">Tài khoản của tôi</a></li>
                                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/account/orders">Đơn hàng</a></li>
                                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/cart">Giỏ hàng</a></li>
                                        <li><hr class="dropdown-divider"></li>
                                        <li>
                                            <form id="logoutForm" action="${pageContext.request.contextPath}/logout" method="POST" class="dropdown-item p-0">
                                                <button type="button" onclick="return logout()"
                                                        class="btn btn-link text-danger text-decoration-none w-100 text-start px-3">
                                                    <i class="bi bi-box-arrow-right me-2"></i>Đăng xuất
                                                </button>
                                            </form>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </nav>
    </div>

    <!-- JavaScript for logout confirmation -->
    <script type="text/javascript">
        function logout() {
            var confirmLogout = confirm("Bạn có chắc chắn muốn đăng xuất?");
            if (confirmLogout) {
                document.getElementById('logoutForm').submit();
                return true;
            } else {
                return false;
            }
        }
    </script>
</header>
