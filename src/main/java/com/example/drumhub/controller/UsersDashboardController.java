package com.example.drumhub.controller;

import com.example.drumhub.dao.models.User;
import com.example.drumhub.services.UsersDashboardService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "UsersDashboardController", value = "/dashboard/user")
public class UsersDashboardController extends HttpServlet {
    private UsersDashboardService usersDashboardService = new UsersDashboardService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("detail".equals(action)) {
            String idStr = request.getParameter("id");
            if (idStr == null) {
                response.sendRedirect(request.getContextPath() + "/dashboard/user");
                return;
            }
            int id = Integer.parseInt(idStr);
            User user = usersDashboardService.getById(id);
            if (user == null) {
                response.sendRedirect(request.getContextPath() + "/dashboard/user");
                return;
            }
            request.setAttribute("user", user);
            request.getRequestDispatcher("/dashboard/user/detail.jsp").forward(request, response);

        } else if ("create".equals(action)) {
            request.getRequestDispatcher("/dashboard/user/create.jsp").forward(request, response);
        }else {
            // Mặc định hiển thị danh sách
            List<User> users = usersDashboardService.getAll();
            request.setAttribute("users", users);
            request.getRequestDispatcher("/dashboard/user/index.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        UsersDashboardService service = new UsersDashboardService();
        if ("update".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String fullName = request.getParameter("fullName");
            int role = Integer.parseInt(request.getParameter("role"));
            int status = Integer.parseInt(request.getParameter("status"));

            User user = usersDashboardService.getById(id);
            if (user == null) {
                response.sendRedirect(request.getContextPath() + "/dashboard/user");
                return;
            }
            user.setUsername(username);
            user.setEmail(email);
            user.setFullName(fullName);
            user.setRole(role);
            user.setStatus(status);

            usersDashboardService.updateUser(user);

            response.sendRedirect(request.getContextPath() + "/dashboard/user");
        }
        if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            service.softDelete(id);
            response.sendRedirect(request.getContextPath() + "/dashboard/user");
        } else if ("create".equals(action)) {
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String fullName = request.getParameter("fullName");
            String password = request.getParameter("password");
            int role = Integer.parseInt(request.getParameter("role"));

            User newUser = new User();
            newUser.setUsername(username);
            newUser.setEmail(email);
            newUser.setFullName(fullName);
            newUser.setPassword(password); // nên hash mật khẩu
            newUser.setRole(role);
            newUser.setStatus(1); // mặc định kích hoạt
            newUser.setCreatedAt(new java.sql.Timestamp(System.currentTimeMillis()));

            usersDashboardService.insert(newUser);
            response.sendRedirect(request.getContextPath() + "/dashboard/user");
        }
    }
}