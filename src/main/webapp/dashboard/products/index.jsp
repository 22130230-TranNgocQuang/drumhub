<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Admin Dashboard - Quản lý Sản phẩm</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />

    <!-- DataTables CSS -->
    <link href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css" rel="stylesheet" />
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <nav class="col-md-3 col-lg-2 d-md-block bg-dark sidebar collapse text-white p-3" style="height: 100vh;">
            <h4 class="text-white mb-4">Quản trị</h4>
            <ul class="nav flex-column">
                <li class="nav-item mb-2">
                    <a class="nav-link text-white" href="/dashboard/users">Quản lý người dùng</a>
                </li>
                <li class="nav-item mb-2">
                    <a class="nav-link text-white" href="/dashboard/orders">Quản lý đơn hàng</a>
                </li>
                <li class="nav-item mb-2">
                    <a class="nav-link text-white active" href="/dashboard/products">Quản lý sản phẩm</a>
                </li>
                <li class="nav-item mb-2">
                    <a class="nav-link text-white" href="/dashboard/statistics">Thống kê</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="/logout">Đăng xuất</a>
                </li>
            </ul>
        </nav>

        <!-- Main Content -->
        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 py-4">
            <h2>Danh sách sản phẩm</h2>
            <div class="table-responsive">
                <table id="productTable" class="table table-striped table-bordered">
                    <thead class="table-primary">
                    <tr>
                        <th>ID</th>
                        <th>Tên sản phẩm</th>
                        <th>Giá</th>
                        <th>Danh mục</th>
                        <th>Trạng thái</th>
                        <th>Hành động</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="product" items="${products}">
                        <tr>
                            <td>${product.id}</td>
                            <td>${product.name}</td>
                            <td><fmt:formatNumber value="${product.price}" type="currency"/></td>
                            <td>${product.categoryId}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${product.status}">Hiển thị</c:when>
                                    <c:otherwise>Đã ẩn</c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <a href="/edit-product?id=${product.id}" class="btn btn-sm btn-warning">Sửa</a>
                                <a href="/dashboard/products/delete?id=${product.id}" class="btn btn-sm btn-danger"
                                   onclick="return confirm('Bạn có chắc muốn ẩn sản phẩm này?')">Ẩn</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </main>
    </div>
</div>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- DataTables JS -->
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>

<!-- Activate DataTables -->
<script>
    $(document).ready(function () {
        $('#productTable').DataTable({
            language: {
                url: "//cdn.datatables.net/plug-ins/1.13.6/i18n/vi.json"
            }
        });
    });
</script>

</body>
