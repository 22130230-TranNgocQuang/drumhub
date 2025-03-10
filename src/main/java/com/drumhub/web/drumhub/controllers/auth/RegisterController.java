package com.drumhub.web.drumhub.controllers.auth;

import com.drumhub.web.drumhub.models.User;
import com.drumhub.web.drumhub.services.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.regex.Pattern;

@WebServlet("/register")
public class RegisterController extends HttpServlet {
    private UserService userService;

    @Override
    public void init() {
        this.userService = new UserService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("title", "Đăng ký");
        request.setAttribute("content", "register.jsp");
        request.getRequestDispatcher("/pages/homepage/layout.jsp").forward(request, response);
    }

    // Phương thức doPost để xử lý yêu cầu POST
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullname = request.getParameter("fullname");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        boolean hasError = false;

        // Kiểm tra từng trường và thiết lập thông báo lỗi nếu cần
        if (fullname == null || fullname.isEmpty()) {
            request.setAttribute("fullnameError", "Họ và tên không được để trống.");
            hasError = true;
        }

        if (phone == null || phone.isEmpty()) {
            request.setAttribute("phoneError", "Số điện thoại không được để trống.");
            hasError = true;
        } else if (!isValidPhoneNumber(phone)) {
            request.setAttribute("phoneError", "Số điện thoại không hợp lệ.");
            hasError = true;
        } else if (userService.isPhoneExists(phone)) { // Kiểm tra xem số điện thoại đã tồn tại
            request.setAttribute("phoneError", "Số điện thoại đã tồn tại.");
            hasError = true;
        }

        if (email == null || email.isEmpty()) {
            request.setAttribute("emailError", "Email không được để trống.");
            hasError = true;
        } else if (!isValidEmail(email)) {
            request.setAttribute("emailError", "Email không hợp lệ.");
            hasError = true;
        } else if (userService.isEmailExists(email)) { // Kiểm tra xem email đã tồn tại
            request.setAttribute("emailError", "Email đã tồn tại.");
            hasError = true;
        }

        if (password == null || password.isEmpty()) {
            request.setAttribute("passwordError", "Mật khẩu không được để trống.");
            hasError = true;
        } else if (password.length() < 6) {
            request.setAttribute("passwordError", "Mật khẩu phải có ít nhất 6 ký tự.");
            hasError = true;
        }

        if (hasError) {
            // Nếu có lỗi, quay lại trang đăng ký
            request.setAttribute("title", "Đăng ký");
            request.setAttribute("content", "register.jsp");
            request.getRequestDispatcher("/pages/homepage/layout.jsp").forward(request, response);
            return;
        }

        // Nếu không có lỗi, tiếp tục xử lý đăng ký
        String hashedPassword = userService.hashPassword(password); // Mã hóa mật khẩu
        User user = new User(fullname, phone, hashedPassword, email); // Tạo đối tượng User
        userService.register(user); // Lưu thông tin người dùng

        // Thông báo thành công
        request.setAttribute("successMessage", "Đăng ký thành công! Bạn có thể đăng nhập ngay.");
        request.setAttribute("title", "Đăng nhập");
        request.setAttribute("content", "login.jsp");
        request.getRequestDispatcher("/pages/homepage/layout.jsp").forward(request, response);
    }

    // Phương thức kiểm tra định dạng số điện thoại
    private boolean isValidPhoneNumber(String phone) {
        return Pattern.matches("^[0-9]{10,15}$", phone); // Kiểm tra số điện thoại có từ 10 đến 15 chữ số
    }

    // Phương thức kiểm tra định dạng email
    private boolean isValidEmail(String email) {
        return Pattern.matches("^[\\w-.]+@([\\w-]+\\.)+[\\w-]{2,4}$", email); // Kiểm tra định dạng email
    }
}
