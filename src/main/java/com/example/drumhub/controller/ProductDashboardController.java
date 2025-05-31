package com.example.drumhub.controller;

import com.example.drumhub.dao.models.Product;
import com.example.drumhub.services.ProductDashboardService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductDashboardController", value = "/dashboard/products/*")
public class ProductDashboardController extends HttpServlet {

    private ProductDashboardService service = new ProductDashboardService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();

        if (path == null || path.equals("/")) {
            List<Product> products = service.getAll();
            request.setAttribute("products", products);
            request.getRequestDispatcher("/dashboard/products/index.jsp").forward(request, response);
        } else if (path.equals("/delete")) {
            String idStr = request.getParameter("id");
            if (idStr != null) {
                int id = Integer.parseInt(idStr);
                service.softDelete(id); // Cập nhật status = false
            }
            response.sendRedirect(request.getContextPath() + "/dashboard/products");
        }
    }
}
