package com.drumhub.web.drumhub.controllers.homepage;

import com.drumhub.web.drumhub.models.Cart;
import com.drumhub.web.drumhub.models.CartItem;
import com.drumhub.web.drumhub.models.Product;
import com.drumhub.web.drumhub.services.ProductService;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/cart/*")
public class CartController extends HttpServlet {
    private final ProductService productService;
    private final Gson gson;

    public CartController() {
        this.productService = new ProductService();
        this.gson = new Gson();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }
        System.out.println(cart);
        request.setAttribute("cart", cart);
        request.setAttribute("title", "Giỏ hàng");
        request.setAttribute("content", "cart.jsp");
        request.getRequestDispatcher("/pages/homepage/layout.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            String action = request.getPathInfo();
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
                session.setAttribute("cart", cart);
            }

            Map<String, Object> result = new HashMap<>();
            System.out.println("action: " + action);
            if ("/add".equals(action)) {
                System.out.println("add");
                int productId = Integer.parseInt(request.getParameter("productId"));
                System.out.println("productId: " + productId);
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                System.out.println("quantity: " + quantity);
                String color = request.getParameter("color");
                System.out.println("color: " + color);

                Product product = productService.findWithDetailsAndSale(productId);
                if (product != null) {
                    cart.addItem(new CartItem(product, quantity, color));
                    result.put("success", true);
                    result.put("message", "Đã thêm vào giỏ hàng");
                    result.put("cartCount", cart.getItemCount());
                    result.put("total", cart.getTotal());
                } else {
                    result.put("success", false);
                    result.put("message", "Không tìm thấy sản phẩm");
                }
            } else if ("/update".equals(action)) {
                int productId = Integer.parseInt(request.getParameter("productId"));
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                String color = request.getParameter("color");

                cart.updateQuantity(productId, color, quantity);
                result.put("success", true);
                result.put("total", cart.getTotal());
            } else if ("/update-color".equals(action)) {
                int productId = Integer.parseInt(request.getParameter("productId"));
                String oldColor = request.getParameter("oldColor");
                String newColor = request.getParameter("newColor");

                cart.updateColor(productId, oldColor, newColor);
                result.put("success", true);
                result.put("message", "Đã cập nhật màu sắc");
            } else if ("/remove".equals(action)) {
                int productId = Integer.parseInt(request.getParameter("productId"));
                String color = request.getParameter("color");

                cart.removeItem(productId, color);
                result.put("success", true);
                result.put("cartCount", cart.getItemCount());
                result.put("total", cart.getTotal());
            } else {
                result.put("success", false);
                result.put("message", "Invalid action");
            }

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(gson.toJson(result));
        } catch (Exception e) {
            Map<String, Object> error = new HashMap<>();
            error.put("success", false);
            error.put("message", e.getMessage());
            System.out.println(e.getMessage());

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(gson.toJson(error));
        }
    }
}

