<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<form id="createProductForm" action="${pageContext.request.contextPath}/dashboard/products" method="POST" enctype="multipart/form-data">
    <input type="hidden" name="_method" value="PUT">
    <input type="hidden" name="csrf_token" value="${csrfToken}">
    <section class="row mb-3">
        <div class="col-md-8">
            <div class="row">
                <div id="image-element"></div>
                <div class="col-md-6 mb-2">
                    <label class="form-label fw-bold">Tên sản phẩm:</label>
                    <input type="text" id="name" name="name" value="" class="form-control" placeholder="Tên sản phẩm" required>
                </div>

                <div class="col-md-6 mb-2">
                    <label class="form-label fw-bold">Chi tiết sản phẩm:</label>
                    <textarea class="form-control" rows="5" id="description" name="description" placeholder="Chi tiết sản phẩm" required></textarea>
                </div>

                <div class="col-md-6 mb-2">
                    <label class="form-label fw-bold">Giá:</label>
                    <input type="text" id="price" name="price" value="" class="form-control" placeholder="Giá" required>
                </div>

                <div class="col-md-6 mb-2">
                    <label class="form-label fw-bold">Còn trong kho:</label>
                    <input type="text" id="stock" name="stock" value="" class="form-control" placeholder="Còn trong kho" required>
                </div>

                <div class="col-md-6 mb-2">
                    <label class="form-label fw-bold">Sản phẩm nổi bật:</label>
                    <div class="form-check form-switch">
                        <input class="form-check-input" type="checkbox" id="isFeaturedToggle"
                               name="isFeatured" value="${product.isFeatured}" ${product.isFeatured == true ? 'checked' : ''}
                               onchange="updateIsFeaturedToggle(this)" required>
                        <label class="form-check-label" for="isFeaturedToggle">
                            ${product.isFeatured == true ? 'Có' : 'Không'}
                        </label>
                    </div>
                </div>

                <div class="col-md-6 mb-2">
                    <label class="form-label fw-bold">Trạng thái:</label>
                    <div class="form-check form-switch">
                        <!-- Input hidden chứa giá trị ban đầu của status -->
                        <input type="hidden" name="status" value="0">
                        <input class="form-check-input" type="checkbox" id="statusToggle"
                               name="status" value="1" ${product.status == 1 ? 'checked' : ''}
                               onchange="updateStatusToggle(this)" required>
                        <label class="form-check-label" for="statusToggle">
                            ${product.status == 1 ? 'Hoạt động' : 'Không hoạt động'}
                        </label>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="row mb-4">
        <div class="col-12">
            <h5>Danh sách ảnh</h5>

            <div class="create-input-form border p-3 mb-3">
                <div class="row">
                    <div class="col-md-5 mb-2">
                        <label class="form-label">Đường dẫn ảnh:</label>
                        <input type="text" id="newImage" class="form-control">
                    </div>
                    <div class="col-md-2 mb-2">
                        <label class="form-label">Là ảnh chính:</label>
                        <div class="form-check form-switch">
                            <input class="form-check-input" type="checkbox" id="newIsMain">
                        </div>
                    </div>
                    <div class="col-md-1 mb-2 d-flex align-items-end">
                        <button type="button" class="btn btn-primary" onclick="addNewImage()">
                            Thêm
                        </button>
                    </div>
                </div>
            </div>

            <div class="create-list mb-3">
                <h6>Danh sách Ảnh đã thêm:</h6>
                <div id="imagesContainer" class="list-group">
                    <!-- Ảnh sẽ được thêm vào đây -->
                </div>
            </div>

            <!-- Hidden input để lưu danh sách dạng JSON -->
            <input type="hidden" name="imagesJson" id="ImagesJson">
        </div>
    </section>

    <section class="row mb-4">
        <div class="col-12">
            <h5>Danh sách màu</h5>

            <div class="create-input-form border p-3 mb-3">
                <div class="row">
                    <div class="col-md-5 mb-2">
                        <label class="form-label">Mã màu:</label>
                        <input type="text" id="newColorCode" class="form-control">
                    </div>
                    <div class="col-md-2 mb-2">
                        <label class="form-label">Tên màu:</label>
                        <input type="text" id="newColorName" class="form-control">
                    </div>
                    <div class="col-md-1 mb-2 d-flex align-items-end">
                        <button type="button" class="btn btn-primary" onclick="addNewColor()">
                            Thêm
                        </button>
                    </div>
                </div>
            </div>

            <div class="create-list mb-3">
                <h6>Danh sách màu đã thêm:</h6>
                <div id="colorsContainer" class="list-group">
                    <!-- maù sẽ được thêm vào đây -->
                </div>
            </div>

            <!-- Hidden input để lưu danh sách dạng JSON -->
            <input type="hidden" name="colorsJson" id="ColorsJson">
        </div>
    </section>

    <div class="form-actions">
        <button type="submit" class="btn btn-primary">Tạo mới</button>
        <a href="${pageContext.request.contextPath}/dashboard/products" class="btn btn-secondary">Hủy</a>
    </div>
</form>

<style>
    .form-actions {
        margin-top: 20px;
    }

    .create-item {
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 10px 15px;
        margin-bottom: 5px;
    }

    .create-info {
        flex-grow: 1;
    }

    .create-actions {
        display: flex;
        gap: 5px;
    }

    .default-badge {
        background-color: #198754;
        color: white;
        padding: 2px 8px;
        border-radius: 4px;
        font-size: 0.8em;
        margin-left: 10px;
    }
</style>

<script>
    let images = [];
    let colors = [];

    function addNewImage() {
        const imageInput = document.getElementById('newImage');
        const isMainInput = document.getElementById('newIsMain');

        // Validation
        if (!imageInput.value.trim()) {
            alert('Vui lòng nhập ảnh');
            return;
        }

        if (isMainInput.checked) {
            images.forEach(img => img.isMain = false);
        }

        const newImage = {
            image: imageInput.value.trim(),
            isMain: isMainInput.checked
        };
        images.push(newImage);

        // Cập nhật giao diện
        renderTable();

        // Reset form
        imageInput.value = '';
        isMainInput.checked = false;
    }

    function addNewColor() {
        const colorCodeInput = document.getElementById('newColorCode');
        const colorNameInput = document.getElementById('newColorName');

        // Validation
        if (!colorCodeInput.value.trim() || !colorNameInput.value.trim()) {
            alert('Vui lòng nhập mã màu và tên màu');
            return;
        }

        const newColor = {
            colorCode: colorCodeInput.value.trim(),
            colorName: colorNameInput.value.trim(),
        };
        colors.push(newColor);

        // Cập nhật giao diện
        renderTable();

        // Reset form
        colorCodeInput.value = '';
        colorNameInput.value = '';
    }

    function renderTable() {
        const imagesContainer = document.getElementById('imagesContainer');
        const colorsContainer = document.getElementById('colorsContainer');
        imagesContainer.innerHTML = '';
        colorsContainer.innerHTML = '';

        images.forEach((img, index) => {
            console.log(img.image, img.isMain, index);
            const imageElement = document.createElement('div');
            imageElement.className = 'list-group-item create-item';
            imageElement.innerHTML = `
            <div class="create-info">
                <strong>\${img.image}</strong>
                \${img.isMain ? '<span class="default-badge">Mặc định</span>' : ''}
            </div>
            <div class="create-actions">
                \${!img.isMain ? `<button type="button" class="btn btn-sm btn-success" onclick="setMainImage(\${index})">Đặt làm ảnh chính</button>`: ''}
                <button type="button" class="btn btn-sm btn-danger"
                    onclick="removeImage(${index})">
                    Xóa
                </button>
            </div>
            `;
            imagesContainer.appendChild(imageElement);
        });

        colors.forEach((cl, index) => {
            const colorElement = document.createElement('div');
            colorElement.className = 'list-group-item create-item';
            colorElement.innerHTML = `
                <div class="create-info">
                    <strong>\${cl.colorCode}</strong>
                </div>
                <div class="create-info">
                    \${cl.colorName}
                </div>
                <div class="create-actions">
                    <button type="button" class="btn btn-sm btn-danger"
                            onclick="removeColor(${index})">
                        Xóa
                    </button>
                </div>
            `;
            colorsContainer.appendChild(colorElement);
        });

        // Cập nhật hidden input với dữ liệu JSON
        document.getElementById('ImagesJson').value = JSON.stringify(images);
        document.getElementById('ColorsJson').value = JSON.stringify(colors);
    }

    function setMainImage(index) {
        images.forEach(img => img.isMain = false);
        images[index].isMain = true;
        renderTable();
    }

    function removeImage(index) {
        images.splice(index, 1);
        renderTable();
    }

    function removeColor(index) {
        colors.splice(index, 1);
        renderTable();
    }

    // Xử lý submit form
    document.getElementById('createProductForm').addEventListener('submit', function(e) {
        if (images.length === 0 || colors.length === 0) {
            e.preventDefault();
            alert('Vui lòng thêm ít nhất một ảnh và một màu');
            return;
        }

        // Kiểm tra có ít nhất một địa chỉ mặc định
        if (!images.some(img => img.isMain)) {
            e.preventDefault();
            alert('Vui lòng chọn một ảnh làm ảnh chính');
            return;
        }

        document.getElementById('ImagesJson').value = JSON.stringify(images);
        document.getElementById('ColorsJson').value = JSON.stringify(colors);
    });

    function updateIsFeaturedToggle(toggle) {
        const label = toggle.nextElementSibling;

        // Cập nhật giá trị của thuộc tính value (!!toggle.checked)
        toggle.value = toggle.checked ? true : false;

        // Cập nhật nội dung label theo trạng thái của toggle
        if (label) {
            label.textContent = toggle.checked ? 'Có' : 'Không';
        }
    }

    function updateStatusToggle(toggle) {
        const label = toggle.nextElementSibling;

        // Lấy giá trị của hidden input name="status"
        const hiddenInput = toggle.closest('div').querySelector('input[type="hidden"]');

        // Cập nhật giá trị của hidden input tùy theo trạng thái của checkbox
        hiddenInput.value = toggle.checked ? '1' : '0';

        // Cập nhật nội dung label theo trạng thái của toggle
        if (label) {
            label.textContent = toggle.checked ? 'Hoạt động' : 'Không hoạt động';
        }
    }
</script>