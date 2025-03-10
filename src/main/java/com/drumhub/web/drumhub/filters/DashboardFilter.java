package com.drumhub.web.drumhub.filters;

import com.drumhub.web.drumhub.models.User;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter("/dashboard/*")
public class DashboardFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Khởi tạo filter nếu cần
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response; // Thêm dòng này để sử dụng HttpServletResponse
        HttpSession session = httpRequest.getSession(false);

        // Kiểm tra xem người dùng đã đăng nhập hay chưa
        if (session == null || session.getAttribute("user") == null) {
            // Nếu chưa đăng nhập, chuyển hướng đến trang đăng nhập
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/login"); // Điều hướng đến trang đăng nhập
        } else {
            // Nếu đã đăng nhập, kiểm tra vai trò của người dùng
            User user = (User) session.getAttribute("user");
            if (!user.isAdmin()) { // Kiểm tra xem người dùng có phải là admin không
                // Nếu không phải admin, chuyển hướng đến trang home hoặc thông báo lỗi
                httpResponse.sendRedirect(httpRequest.getContextPath() + "/home"); // Điều hướng đến trang home
                return; // Kết thúc filter
            }
            // Nếu là admin, tiếp tục xử lý yêu cầu
            chain.doFilter(request, response);
        }
    }

    @Override
    public void destroy() {
        // Giải phóng tài nguyên nếu cần
    }
}