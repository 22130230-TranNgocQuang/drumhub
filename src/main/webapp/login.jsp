<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
    .success-message {
        color: green;
        font-size: 14px;
        margin-bottom: 20px;
    }

    * {
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
    }

    body {
        justify-content: center;
        align-items: center;
    }

    .login-container {
        margin: 0 auto;
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

    .divider {
        display: flex;
        align-items: center;
        text-align: center;
        margin: 20px 0;
        color: black;
    }

    .divider::before, .divider::after {
        content: '';
        flex: 1;
        border-bottom: 1px solid #ccc;
    }

    .divider:not(:empty)::before {
        margin-right: 10px;
    }

    .divider:not(:empty)::after {
        margin-left: 10px;
    }

    .field {
        position: relative;
    }

    .field input {
        width: 100%;
        padding: 0.5rem;
        margin-bottom: 30px;
        border: none;
        border-bottom: 1px solid #ccc;
        outline: none;
        background: none;
        color: #fd0;
    }

    .field label {
        position: absolute;
        font-size: 14px;
        top: 0;
        left: 0;
        transform: translate(0.625rem, 0.625rem);
        color: #fd0;
        padding-left: 0.25rem;
        pointer-events: none;
        transition: transform 250ms;
        visibility: hidden;
    }

    .field:focus-within label,
    .field:not(:has(:placeholder-shown)) label {
        transform: translate(0.5rem, -1rem);
        visibility: visible;
    }

    .field input:focus {
        border-bottom: 1px solid #fd0;
    }

    .error-message {
        text-align: left;
        margin-top: -20px;
        margin-bottom: 20px;
        color: red;
        font-size: 10px;
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

    .btn-login:hover {
        background-color: #fd0;
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

    .forgot-password {
        text-decoration: none;
        color: black;
        font-size: 13px;
        font-style: italic;
    }

    .error-message {
        text-align: left;
        margin-top: -20px;
        margin-bottom: 20px;
        color: red;
        font-size: 10px;
    }
</style>

<div class="container my-5" style="min-height: 70vh">
    <div class="row">
        <div class="login-container col-12 col-md-8">
            <h3>Đăng nhập với</h3>
            <div class="social-buttons">
                <button class="btn-social" onclick="window.location.href='${pageContext.request.contextPath}/login?action=google'">
                    <img src="${pageContext.request.contextPath}/assets/images/logos/google-logo.png" alt="Google" style="width: 20px; height: 20px;">
                    &nbsp;Google
                </button>
                <button class="btn-social" onclick="window.location.href='${pageContext.request.contextPath}/login?action=facebook'">
                    <img src="${pageContext.request.contextPath}/assets/images/logos/Facebook.png" alt="Facebook" style="width: 20px; height: 20px;">
                    &nbsp;Facebook
                </button>
            </div>
            <div class="divider">hoặc</div>

            <!-- Hiển thị lỗi nếu có -->
            <c:if test="${not empty errorMessage}">
                <p class="error-message" >${errorMessage}</p>
            </c:if>

            <!-- Hiển thị countdown khóa tài khoản -->
            <c:if test="${not empty lockTimeRemaining}">
                <div id="lockMessage" style="color: red; margin-bottom: 20px;">
                    Tài khoản bị khóa do nhập mật khẩu sai nhiều lần. Vui lòng chờ <span id="countdown">${lockTimeRemaining}</span> giây...
                </div>
                <div id="unlockMessage" style="color: green; display: none; margin-bottom: 20px;">
                    Bạn đã có thể đăng nhập lại.
                </div>
            </c:if>

            <form id="login-form" action="${pageContext.request.contextPath}/login" method="post">
                <div class="field">
                    <input type="text" name="username" id="user-number" placeholder="Nhập tên đăng nhập" required>
                    <label for="user-number" id="user-number-label">Tên đăng nhập</label>
                    <p id="user-number-error" class="error-message"></p>
                </div>

                <div class="field">
                    <input type="password" name="password" id="user-password" placeholder="Nhập mật khẩu" required>
                    <label for="user-password" id="user-password-label">Mật khẩu</label>
                    <p id="user-password-error" class="error-message"></p>
                </div>

                <div style="text-align: right; margin-bottom: 15px;">
                    <a href="${pageContext.request.contextPath}/forgot-password" class="forgot-password">Quên mật khẩu?</a>
                </div>
                <button type="submit" class="btn-login" id="login-btn">Đăng nhập</button>
            </form>

            <div class="footer-links">
                <p>Bạn chưa có tài khoản? <a href="${pageContext.request.contextPath}/register" class="text-link">Đăng ký ngay</a></p>
            </div>
        </div>
    </div>
</div>

<script>
    // Nếu có countdown thì bắt đầu đếm ngược
    (function(){
        var countdownElem = document.getElementById('countdown');
        var lockMessageElem = document.getElementById('lockMessage');
        var unlockMessageElem = document.getElementById('unlockMessage');

        if (countdownElem) {
            var seconds = parseInt(countdownElem.textContent);
            var interval = setInterval(function() {
                seconds--;
                if (seconds <= 0) {
                    clearInterval(interval);
                    lockMessageElem.style.display = 'none';
                    unlockMessageElem.style.display = 'block';
                } else {
                    countdownElem.textContent = seconds;
                }
            }, 1000);
        }
    })();
</script>
