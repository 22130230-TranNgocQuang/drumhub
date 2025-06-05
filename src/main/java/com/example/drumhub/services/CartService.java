package com.example.drumhub.services;

import com.example.drumhub.dao.CartDAO;
import com.example.drumhub.dao.models.Cart;
import com.example.drumhub.dao.models.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class CartService {

    public boolean addCart(Connection conn, int userId, int productId, int quantity, double price) {
        try {
            Product product = new Product();
            product.setId(productId);
            int orderId = 0;
            Cart cart = new Cart(0, product, userId, quantity, price, orderId);
            CartDAO cartDAO = new CartDAO(conn);
            return cartDAO.addCart(cart);
        } catch(Exception e){
            e.printStackTrace();
            return false;
        }
    }

    public List<Cart> getCartByUserWithoutOrder(Connection conn, int userId) {
        try {
            CartDAO cartDAO = new CartDAO(conn);
            return cartDAO.getCartByUserWithoutOrder(userId);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public boolean removeCartItem(Connection conn, int cartId, int userId) throws SQLException {
        String sql = "DELETE FROM carts WHERE id = ?";
        System.out.println(">> TEST: bỏ qua userId - cartId = " + cartId);

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, cartId);
            int rows = stmt.executeUpdate();
            System.out.println(">> Số dòng bị xoá: " + rows);
            return rows > 0;
        }
    }

    public boolean updateQuantity(Connection conn, int cartId, int userId, int quantity) {
        try {
            CartDAO cartDAO = new CartDAO(conn);
            return cartDAO.updateQuantity(cartId, userId, quantity);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
