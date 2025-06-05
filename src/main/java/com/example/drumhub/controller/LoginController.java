package com.example.drumhub.controller;

import com.example.drumhub.dao.UserDAO;
import com.example.drumhub.dao.models.User;
import com.example.drumhub.services.LogService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.net.URLEncoder;

@WebServlet("/login")
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final int MAX_ATTEMPTS = 5;
    private static final long LOCK_TIME_MILLIS = 20 * 1000; // 20 giây (để demo nhanh)

    private static final String CLIENT_ID = "467836431196-6hp51978i86knhd3nccpr65dtlp5hoiq.apps.googleusercontent.com";
    private static final String REDIRECT_URI = "http://localhost:8080/oauth2callback";
    private static final String SCOPE = "https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/userinfo.profile";

    private UserDAO userDAO;
    private LogService logService;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();
        logService = new LogService(new com.example.drumhub.dao.LogDAO());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        HttpSession session = request.getSession();

        // Kiểm tra khóa tài khoản theo session
        if (isAccountLocked(session, request)) {
            logService.logError("/login", "User", username, null, "Tài khoản bị khóa do đăng nhập quá nhiều lần");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }

        User user = userDAO.authenticateUser(username, password);

        if (user != null) {
            if (user.getStatus() == 1) { // email đã xác minh
                resetLoginAttempts(session);
                session.setAttribute("user", user);

                // Thêm log đăng nhập thành công
                logService.logInfo("/login", "User", username, null, "Đăng nhập thành công");

                response.sendRedirect("/list-product");
            } else {
                request.setAttribute("errorMessage", "Bạn cần xác minh email trước khi đăng nhập.");

                // Thêm log lỗi chưa xác minh email
                logService.logError("/login", "User", username, null, "Chưa xác minh email");

                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } else {
            registerFailedAttempt(session);
            if (getLoginAttempts(session) >= MAX_ATTEMPTS) {
                lockAccount(session);
                long timeRemaining = getLockTimeRemaining(session);
                request.setAttribute("errorMessage", "");
                request.setAttribute("lockTimeRemaining", timeRemaining / 1000); // truyền số giây còn lại

                // Thêm log lỗi tài khoản bị khóa do đăng nhập sai nhiều lần
                logService.logError("/login", "User", username, null, "Tài khoản bị khóa do đăng nhập sai quá nhiều lần");
            } else {
                request.setAttribute("errorMessage", "Tên đăng nhập hoặc mật khẩu không đúng.");

                // Thêm log lỗi đăng nhập sai
                logService.logError("/login", "User", username, null, "Tên đăng nhập hoặc mật khẩu không đúng");
            }
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }

    private boolean isAccountLocked(HttpSession session, HttpServletRequest request) {
        Long lockTime = (Long) session.getAttribute("lockTime");
        if (lockTime == null) return false;

        long currentTime = System.currentTimeMillis();
        long timePassed = currentTime - lockTime;

        if (timePassed > LOCK_TIME_MILLIS) {
            resetLoginAttempts(session);
            session.removeAttribute("lockTime");
            return false;
        } else {
            long timeRemaining = LOCK_TIME_MILLIS - timePassed;
            request.setAttribute("lockTimeRemaining", timeRemaining / 1000); // truyền xuống JSP
            request.setAttribute("errorMessage", "");
            return true;
        }
    }

    private long getLockTimeRemaining(HttpSession session) {
        Long lockTime = (Long) session.getAttribute("lockTime");
        if (lockTime == null) return 0;
        long currentTime = System.currentTimeMillis();
        long timePassed = currentTime - lockTime;
        return (timePassed > LOCK_TIME_MILLIS) ? 0 : (LOCK_TIME_MILLIS - timePassed);
    }

    private void lockAccount(HttpSession session) {
        session.setAttribute("lockTime", System.currentTimeMillis());
    }

    private void registerFailedAttempt(HttpSession session) {
        Integer attempts = (Integer) session.getAttribute("loginAttempts");
        if (attempts == null) attempts = 0;
        attempts++;
        session.setAttribute("loginAttempts", attempts);

        if (session.getAttribute("firstFailedTime") == null) {
            session.setAttribute("firstFailedTime", System.currentTimeMillis());
        }
    }

    private void resetLoginAttempts(HttpSession session) {
        session.removeAttribute("loginAttempts");
        session.removeAttribute("firstFailedTime");
        session.removeAttribute("lockTime");
    }

    private int getLoginAttempts(HttpSession session) {
        Integer attempts = (Integer) session.getAttribute("loginAttempts");
        return attempts == null ? 0 : attempts;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("google".equals(action)) {
            doGoogleLogin(request, response);
            return;
        }

        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            response.sendRedirect("/list-product");
        } else {
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }

    private void doGoogleLogin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String oauthUrl = "https://accounts.google.com/o/oauth2/auth"
                + "?client_id=" + CLIENT_ID
                + "&redirect_uri=" + URLEncoder.encode(REDIRECT_URI, "UTF-8")
                + "&response_type=code"
                + "&scope=" + URLEncoder.encode(SCOPE, "UTF-8")
                + "&access_type=offline";

        response.sendRedirect(oauthUrl);
    }
}
