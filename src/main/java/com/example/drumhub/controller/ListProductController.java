package com.example.drumhub.controller;
import com.example.drumhub.dao.models.Product;
import com.example.drumhub.services.ProductService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ListProductController", value = "/list-product")
public class ListProductController extends HttpServlet { 

@Override protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    ProductService service = new ProductService();
    List<Product> all = service.getAll();
    request.setAttribute("products", all);
    request.getRequestDispatcher("list-product.jsp").forward(request, response);
}
@Override protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { } 
}