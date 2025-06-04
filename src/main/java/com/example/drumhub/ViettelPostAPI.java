package com.example.drumhub;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.TimeUnit;
import java.util.logging.Logger;

public class ViettelPostAPI {
    private static final Logger logger = Logger.getLogger(ViettelPostAPI.class.getName());
    private static final String BASE_URL = "https://partner.viettelpost.vn/v2/categories/";
    private static final String LOGIN_URL = "https://partner.viettelpost.vn/v2/user/Login";

    private static String token;
    private static long tokenExpiryTime = 0;
    private static final String username = "0346402209";
    private static final String password = "Quangtran0410";
    private static final long TOKEN_EXPIRY_DURATION = TimeUnit.HOURS.toMillis(1);

    public static synchronized String getToken() throws IOException {
        return getToken(username, password);
    }

    public static synchronized String getToken(String username, String password) throws IOException {
        logger.info("Đang lấy token mới từ ViettelPost...");

        URL url = new URL(LOGIN_URL);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setDoOutput(true);

        JSONObject loginData = new JSONObject();
        loginData.put("USERNAME", username);
        loginData.put("PASSWORD", password);

        try (OutputStream os = conn.getOutputStream()) {
            os.write(loginData.toString().getBytes(StandardCharsets.UTF_8));
        }

        int responseCode = conn.getResponseCode();
        String responseText = readStream(
                (responseCode == 200) ? conn.getInputStream() : conn.getErrorStream()
        );

        JSONObject json = new JSONObject(responseText);
        if (!json.has("data") || json.isNull("data")) {
            throw new IOException("Lỗi đăng nhập ViettelPost: " + json.optString("message", "Không rõ lỗi"));
        }

        token = json.getJSONObject("data").getString("token");
        tokenExpiryTime = System.currentTimeMillis() + TOKEN_EXPIRY_DURATION;

        logger.info("Lấy token thành công, hết hạn lúc: " + new java.util.Date(tokenExpiryTime));
        return token;
    }

    public static JSONArray getProvinces() throws IOException {
        return callAPIWithRetry("listProvince", null);
    }

    public static JSONArray getDistricts(int provinceId) throws IOException {
        return callAPIWithRetry("listDistrict?provinceId=" + provinceId, null);
    }

    public static JSONArray getWards(int districtId) throws IOException {
        JSONObject body = new JSONObject();
        body.put("districtId", districtId);
        return callAPIWithRetry("listWard", body);
    }

    private static JSONArray callAPIWithRetry(String endpoint, JSONObject body) throws IOException {
        try {
            return callAPI(endpoint, body);
        } catch (IOException e) {
            if (e.getMessage().contains("401") || !isTokenValid()) {
                logger.warning("Token có thể hết hạn, thử lấy token mới...");
                refreshToken();
                return callAPI(endpoint, body);
            }
            throw e;
        }
    }

    private static JSONArray callAPI(String endpoint, JSONObject body) throws IOException {
        if (!isTokenValid()) {
            throw new IOException("Token không hợp lệ hoặc đã hết hạn");
        }

        URL url = new URL(BASE_URL + endpoint);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();

        String method = getHttpMethodForEndpoint(endpoint);
        conn.setRequestMethod(method);
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setRequestProperty("Token", token);

        logger.info("Gọi API " + endpoint + " bằng " + method + (body != null ? " | body = " + body.toString() : ""));

        if ("POST".equals(method)) {
            conn.setDoOutput(true);
            try (OutputStream os = conn.getOutputStream()) {
                if (body != null) {
                    os.write(body.toString().getBytes(StandardCharsets.UTF_8));
                } else {
                    os.write("{}".getBytes(StandardCharsets.UTF_8));
                }
            }
        }

        int responseCode = conn.getResponseCode();
        String responseText = readStream(
                (responseCode == 200) ? conn.getInputStream() : conn.getErrorStream()
        );

        logger.info("Phản hồi từ " + endpoint + " - Mã: " + responseCode);

        if (responseCode != 200) {
            throw new IOException("Lỗi API ViettelPost: " + responseCode + " - " + responseText);
        }

        JSONObject json = new JSONObject(responseText);
        if (!json.has("data") || json.isNull("data")) {
            throw new IOException("Phản hồi không chứa mảng data: " + responseText);
        }

        return json.getJSONArray("data");
    }

    private static String getHttpMethodForEndpoint(String endpoint) {
        if (endpoint.startsWith("listDistrict") || endpoint.startsWith("listWard")) {
            return "GET"; // Đã đổi từ POST sang GET
        }
        return "GET"; // Default
    }

    private static String readStream(InputStream stream) throws IOException {
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(stream, StandardCharsets.UTF_8))) {
            StringBuilder result = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                result.append(line);
            }
            return result.toString();
        }
    }

    public static synchronized boolean isTokenValid() {
        return token != null && !token.isEmpty() && System.currentTimeMillis() < tokenExpiryTime;
    }

    public static synchronized void refreshToken() throws IOException {
        logger.info("Làm mới token...");
        getToken(); // tự động dùng thông tin đăng nhập đã lưu
    }
}
