<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
    <title>Chi tiết Người dùng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
<div class="container mt-4">
    <h2>Chi tiết Người dùng</h2>
    <form action="${pageContext.request.contextPath}/dashboard/user" method="post">
        <input type="hidden" name="action" value="update" />
        <input type="hidden" name="id" value="${user.id}" />

        <div class="mb-3">
            <label for="username" class="form-label">Tên đăng nhập</label>
            <input type="text" class="form-control" id="username" name="username" value="${user.username}" required />
        </div>

        <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input type="email" class="form-control" id="email" name="email" value="${user.email}" />
        </div>

        <div class="mb-3">
            <label for="fullName" class="form-label">Họ tên</label>
            <input type="text" class="form-control" id="fullName" name="fullName" value="${user.fullName}" />
        </div>

        <div class="mb-3">
            <label for="role" class="form-label">Vai trò</label>
            <select id="role" name="role" class="form-select" required>
                <option value="1" ${user.role == 1 ? "selected" : ""}>Admin</option>
                <option value="0" ${user.role == 0 ? "selected" : ""}>Người dùng</option>
            </select>
        </div>

        <div class="mb-3">
            <label for="status" class="form-label">Trạng thái</label>
            <select id="status" name="status" class="form-select" required>
                <option value="1" ${user.status == 1 ? "selected" : ""}>Kích hoạt</option>
                <option value="0" ${user.status == 0 ? "selected" : ""}>Khóa</option>
            </select>
        </div>

        <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
        <a href="${pageContext.request.contextPath}/dashboard/user" class="btn btn-secondary ms-2">Hủy</a>
    </form>
</div>
</body>
