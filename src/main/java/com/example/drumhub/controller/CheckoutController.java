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
import java.sql.Timestamp;
import java.util.List;

@WebServlet(name = "CheckoutController", value = "/checkout")
public class CheckoutController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //định dag cho JSON phản hồi
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

        //lấy thông tin người dùng và giỏ hàng
        List<Cart> cartItems = (List<Cart>) session.getAttribute("cart");

        if (cartItems == null || cartItems.isEmpty()) {
            jsonRespone.put("success", false);
            jsonRespone.put("message", "Giỏ hàng đang trống");
            out.println(jsonRespone);
            return;
        }

        double total = 0;
        for (Cart item : cartItems) {
            total += item.getPrice() * item.getQuantity();
        }

        String fullName = request.getParameter("fullName");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String paymentMethod = request.getParameter("paymentMethod");

        try {
            Connection conn = (Connection) getServletContext().getAttribute("DBConnection");
            OrderDAO orderDAO = new OrderDAO(conn);
            CartDAO cartDAO = new CartDAO(conn);

            Order order = new Order();
            order.setUserId(user.getId());
            order.setTotalPrice(total);
            order.setStatus("pending");
            order.setOrderDate(new Timestamp(System.currentTimeMillis()));

            int orderId = orderDAO.insertOrder(order);
            boolean updated = cartDAO.assignOrderIdToCartItems(user.getId(), orderId);

            if (orderId > 0 && updated) {
                session.removeAttribute("cart"); //xoá giỏ hàng sau khi đăặt hàng thành công
                jsonRespone.put("success", true);
                jsonRespone.put("message", "Đặt hàng thành công");
            } else {
                jsonRespone.put("success", false);
                jsonRespone.put("message", "Đặt hàng thất bại. Vui lòng thử lại");
            }
        } catch (Exception e) {
            e.printStackTrace();
            jsonRespone.put("success", false);
            jsonRespone.put("message", "Lỗi hệ thống" + e.getMessage());
        }
        out.println(jsonRespone);
    }
}