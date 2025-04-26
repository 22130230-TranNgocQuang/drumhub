package com.example.drumhub.controller;
import com.example.drumhub.dao.UserDAO;
import com.example.drumhub.dao.models.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Timestamp;

@WebServlet("/register")
public class RegisterController extends HttpServlet {
    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();  // Khởi tạo DAO
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy dữ liệu từ form đăng ký
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String fullName = request.getParameter("fullname");
        String role = "user";  // Mặc định là user
        int status = 0;  // Mặc định là 0 (chưa xác minh email)
        Timestamp createdAt = new Timestamp(System.currentTimeMillis());  // Thêm thời gian tạo

        // Kiểm tra các lỗi nhập liệu
        boolean hasError = false;
        String errorMessage = "";

        if (username == null || username.trim().isEmpty()) {
            hasError = true;
            errorMessage = "Tên đăng nhập không được để trống.";
        }
        if (email == null || email.trim().isEmpty()) {
            hasError = true;
            errorMessage = "Email không được để trống.";
        }
        if (userDAO.checkEmailExists(email)) {
            hasError = true;
            errorMessage = "Email đã tồn tại.";
        }
        if (userDAO.checkUsernameExists(username)) {
            hasError = true;
            errorMessage = "Tên đăng nhập đã tồn tại.";
        }

        // Nếu có lỗi, quay lại trang đăng ký và hiển thị lỗi
        if (hasError) {
            request.setAttribute("errorMessage", errorMessage);
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        // Tạo đối tượng User mới và gọi phương thức đăng ký
        User user = new User(0, username, password, email, fullName, role, status, createdAt);

        if (userDAO.registerUser(user)) {
            // Đăng ký thành công, chuyển hướng đến trang đăng nhập
            response.sendRedirect("login");
        } else {
            // Nếu không thành công, thông báo lỗi
            request.setAttribute("errorMessage", "Đăng ký không thành công. Vui lòng thử lại.");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/register.jsp").forward(request, response);
    }
}
