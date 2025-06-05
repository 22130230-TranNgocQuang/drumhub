package com.example.drumhub.controller;

import com.example.drumhub.dao.UserDAO;
import com.example.drumhub.dao.models.User;
import com.example.drumhub.services.LogService;
import com.google.gson.Gson;
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
    private LogService logService;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();
        logService = new LogService(new com.example.drumhub.dao.LogDAO()); // LogDAO không truyền connection
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String fullName = request.getParameter("fullname");
        int role = 1;
        int status = 1;
        Timestamp createdAt = new Timestamp(System.currentTimeMillis());

        boolean hasError = false;
        String errorMessage = "";

        if (username == null || username.trim().isEmpty()) {
            hasError = true;
            errorMessage = "Tên đăng nhập không được để trống.";
        } else if (email == null || email.trim().isEmpty()) {
            hasError = true;
            errorMessage = "Email không được để trống.";
        } else if (userDAO.checkEmailExists(email)) {
            hasError = true;
            errorMessage = "Email đã tồn tại.";
        } else if (userDAO.checkUsernameExists(username)) {
            hasError = true;
            errorMessage = "Tên đăng nhập đã tồn tại.";
        }

        if (hasError) {
            request.setAttribute("errorMessage", errorMessage);
            logService.logError("/register", "User", username, null, "Lỗi: " + errorMessage);
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        User user = new User(0, username, password, email, fullName, role, status, createdAt);

        if (userDAO.registerUser(user)) {
            String newData = new Gson().toJson(user);
            logService.logInfo("/register", "User", username, null, newData);
            response.sendRedirect("login");
        } else {
            request.setAttribute("errorMessage", "Đăng ký không thành công. Vui lòng thử lại.");
            logService.logError("/register", "User", username, null, "Lỗi DB khi insert");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/register.jsp").forward(request, response);
    }
}
