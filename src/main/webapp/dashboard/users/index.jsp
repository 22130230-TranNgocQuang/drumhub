<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Admin Dashboard - Quản lý Người dùng</title>

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
                    <a class="nav-link text-white" href="#">Quản lý người dùng</a>
                </li>
                <li class="nav-item mb-2">
                    <a class="nav-link text-white" href="/orders">Quản lý đơn hàng</a>
                </li>
                <li class="nav-item mb-2">
                    <a class="nav-link text-white" href="/products">Quản lý sản phẩm</a>
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
            <h2>Danh sách người dùng</h2>
            <div class="table-responsive">
                <table id="userTable" class="table table-striped table-bordered">
                    <thead class="table-primary">
                    <tr>
                        <th>ID</th>
                        <th>Tên đăng nhập</th>
                        <th>Email</th>
                        <th>Họ tên</th>
                        <th>Vai trò</th>
                        <th>Trạng thái</th>
                        <th>Ngày tạo</th>
                        <th>Hành động</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="user" items="${users}">
                        <tr>
                            <td>${user.id}</td>
                            <td>${user.username}</td>
                            <td>${user.email}</td>
                            <td>${user.fullName}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${user.role == 'admin'}">Admin</c:when>
                                    <c:otherwise>Người dùng</c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${user.status == 1}">Kích hoạt</c:when>
                                    <c:otherwise>Khóa</c:otherwise>
                                </c:choose>
                            </td>
                            <td>${user.createdAt}</td>
                            <td>
                                <a href="/edit-user?id=${user.id}" class="btn btn-sm btn-warning">Sửa</a>
                                <a href="/delete-user?id=${user.id}" class="btn btn-sm btn-danger" onclick="return confirm('Bạn có chắc muốn xóa không?')">Xóa</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </main>
    </div>
</div>

<!-- jQuery (cần cho DataTables) -->
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

<!-- Bootstrap Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- DataTables JS -->
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>

<!-- Kích hoạt DataTable -->
<script>
    $(document).ready(function () {
        $('#userTable').DataTable({
            language: {
                url: "//cdn.datatables.net/plug-ins/1.13.6/i18n/vi.json"
            }
        });
    });
</script>

</body>
