package com.example.drumhub.controller;

import com.example.drumhub.dao.db.DBConnect;
import com.example.drumhub.dao.models.Product;
import com.example.drumhub.services.ProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet(name = "ListProductController", value = {"/list-product", "/list-product/*"})
public class ListProductController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        action = (action == null) ? "list" : action;

        try (Connection conn = DBConnect.getConnection()) {
            ProductService service = new ProductService(conn);

            switch (action) {
                case "search":
                    searchProducts(request, response, service);
                    break;
                case "detail":
                    detailProduct(request, response, service);
                    break;
                default:
                    listAllProducts(request, response, service);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    private void listAllProducts(HttpServletRequest request, HttpServletResponse response, ProductService service)
            throws ServletException, IOException {
        List<Product> products = service.getAll();
        System.out.println("Debug - Total products: " + products.size());
        request.setAttribute("products", products);
        request.getRequestDispatcher("/list-product.jsp").forward(request, response);
    }

    private void searchProducts(HttpServletRequest request, HttpServletResponse response, ProductService service)
            throws ServletException, IOException {
        String keyword = request.getParameter("keyword");

        if (keyword == null || keyword.trim().isEmpty()) {
            listAllProducts(request, response, service);
            return;
        }

        List<Product> searchResults = service.search(keyword);
        request.setAttribute("products", searchResults);
        request.getRequestDispatcher("/list-product.jsp").forward(request, response);
    }

    private void detailProduct(HttpServletRequest request, HttpServletResponse response, ProductService service)
            throws ServletException, IOException {
        try {
            String pathInfo = request.getPathInfo();
            if (pathInfo == null || pathInfo.equals("/")) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing product ID");
                return;
            }

            int id = Integer.parseInt(pathInfo.substring(1));
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