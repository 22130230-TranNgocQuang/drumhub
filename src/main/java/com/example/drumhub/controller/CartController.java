package com.example.drumhub.controller;

import com.example.drumhub.dao.db.DBConnect;
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
        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = user.getId();

        try (Connection conn = DBConnect.getConnection()) {
            CartService cartService = new CartService();
            List<Cart> cartItems = cartService.getCartByUserWithoutOrder(conn, userId);
            request.setAttribute("cartItems", cartItems);
            RequestDispatcher dispatcher = request.getRequestDispatcher("cart.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Không thể tải giỏ hàng.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "addCart";

        try (Connection conn = DBConnect.getConnection()) {
            switch (action) {
                case "addCart":
                    addCart(request, response, conn);
                    break;
                case "detail":
                    showCartDetails(request, response, conn);
                    break;
                case "buyNow":
                    buyNow(request, response);
                    break;
                case "remove":
                    removeCartItem(request, response, conn);
                    break;
                case "updateQuantity":
                    updateCartQuantity(request, response, conn);
                    break;
                default:
                    response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    private void updateCartQuantity(HttpServletRequest request, HttpServletResponse response, Connection conn) throws IOException, SQLException {
        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            response.getWriter().println("Bạn cần đăng nhập.");
            return;
        }

        String cartIdRaw = request.getParameter("cartId");
        String quantityRaw = request.getParameter("quantity");

        if (cartIdRaw == null || quantityRaw == null || cartIdRaw.isEmpty() || quantityRaw.isEmpty()) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().println("Thiếu thông tin.");
            return;
        }

        int cartId = Integer.parseInt(cartIdRaw);
        int quantity = Integer.parseInt(quantityRaw);
        int userId = user.getId();

        CartService cartService = new CartService();
        boolean success = cartService.updateQuantity(conn, cartId, userId, quantity);
        if (success) {
            response.setStatus(HttpServletResponse.SC_OK);
            response.getWriter().println("Cập nhật thành công.");
        } else {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().println("Không thể cập nhật.");
        }
    }

    private void removeCartItem(HttpServletRequest request, HttpServletResponse response, Connection conn) throws IOException, SQLException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Bạn cần đăng nhập");
            return;
        }
        User user = (User) session.getAttribute("user");

        String cartIdStr = request.getParameter("cartId");
        if (cartIdStr == null || cartIdStr.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Thiếu tham số cartId");
            return;
        }

        int cartId = Integer.parseInt(cartIdStr);
        CartService cartService = new CartService();
        boolean success = cartService.removeCartItem(conn, cartId, user.getId());

        if (success) {
            response.setContentType("text/plain");
            response.getWriter().write("Xóa thành công");
        } else {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Xóa thất bại");
        }
    }

    private void buyNow(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

        ProductService service = new ProductService();
        Product product = service.getDetailById(productId);

        Cart buyNowItem = new Cart();
        buyNowItem.setProduct(product);
        buyNowItem.setQuantity(quantity);
        buyNowItem.setPrice(price);
        buyNowItem.setUserId(user.getId());
        buyNowItem.setOrderId(0);

        session.setAttribute("buyNowItem", buyNowItem);
        response.setStatus(HttpServletResponse.SC_OK);
    }

    private void showCartDetails(HttpServletRequest request, HttpServletResponse response, Connection conn) throws IOException {
        response.setContentType("application/json");

        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (session == null || user == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            response.getWriter().println("{\"error\": \"Chưa đăng nhập\"}");
            return;
        }

        int userId = user.getId();
        CartService cartService = new CartService();
        List<Cart> cartItems = cartService.getCartByUserWithoutOrder(conn, userId);

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

    private void addCart(HttpServletRequest request, HttpServletResponse response, Connection conn) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            response.getWriter().println("Vui lòng đăng nhập");
            return;
        }

        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double price = Double.parseDouble(request.getParameter("price"));
        int userId = user.getId();

        CartService cartService = new CartService();
        boolean success = cartService.addCart(conn, userId, productId, quantity, price);

        if (success) {
            List<Cart> updatedCart = cartService.getCartByUserWithoutOrder(conn, userId);
            session.setAttribute("cart", updatedCart);
            response.setStatus(HttpServletResponse.SC_OK);
        } else {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Thêm giỏ hàng thất bại.");
        }
    }
}
