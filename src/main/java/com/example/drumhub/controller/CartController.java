package com.example.drumhub.controller;

import com.example.drumhub.dao.models.Cart;
import com.example.drumhub.dao.models.Product;
import com.example.drumhub.dao.models.User;
import com.example.drumhub.services.CartService;
import com.example.drumhub.services.ProductService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

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
            case "detail":
                try {
                    showCartDetails(request, response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "buyNow":
                try {
                    buyNow(request, response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            default:
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
    }

    private void buyNow(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;
        if (user == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            response.getWriter().println("Vui lòng đăng nhập");
            return;
        }

        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double price = Double.parseDouble(request.getParameter("price"));

        // Lấy thông tin sản phẩm
        ProductService service = new ProductService();
        Product product = service.getDetailById(productId);

        Cart buyNowItem = new Cart();
        buyNowItem.setProduct(product);
        buyNowItem.setQuantity(quantity);
        buyNowItem.setPrice(price);
        buyNowItem.setUserId(user.getId());
        buyNowItem.setOrderId(0);

        // Lưu vào session
        session.setAttribute("buyNowItem", buyNowItem);
        response.setStatus(HttpServletResponse.SC_OK);
    }


    private void showCartDetails(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        response.setContentType("application/json");

        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (session == null || session.getAttribute("user") == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            response.getWriter().println("{\"error\": \"Chưa đăng nhập\"}");
            return;
        }


        int userId = user.getId();
        Connection conn = (Connection) getServletContext().getAttribute("DBConnection");
        CartService cartService = new CartService(conn);
        List<Cart> cartItems = cartService.getCartByUserWithoutOrder(userId);

        StringBuilder json = new StringBuilder("[");
        for (int i = 0; i < cartItems.size(); i++) {
            Cart item = cartItems.get(i);
            json.append("{")
                    .append("\"productId\":").append(item.getProduct().getId()).append(",")
                    .append("\"quantity\":").append(item.getQuantity()).append(",")
                    .append("\"price\":").append(item.getPrice())
                    .append("}");
            if (i < cartItems.size() - 1) json.append(",");
        }
        json.append("]");

        response.getWriter().write(json.toString());

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

        Connection conn = (Connection) getServletContext().getAttribute("DBConnection");

        CartService cartService = new CartService(conn);

        boolean success = cartService.addCart(userId, productId, quantity, price);

        if (success) {
            List<Cart> updatedCart = cartService.getCartByUserWithoutOrder(userId);
            session.setAttribute("cart", updatedCart);
            response.setStatus(HttpServletResponse.SC_OK);
        } else {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Thêm giỏ hàng thất bại.");
        }
    }
}