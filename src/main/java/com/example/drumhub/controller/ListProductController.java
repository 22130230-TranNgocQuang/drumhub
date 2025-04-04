package com.example.drumhub.controller;

import com.example.drumhub.dao.models.Product;
import com.example.drumhub.services.ProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ListProductController", value = "/list-product")
public class ListProductController extends HttpServlet {
    private ProductService service = new ProductService();

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
                    detailProduct(request, response);
                    break;
                default:
                    listAllProducts(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace(); // In lỗi ra console để debug
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    private void listAllProducts(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Product> products = service.getAll();
        System.out.println("Debug - Total products: " + products.size()); // Debug số lượng

        request.setAttribute("products", products);
        request.getRequestDispatcher("/list-product.jsp").forward(request, response);
    }

    private void searchProducts(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String keyword = request.getParameter("keyword");

        if (keyword == null || keyword.trim().isEmpty()) {
            // Nếu không có keyword thì hiển thị tất cả
            listAllProducts(request, response);
            return;
        }

        List<Product> products = service.search(keyword);
        request.setAttribute("products", products);
        request.setAttribute("searchKeyword", keyword); // Giữ lại từ khóa tìm kiếm

        request.getRequestDispatcher("/list-product.jsp").forward(request, response);
    }

    private void detailProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Product product = service.getDetailById(id);

            if (product == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Product not found");
                return;
            }

            request.setAttribute("product", product);
            request.getRequestDispatcher("/detail-product.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid product ID");
        }
    }
}