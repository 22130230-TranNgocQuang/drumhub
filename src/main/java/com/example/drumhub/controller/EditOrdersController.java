package com.example.drumhub.controller;

import com.example.drumhub.dao.models.Order;
import com.example.drumhub.services.OrdersDashboardService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "EditOrderController", value = "/dashboard/orders/edit")
public class EditOrdersController extends HttpServlet {
    private OrdersDashboardService service;

    @Override
    public void init() throws ServletException {
        service = new OrdersDashboardService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        if (idStr == null) {
            response.sendRedirect(request.getContextPath() + "/dashboard/orders");
            return;
        }
        int id = Integer.parseInt(idStr);
        Order order = service.getById(id);
        if (order == null) {
            response.sendRedirect(request.getContextPath() + "/dashboard/orders");
            return;
        }
        request.setAttribute("order", order);
        request.getRequestDispatcher("/dashboard/orders/edit.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        String status = request.getParameter("status");

        if (idStr == null || status == null) {
            response.sendRedirect(request.getContextPath() + "/dashboard/orders");
            return;
        }
        int id = Integer.parseInt(idStr);

        service.updateStatus(id, status);
        response.sendRedirect(request.getContextPath() + "/dashboard/orders");
    }
}
