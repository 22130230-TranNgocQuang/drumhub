package com.drumhub.web.drumhub.controllers.dashboard;

import com.drumhub.web.drumhub.models.*;
import com.drumhub.web.drumhub.services.ProductColorService;
import com.drumhub.web.drumhub.services.ProductImageService;
import com.drumhub.web.drumhub.services.ProductService;
import com.drumhub.web.drumhub.utils.Utils;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/dashboard/products/*")
public class ProductManagerController extends ResourceController  {
    private ProductService productService;
    private ProductImageService productImageService;
    private ProductColorService productColorService;

    @Override
    public void init() {
        this.productService = new ProductService();
        this.productImageService = new ProductImageService();
        this.productColorService = new ProductColorService();
    }

    @Override
    public void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> products = productService.all();
        request.setAttribute("products", products);
        request.setAttribute("pageTitle", "Quản lí sản phẩm");
        request.setAttribute("content", "products/index.jsp");
        request.getRequestDispatcher("/pages/dashboard/layout.jsp").forward(request, response);
    }

    @Override
    public void show(HttpServletRequest request, HttpServletResponse response, String id) throws ServletException, IOException {
        Product product = productService.findWithDetails(Integer.parseInt(id));
        request.setAttribute("product", product);
        request.setAttribute("pageTitle", "Xem chi tiết sản phẩm");
        request.setAttribute("content", "products/show.jsp");
        request.getRequestDispatcher("/pages/dashboard/layout.jsp").forward(request, response);
    }

    @Override
    public void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("pageTitle", "Thêm sản phẩm");
        request.setAttribute("content", "products/create.jsp");
        request.getRequestDispatcher("/pages/dashboard/layout.jsp").forward(request, response);
    }

    @Override
    public void store(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (!Utils.validateCsrfToken(request, response)) return;

        try {
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            double price = Double.parseDouble(request.getParameter("price"));
            int stock = Integer.parseInt(request.getParameter("stock"));
            boolean isFeatured = Boolean.parseBoolean(request.getParameter("isFeatured"));
            int status = Integer.parseInt(request.getParameter("status"));
            String imagesJson = request.getParameter("imagesJson");
            String colorsJson = request.getParameter("colorsJson");
            System.out.println(imagesJson);
            System.out.println(colorsJson);
            //todo: transfer json data to List<>

            Product newProduct = new Product();
            newProduct.setName(name);
            newProduct.setDescription(description);
            newProduct.setPrice(price);
            newProduct.setStock(stock);
            newProduct.setIsFeatured(isFeatured);
            newProduct.setStatus(status);

            productService.create(newProduct);

            response.sendRedirect(request.getContextPath() + "/dashboard/products");
        } catch (NumberFormatException | NullPointerException e) {
            request.setAttribute("error", "Dữ liệu đầu vào không hợp lệ.");
            create(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Cập nhật thất bại: " + e.getMessage());
            create(request, response);
        }
    }

    @Override
    public void edit(HttpServletRequest request, HttpServletResponse response, String id) throws ServletException, IOException {
        Product product = productService.findWithDetails(Integer.parseInt(id));
        request.setAttribute("product", product);
        request.setAttribute("pageTitle", "Chỉnh sửa sản phẩm");
        request.setAttribute("content", "products/edit.jsp");
        request.getRequestDispatcher("/pages/dashboard/layout.jsp").forward(request, response);
    }

    @Override
    public void update(HttpServletRequest request, HttpServletResponse response, String id) throws ServletException, IOException {
        if (!Utils.validateCsrfToken(request, response)) return;

        try {
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            double price = Double.parseDouble(request.getParameter("price"));
            int stock = Integer.parseInt(request.getParameter("stock"));
            boolean isFeatured = Boolean.parseBoolean(request.getParameter("isFeatured"));
            int status = Integer.parseInt(request.getParameter("status"));

            Product product = productService.findWithDetails(Integer.parseInt(id));
            product.setName(name);
            product.setDescription(description);
            product.setPrice(price);
            product.setStock(stock);
            product.setIsFeatured(isFeatured);
            product.setStatus(status);

            productService.update(product);

            response.sendRedirect(request.getContextPath() + "/dashboard/products");
        } catch (NumberFormatException | NullPointerException e) {
            request.setAttribute("error", "Dữ liệu đầu vào không hợp lệ.");
            edit(request, response, id);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Cập nhật thất bại: " + e.getMessage());
            edit(request, response, id);
        }
    }

    @Override
    public void delete(HttpServletRequest request, HttpServletResponse response, String id) throws ServletException, IOException {
        if (!Utils.validateCsrfToken(request, response)) return;
        try {
            productService.delete(Integer.parseInt(id));

            response.sendRedirect(request.getContextPath() + "/dashboard/products");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Xóa sản phẩm thất bại: " + e.getMessage());
            index(request, response);
        }
    }

    @Override
    public void indexNested(HttpServletRequest request, HttpServletResponse response, String parentId, NestedResourceType resourceType) {
        switch (resourceType) {
            case PRODUCT_IMAGE:
                break;
            case PRODUCT_COLORS:
                System.out.println("day la Colors");
                break;
        }
    }

    @Override
    public void showNested(HttpServletRequest request, HttpServletResponse response, String parentId, String id, NestedResourceType resourceType) {
        switch (resourceType) {
            case PRODUCT_IMAGE:
                // Hiển thị chi tiết một bài post
                break;
            case PRODUCT_COLORS:
                System.out.println("day la addresses voi id la: " + id);
                break;
        }
    }

    @Override
    public void createNested(HttpServletRequest request, HttpServletResponse response, String parentId, NestedResourceType resourceType) {

    }

    @Override
    public void storeNested(HttpServletRequest request, HttpServletResponse response, String parentId, NestedResourceType resourceType) {

    }

    @Override
    public void editNested(HttpServletRequest request, HttpServletResponse response, String parentId, String id, NestedResourceType resourceType) throws ServletException, IOException {
        switch (resourceType) {
            case PRODUCT_IMAGE:
                ProductImage productImage = productImageService.find(Integer.parseInt(id));
                request.setAttribute("productImage", productImage);
                request.setAttribute("pageTitle", "Chỉnh sửa ảnh của sản phẩm");
                request.setAttribute("content", "products/images/edit.jsp");
                request.getRequestDispatcher("/pages/dashboard/layout.jsp").forward(request, response);
                break;
            case PRODUCT_COLORS:
                ProductColor productColor = productColorService.find(Integer.parseInt(id));
                request.setAttribute("productColor", productColor);
                request.setAttribute("pageTitle", "Chỉnh sửa màu của sản phẩm");
                request.setAttribute("content", "products/colors/edit.jsp");
                request.getRequestDispatcher("/pages/dashboard/layout.jsp").forward(request, response);
                break;
        }
    }

    @Override
    public void updateNested(HttpServletRequest request, HttpServletResponse response, String parentId, String id, NestedResourceType resourceType) throws ServletException, IOException {
        if (!Utils.validateCsrfToken(request, response)) return;
        switch (resourceType) {
            case PRODUCT_IMAGE:
                try {
                    String image = request.getParameter("productImage");
                    boolean isMain = Boolean.parseBoolean(request.getParameter("isMain"));

                    ProductImage productImage = new ProductImage();
                    productImage.setId(Integer.parseInt(id));
                    productImage.setImage(image);
                    productImage.setIsMain(isMain);
                    productImage.setProductId(Integer.parseInt(parentId));

                    System.out.println(productImage);

                    productImageService.update(productImage);

                    // Redirect
                    response.sendRedirect(request.getContextPath() + "/dashboard/products/" + parentId + "/edit");
                } catch (NumberFormatException | NullPointerException e) {
                    request.setAttribute("error", "Dữ liệu đầu vào không hợp lệ.");
                    editNested(request, response, parentId, id, resourceType);
                } catch (Exception e) {
                    e.printStackTrace();
                    request.setAttribute("error", "Cập nhật thất bại: " + e.getMessage());
                    editNested(request, response, parentId, id, resourceType);
                }
                break;
            case PRODUCT_COLORS:
                try {
                    String colorCode = request.getParameter("colorCode");
                    String colorName = request.getParameter("colorName");

                    ProductColor productColor = new ProductColor();
                    productColor.setId(Integer.parseInt(id));
                    productColor.setColorCode(colorCode);
                    productColor.setColorName(colorName);
                    productColor.setProductId(Integer.parseInt(parentId));

                    productColorService.update(productColor);

                    // Redirect
                    response.sendRedirect(request.getContextPath() + "/dashboard/products/" + parentId + "/edit");
                } catch (NumberFormatException | NullPointerException e) {
                    request.setAttribute("error", "Dữ liệu đầu vào không hợp lệ.");
                    editNested(request, response, parentId, id, resourceType);
                } catch (Exception e) {
                    e.printStackTrace();
                    request.setAttribute("error", "Cập nhật thất bại: " + e.getMessage());
                    editNested(request, response, parentId, id, resourceType);
                }
                break;
        }
    }

    @Override
    public void deleteNested(HttpServletRequest request, HttpServletResponse response, String parentId, String id, NestedResourceType resourceType) throws ServletException, IOException {
//        if (!Utils.validateCsrfToken(request, response)) return;
        switch (resourceType) {
            case PRODUCT_IMAGE:
                try {
                    productImageService.delete(Integer.parseInt(id));
                    response.sendRedirect(request.getContextPath() + "/dashboard/products/" + parentId + "/edit");
                } catch (Exception e) {
                    e.printStackTrace();
                    request.setAttribute("error", "Xóa ảnh thất bại: " + e.getMessage());
                    editNested(request, response, parentId, id, resourceType);
                };
                break;
            case PRODUCT_COLORS:
                try {
                    productColorService.delete(Integer.parseInt(id));
                    response.sendRedirect(request.getContextPath() + "/dashboard/products/" + parentId + "/edit");
                } catch (Exception e) {
                    e.printStackTrace();
                    request.setAttribute("error", "Xóa màu thất bại: " + e.getMessage());
                    editNested(request, response, parentId, id, resourceType);
                };
                break;
            case ORDERS:
                // Hiển thị chi tiết một đơn hàng
                break;
            case WISHLISTS:
                // Hiển thị chi tiết một wishlist
                break;
        }
    }
}