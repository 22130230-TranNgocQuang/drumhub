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
        try {
            Product product = new Product();
            product.setId(productId); // đủ dùng vì CartDAO sẽ lấy đầy đủ sau
            int orderId = 0;
            Cart cart = new Cart(0, product, userId, quantity, price, orderId);
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
