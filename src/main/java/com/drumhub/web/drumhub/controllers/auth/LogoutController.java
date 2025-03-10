package com.drumhub.web.drumhub.controllers.auth;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

@WebServlet("/logout")
public class LogoutController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Lấy session hiện tại
        HttpSession session = request.getSession(false);

        if (session != null) {
            // Xóa toàn bộ dữ liệu trong session
            session.invalidate();
        }

        // Chuyển hướng về trang đăng nhập với thông báo
        String message = "Đăng xuất thành công";
        String encodedMessage = URLEncoder.encode(message, StandardCharsets.UTF_8);
        response.sendRedirect(request.getContextPath() + "/login?message=" + encodedMessage);
    }
} 