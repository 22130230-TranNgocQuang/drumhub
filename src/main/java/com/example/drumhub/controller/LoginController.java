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
import java.net.URLEncoder;

@WebServlet("/login")
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Google OAuth
    private static final String CLIENT_ID = "467836431196-6hp51978i86knhd3nccpr65dtlp5hoiq.apps.googleusercontent.com";
    private static final String REDIRECT_URI = "http://localhost:8080/oauth2callback";
    private static final String SCOPE = "https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/userinfo.profile";


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
                response.sendRedirect("/list-product");
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
        String action = request.getParameter("action");
        if ("google".equals(action)) {
            doGoogleLogin(request, response);  // redirect sang Google OAuth
            return;
        }

        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            response.sendRedirect("/list-product");
        } else {
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }
    private void doGoogleLogin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String oauthUrl = "https://accounts.google.com/o/oauth2/auth"
                + "?client_id=" + CLIENT_ID
                + "&redirect_uri=" + URLEncoder.encode(REDIRECT_URI, "UTF-8")
                + "&response_type=code"
                + "&scope=" + URLEncoder.encode(SCOPE, "UTF-8")
                + "&access_type=offline";

        response.sendRedirect(oauthUrl);
    }

}
