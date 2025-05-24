package com.example.drumhub.controller;

import com.example.drumhub.dao.models.Cart;
import com.example.drumhub.dao.models.Product;
import com.example.drumhub.dao.models.User;
import com.example.drumhub.services.CartService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "CartController", value = "/cart")
public class CartController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "addCart";
        }

        switch (action) {
            case "addCart":
                try {
                    addCart(request, response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;

        }
    }

    private void addCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        //nhận -> xử lý dữ liệu -> id, soluong (model CRUD) create, read, update, delete
        //lấy dữ liệu từ view id, soluong
        //xử lý ceate trong model
        //
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");
        //int userId = (user != null) ? user.getId() : 0;
        if (user == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            response.getWriter().println("Vui lòng đăng nhập");
            return;
        }

        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double price = Double.parseDouble(request.getParameter("price"));
        int userId = user.getId();
        Product product = new Product();
        Cart cart = new Cart();

        cart.setUserId(userId);
        product.setId(productId);
        cart.setProduct(product);
        cart.setQuantity(quantity);
        cart.setPrice(price);

        CartService cartService = new CartService();
        boolean success = cartService.addCart(userId, productId, quantity, price);

        if (success) {
            response.setStatus(HttpServletResponse.SC_OK);
        } else {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Thêm giỏ hàng thất bại.");
        }
    }
}