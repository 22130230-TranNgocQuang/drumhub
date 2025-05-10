package com.example.drumhub.controller;

import com.example.drumhub.dao.models.Order;
import com.example.drumhub.services.OrderService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet(name = "OrderController", value = "/order")
public class OrderController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            response.sendRedirect("/order");
            return;
        }

        try {
            switch (action) {
                case "createOrder":
                    createOrder(request, response);
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi tạo đơn hàng: " + e.getMessage());
        }
    }

    private void createOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        double totalPrice = Double.parseDouble(request.getParameter("totalPrice"));
        String status = request.getParameter("status");

        Order order = new Order();
        order.setUserId(userId);
        order.setTotalPrice(totalPrice);
        order.setStatus(status);

        Connection conn = (Connection) getServletContext().getAttribute("DBConnection");
        OrderService orderService = new OrderService(conn);

        boolean success = orderService.createOrder(order);

        if (success) {
            response.sendRedirect("/order/success.jsp");
        } else {
            request.setAttribute("error", "Tạo đơn hàng thất bại");

        }
    }
}