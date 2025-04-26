<%@ page contentType="text/html;charset=UTF-8" %>
<aside id="sidebar">
    <div class="d-flex">
        <button class="toggle-btn" type="button">
            <i class="bi bi-grid"></i>
        </button>
        <div class="sidebar-logo">
            <a href="${pageContext.request.contextPath}/dashboard">Drum Store</a>
        </div>
    </div>
    <ul class="sidebar-nav">
        <li class="sidebar-item">
            <a href="${pageContext.request.contextPath}/dashboard/users" class="sidebar-link">
                <i class="bi bi-people"></i>
                <span>Quản lý người dùng</span>
            </a>
        </li>
        <li class="sidebar-item">
            <a href="${pageContext.request.contextPath}/dashboard/products" class="sidebar-link">
                <i class="bi bi-box"></i>
                <span>Quản lý sản phẩm</span>
            </a>
        </li>
        <li class="sidebar-item">
            <a href="${pageContext.request.contextPath}/dashboard/orders" class="sidebar-link">
                <i class="bi bi-cart"></i>
                <span>Quản lý đơn hàng</span>
            </a>
        </li>
        <li class="sidebar-item">
            <a href="${pageContext.request.contextPath}/dashboard/sales" class="sidebar-link">
                <i class="bi bi-tags"></i>
                <span>Quản lý giảm giá</span>
            </a>
        </li>
        <li class="sidebar-item">
            <a href="${pageContext.request.contextPath}/dashboard/categories" class="sidebar-link">
                <i class="bi bi-collection"></i>
                <span>Quản lý danh mục</span>
            </a>
        </li>
        <li class="sidebar-item">
            <a href="${pageContext.request.contextPath}/dashboard/brands" class="sidebar-link">
                <i class="bi bi-bag"></i>
                <span>Quản lý thương hiệu</span>
            </a>
        </li>
        <li class="sidebar-item">
            <a href="${pageContext.request.contextPath}/dashboard/profile" class="sidebar-link">
                <i class="bi bi-person"></i>
                <span>Thông tin cá nhân</span>
            </a>
        </li>

        <li class="sidebar-item">
            <a href="javascript:void(0)" onclick="logout()" class="sidebar-link">
                <i class="bi bi-box-arrow-left"></i>
                <span>Đăng xuất</span>
            </a>
            <form id="logoutForm" action="${pageContext.request.contextPath}/logout" method="POST" style="display: none">
            </form>
        </li>
    </ul>
</aside>