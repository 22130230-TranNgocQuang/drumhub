package com.example.drumhub.controller;

import com.example.drumhub.dao.CartDAO;
import com.example.drumhub.dao.ProductDAO;
import com.example.drumhub.dao.db.DBConnect;
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
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet(name = "OrderController", value = "/order")
public class OrderController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/cart.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        Connection conn = null;
        try {
            conn = DBConnect.getConnection();
            OrderService orderService = new OrderService(conn);
            CartDAO cartDAO = new CartDAO(conn);
            ProductDAO productDAO = new ProductDAO(conn);

            String action = request.getParameter("action");
            if (action == null) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                out.print(new JSONObject().put("message", "Thiếu tham số action.").toString());
                return;
            }

            if (action.equals("toOrderPage")) {
                String[] selectedCartIds = request.getParameterValues("selectedCartIds");
                if (selectedCartIds == null || selectedCartIds.length == 0) {
                    request.setAttribute("error", "Vui lòng chọn sản phẩm để thanh toán.");
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

                request.setAttribute("cartItems", selectedCarts);
                request.getRequestDispatcher("/order.jsp").forward(request, response);
                return;
            }

            if (action.equals("confirmOrder")) {
                String fullName = request.getParameter("fullName");
                String province = request.getParameter("province");
                String district = request.getParameter("district");
                String ward = request.getParameter("ward");
                String phone = request.getParameter("phone");

                String address = String.join(", ", ward, district, province);
                String[] selectedCartIds = request.getParameterValues("selectedCartIds");
                if (selectedCartIds == null || selectedCartIds.length == 0) {
                    response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                    out.print(new JSONObject().put("message", "Không có sản phẩm nào được chọn để đặt hàng.").toString());
                    return;
                }

                List<Integer> cartIdList = Arrays.stream(selectedCartIds)
                        .map(Integer::parseInt)
                        .collect(Collectors.toList());

                List<Cart> carts = cartDAO.getSelectedCartsByIds(user.getId(), cartIdList);
                if (carts.isEmpty()) {
                    response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                    out.print(new JSONObject().put("message", "Không có sản phẩm nào để đặt hàng.").toString());
                    return;
                }

                double total = carts.stream()
                        .mapToDouble(c -> c.getPrice() * c.getQuantity())
                        .sum();

                Order order = new Order(user.getId(), fullName, phone, address, total, "pending");
                int orderId = orderService.createOrder(order);

                cartDAO.assignOrderIdToSelectedCarts(user.getId(), cartIdList, orderId);
                for (Cart cart : carts) {
                    productDAO.markProductAsInactive(cart.getProduct().getId());
                }

                JSONObject res = new JSONObject();
                res.put("status", "success");
                res.put("redirect", request.getContextPath() + "/thankyou.jsp");
                out.print(res.toString());
                return;
            }

            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            out.print(new JSONObject().put("message", "Action không hợp lệ.").toString());

        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(500);
            JSONObject error = new JSONObject();
            error.put("status", "error");
            error.put("message", "Lỗi xử lý đơn hàng: " + e.getMessage());
            out.print(error.toString());
        } finally {
            if (conn != null) try { conn.close(); } catch (Exception ignore) {}
        }
    }
}