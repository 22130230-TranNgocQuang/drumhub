<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách sản phẩm</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">

    <style>
        :root {
            --drumhub-primary: #FFD700;  /* Màu vàng chính */
            --drumhub-secondary: #FFFACD; /* Màu vàng nhạt */
            --drumhub-dark: #FFA500;     /* Màu cam vàng đậm */
            --drumhub-accent: #FF6347;   /* Màu phụ tomato */
        }

        /* Nền header/footer */
        .navbar, .footer {
            background-color: var(--drumhub-primary) !important;
        }

        /* Nút chính */
        .btn-primary {
            background-color: var(--drumhub-dark);
            border-color: var(--drumhub-dark);
        }
        .btn-primary:hover {
            background-color: #FF8C00;
            border-color: #FF8C00;
        }

        /* Card sản phẩm */
        .card {
            border: 1px solid var(--drumhub-secondary);
            transition: all 0.3s ease;
        }
        .card:hover {
            box-shadow: 0 5px 15px rgba(255, 215, 0, 0.3);
            transform: translateY(-5px);
        }

        /* Badge trạng thái */
        .bg-success {
            background-color: #28a745 !important; /* Giữ màu xanh cho trạng thái còn hàng */
        }
        .bg-secondary {
            background-color: #6c757d !important; /* Giữ màu xám cho hết hàng */
        }

        /* Giá sản phẩm */
        .price-text {
            color: var(--drumhub-dark);
            font-weight: bold;
        }

        /* Hiệu ứng hover nút */
        .btn-outline-primary {
            color: var(--drumhub-dark);
            border-color: var(--drumhub-dark);
        }
        .btn-outline-primary:hover {
            background-color: var(--drumhub-primary);
        }
    /* Tối ưu CSS cho trang liên hệ */
    .contact-info {
        display: flex;
        justify-content: space-around;
        flex-wrap: wrap;
        gap: 2rem;
        padding: 2rem 0;
    }

    .contact-info i {
        font-size: 2.5rem;
        color: var(--bs-primary);
        margin-bottom: 1rem;
    }

    .contact-info h4 {
        font-size: 1.25rem;
        font-weight: 600;
        color: #333;
    }

    .contact-info p {
        font-size: 1rem;
        color: #666;
    }

    .contact-form {
        background: #f8f9fa;
        padding: 2rem;
        border-radius: 10px;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
    }

    .map-container {
        height: 400px;
        width: 100%;
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
    }

    /* Banner Section */
    .container-fluid.py-5.mb-5 {
        background: #f1f1f1;
        text-align: center;
    }

    .container-fluid.py-5.mb-5 h1 {
        font-size: 2rem;
        color: var(--bs-primary);
        margin-top: 2rem;
    }

    /* Responsive */
    @media (max-width: 768px) {
        .contact-info {
            flex-direction: column;
            align-items: center;
        }
        .contact-info i {
            font-size: 3rem;
        }

        .map-container {
            height: 300px;
        }
    }
    </style>
</head>
<jsp:include page="header.jsp"/>
<main>
    <!-- Banner -->
    <div class="container-fluid py-5 mb-5" style="margin-top: 100px;">
        <div class="container">
            <h1>LIÊN HỆ VỚI CHÚNG TÔI</h1>
        </div>
    </div>

    <!-- Contact Section -->
    <div class="container my-5">
        <div class="contact-info">
            <div class="mb-4 text-center">
                <i class="bi bi-geo-alt"></i>
                <h4>Địa Chỉ</h4>
                <p>123 Đường ABC, Quận 1, TP.HCM</p>
            </div>
            <div class="mb-4 text-center">
                <i class="bi bi-telephone"></i>
                <h4>Điện Thoại</h4>
                <p>Hotline: 123-456-7890</p>
                <p>Bảo hành: 098-765-4321</p>
            </div>
            <div class="mb-4 text-center">
                <i class="bi bi-envelope"></i>
                <h4>Email</h4>
                <p>info@drumstore.com</p>
                <p>support@drumstore.com</p>
            </div>
            <div class="mb-4 text-center">
                <i class="bi bi-clock"></i>
                <h4>Giờ Làm Việc</h4>
                <p>Thứ 2 - Chủ nhật: 8:00 - 22:00</p>
            </div>
        </div>

        <!-- Bản đồ -->
        <div class="row mt-5">
            <div class="col-12">
                <h3 class="text-center mb-4">BẢN ĐỒ CỬA HÀNG</h3>
                <div class="map-container">
                    <iframe
                            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.325247592686!2d106.66372161533417!3d10.786840792314456!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752ed2392c44df%3A0xd2ecb62e0d050fe9!2sFPT-Aptech%20Computer%20Education%20HCM!5e0!3m2!1sen!2s!4v1642728362543!5m2!1sen!2s"
                            width="100%" height="100%" style="border:0;" allowfullscreen="" loading="lazy">
                    </iframe>
                </div>
            </div>
        </div>
    </div>
</main>
<!-- Footer -->
<jsp:include page="footer.jsp"/>