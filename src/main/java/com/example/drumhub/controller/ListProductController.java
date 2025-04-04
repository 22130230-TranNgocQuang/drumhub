package com.example.drumhub.controller;

import com.example.drumhub.dao.models.Product;
import com.example.drumhub.services.ProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "ListProductController", value = "/list-product")
public class ListProductController extends HttpServlet {
    private ProductService service = new ProductService(); // Khởi tạo 1 lần

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        action = (action == null) ? "list" : action;

        try {
            switch (action) {
                case "search":
                    searchProducts(request, response);
                    break;
                case "detail":
                    detailProducts(request, response);
                    break;
                default:
                    listProducts(request, response);
            }
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    private void detailProducts(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Product product = service.getDetailById(id);
            request.setAttribute("product", product);
            request.getRequestDispatcher("/detail-product.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid product ID");
        }
    }

    // Các phương thức khác giữ nguyên nhưng thêm / vào đường dẫn JSP
    private void searchProducts(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("products", service.getAll());
        request.getRequestDispatcher("/list-product.jsp").forward(request, response);
    }

    private void listProducts(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("products", service.getAll());
        request.getRequestDispatcher("/list-product.jsp").forward(request, response);
    }
}