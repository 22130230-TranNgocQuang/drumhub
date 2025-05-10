package com.example.drumhub.controller;

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
        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double price = Double.parseDouble(request.getParameter("price"));

        CartService service = new CartService();
        boolean result = false;
        result = service.addCart(productId, quantity, price);

        request.setAttribute("result", result);
        response.sendRedirect("list-product?action=detail&id=" + productId);
    }
}