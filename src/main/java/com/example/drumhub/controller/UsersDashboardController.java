package com.example.drumhub.controller;

import com.example.drumhub.dao.models.User;
import com.example.drumhub.services.UsersDashboardService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "UsersDashboardController2", value = "/dashboard/users")
public class UsersDashboardController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UsersDashboardService usersDashboardService= new UsersDashboardService();
            List<User> users = usersDashboardService.getAll();
            request.setAttribute("users", users);
            request.getRequestDispatcher("/dashboard/users/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}