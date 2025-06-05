package com.example.drumhub;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Scanner;

@WebServlet("/address-proxy")
public class AddressProxyServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String type = request.getParameter("type");
        String id = request.getParameter("id");

        String apiUrl;

        // Xác định endpoint API dựa trên tham số "type"
        switch (type) {
            case "province":
                apiUrl = "https://provinces.open-api.vn/api/p/";
                break;
            case "district":
                if (id == null || id.isEmpty()) {
                    response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                    response.getWriter().write("{\"error\": \"Thiếu mã tỉnh (id)\"}");
                    return;
                }
                apiUrl = "https://provinces.open-api.vn/api/p/" + id + "?depth=2";
                break;
            case "ward":
                if (id == null || id.isEmpty()) {
                    response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                    response.getWriter().write("{\"error\": \"Thiếu mã huyện (id)\"}");
                    return;
                }
                apiUrl = "https://provinces.open-api.vn/api/d/" + id + "?depth=2";
                break;
            default:
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().write("{\"error\": \"Tham số 'type' không hợp lệ.\"}");
                return;
        }

        // Log debug (bạn có thể bỏ nếu không cần)
        System.out.println("[Proxy] Gọi tới: " + apiUrl);

        try {
            URL url = new URL(apiUrl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setConnectTimeout(5000);  // timeout an toàn hơn
            conn.setReadTimeout(5000);

            int status = conn.getResponseCode();
            System.out.println("[Proxy] Mã phản hồi: " + status);

            InputStream is = (status >= 200 && status < 400) ? conn.getInputStream() : conn.getErrorStream();

            response.setContentType("application/json;charset=UTF-8");

            try (
                    Scanner scanner = new Scanner(is, "UTF-8").useDelimiter("\\A");
                    PrintWriter out = response.getWriter()
            ) {
                if (scanner.hasNext()) {
                    out.write(scanner.next());
                } else {
                    out.write("{}");  // JSON hợp lệ để tránh lỗi JS
                }
            }

        } catch (Exception e) {
            e.printStackTrace();  // In lỗi chi tiết ra console
            response.setStatus(500);
            response.setContentType("application/json");
            response.getWriter().write("{\"error\": \"Không thể truy cập API\"}");
        }
    }
}
