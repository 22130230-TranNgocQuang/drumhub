package com.example.drumhub.controller;

import com.example.drumhub.dao.models.User;
import com.example.drumhub.services.DashboardService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/dashboard")
public class DashboardController extends HttpServlet {

    private DashboardService dashboardService = new DashboardService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        // Kiểm tra phiên đăng nhập
        if (session == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        User user = (User) session.getAttribute("user");

        // Kiểm tra user có tồn tại và có role admin (role == 1)
        if (user == null || user.getRole() != 1) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Bạn không có quyền truy cập trang này.");
            return;
        }

        // Lấy dữ liệu tổng hợp cho dashboard
        int totalUsers = dashboardService.getTotalUsers();
        int totalProducts = dashboardService.getTotalProducts();
        int totalOrders = dashboardService.getTotalOrders();

        request.setAttribute("totalUsers", totalUsers);
        request.setAttribute("totalProducts", totalProducts);
        request.setAttribute("totalOrders", totalOrders);

        // Forward tới trang dashboard chính xác (đường dẫn tương đối trong webapp là: /dashboard/index.jsp)
        request.getRequestDispatcher("/dashboard/index.jsp").forward(request, response);
    }
}
