<%@ page contentType="text/html;charset=UTF-8" %>
<style>
    * {
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
    }

    body {
        justify-content: center;
        align-items: center;
        margin: 0;
    }

    .login-container {
        margin: 0 auto;
        align-content: center;
        width: 800px;
        background-color: #fff;
        padding: 30px;
        text-align: center;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .login-container h3 {
        font-size: 24px;
        font-weight: bold;
        margin-bottom: 20px;
    }

    /* Social buttons */
    .social-buttons {
        display: flex;
        justify-content: center;
        gap: 50px;
        margin-bottom: 20px;
    }

    .btn-social {
        border: none;
        display: flex;
        justify-content: center;
        align-items: center;
        cursor: pointer;
        background-color: white;
    }

    .btn-social img {
        width: 20px;
        height: 20px;
        margin-right: 5px;
    }

    /* Form styles */
    .field {
        position: relative;
        margin-bottom: 30px;
    }

    .field input {
        width: 100%;
        padding: 0.5rem;
        border: none;
        border-bottom: 1px solid #ccc;
        outline: none;
        color: #fd0;
        background: none;
    }

    .field label {
        position: absolute;
        font-size: 14px;
        top: 0;
        left: 0;
        translate: 0.625rem 0.625rem;
        color: #fd0;
        padding-inline-start: 0.25rem;
        pointer-events: none;
        transition: translate 250ms;
        visibility: hidden;
    }

    .field:focus-within label,
    .field:not(:has(:placeholder-shown)),
    label {
        translate: 0.5rem -1rem;
        visibility: visible;
    }

    .error-message {
        text-align: left;
        margin-top: 5px;
        color: red;
        font-size: 12px;
    }

    .btn-login {
        background-color: #fd0;
        color: black;
        padding: 10px;
        width: 100%;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 1rem;
    }

    .text-link {
        color: #fd0;
        text-decoration: none;
    }

    .text-link:hover {
        text-decoration: underline;
    }

    .footer-links {
        margin-top: 20px;
    }
</style>
<div class="container my-5" style="min-height: 70vh">
    <div class="row">
        <div class="login-container col-12 col-md-8">
            <h3>Đăng ký với</h3>

            <div class="social-buttons">
                <button class="btn-social">
                    <img src="${pageContext.request.contextPath}/assets/images/logos/google-logo.png" alt="Google">
                    Google
                </button>
                <button class="btn-social">
                    <img src="${pageContext.request.contextPath}/assets/images/logos/Facebook.png" alt="Facebook">
                    Facebook
                </button>
            </div>

            <div class="divider">hoặc</div>

            <form id="register-form" action="${pageContext.request.contextPath}/register" method="post">
                <div class="field">
                    <input type="text" name="fullname" id="full-name" placeholder="Nhập họ và tên" required>
                    <label for="full-name">Họ và tên</label>
                    <p id="full-name-error" class="error-message">${fullnameError}</p>
                </div>

                <div class="field">
                    <input type="tel" name="phone" id="phone-number" placeholder="Nhập số điện thoại" required>
                    <label for="phone-number">Số điện thoại</label>
                    <p id="phone-number-error" class="error-message">${phoneError}</p>
                </div>

                <div class="field">
                    <input type="email" name="email" id="email-address" placeholder="Nhập email" required>
                    <label for="email-address">Email</label>
                    <p id="email-address-error" class="error-message">${emailError}</p>
                </div>

                <div class="field">
                    <input type="password" name="password" id="password" placeholder="Nhập mật khẩu" required>
                    <label for="password">Mật khẩu</label>
                    <p id="password-error" class="error-message">${passwordError}</p>
                </div>

                <div class="field">
                    <input type="password" id="confirm-password" placeholder="Nhập lại mật khẩu" required>
                    <label for="confirm-password">Nhập lại mật khẩu</label>
                    <p id="confirm-password-error" class="error-message"></p>
                </div>

                <button type="submit" class="btn-login">Đăng ký</button>
            </form>
            <div class="footer-links">
                <p>Bạn đã có tài khoản? <a href="${pageContext.request.contextPath}/login" class="text-link">Đăng nhập
                    ngay</a></p>
            </div>
        </div>
    </div>
</div>

