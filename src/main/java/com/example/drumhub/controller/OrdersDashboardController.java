package com.example.drumhub.controller;

import com.example.drumhub.dao.models.Order;
import com.example.drumhub.services.OrdersDashboardService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "OrdersDashboardController", value = "/dashboard/orders")
public class OrdersDashboardController extends HttpServlet {
    private OrdersDashboardService service;

    @Override
    public void init() throws ServletException {
        service = new OrdersDashboardService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Order> orders = service.getAll();
        request.setAttribute("orders", orders);
        request.getRequestDispatcher("/dashboard/orders/index.jsp").forward(request, response);
    }
}
