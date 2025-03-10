<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<section id="productForm">
    <input type="hidden" name="id" value="${product.id}">
    <section class="row mb-3">

        <div class="col-md-8">
            <div class="row">
                <div class="col-md-6 mb-2">
                    <label class="form-label fw-bold">Tên sản phẩm:</label>
                    <input type="text" value="${product.name}" class="form-control" readonly>
                </div>

                <div class="col-md-6 mb-2">
                    <label class="form-label fw-bold">Chi tiết:</label>
                    <textarea class="form-control" rows="5" readonly>${product.description}</textarea>
                </div>

                <div class="col-md-6 mb-2">
                    <label class="form-label fw-bold">Giá:</label>
                    <input type="text" value="${product.price}" class="form-control" readonly>
                </div>

                <div class="col-md-6 mb-2">
                    <label class="form-label fw-bold">Còn trong kho:</label>
                    <input type="text" value="${product.stock}" class="form-control" readonly>
                </div>

                <div class="col-md-6 mb-2">
                    <label class="form-label fw-bold">Số lượt xem:</label>
                    <input type="text" value="${product.totalViews}" class="form-control" readonly>
                </div>

                <div class="col-md-6 mb-2">
                    <label class="form-label fw-bold">Sản phẩm nổi bật:</label>
                    <input type="text" value="${product.isFeatured == true ? 'Có' : 'Không'}" class="form-control" readonly>
                </div>

                <div class="col-md-6 mb-2">
                    <label class="form-label fw-bold">Trạng thái:</label>
                    <input type="text" value="${product.status == 1 ? 'Hoạt động' : 'Bị cấm'}" class="form-control" readonly>
                </div>

                <div class="col-md-6 mb-2">
                    <label class="form-label fw-bold">Trung bình đánh giá:</label>
                    <input type="number" value="${product.averageRating}" class="form-control" readonly>
                </div>

            </div>
        </div>
    </section>

    <section class="row mb-4">
        <div class="col-12">
            <h5>Danh sách hình ảnh</h5>
            <table id="imageTable" class="table">
                <thead>
                <tr>
                    <th>#</th>
                    <th>Ảnh</th>
                    <th>Ảnh chính</th>
                    <th>Thao tác</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="productImage" items="${product.images}">
                    <tr>
                        <td>${productImage.id}</td>
                        <td><img class="product-image" src="${productImage.image}" alt="${productImage.image}"></td>
                        <td>${productImage.isMain ? 'Có' : 'Không'}</td>
                        <td>
                            <div class="btn-group">
                                <form action="${pageContext.request.contextPath}/dashboard/products/${product.id}/productImage/${productImage.id}" method="GET">
                                    <button type="submit" class="btn btn-info">Xem</button>
                                </form>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </section>

    <section class="row mb-4">
        <div class="col-12">
            <h5>Danh sách màu</h5>
            <table id="colorTable" class="table table-bordered striped">
                <thead>
                <tr>
                    <th>#</th>
                    <th>Mã màu</th>
                    <th>Tên màu</th>
                    <th>Thao tác</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="productColor" items="${product.colors}">
                    <tr>
                        <td>${productColor.id}</td>
                        <td>
                            <p class="color-code" style="color: ${productColor.colorCode};">
                                ${productColor.colorCode}
                            </p>
                        </td>
                        <td>${productColor.colorName}</td>
                        <td>
                            <div class="btn-group">
                                <form action="${pageContext.request.contextPath}/dashboard/products/${product.id}/productColor/${productColor.id}" method="GET">
                                    <button type="submit" class="btn btn-info">Xem</button>
                                </form>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </section>

    <div class="form-actions">
        <a href="${pageContext.request.contextPath}/dashboard/products" class="btn btn-secondary">Quay lại</a>
    </div>
</section>

<style>
    .form-actions {
        margin-top: 20px;
    }

    .product-image {
        width: 400px;
        height: 400px;
        object-fit: cover;
        justify-content: center;
    }

    .color-code {
        font-weight: bold;
        /*mix-blend-mode: difference;*/
    }
</style>
<script>
    $(document).ready(function () {
        $('#imageTable').DataTable({
            responsive: true, // Bảng responsive
            paging: true,      // Bật phân trang
            searching: true,   // Bật tìm kiếm
            ordering: true,    // Cho phép sắp xếp
            lengthMenu: [5, 10, 20, 100], // Tùy chọn số hàng hiển thị
            columnDefs: [
                {orderable: false, targets: [3]} // Vô hiệu hóa sắp xếp cho cột Thao tác
            ]
        });

        $('#colorTable').DataTable({
            responsive: true, // Bảng responsive
            paging: true,      // Bật phân trang
            searching: true,   // Bật tìm kiếm
            ordering: true,    // Cho phép sắp xếp
            lengthMenu: [5, 10, 20, 100], // Tùy chọn số hàng hiển thị
            columnDefs: [
                {orderable: false, targets: [3]} // Vô hiệu hóa sắp xếp cho cột Thao tác
            ]
        });
    });
</script>

