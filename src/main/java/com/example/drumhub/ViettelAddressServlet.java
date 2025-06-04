package com.example.drumhub;

import com.example.drumhub.ViettelPostAPI;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.json.JSONArray;
import org.json.JSONObject;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Logger;

@WebServlet("/api/viettel-address")
public class ViettelAddressServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(ViettelAddressServlet.class.getName());
    private static final String AUTH_ERROR = "{\"error\":\"Không thể xác thực với ViettelPost\"}";

    @Override
    public void init() throws ServletException {
        try {
            logger.info("Khởi tạo ViettelAddressServlet...");
            ViettelPostAPI.getToken("0346402209", "Quangtran0410");
        } catch (Exception e) {
            logger.severe("Lỗi khi lấy token ViettelPost: " + e.getMessage());
            throw new ServletException("Không thể khởi tạo servlet", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        // Thiết lập CORS headers
        setCorsHeaders(resp);

        resp.setContentType("application/json;charset=UTF-8");
        PrintWriter out = resp.getWriter();

        try {
            String type = req.getParameter("type");
            String id = req.getParameter("id");

            logger.info("Request type: " + type + ", id: " + id);

            // Kiểm tra token còn hiệu lực
            if (!ViettelPostAPI.isTokenValid()) {
                logger.warning("Token hết hạn, thử lấy token mới...");
                ViettelPostAPI.refreshToken();
            }

            JSONArray data = processRequest(type, id, resp);
            if (data != null) {
                out.print(data.toString());
            }
        } catch (Exception e) {
            logger.severe("Lỗi server: " + e.getMessage());
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print("{\"error\": \"Lỗi hệ thống: " + e.getMessage().replace("\"", "'") + "\"}");
        }
    }

    private JSONArray processRequest(String type, String id, HttpServletResponse resp) throws IOException {
        if (type == null) {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            resp.getWriter().print("{\"error\":\"Thiếu tham số type\"}");
            return null;
        }

        try {
            switch (type) {
                case "province":
                    return ViettelPostAPI.getProvinces();
                case "district":
                    validateId(id, resp);
                    return ViettelPostAPI.getDistricts(Integer.parseInt(id));
                case "ward":
                    validateId(id, resp);
                    return ViettelPostAPI.getWards(Integer.parseInt(id));
                default:
                    resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                    resp.getWriter().print("{\"error\":\"Loại request không hợp lệ\"}");
                    return null;
            }
        } catch (NumberFormatException e) {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            resp.getWriter().print("{\"error\":\"ID phải là số\"}");
            return null;
        } catch (IOException e) {
            throw e; // Re-throw để xử lý ở trên
        }
    }

    private void validateId(String id, HttpServletResponse resp) throws IOException {
        if (id == null || id.isEmpty()) {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            resp.getWriter().print("{\"error\":\"Thiếu tham số id\"}");
            throw new IllegalArgumentException("Thiếu id");
        }
    }

    private void setCorsHeaders(HttpServletResponse resp) {
        resp.setHeader("Access-Control-Allow-Origin", "*");
        resp.setHeader("Access-Control-Allow-Methods", "GET");
        resp.setHeader("Access-Control-Allow-Headers", "Content-Type");
    }

    @Override
    protected void doOptions(HttpServletRequest req, HttpServletResponse resp) {
        setCorsHeaders(resp);
        resp.setStatus(HttpServletResponse.SC_OK);
    }
}