package com.drumhub.web.drumhub.controllers.dashboard;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/dashboard")
public class DashboardController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("pageTitle", "Trang dashboard");
        request.setAttribute("content", "index.jsp");
        request.getRequestDispatcher("/pages/dashboard/layout.jsp").forward(request, response);
    }
}
