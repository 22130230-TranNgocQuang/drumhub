package com.example.drumhub;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;

public class ViettelPostAPI {
    private static final String BASE_URL = "https://partner.viettelpost.vn/v2/categories/";
    private static String token;

    // Lấy token đăng nhập
    public static String getToken(String username, String password) throws IOException {
        URL url = new URL("https://partner.viettelpost.vn/v2/user/Login");
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setDoOutput(true);

        JSONObject loginData = new JSONObject();
        loginData.put("USERNAME", username);
        loginData.put("PASSWORD", password);

        try (OutputStream os = conn.getOutputStream()) {
            byte[] input = loginData.toString().getBytes(StandardCharsets.UTF_8);
            os.write(input);
        }

        int responseCode = conn.getResponseCode();
        String responseText = readStream(
                (responseCode == 200) ? conn.getInputStream() : conn.getErrorStream()
        );

        JSONObject json = new JSONObject(responseText);
        if (!json.has("data") || json.isNull("data")) {
            throw new IOException("Lỗi đăng nhập ViettelPost: " + json.optString("message", "không rõ lỗi"));
        }

        token = json.getJSONObject("data").getString("token");
        return token;
    }


    // Gọi API lấy danh sách tỉnh
    public static JSONArray getProvinces() throws IOException {
        System.out.println(">>> [DEBUG] Gọi getProvinces()...");
        return callAPI("listProvince", null);
    }

    // Lấy huyện theo tỉnh
    public static JSONArray getDistricts(int provinceId) throws IOException {
        JSONObject body = new JSONObject();
        body.put("provinceId", provinceId);
        return callAPI("listDistrict", body);
    }

    // Lấy xã theo huyện
    public static JSONArray getWards(int districtId) throws IOException {
        JSONObject body = new JSONObject();
        body.put("districtId", districtId);
        return callAPI("listWard", body);
    }

    // Gọi API chung
    private static JSONArray callAPI(String endpoint, JSONObject body) throws IOException {
        URL url = new URL(BASE_URL + endpoint);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();

        // 💡 Nếu body == null → GET, ngược lại thì POST
        boolean isPost = (body != null);
        conn.setRequestMethod(isPost ? "POST" : "GET");

        conn.setRequestProperty("Content-Type", "application/json");
        conn.setRequestProperty("Token", token);

        if (isPost) {
            conn.setDoOutput(true);
            System.out.println(">>> [DEBUG] Gửi body: " + body.toString());
            try (OutputStream os = conn.getOutputStream()) {
                byte[] input = body.toString().getBytes(StandardCharsets.UTF_8);
                os.write(input);
            }
        }

        int responseCode = conn.getResponseCode();
        String responseText = readStream(
                (responseCode == 200) ? conn.getInputStream() : conn.getErrorStream()
        );

        System.out.println(">>> [DEBUG] Phản hồi từ " + endpoint + ": " + responseText);
        if (responseCode == 200) {
            JSONObject json = new JSONObject(responseText);
            return json.getJSONArray("data");
        } else {
            throw new IOException("Lỗi API ViettelPost: " + responseCode);
        }
    }


    private static String readStream(InputStream stream) throws IOException {
        BufferedReader reader = new BufferedReader(new InputStreamReader(stream, StandardCharsets.UTF_8));
        StringBuilder result = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            result.append(line);
        }
        return result.toString();
    }
}
