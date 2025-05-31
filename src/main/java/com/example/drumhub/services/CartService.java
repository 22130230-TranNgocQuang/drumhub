package com.example.drumhub.services;

import com.example.drumhub.dao.CartDAO;
import com.example.drumhub.dao.models.Cart;
import com.example.drumhub.dao.models.Product;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class CartService {
    private CartDAO cartDAO ;

    public CartService(Connection conn) throws SQLException {
        cartDAO = new CartDAO(conn);
    }

    public boolean addCart(int userId, int productId, int quantity, double price) {
        boolean result = false;
        System.out.println("===> Gọi addCart: userId=" + userId + ", productId=" + productId);
        try{
            ProductService service = new ProductService();
            Product product = service.getDetailById(productId);
            if (product == null) {
                System.err.println("Không tìm thấy sản phẩm với ID: " + productId);
                return false;
            }
            int orderId = 0;
            Cart cart = new Cart(productId, product, userId, quantity, price, orderId);
            return cartDAO.addCart(cart);
        } catch(Exception e){
            e.printStackTrace();
            return false;
        }
    }

    public List<Cart> getCartByUserWithoutOrder(int userId) {
        return cartDAO.getCartByUserWithoutOrder(userId);
    }

}
