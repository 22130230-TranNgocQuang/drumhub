package com.drumhub.web.drumhub.controllers.homepage;

import com.drumhub.web.drumhub.models.Product;
import com.drumhub.web.drumhub.services.BrandService;
import com.drumhub.web.drumhub.services.CategoryService;
import com.drumhub.web.drumhub.services.ProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet({"/products", "/product/*"})
public class ProductController extends HttpServlet {
    private ProductService productService;
    private CategoryService categoryService;
    private BrandService brandService;
    private static final int PRODUCTS_PER_PAGE = 9;

    @Override
    public void init() {
        this.productService = new ProductService();
        this.categoryService = new CategoryService();
        this.brandService = new BrandService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            String pathInfo = request.getPathInfo();
            String servletPath = request.getServletPath();

            if ("/product".equals(servletPath) && pathInfo != null) {
                // Xử lý chi tiết sản phẩm
                handleProductDetail(request, response);
            } else {
                // Xử lý danh sách sản phẩm
                handleProductList(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    private void handleProductDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Lấy ID sản phẩm từ URL
            String pathInfo = request.getPathInfo();
            String productId = pathInfo.substring(1); // Bỏ dấu "/" ở đầu

            // Lấy thông tin sản phẩm
            Product product = productService.findWithDetailsAndSale(Integer.parseInt(productId));
            if (product == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                return;
            }

            // Lấy các sản phẩm liên quan (cùng danh mục)
            List<Product> relatedProducts = productService.getRelatedProductsWithSale(product.getId(), product.getCategory().getId(), 4);

            // Set attributes
            request.setAttribute("product", product);
            request.setAttribute("relatedProducts", relatedProducts);
            request.setAttribute("title", product.getName());
            request.setAttribute("content", "product-detail.jsp");
            request.getRequestDispatcher("/pages/homepage/layout.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
        }
    }

    private void handleProductList(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            // Lấy các tham số từ request
            int page = getPage(request);
            String searchKeyword = request.getParameter("search");
            String category = request.getParameter("category");
            String brand = request.getParameter("brand");
            String priceRange = request.getParameter("priceRange");
            String sortBy = request.getParameter("sortBy");

            // Tính toán phân trang
            int totalProducts = productService.countProducts(searchKeyword, category, brand, priceRange);
            int totalPages = (int) Math.ceil((double) totalProducts / PRODUCTS_PER_PAGE);

            // Lấy danh sách sản phẩm theo điều kiện lọc
            List<Product> products = productService.getProducts(page, PRODUCTS_PER_PAGE, searchKeyword, category, brand, priceRange, sortBy);

            // Set attributes cho view
            request.setAttribute("products", products);
            request.setAttribute("currentPage", page);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("searchKeyword", searchKeyword);
            request.setAttribute("selectedCategory", category);
            request.setAttribute("selectedBrand", brand);
            request.setAttribute("selectedPriceRange", priceRange);
            request.setAttribute("sortBy", sortBy);

            // Lấy danh sách categories và brands cho filter
            request.setAttribute("categories", categoryService.all());
            request.setAttribute("brands", brandService.all());

            request.setAttribute("title", "Danh sách sản phẩm");
            request.setAttribute("content", "products.jsp");
            request.getRequestDispatcher("/pages/homepage/layout.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    private int getPage(HttpServletRequest request) {
        String pageStr = request.getParameter("page");
        if (pageStr != null && !pageStr.isEmpty()) {
            try {
                return Integer.parseInt(pageStr);
            } catch (NumberFormatException e) {
                return 1;
            }
        }
        return 1;
    }
}

