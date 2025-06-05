package com.example.drumhub.controller;

import com.example.drumhub.dao.UserDAO;
import com.example.drumhub.services.LogService;
import com.example.drumhub.dao.models.Log;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;

@WebServlet("/verify")
public class VerifyEmailController extends HttpServlet {

    private LogService logService;
    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        userDAO = new UserDAO();

        // Khởi tạo LogService (giả sử bạn có constructor kiểu này)
        // Hoặc lấy connection từ context, tùy setup của bạn
        logService = new LogService(new com.example.drumhub.dao.LogDAO());
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");

        if (email == null || email.isEmpty()) {
            // Log lỗi khi không có email
            logService.logError("/verify", "User", "N/A", null, "Email verify failed: missing email parameter");

            response.sendRedirect("verify-success.jsp?status=fail");
            return;
        }

        boolean success = userDAO.updateUserStatusByEmail(email);

        if (success) {
            // Log thành công
            logService.logInfo("/verify", "User", email, null, "Email verification success");
            response.sendRedirect("verify-success.jsp?status=success");
        } else {
            // Log thất bại do DB update lỗi
            logService.logError("/verify", "User", email, null, "Email verification failed: updateUserStatusByEmail returned false");
            response.sendRedirect("verify-success.jsp?status=fail");
        }
    }
}
