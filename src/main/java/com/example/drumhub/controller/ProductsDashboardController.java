package com.example.drumhub.controller;

import com.example.drumhub.dao.models.Category;
import com.example.drumhub.dao.models.Product;
import com.example.drumhub.services.ProductsDashboardService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 10
)
@WebServlet(name = "ProductDashboardController", value = "/dashboard/product")
public class ProductsDashboardController extends HttpServlet {
    private ProductsDashboardService service = new ProductsDashboardService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("detail".equals(action)) {
            String idStr = request.getParameter("id");
            if (idStr == null) {
                response.sendRedirect(request.getContextPath() + "/dashboard/product");
                return;
            }
            int id = Integer.parseInt(idStr);
            Product product = service.getById(id);
            if (product == null) {
                response.sendRedirect(request.getContextPath() + "/dashboard/product");
                return;
            }

            List<Category> categories = service.getAllCategories();
            request.setAttribute("product", product);
            request.setAttribute("categories", categories);
            request.getRequestDispatcher("/dashboard/product/detail.jsp").forward(request, response);

        } else if ("create".equals(action)) {
            List<Category> categories = service.getAllCategories();
            request.setAttribute("categories", categories);
            request.getRequestDispatcher("/dashboard/product/create.jsp").forward(request, response);

        } else {
            List<Product> products = service.getAll();
            request.setAttribute("products", products);
            request.getRequestDispatcher("/dashboard/product/products.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("update".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String image = request.getParameter("image");
            double price = Double.parseDouble(request.getParameter("price"));
            boolean status = "true".equals(request.getParameter("status"));
            int categoryId = Integer.parseInt(request.getParameter("categoryId"));

            Product product = service.getById(id);
            if (product == null) {
                response.sendRedirect(request.getContextPath() + "/dashboard/product");
                return;
            }
            product.setName(name);
            product.setImage(image);
            product.setPrice(price);
            product.setStatus(status);
            product.setCategoryId(categoryId);

            service.updateProduct(product);
            response.sendRedirect(request.getContextPath() + "/dashboard/product");

        } else if ("hide".equals(action)) {
            String idStr = request.getParameter("id");
            if (idStr != null) {
                int id = Integer.parseInt(idStr);
                service.softDelete(id);
            }
            response.sendRedirect(request.getContextPath() + "/dashboard/product");

        } else if ("create".equals(action)) {
            String name = request.getParameter("name");
            double price = Double.parseDouble(request.getParameter("price"));
            boolean status = "true".equals(request.getParameter("status"));
            int categoryId = Integer.parseInt(request.getParameter("categoryId"));

            // Xử lý upload ảnh
            Part filePart = request.getPart("image");
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

            // Tạo thư mục nếu chưa có
            String uploadPath = getServletContext().getRealPath("assets/images/products");
//            File uploadDir = new File(uploadPath);
//            if (!uploadDir.exists()) uploadDir.mkdir();

            // Ghi file vào thư mục /uploads
            filePart.write(uploadPath + File.separator + fileName);

            // Lưu đường dẫn tương đối vào DB
            String imagePath =  fileName;
            Product product = new Product(0, name, imagePath, price, status, categoryId);
            service.addProduct(product);

            response.sendRedirect(request.getContextPath() + "/dashboard/product");
        }

    }
}