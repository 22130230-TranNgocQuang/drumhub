package com.example.drumhub.controller;

import com.example.drumhub.dao.CartDAO;
import com.example.drumhub.dao.OrderDAO;
import com.example.drumhub.dao.models.Cart;
import com.example.drumhub.dao.models.Order;
import com.example.drumhub.dao.models.User;
import com.example.drumhub.services.OrderService;
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
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet(name = "OrderController", value = "/order")
public class OrderController extends HttpServlet {
    private OrderService orderService;
    private CartDAO cartDAO;

    @Override
    public void init() throws ServletException {
        try {
            Connection conn = com.example.drumhub.dao.db.DBConnect.getConnection();
            orderService = new OrderService(conn);
            cartDAO = new CartDAO(conn);
        } catch (Exception e) {
            throw new ServletException("Không thể khởi tạo OrderController: " + e.getMessage(), e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/cart.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Kiểm tra đăng nhập
            User user = (User) request.getSession().getAttribute("user");
            if (user == null) {
                response.sendRedirect(request.getContextPath() + "/login.jsp");
                return;
            }

            // Lấy danh sách cartId được chọn
            String[] selectedCartIds = request.getParameterValues("selectedCartIds");
            if (selectedCartIds == null || selectedCartIds.length == 0) {
                request.setAttribute("error", "Vui lòng chọn ít nhất 1 sản phẩm để thanh toán.");
                request.getRequestDispatcher("/cart.jsp").forward(request, response);
                return;
            }

            List<Integer> cartIdList = Arrays.stream(selectedCartIds)
                    .map(Integer::parseInt)
                    .collect(Collectors.toList());

            List<Cart> selectedCarts = cartDAO.getSelectedCartsByIds(user.getId(), cartIdList);

            if (selectedCarts.isEmpty()) {
                request.setAttribute("error", "Không tìm thấy sản phẩm hợp lệ.");
                request.getRequestDispatcher("/cart.jsp").forward(request, response);
                return;
            }

            // ✅ Gửi selectedCarts sang order.jsp để nhập thông tin thanh toán
            request.setAttribute("cartItems", selectedCarts);
            request.getRequestDispatcher("/order.jsp").forward(request, response);
            return;

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Đã xảy ra lỗi khi xử lý đơn hàng.");
            request.getRequestDispatcher("/cart.jsp").forward(request, response);
            return;
        }
    }
}