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
        background-color: var(--bs-primary);
    }

    /* Button styling */
    .btn-primary {
        background-color: var(--drumhub-dark);
        border-color: var(--drumhub-dark);
        color: #000;
    }

    .btn-primary:hover {
        background-color: #FF8C00;
        border-color: #FF8C00;
        color: #000;
    }

    .btn-outline-primary {
        color: var(--drumhub-dark);
        border-color: var(--drumhub-dark);
    }

    .btn-outline-primary:hover {
        background-color: var(--bs-primary);
        color: #000;
    }

    .nav-link:hover {
        color: var(--drumhub-dark) !important;
    }
    .nav-link {
        color: #000 !important;
        font-weight: 500;
    }

    /* Sửa lỗi bị đè phần tử */
    .row {
        margin-top: 20px;
    }
    .card-body {
        display: flex;
        flex-direction: column;
        justify-content: space-between;
    }
    .custom-box {
        background-color: var(--drumhub-secondary);
        border-radius: 5px;
        padding: 20px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        transition: all 0.3s ease;
    }
    .custom-box:hover {
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
    }
</style>
    <jsp:include page="header.jsp"/>
<main style="margin-top: 50px;">
    <div class="container py-4">
        <div class="row">
            <div class="col-lg-3">
                <h5 class="mb-3">Tin tức mới nhất</h5>
                    <div class="news-item d-flex mb-3">
                        <img src="../../assets/images/posts/trong-dien-tu-gia-re-la-bao-nhieu.jpg" alt="News 1"
                             class="me-3 rounded" style="width: 80px; height: 80px;">
                        <div>
                            <small class="text-muted">Trống điện tử là gì?</small>
                            <h6 class="mt-1 mb-1">Ngày nay, trống điện tử được lựa chọn khá nhiều nhằm phục vụ cho học
                                tập...</h6>
                        </div>
                    </div>

                    <div class="news-item d-flex mb-3">
                        <img src="../../assets/images/posts/khoa-hoc-03.jpg" alt="News 2" class="me-3 rounded"
                             style="width: 80px; height: 80px;">
                        <div>
                            <small class="text-muted">Khóa học Drum</small>
                            <h6 class="mt-1 mb-1">Hãy đến với DrumStore, bạn sẽ được học mọi thứ về Drums đặc biệt và
                                thú vị.</h6>
                        </div>
                    </div>

                    <div class="news-item d-flex mb-3">
                        <img src="../../assets/images/posts/66242379_2329789863976155_3500065297295998976_n.jpg"
                             alt="News 1" class="me-3 rounded" style="width: 80px; height: 80px;">
                        <div>
                            <small class="text-muted">Trống và giới trẻ</small>
                            <h6 class="mt-1 mb-1">Cuộc thi trống trẻ toàn cầu tại Mỹ</h6>
                        </div>
                    </div>

                    <div class="news-item d-flex mb-3">
                        <img src="../../assets/images/posts/227365-maintainratio-w1550-h1035-of-1-FFFFFF-dsc_3464.jpg"
                             alt="News 2" class="me-3 rounded" style="width: 80px; height: 80px;">
                        <div>
                            <small class="text-muted">Âm nhạc trong đời sống</small>
                            <h6 class="mt-1 mb-1">Có âm nhạc sẽ giúp mỗi con người thư thái hơn sau những bộn bề cuộc
                                sống.</h6>
                        </div>
                    </div>

                    <div class="news-item d-flex mb-3">
                        <img src="../../assets/images/posts/lich-su-trong-kham-pha-hanh-trinh.webp" alt="News 1"
                             class="me-3 rounded" style="width: 80px; height: 80px;">
                        <div>
                            <small class="text-muted">Lịch sử trống</small>
                            <h6 class="mt-1 mb-1">Khám phá hành trình phát triển qua các thời kì</h6>
                        </div>
                    </div>

                    <div class="news-item d-flex mb-3">
                        <img src="../../assets/images/posts/kiluc.webp" alt="News 2" class="me-3 rounded"
                             style="width: 80px; height: 80px;">
                        <div>
                            <small class="text-muted">Kỉ lục dàn trống lớn nhất thế giới</small>
                            <h6 class="mt-1 mb-1">Một dàn trống gồm 7.951 tay trống ở Shillong đã lập kỉ lục thế giới
                            </h6>
                        </div>
                    </div>
                <!-- Add more news items here -->
            </div>
            <!-- Cột giữa: Featured News -->
            <div class="col-lg-6">
                <h4 class="mb-3">Tin tức nổi bật</h4>
                <div class="featured mb-4">
                        <img src="../../assets/images/posts/viet-nam-gianh-chien-thang-cuoc-thi-drum-off-global-2019.jpg"
                             alt="Featured News" style="width: 630px; height: 400px;">
                        <h4 class="mt-3">Việt Nam giành quán quân cuộc thi Drum Off Global
                            2019</h4>
                        <p style="text-indent: 20px;">Hai sinh viên trẻ của Việt Nam là Nguyễn Đức Minh Dương và
                            Phạm
                            Duy Anh đã vượt qua hàng trăm đối thủ đến từ nhiều quốc gia trên thế giới để đoạt giải
                            nhất
                            danh giá tại cuộc thi Drum Off Global 2019 diễn ra vào chiều 31/8 tại Singapore.</p>
                </div>
                <div class="row">
                    <div class="col-md-6">
                            <img src="../../assets/images/posts/401564399-772495134892280-1414890838405770283-n-6965.webp"
                                 alt="Featured News 1" class="mb-2" style="width: 300px; height: 150px;">
                            <h6>Cuộc thi Fschools’s Got Talent 2023 tại Trường TH&THCS FPT Đà Nẵng</h6>
                    </div>
                    <div class="col-md-6">
                            <img src="../../assets/images/posts/20200201_074814.jpg" alt="Featured News 2" class="mb-2"
                                 style="width: 300px; height: 150px;">
                            <h6>Cuộc thi “Vươn ra thế giới”
                                TRỐNG TRẬN TÂY SƠN</h6>
                    </div>
                </div>
                <div class="featured mb-4 ">
                        <img src="../../assets/images/posts/img-2061-5524.jpg" alt="Featured News"
                             style="width: 630px; height: 400px;">
                        <h4 class="mt-3 ">Tiết mục của Đoàn Nghệ thuật Trống hội của Học viện
                            Cảnh sát Nhân dân</h4>
                        <p class="ms-0" style="text-indent: 20px;"> Ngày Quốc gia Việt Nam tại Triển lãm thế giới EXPO
                            Dubai - diễn ra vào ngày 30 tháng 12 năm 2021 là
                            ngày trình diễn văn hóa Việt Nam trước toàn thể nhân loại. Sân chơi ngày hôm đó được dành
                            trọn cho Việt Nam, bao gồm khu vực tại Ngôi nhà Việt Nam và toàn bộ quảng trường mái vòm Al
                            Wasl. Màn biểu diễn thể hiện niềm tự hào, khí thế, đặt mục tiêu giới thiệu các giá trị tinh
                            hoa truyền thống và thành tựu đổi mới sáng tạo của đất nước, con người Việt Nam, đồng thời
                            góp phần quảng bá vẻ đẹp, sự độc đáo, bản sắc văn hóa Việt, thông qua hoạt động biểu diễn
                            tiết mục trống hội đến với với bạn bè quốc tế trong khu vực Trung Đông và toàn thế giới...
                        </p>
                </div>
                <div class="featured mb-4">
                        <img src="../../assets/images/posts/5f97a8be12584.jpg" alt="Featured News"
                             style="width: 630px; height: 300px;">
                        <h4 class="mt-3">Top 10 sự kiện lễ hội âm nhạc Việt Nam được mong chờ nhất trong năm nhưng bị bỏ
                            lỡ vì covid</h4>
                        <p style="text-indent: 20px;">Hẳn nhà mình còn nhớ rất nhiều lễ hội đã được tổ chức năm 2019 rất
                            vui và giải trí hết cỡ.
                            Định rằng năm nay đến hẹn lại lên ring vé tham gia mà Cô vít lại làm chúng ta phải chờ năm
                            sau...</p>
                </div>
                <div class="row">
                    <div class="col-md-6">
                            <img src="../../assets/images/posts/eb704795-23c7-4752-9145-c5906fffa24f-z5350661987192_50c6937284c77608b81bddba85ccc089.jpg"
                                 alt="Featured News 1" class="mb-2" style="width: 300px; height: 150px;">
                            <h6>Lễ hội âm nhạc Coachella 2024: Bùng nổ sức sống giữa sa mạc khô cằn.</h6>
                    </div>
                    <div class="col-md-6">
                            <img src="../../assets/images/posts/pqk2543-17326734053461170447440.jpg"
                                 alt="Featured News 2" class="mb-2" style="width: 300px; height: 150px;">
                            <h6>Ban nhạc Bức Tường đại diện Việt Nam tham gia Liên hoan Âm nhạc ASEAN-Ấn Độ 2024</h6>
                    </div>
                </div>
            </div>
            <!-- Cột phải: Most Popular -->
            <div class="col-lg-3">
                <h5 class="mb-3">Tin tức phổ biến</h5>
                <div class="popular-item mb-3">
                        <img src="../../assets/images/posts/1649_3149_trong-dong-dong-son.jpg" alt="Popular 1"
                             style="width: 300px; height: 150px;">
                        <h6 class="mt-1">Văn hóa Đông Sơn: Nghệ thuật đỉnh cao Việt Nam thời nguyên thủy</h6>
                </div>
                <div class="ad-box my-3">
                        <img src="../../assets/images/posts/banner-km-tet-1024x1024.jpg" alt="Ad"
                             style="width: 250px; height: 250px;">
                </div>
                <div class="popular-item mb-3">
                        <img src="../../assets/images/posts/Z3323214798655_0185E.jpg" alt="Popular 2"
                             style="width: 300px; height: 150px;">
                        <small class="text-muted">Nhạc cụ cổ truyền Việt Nam</small>
                        <h6 class="mt-1">Âm nhạc là một trong những món ăn tinh thần không thể thiếu trong đời sống của
                            người dân Việt. Nền âm nhạc Việt Nam được biết đến với một kho tàng phong phú. </h6>
                </div>
                <div class="popular-item mb-3">
                        <img src="../../assets/images/posts/ttxvn_lien_hoan_van_hoa_nghe_thuat_dan_gian_viet_nam_lan_thu_hai_2.jpg.webp"
                             alt="Popular 3" style="width: 300px; height: 150px;">
                        <small class="text-muted">Lễ hội và âm nhạc</small>
                        <h6 class="mt-1">Trải nghiệm các nhạc cụ truyền thống qua lễ hội dân gian dân tộc</h6>
                </div>
            </div>
        </div>
    </div>
</main>
    <jsp:include page="footer.jsp"/>


