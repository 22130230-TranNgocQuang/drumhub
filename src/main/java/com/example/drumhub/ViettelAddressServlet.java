package com.example.drumhub;

import com.example.drumhub.ViettelPostAPI;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.json.JSONArray;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/api/viettel-address")
public class ViettelAddressServlet extends HttpServlet {
    @Override
    public void init() throws ServletException {
        System.out.println("ViettelAddressServlet init() đã được gọi!");
        try {
            // Lấy token 1 lần khi servlet khởi động
            ViettelPostAPI.getToken("0346402209", "Quangtran0410");
        } catch (IOException e) {
            throw new ServletException("Không thể đăng nhập ViettelPost", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        System.out.println(">>> [DEBUG] ContextPath: " + req.getContextPath());

        String type = req.getParameter("type"); // province | district | ward
        String id = req.getParameter("id");     // provinceId hoặc districtId

        resp.setContentType("application/json");
        PrintWriter out = resp.getWriter();

        try {
            JSONArray data;

            if ("province".equals(type)) {
                data = ViettelPostAPI.getProvinces();
            } else if ("district".equals(type) && id != null) {
                data = ViettelPostAPI.getDistricts(Integer.parseInt(id));
            } else if ("ward".equals(type) && id != null) {
                data = ViettelPostAPI.getWards(Integer.parseInt(id));
            } else {
                resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                out.print("{\"error\": \"Thiếu hoặc sai tham số\"}");
                return;
            }

            out.print(data.toString());

        } catch (Exception e) {
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print("{\"error\": \"Lỗi server\"}");
        }
    }
}
