package com.example.drumhub.controller;

import com.example.drumhub.services.LogService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/logout")
public class LogoutController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private LogService logService;

    @Override
    public void init() throws ServletException {
        // Khởi tạo logService (nhớ import LogService và LogDAO)
        logService = new LogService(new com.example.drumhub.dao.LogDAO());
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        logout(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        logout(request, response);
    }

    private void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false); // không tạo mới session

        if (session != null) {
            // Lấy username (nếu có) để log
            Object userObj = session.getAttribute("user");
            String username = null;
            if (userObj != null) {
                try {
                    username = ((com.example.drumhub.dao.models.User) userObj).getUsername();
                } catch (Exception e) {
                    // Nếu cast fail thì thôi k sao
                }
            }

            // Log sự kiện logout
            logService.logInfo("/logout", "User", username, null, "Đăng xuất thành công");

            session.invalidate();
        }

        response.sendRedirect("index.jsp");
    }
}
