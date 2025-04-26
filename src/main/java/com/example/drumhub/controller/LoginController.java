package com.example.drumhub.controller;

import com.example.drumhub.dao.UserDAO;
import com.example.drumhub.dao.models.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/login")
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Xác thực người dùng
        UserDAO userDAO = new UserDAO();
        User user = userDAO.authenticateUser(username, password);

        if (user != null) {
            // Kiểm tra nếu email đã được xác minh (status = 1 có nghĩa là đã xác minh)
            if (user.getStatus() == 1) {  // email đã xác minh
                // Lưu thông tin người dùng vào session
                HttpSession session = request.getSession();
                session.setAttribute("user", user); // Lưu người dùng vào session

                // Chuyển hướng tới trang home
                response.sendRedirect("/index.jsp");
            } else {
                // Nếu chưa xác minh email, thông báo yêu cầu xác minh
                request.setAttribute("errorMessage", "Bạn cần xác minh email trước khi đăng nhập.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } else {
            // Nếu không tìm thấy người dùng hoặc mật khẩu sai
            request.setAttribute("errorMessage", "Tên đăng nhập hoặc mật khẩu không đúng.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Kiểm tra nếu người dùng đã đăng nhập rồi thì chuyển hướng tới trang chủ
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            // Đã đăng nhập, chuyển về trang home
            response.sendRedirect("/index.jsp");
        } else {
            // Chưa đăng nhập, hiển thị trang login
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }
}
