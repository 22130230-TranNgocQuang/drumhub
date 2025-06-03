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
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        JSONObject json = new JSONObject();

        try {
            // Lấy user từ session
            User user = (User) request.getSession().getAttribute("user");
            if (user == null) {
                response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                json.put("message", "Bạn chưa đăng nhập.");
                out.print(json);
                return;
            }

            // Lấy danh sách cartId được chọn
            String[] selectedCartIds = request.getParameterValues("selectedCartIds");
            if (selectedCartIds == null || selectedCartIds.length == 0) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                json.put("message", "Vui lòng chọn ít nhất một sản phẩm để thanh toán.");
                out.print(json);
                return;
            }

            // Chuyển thành List<Integer>
            List<Integer> cartIdList = Arrays.stream(selectedCartIds)
                    .map(Integer::parseInt)
                    .collect(Collectors.toList());

            // Lấy danh sách cart được chọn
            List<Cart> selectedCarts = cartDAO.getSelectedCartsByIds(user.getId(), cartIdList);

            if (selectedCarts.isEmpty()) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                json.put("message", "Không tìm thấy sản phẩm hợp lệ để thanh toán.");
                out.print(json);
                return;
            }

            // Tính tổng tiền
            double totalPrice = selectedCarts.stream()
                    .mapToDouble(c -> c.getPrice() * c.getQuantity())
                    .sum();

            // Tạo đơn hàng
            Order order = new Order();
            order.setUserId(user.getId());
            order.setOrderDate(new Timestamp(System.currentTimeMillis()));
            order.setTotalPrice(totalPrice);
            order.setStatus("Chờ xử lý");

            int orderId = orderService.createOrder(order);

            // Cập nhật orderId cho từng cart
            for (Cart cart : selectedCarts) {
                cartDAO.updateOrderId(cart.getId(), orderId);
            }

            json.put("success", true);
            json.put("message", "Đặt hàng thành công!");
            json.put("orderId", orderId);
            out.print(json);

        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            json.put("message", "Có lỗi xảy ra trong quá trình đặt hàng.");
            out.print(json);
        }
    }

}