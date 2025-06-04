package com.example.drumhub.controller;

import com.example.drumhub.dao.ProductDAO;
import com.example.drumhub.dao.models.Product;
import com.example.drumhub.services.ProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/home")
public class HomeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductService service = new ProductService();
        List<Product> topProducts = service.getListByN();
        request.setAttribute("products", topProducts);
        System.out.println("Số lượng sản phẩm lấy được: " + topProducts.size());
        request.getRequestDispatcher("index.jsp").forward(request, response);

    }
}
