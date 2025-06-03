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
    private Connection conn;

    @Override
    public void init() throws ServletException {
        super.init();
        conn = (Connection) getServletContext().getAttribute("DBConnection");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user == null) {
            // Nếu chưa đăng nhập, chuyển hướng về trang login
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = user.getId();
        Connection conn = (Connection) getServletContext().getAttribute("DBConnection");
        try {
            CartService cartService = new CartService(conn);
            List<Cart> cartItems = cartService.getCartByUserWithoutOrder(userId);
            request.setAttribute("cartItems", cartItems);
            RequestDispatcher dispatcher = request.getRequestDispatcher("cart.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Không thể tải giỏ hàng.");
        }
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
            case "remove":
                try {
                    removeCartItem(request, response);
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
                break;
            case "updateQuantity":
                try {
                    updateCartQuantity(request, response);
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
                break;
            default:
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
    }

    private void updateCartQuantity(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
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

        Connection conn = (Connection) getServletContext().getAttribute("DBConnection");
        CartService cartService = new CartService(conn);

        boolean success = cartService.updateQuantity(cartId, userId, quantity);
        if (success) {
            response.setStatus(HttpServletResponse.SC_OK);
            response.getWriter().println("Cập nhật thành công.");
        } else {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().println("Không thể cập nhật.");
        }
    }


    private void removeCartItem(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            // 1. Kiểm tra đăng nhập
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("user") == null) {
                response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Bạn cần đăng nhập");
                return;
            }
            User user = (User) session.getAttribute("user");

            // 2. Lấy và validate cartId
            String cartIdStr = request.getParameter("cartId");
            if (cartIdStr == null || cartIdStr.trim().isEmpty()) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Thiếu tham số cartId");
                return;
            }

            int cartId;
            try {
                cartId = Integer.parseInt(cartIdStr);
            } catch (NumberFormatException e) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "cartId không hợp lệ");
                return;
            }

            // 3. Thực hiện xóa
            Connection conn = (Connection) getServletContext().getAttribute("DBConnection");
            CartService cartService = new CartService(conn);
            boolean success = cartService.removeCartItem(cartId, user.getId());

            // 4. Trả kết quả
            if (success) {
                response.setContentType("text/plain");
                response.getWriter().write("Xóa thành công");
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Xóa thất bại");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi server: " + e.getMessage());
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