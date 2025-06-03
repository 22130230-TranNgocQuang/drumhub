package com.example.drumhub.services;

import com.example.drumhub.dao.CartDAO;
import com.example.drumhub.dao.models.Cart;
import com.example.drumhub.dao.models.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class CartService {
    private CartDAO cartDAO ;
    private Connection conn;

    public CartService(Connection conn) throws SQLException {
        this.conn = conn;
        this.cartDAO = new CartDAO(conn);
    }

    public boolean addCart(int userId, int productId, int quantity, double price) {
        try {
            Product product = new Product();
            product.setId(productId);
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

    public boolean removeCartItem(int cartId, int userId) throws SQLException {
        String sql = "DELETE FROM carts WHERE id = ?";
        System.out.println(">> TEST: bỏ qua userId - cartId = " + cartId);

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, cartId);
            int rows = stmt.executeUpdate();
            System.out.println(">> Số dòng bị xoá: " + rows);
            return rows > 0;
        }
    }

    public boolean updateQuantity(int cartId, int userId, int quantity) {
        return cartDAO.updateQuantity(cartId, userId, quantity);
    }


}
