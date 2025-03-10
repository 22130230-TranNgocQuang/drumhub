package com.drumhub.web.drumhub.controllers.auth;

import com.drumhub.web.drumhub.config.GoogleAuthConfig;
import com.drumhub.web.drumhub.models.User;
import com.drumhub.web.drumhub.services.UserService;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeTokenRequest;
import com.google.api.client.googleapis.auth.oauth2.GoogleTokenResponse;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.gson.GsonFactory;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Scanner;
import org.json.JSONObject;

@WebServlet({"/login/google", "/login/oauth2/code/google"})
public class GoogleLoginController extends HttpServlet {
    private UserService userService;

    @Override
    public void init() {
        this.userService = new UserService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String code = request.getParameter("code");

        if (code == null || code.isEmpty()) {
            // Tạo URL xác thực Google
            String authUrl = String.format("%s?client_id=%s&redirect_uri=%s&response_type=code&scope=%s",
                    GoogleAuthConfig.AUTH_ENDPOINT,
                    GoogleAuthConfig.CLIENT_ID,
                    GoogleAuthConfig.REDIRECT_URI,
                    GoogleAuthConfig.SCOPE);
            response.sendRedirect(authUrl);
            return;
        }

        try {
            // Trao đổi code lấy access token
            GoogleTokenResponse tokenResponse = new GoogleAuthorizationCodeTokenRequest(
                    new NetHttpTransport(),
                    new GsonFactory(),
                    GoogleAuthConfig.CLIENT_ID,
                    GoogleAuthConfig.CLIENT_SECRET,
                    code,
                    GoogleAuthConfig.REDIRECT_URI
            ).execute();

            // Lấy thông tin user từ Google
            String accessToken = tokenResponse.getAccessToken();
            URL url = new URL(GoogleAuthConfig.USERINFO_ENDPOINT);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestProperty("Authorization", "Bearer " + accessToken);

            Scanner scanner = new Scanner(conn.getInputStream());
            String response_body = scanner.useDelimiter("\\A").next();
            scanner.close();

            JSONObject userInfo = new JSONObject(response_body);

            // Kiểm tra email đã tồn tại chưa
            String email = userInfo.getString("email");
            User user = userService.findByEmail(email);

            if (user == null) {
                // Tạo user mới nếu chưa tồn tại
                user = new User();
                user.setEmail(email);
                user.setFullname(userInfo.getString("name"));
                user.setAvatar(userInfo.getString("picture"));
                user.setStatus(1);
                user.setRole(0);
                userService.create(user);
            }

            // Lưu thông tin vào session
            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            // Chuyển hướng về trang chủ
            response.sendRedirect(request.getContextPath() + "/home");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/login?error=google_login_failed");
        }
    }
}