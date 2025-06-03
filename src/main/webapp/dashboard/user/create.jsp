<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<html>
<head>
  <title>Thêm Người dùng</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
<div class="container mt-4">
  <h2>Thêm Người dùng mới</h2>
  <form action="${pageContext.request.contextPath}/dashboard/user" method="post">
    <input type="hidden" name="action" value="create" />
    <div class="mb-3">
      <label class="form-label">Tên đăng nhập</label>
      <input type="text" class="form-control" name="username" required>
    </div>
    <div class="mb-3">
      <label class="form-label">Email</label>
      <input type="email" class="form-control" name="email" required>
    </div>
    <div class="mb-3">
      <label class="form-label">Họ tên</label>
      <input type="text" class="form-control" name="fullName" required>
    </div>
    <div class="mb-3">
      <label class="form-label">Mật khẩu</label>
      <input type="password" class="form-control" name="password" required>
    </div>
    <div class="mb-3">
      <label class="form-label">Vai trò</label>
      <select name="role" class="form-control">
        <option value="0">Người dùng</option>
        <option value="1">Admin</option>
      </select>
    </div>
    <button type="submit" class="btn btn-success">Thêm</button>
    <a href="${pageContext.request.contextPath}/dashboard/user" class="btn btn-secondary">Quay lại</a>
  </form>
</div>
</body>
</html>
