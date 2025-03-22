package com.drumhub.web.drumhub.controllers.homepage;

import com.drumhub.web.drumhub.models.Cart;
import com.drumhub.web.drumhub.models.CartItem;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/checkout")
public class CheckoutController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        List<CartItem> cartItems = (cart != null) ? cart.getItems() : List.of();
        double totalPrice = (cart != null) ? cart.getTotal() : 0.0;

        request.setAttribute("cartItems", cartItems);
        request.setAttribute("totalPrice", totalPrice);

        // Hiển thị thông báo nếu có
        String message = (String) session.getAttribute("message");
        if (message != null) {
            request.setAttribute("message", message);
            session.removeAttribute("message"); // Xóa sau khi hiển thị
        }

        request.setAttribute("title", "Thanh Toán");
        request.setAttribute("content", "checkout.jsp");
        request.getRequestDispatcher("/pages/homepage/layout.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null || cart.getItems().isEmpty()) {
            session.setAttribute("message", "Giỏ hàng của bạn đang trống!");
            response.sendRedirect("/checkout");
            return;
        }

        // Lấy thông tin từ form
        String fullName = request.getParameter("fullName");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String paymentMethod = request.getParameter("paymentMethod");

        // Kiểm tra dữ liệu nhập vào
        if (fullName == null || fullName.trim().isEmpty() ||
                address == null || address.trim().isEmpty() ||
                phone == null || phone.trim().isEmpty() ||
                paymentMethod == null || paymentMethod.trim().isEmpty()) {

            session.setAttribute("message", "Vui lòng nhập đầy đủ thông tin.");
            response.sendRedirect("/checkout");
            return;
        }

        // Xử lý đơn hàng
        boolean orderSuccess = saveOrder(fullName, address, phone, paymentMethod, cart);

        if (orderSuccess) {
            session.removeAttribute("cart"); // Xóa giỏ hàng sau khi đặt hàng thành công
            session.setAttribute("message", "🎉 Bạn đã đặt hàng thành công!"); // Lưu thông báo vào session
            response.sendRedirect("/home"); // Chuyển hướng về trang chủ
        } else {
            session.setAttribute("message", "Có lỗi xảy ra khi đặt hàng. Vui lòng thử lại.");
            response.sendRedirect("/checkout");
        }
    }



    private boolean saveOrder(String fullName, String address, String phone, String paymentMethod, Cart cart) {
        if (cart.getItems().isEmpty()) {
            return false;
        }

        // Giả lập xử lý đơn hàng - Sau này có thể thay thế bằng database
        System.out.println("Đơn hàng được tạo:");
        System.out.println("Khách hàng: " + fullName);
        System.out.println("Địa chỉ: " + address);
        System.out.println("Số điện thoại: " + phone);
        System.out.println("Phương thức thanh toán: " + paymentMethod);
        System.out.println("Sản phẩm trong đơn hàng:");
        for (CartItem item : cart.getItems()) {
            System.out.println("- " + item.getProduct().getName() + " | Số lượng: " + item.getQuantity());
        }
        return true;
    }

    private boolean isEmpty(String str) {
        return str == null || str.trim().isEmpty();
    }
}
