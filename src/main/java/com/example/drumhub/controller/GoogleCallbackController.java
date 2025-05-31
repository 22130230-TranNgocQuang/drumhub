package com.example.drumhub.controller;

import com.example.drumhub.dao.UserDAO;
import com.example.drumhub.dao.models.Email;
import com.example.drumhub.dao.models.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.json.JSONObject;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.stream.Collectors;

@WebServlet("/oauth2callback")
public class GoogleCallbackController extends HttpServlet {

    private static final String CLIENT_ID = "467836431196-6hp51978i86knhd3nccpr65dtlp5hoiq.apps.googleusercontent.com";
    private static final String CLIENT_SECRET = "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";
    private static final String REDIRECT_URI = "http://localhost:8080/oauth2callback";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String code = request.getParameter("code");
        if (code == null || code.isEmpty()) {
            response.getWriter().println("Thiếu mã code từ Google.");
            return;
        }

        // 1. Lấy access token từ Google
        String tokenUrl = "https://oauth2.googleapis.com/token";
        String urlParameters = "code=" + URLEncoder.encode(code, "UTF-8") +
                "&client_id=" + URLEncoder.encode(CLIENT_ID, "UTF-8") +
                "&client_secret=" + URLEncoder.encode(CLIENT_SECRET, "UTF-8") +
                "&redirect_uri=" + URLEncoder.encode(REDIRECT_URI, "UTF-8") +
                "&grant_type=authorization_code";

        HttpURLConnection tokenConn = (HttpURLConnection) new URL(tokenUrl).openConnection();
        tokenConn.setRequestMethod("POST");
        tokenConn.setDoOutput(true);
        tokenConn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");

        try (OutputStream os = tokenConn.getOutputStream()) {
            os.write(urlParameters.getBytes());
            os.flush();
        }

        String tokenResponse;
        try (BufferedReader in = new BufferedReader(new InputStreamReader(tokenConn.getInputStream()))) {
            tokenResponse = in.lines().collect(Collectors.joining());
        } catch (IOException e) {
            String errorMsg;
            try (BufferedReader errorReader = new BufferedReader(new InputStreamReader(tokenConn.getErrorStream()))) {
                errorMsg = errorReader.lines().collect(Collectors.joining());
            }
            throw new RuntimeException("Không thể lấy access token: " + errorMsg);
        }

        JSONObject jsonObject = new JSONObject(tokenResponse);
        String accessToken = jsonObject.getString("access_token");

        // 2. Lấy thông tin user từ access token
        String userInfoUrl = "https://www.googleapis.com/oauth2/v2/userinfo?access_token=" + accessToken;
        HttpURLConnection userConn = (HttpURLConnection) new URL(userInfoUrl).openConnection();

        String userInfo;
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(userConn.getInputStream()))) {
            userInfo = reader.lines().collect(Collectors.joining());
        }

        JSONObject userJson = new JSONObject(userInfo);
        String email = userJson.getString("email");
        String name = userJson.getString("name").replaceAll("\\s+", "");

        UserDAO userDAO = new UserDAO();
        User existingAccount = userDAO.findUserByEmail(email);

        if (existingAccount == null) {
            // Nếu user chưa có, tạo mới với status = 0 (chưa xác thực)
            User newAccount = new User();
            newAccount.setEmail(email);
            newAccount.setUsername(name);
            newAccount.setFullName(name);
            newAccount.setRole(1);
            newAccount.setStatus(0); // Chưa xác thực

            userDAO.registerGoogleUser(newAccount);

            // Gửi email xác thực
            String verificationLink = "http://localhost:8080/verify?email=" + URLEncoder.encode(email, "UTF-8");
            Email.sendVerificationEmail(email, verificationLink);
            request.getRequestDispatcher("email-sent.jsp").forward(request, response);
            return;
        }

        // Nếu user đã có nhưng chưa xác thực
        if (existingAccount.getStatus() == 0) {
            response.getWriter().println("Tài khoản của bạn chưa được xác thực. Vui lòng kiểm tra email.");
            return;
        }

        // 3. Lưu session nếu đã xác thực
        HttpSession session = request.getSession();
        session.setAttribute("user", existingAccount);

        // 4. Redirect về home
        response.sendRedirect(request.getContextPath() + "/home");
    }
}

