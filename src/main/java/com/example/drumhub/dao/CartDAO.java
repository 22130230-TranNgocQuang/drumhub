package com.example.drumhub.dao;

import com.example.drumhub.dao.db.DBConnect;
import com.example.drumhub.dao.models.Cart;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CartDAO {
    private final Statement statement;

    public CartDAO() throws SQLException {
        this.statement = DBConnect.getStatement();
    }

    // Create (Insert)
    public boolean addCart(Cart cart) {
        try {
            String query = "INSERT INTO carts (productId, userId, quantity, price, orderId) VALUES (" +
                    cart.getProduct().getId() + ", " + cart.getUserId() + ", " + cart.getQuantity() + ", " +
                    cart.getPrice() + ", " + (cart.getOrderId() == 0 ? "NULL" : cart.getOrderId()) + ")";
            statement.executeUpdate(query);
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Read (Get by ID)
    public Cart getCartById(int id) {
        try {
            String query = "SELECT * FROM carts WHERE id = " + id;
            ResultSet rs = statement.executeQuery(query);
            if (rs.next()) {
                return mapResultSetToCart(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Read (Get all carts by userId)
    public List<Cart> getCartsByUserId(int userId) {
        List<Cart> carts = new ArrayList<>();
        try {
            String query = "SELECT * FROM carts WHERE userId = " + userId;
            ResultSet rs = statement.executeQuery(query);
            while (rs.next()) {
                carts.add(mapResultSetToCart(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return carts;
    }

    // Update
    public void updateCart(Cart cart) {
        try {
            String query = "UPDATE carts SET quantity = " + cart.getQuantity() + ", price = " + cart.getPrice() +
                    ", orderId = " + (cart.getOrderId() == 0 ? "NULL" : cart.getOrderId()) +
                    " WHERE id = " + cart.getId();
            statement.executeUpdate(query);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

  /*  // Delete
    public void deleteCart(int id) {
        try {
            String query = "DELETE FROM carts WHERE id = " + id;
            statement.executeUpdate(query);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }*/

    // Helper method to map ResultSet to Cart
    private Cart mapResultSetToCart(ResultSet rs) {
        try {
            Cart cart = new Cart();
            cart.setId(rs.getInt("id"));
            cart.setProduct(new ProductDAO().getById(rs.getInt("productId"))); // Assume ProductDAO exists
            cart.setUserId(rs.getInt("userId"));
            cart.setQuantity(rs.getInt("quantity"));
            cart.setPrice(rs.getDouble("price"));
            cart.setOrderId(rs.getInt("orderId"));
            return cart;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
