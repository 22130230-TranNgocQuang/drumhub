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
    String action = request.getParameter("action");

    if (action == null) {
        action = "list";
    }

    switch (action) {
        case "search":
            searchProducts(request, response);
            break;
        case "detail":
            detailProducts(request, response);
            break;
        default:
            listProducts(request, response);
            break;
    }
}

    private void detailProducts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        ProductService service = new ProductService();
        Product product = service.getDetailById(id);

        request.setAttribute("product", product);
        request.getRequestDispatcher("detail-product.jsp").forward(request, response);
    }

    private void searchProducts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // dữ liệu
        ProductService service = new ProductService();
        List<Product> all = service.getAll();

        //------------------------------------
        request.setAttribute("products", all);
        request.getRequestDispatcher("list-product.jsp").forward(request, response);
    }

    private void listProducts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // code lấy giá trị từ model
        ProductService service = new ProductService();
        List<Product> all = service.getAll();
        // code truyền giá trị qua view
        request.setAttribute("products", all);
        // trang chuyển hướng view
        request.getRequestDispatcher("list-product.jsp").forward(request, response);
    }

    @Override protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}