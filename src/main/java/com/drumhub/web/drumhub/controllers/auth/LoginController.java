package com.drumhub.web.drumhub.controllers.auth;

import com.drumhub.web.drumhub.models.User;
import com.drumhub.web.drumhub.services.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/login")
public class LoginController extends HttpServlet {
    private UserService userService;

    @Override
    public void init() throws ServletException {
        this.userService = new UserService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("title", "Đăng nhập");
        request.setAttribute("content", "login.jsp");
        request.getRequestDispatcher("/pages/homepage/layout.jsp").forward(request, response);
    }

    // Phương thức doPost để xử lý yêu cầu POST
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = userService.login(username, password);

        if (user != null) {
            // Lưu thông tin người dùng vào session
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            user.setPassword(null); // Xóa mật khẩu để tránh lộ thông tin

            // Điều hướng đến trang dashboard hoặc home
            request.setAttribute("successMessage", "Đăng nhập thành công.");
            if (user.isAdmin()) {
                response.sendRedirect(request.getContextPath() + "/dashboard");
            } else {
                response.sendRedirect(request.getContextPath() + "/home");
            }
        } else {
            // Nếu đăng nhập thất bại, quay lại trang đăng nhập với thông báo lỗi
            request.setAttribute("errorMessage", "Tên đăng nhập hoặc mật khẩu không đúng.");
            request.setAttribute("title", "Đăng nhập");
            request.setAttribute("content", "login.jsp");
            request.getRequestDispatcher("/pages/homepage/layout.jsp").forward(request, response);
        }
    }
}
