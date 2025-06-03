package com.example.drumhub.controller;

import com.example.drumhub.dao.models.Order;
import com.example.drumhub.dao.models.OrderDetailItem;
import com.example.drumhub.dao.models.User;
import com.example.drumhub.services.OrdersDashboardService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "OrdersDashboardController", urlPatterns = {
        "/dashboard/order",            // Danh sách đơn hàng
        "/dashboard/order/detail"      // Chi tiết đơn hàng
})
public class OrdersDashboardController extends HttpServlet {
    private OrdersDashboardService service ;

    @Override
    public void init() throws ServletException {
        service = new OrdersDashboardService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();

        if ("/dashboard/order/detail".equals(path)) {
            showOrderDetail(request, response);
        } else {
            listOrders(request, response);
        }
    }

    private void listOrders(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Order> orders = service.getAll();
        request.setAttribute("orders", orders);
        request.getRequestDispatcher("/dashboard/order/index.jsp").forward(request, response);
    }

    private void showOrderDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int orderId = Integer.parseInt(request.getParameter("id"));

        Order order = service.getById(orderId);
        User user = service.getUserByOrderId(orderId);
        List<OrderDetailItem> items = service.getOrderDetailsByOrderId(orderId);

        request.setAttribute("order", order);
        request.setAttribute("user", user);
        request.setAttribute("items", items);

        request.getRequestDispatcher("/dashboard/order/detail.jsp").forward(request, response);
    }

}
