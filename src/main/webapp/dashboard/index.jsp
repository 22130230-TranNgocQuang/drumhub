<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Admin Dashboard - Tổng quan</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />

</head>
<body>
<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <nav class="col-md-3 col-lg-2 d-md-block bg-dark sidebar collapse text-white p-3" style="height: 100vh;">
            <h4 class="text-white mb-4">Quản trị</h4>
            <ul class="nav flex-column">
                <li class="nav-item mb-2">
                    <a class="nav-link text-white" href="/dashboard/user">Quản lý người dùng</a>
                </li>
                <li class="nav-item mb-2">
                    <a class="nav-link text-white" href="/dashboard/order">Quản lý đơn hàng</a>
                </li>
                <li class="nav-item mb-2">
                    <a class="nav-link text-white" href="/dashboard/product">Quản lý sản phẩm</a>
                </li>
                <li class="nav-item mb-2">
                    <a class="nav-link text-white" href="/statistics">Thống kê</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="/logout">Đăng xuất</a>
                </li>
            </ul>
        </nav>

        <!-- Main Content -->
        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 py-4">
            <h2>Tổng quan Dashboard</h2>
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="card text-white bg-primary mb-3">
                        <div class="card-body">
                            <h5 class="card-title">Tổng số người dùng</h5>
                            <p class="card-text fs-2">${totalUsers}</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card text-white bg-success mb-3">
                        <div class="card-body">
                            <h5 class="card-title">Tổng số sản phẩm</h5>
                            <p class="card-text fs-2">${totalProducts}</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card text-white bg-warning mb-3">
                        <div class="card-body">
                            <h5 class="card-title">Tổng số đơn hàng</h5>
                            <p class="card-text fs-2">${totalOrders}</p>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>

<!-- Bootstrap Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
