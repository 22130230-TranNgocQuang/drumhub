package com.example.drumhub.controller;

import com.example.drumhub.dao.CartDAO;
import com.example.drumhub.dao.models.Cart;
import com.example.drumhub.dao.models.Order;
import com.example.drumhub.dao.models.User;
import com.example.drumhub.dao.OrderDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONObject;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CheckoutController", value = "/checkout")
public class CheckoutController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // Chỉ lấy sản phẩm mua ngay từ session
        Cart buyNowItem = (Cart) session.getAttribute("buyNowItem");
        request.setAttribute("buyNowItem", buyNowItem);

        request.getRequestDispatcher("/checkout.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        JSONObject jsonRespone = new JSONObject();

        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user == null) {
            jsonRespone.put("success", false);
            jsonRespone.put("message", "Vui lòng đăng nhập để thực hiện thanh toán");
            out.println(jsonRespone);
            return;
        }

        boolean isBuyNow = "1".equals(request.getParameter("buynow"));
        if (!isBuyNow) {
            jsonRespone.put("success", false);
            jsonRespone.put("message", "Sai luồng thanh toán! Chỉ hỗ trợ Mua ngay.");
            out.println(jsonRespone);
            return;
        }

        Cart buyNowItem = (Cart) session.getAttribute("buyNowItem");
        if (buyNowItem == null) {
            jsonRespone.put("success", false);
            jsonRespone.put("message", "Không tìm thấy sản phẩm mua ngay!");
            out.println(jsonRespone);
            return;
        }

        double total = buyNowItem.getPrice() * buyNowItem.getQuantity();

        String fullName = request.getParameter("fullName");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String paymentMethod = request.getParameter("paymentMethod");

        Connection conn = (Connection) getServletContext().getAttribute("DBConnection");
        try {
            OrderDAO orderDAO = new OrderDAO(conn);
            Order order = new Order();
            order.setUserId(user.getId());
            order.setTotalPrice(total);
            order.setStatus("pending");
            order.setOrderDate(new Timestamp(System.currentTimeMillis()));
            int orderId = orderDAO.insertOrder(order);

            if (orderId > 0) {
                session.removeAttribute("buyNowItem");
                jsonRespone.put("success", true);
                jsonRespone.put("message", "Đặt hàng thành công");
            } else {
                jsonRespone.put("success", false);
                jsonRespone.put("message", "Đặt hàng thất bại. Vui lòng thử lại");
            }

        } catch (Exception e) {
            e.printStackTrace();
            jsonRespone.put("success", false);
            jsonRespone.put("message", "Lỗi hệ thống: " + e.getMessage());
        }
        out.println(jsonRespone);
    }
}